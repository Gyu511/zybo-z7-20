#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"

int main(void) {
    int data;
    int reg_num;
    while (1) {
    	printf("stop(0), write(1), read(2) : \n");
    	scanf("%d",&data);

    	if(data == 1){
    		printf("write reg number (0~3) : \n");
    		scanf("%d",&reg_num);
    		printf("input Value(100MHz) : \n");
    		scanf("%d",&data);
    		Xil_Out32(( XPAR_LED_AXI4_LITE_0_BASEADDR) + (reg_num*4), (u32)(data));
    		printf("reg_number : %d , value : %d\n", reg_num, data);
    	}
		else if (data == 2){
    		printf("read reg number (0~3) : \n");
    		scanf("%d",&reg_num);
    		data = Xil_In32(( XPAR_LED_AXI4_LITE_0_BASEADDR) + (reg_num*4));
    		printf("reg_number : %d , value : %d\n", reg_num, data);
    	}
		else if(data == 0){
    		break;
    	}
		printf("======================\n");
    }
    return 0;
}
