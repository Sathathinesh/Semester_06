/*
Write a program called mycopy using open(), read(), write() and close() which takes two
arguments, viz. source and target file names, and copy the content of the source file into the
target file. If the target file exists, just overwrite the file.

E/15/366
S.THINESH

Usage of the program : Run as  ./mycat filename1 filename2

Ex : ./mycat out.txt in.txt
**/
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>

#define SIZE 8192

int main(int argc,char *argv[]){
	
	//input the filename as an argument
	if(argc!=3){
		printf(" ERROR : Usage a fileName\n");
		exit(0);
	}
	
  char buf;
  ssize_t ret_in,ret_out;      //number of bytes returned by read() and write()          
  char buffer[SIZE];           
    
  //creating the output file desciptor
  int out_desc=open(argv[2],O_WRONLY|O_CREAT,S_IRUSR|S_IWUSR);
  
  //creating the input file desciptor 
  int in_desc=open (argv [1], O_RDONLY);
  
  while((ret_in = read (in_desc, &buffer, SIZE)) > 0){
    ret_out = write (out_desc, &buffer, (ssize_t) ret_in);
	
    if(ret_out != ret_in){
        perror("write");
    }
  }
  close(in_desc);
  close(out_desc);
  return 0;
}
