/* E/15/366
   S.THINESH
   Program for Input/Output operations using ISA Interface
 */  

#include<stdio.h>
#include<sys/io.h>
#include<unistd.h>


const int OUTPUT_PORT = 0x213;	/* Starting address of output port */
const int INPUT_PORT = 0x210;	/* Starting address of input port */
const int LENGTH = 3;		    /* No of continuous port addresses */


                     /* Writes a BYTE to the specified port */
void write_port(void)
{
	
	int port,data;
	
	while(1)
	{
		printf("\nEnter port address to write: ");
		scanf("%x",&port);
		
		if(port <0)
			return;
			
		if(port<OUTPUT_PORT || port > OUTPUT_PORT+LENGTH)
			printf("\tERROR: Port address out of range");
		else
		{
			printf("Enter data: ");
			scanf("%x",&data);
			outb(data,port);
			printf("\tWritten 0x%x to address 0x%x",data,port);
		}
	}
}

                   /* Reads a BYTE from the specified port */
void read_port(void)
{
	int port,data;
	
	while(1)
	{
		printf("\nEnter port address to read: ");
		scanf("%x",&port);
		if(port <0)
			return;
		if(port<INPUT_PORT || port > INPUT_PORT+LENGTH)
			printf("\tERROR: Port address out of range");
		else
		{
			data = inb(port);
			printf("\tByte read from address 0x%x = 0x%x",port,data);
		}
	}	
}
int main()
{
	char choice;
	
	if(ioperm(OUTPUT_PORT,LENGTH+1,1))
	{
		perror("ERROR");		
		exit(1);
	}
	if(ioperm(INPUT_PORT,LENGTH+1,1))
	{
		perror("ERROR");
		exit(1);
	}	
	
		printf("\nProgram for Input/Output operations using ISA Interface");
		printf("\n-------------------------------------------------------");
		printf("\n Main Menu");
		printf("\n Write to a port - 1");
		printf("\n Read from a port - 2 ");
		printf("\n\nEnter Choice (1 or 2): ");
		fflush(stdin);
		choice = getchar();
		switch(choice)
		{
			case '1':
				write_port();
				break;
			case '2':
				read_port();
				break;
			default:
				break;
		}
	
	
	/* Release the permissions for the ports */
	ioperm(OUTPUT_PORT,LENGTH,0);
	ioperm(INPUT_PORT,LENGTH,0);
	return 0;
}
