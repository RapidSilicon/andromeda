// This file is Copyright (c) 2020 Florent Kermarrec <florent@enjoy-digital.fr>
// License: BSD

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <libbase/uart.h>
#define I2C_FREQ_HZ  4000000 // busy wait resolution is 1us so max i2c bit rate is limited to 250KHz
#include <libbase/i2c.h>
#include <libliteeth/udp.h>

#define UDP_PORT 5005
uint8_t fb[768*2];

int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();
    fputs("HELLO UART FROM BARE METAL!\n", stdout);

    static unsigned char data[2];
    uint8_t *payload;

    unsigned int ip = IPTOINT(REMOTEIP1, REMOTEIP2, REMOTEIP3, REMOTEIP4);
    static unsigned char macadr[6] = {0x10, 0xe2, 0xd5, 0x00, 0x00, 0x00};
    udp_start(macadr, IPTOINT(192,168,1,50));
    udp_arp_resolve(ip);

    // init mlx
    unsigned int refresh = 0x6; // subpage refresh rate
    // bool i2c_write(unsigned char slave_addr, unsigned int addr, const unsigned char *data, unsigned int len, unsigned int addr_size);
    data[0] = 0x18 | (refresh>>1) ; // msbyte
    data[1] = ((refresh&0x01)<<7) | 0x01; // lsbyte
    i2c_write(0x33, 0x800d, data, 2, 2); // set refresh  rate
    i2c_read(0x33, 0x800d, data, 2, 0, 2); // read config
    printf("mlx config %02x %02x\n", data[0], data[1]);

    *(unsigned long *)0x80000000L = 0x7; // reset andromeda
    busy_wait_us(1);
    *(unsigned long *)0x80000000L = 0x2;
    int w=0;
    while (1) {
#if 0
        i2c_read(0x33, 0x0400, fb, 32*24*2, 0, 2); // read checkboard pattern from mlx90640
        payload = udp_get_tx_buffer();
        for (int k=0; k<768; k++)
            payload[2+k]=fb[k];
        udp_send(UDP_PORT, 30000, 32*24+2);

        payload = udp_get_tx_buffer();
        for (int k=0; k<768; k++)
            payload[k]=fb[768+k];
        udp_send(UDP_PORT, 30000, 32*24);
#endif

#if 1
        //data[0] = 0x1b; // msbyte
        //data[1] = 0x89; // lsbyte
        //i2c_write(0x33, 0x800d, data, 2, 2); // set subpage 0

        payload = udp_get_tx_buffer();
        i2c_read(0x33, 0x8000, payload, 2, 0, 2); // read status
        i2c_read(0x33, 0x2432, payload+2, 2, 0, 2); // read ambient temp
        i2c_read(0x33, 0x0400, payload+4, 32*24, 0, 2); // read checkboard pattern from mlx90640

        // copy from udp payload to andromeda fb, scale raw pixels values to [0,255]
        for (int k=0; k<32*12; k++) {
            int x = (unsigned short *)(payload+4)[k];
            x = x<32768 ? x : x-65536;
            x = x<-128 ? -128 : x;
            x = x+128;
            //*(unsigned long *)(0x80010000L + (w<<12) + k*4) = x;
            fb[k] = x;
        }
        udp_send(UDP_PORT, 30000, 32*24+4);

        payload = udp_get_tx_buffer();
        i2c_read(0x33, 0x0400+(32*24)/2, payload, 32*24, 0, 2); // read checkboard pattern from mlx90640
        // copy from udp payload to andromeda fb, scale raw pixels values to [0,255]
        for (int k=0; k<32*12; k++) {
            int x = (unsigned short *)(payload)[k];
            x = x<32768 ? x : x-65536;
            x = x<-128 ? -128 : x;
            x = x+128;
            //*(unsigned long *)(0x80010000L + (w<<12) + k*4 + 32*12*4) = x;
            fb[k+32*12] = x;
        }
        udp_send(UDP_PORT, 30000, 32*24);

        //data[0] = 0x1b; // msbyte
        //data[1] = 0x99; // lsbyte
        //i2c_write(0x33, 0x800d, data, 2, 2); // set subpage 1

        //payload = udp_get_tx_buffer();
        //i2c_read(0x33, 0x0400, payload, 32*24, 0, 2); // read checkboard pattern from mlx90640
        //udp_send(UDP_PORT, 30000, 32*24);
        //payload = udp_get_tx_buffer();
        //i2c_read(0x33, 0x0400+32*24, payload, 32*24, 0, 2); // read checkboard pattern from mlx90640
        //udp_send(UDP_PORT, 30000, 32*24);
#endif

#if 1
        // clear status register
        data[1] = 0x00;
        data[0] = 0x00;
        i2c_write(0x33, 0x8000, data, 2, 2);
#endif
        // wait per MLX90640 spec
        //busy_wait_us(1);

#if 1
    //busy_wait_us(10000);
    int pred[5];
    for (int k=0; k<5; k++) {
        pred[k] = ((*(unsigned long *)(0x80020000L+k*4))&0x1ff);
        if (pred[k]&0x100)
            pred[k] |= 0xfffffe00;
    }

    printf("w %6d pseq %6d pred %6d %6d %6d %6d %6d\n", w,((*((unsigned long *)(0x80020000L+0*4)))>>16)&0xffff,pred[0],pred[1],pred[2],pred[3],pred[4]);

/*
    printf("w %6d pseq %6d pred %08lx %08lx %08lx %08lx %08lx\n", w,((*((unsigned long *)(0x80020000L+0*4)))>>16)&0xffff,
        *(unsigned long *)(0x80020000L+0*4),
        *(unsigned long *)(0x80020000L+1*4),
        *(unsigned long *)(0x80020000L+2*4),
        *(unsigned long *)(0x80020000L+3*4),
        *(unsigned long *)(0x80020000L+4*4)
    );
*/

    // copy fb[] to andromeda fb[][]
    volatile unsigned long *andromeda_fb = 0x80010000L;
    for (int k=0; k<32*24; k++) 
        andromeda_fb[k] = fb[k];
        //*(unsigned long *)(0x80010000L + (w<<12) + k*4) = fb[k];

    //*(unsigned long *)0x80000000L = 0x8 | 0x2; // increment the barrel shifter (w+1)%16 and reset cnn
    *(unsigned long *)0x80000000L = 0x2; // reset cnn
    busy_wait_us(1);
    *(unsigned long *)0x80000000L = 0x0;

    //w = (w+1)%16;

    //printf("0x80000000 csr    %08lx\n", *(unsigned long *)0x80000000L);
    //*(unsigned long *)0x80000000L = 0x0;
    //printf("0x80000000 csr    %08lx\n", *(unsigned long *)0x80000000L);
    //for (int k=0; k<5; k++)
    //    printf("0x%08lx pred %d %08lx\n", 0x80020000L+k*4, k, *(unsigned long *)(0x80020000L+k*4));
#endif

#if 1
        // wait for new subframe
        while (1) {
            i2c_read(0x33, 0x8000, data, 2, 0, 2); // read status
            if ((data[1] & 0x08)!=0) { // wait for subpage ready
                break;
            } else {
                busy_wait_us(1);
            }
        }
#endif
    }
}
