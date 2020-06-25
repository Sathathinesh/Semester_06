/*
Usage of the program : Run as ./mycat fileName

mycat which reads a text file and writes the output to the standard
output
E/15/366
S.THINESH

**/

#include <stdio.h>
#include <stdlib.h>


int main(int argc,char * argv[]){
	
	//input the filename as an argument
	if(argc!=2){
		printf(" ERROR : Usage a fileName\n");
	}
	
	else{
	FILE *file=fopen(argv[1],"r");
		if(file==0){
			printf("Can't open the File.\n");
		}else{
		  int word;
			while  ( ( word = fgetc( file ) ) != EOF ){
				printf( "%c", word );
			}
      printf("\n");
			fclose( file );
			}
		}
	return 0;
}

