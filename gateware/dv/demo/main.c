// This file is Copyright (c) 2020 Florent Kermarrec <florent@enjoy-digital.fr>
// License: BSD

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <irq.h>
#include <libbase/uart.h>
#include <generated/csr.h>


//-----------------My Global Variable-----------------
static int testresult1 = 0; // To verify test 1 result
static int testresult2 = 0; // To verify test 2 result
static int testresult3 = 0; // To verify test 3 result
static int testresult4 = 0; // To verify test 4 result
static int testresult5 = 0; // To verify test 5 result
static int testresult6 = 0; // To verify test 6 result
static int testresult7 = 0; // To verify test 7 result
static int testresult8 = 0; // To verify test 7 result
//----------------------------------------------------

//------TEST VARIABLES--------------------------------
uint32_t count, data_wrt, data_rd;
uint32_t addr= 0x80100000;
//----------------------------------------------------


//------------ andromeda test --------------------
static void andromeda_test(void)
{
	printf("============================================");
	printf("\n");
	printf("-------andromeda test---------");
	printf("\n");
	printf("============================================");
	printf("\n\n");
	
	data_rd = csr_read_simple(0x80000000);
	printf("\n");
	printf("Data read: %X", data_rd);
	printf("\n");
	
	data_wrt = 0xabcabcab;

	csr_write_simple(data_wrt, addr+(8));
	printf("\n");
	data_rd = csr_read_simple(addr+(8));
			
	printf("Data written: %X", data_wrt);
	printf("\n");
	printf("Data read: %X", data_rd);
	printf("\n");
	csr_write_simple(0x00000000, addr+(8));
	printf("\n");
	csr_write_simple(data_wrt, addr+(0xC));
	printf("\n");
	data_rd = csr_read_simple(addr+(0xC));
			
	printf("Data written: %X", data_wrt);
	printf("\n");
	printf("Data read: %X", data_rd);
	printf("\n");
		    
	csr_write_simple(0x00000000, addr+(0xC)); 	 
	printf("\n");   
    csr_write_simple(data_wrt, addr);	
    printf("\n");
	data_rd = csr_read_simple(addr);
			
	printf("Data written: %X", data_wrt);
	printf("\n");
	printf("Data read: %X", data_rd);
	printf("\n");
	
	printf("============================================");
	printf("\n");
	printf("-----andromeda test end-------");
	printf("\n");
	printf("============================================");
	printf("\n\n");
}

//------------ andromeda test --------------------
static void ibuf_config(void)
{
	printf("============================================");
	printf("\n");
	printf("-------ibuf configuration---------");
	printf("\n");
	printf("============================================");
	printf("\n\n");
	
	data_rd = csr_read_simple(0x80000000);
	printf("\n");
	printf("Data read: %X", data_rd);
	printf("\n");
	
	data_wrt = 0x00000001;
	csr_write_simple(0x00000001, addr+(0x8)); 	 
	printf("\n"); 
	while (data_rd != "0x00000003") {
		data_rd = csr_read_simple(addr+(0x4));
		printf("\n"); 
		printf("Data read: %X", data_rd);
		printf("\n");
	}
}
static void help(void)
{
	puts("\nWELCOME TO LITEX-RS \n"__DATE__" "__TIME__"\n");
}

int main(void)
{
#ifdef CONFIG_CPU_HAS_INTERRUPT
	irq_setmask(0);
	irq_setie(1);
#endif
	uart_init();
	help();
	andromeda_test();
	//ibuf_config();
	return 0;
}
