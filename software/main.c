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

#if 1
    unsigned int refresh = 0x2; // subpage refresh rate
    // bool i2c_write(unsigned char slave_addr, unsigned int addr, const unsigned char *data, unsigned int len, unsigned int addr_size);
    data[0] = 0x18 | (refresh>>1) ; // msbyte
    data[1] = ((refresh&0x01)<<7) | 0x01; // lsbyte
    i2c_write(0x33, 0x800d, data, 2, 2); // set refresh  rate
#endif
    i2c_read(0x33, 0x800d, data, 2, 0, 2); // read config
    printf("mlx config %02x %02x\n", data[0], data[1]);

    while (1) {
#if 1
        //data[0] = 0x1b; // msbyte
        //data[1] = 0x89; // lsbyte
        //i2c_write(0x33, 0x800d, data, 2, 2); // set subpage 0

        payload = udp_get_tx_buffer();
        i2c_read(0x33, 0x8000, payload, 2, 0, 2); // read status
        i2c_read(0x33, 0x0400, payload+2, 32*24, 0, 2); // read checkboard pattern from mlx90640
        udp_send(UDP_PORT, 30000, 32*24+2);

        payload = udp_get_tx_buffer();
        i2c_read(0x33, 0x0400+(32*24)/2, payload, 32*24, 0, 2); // read checkboard pattern from mlx90640
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
