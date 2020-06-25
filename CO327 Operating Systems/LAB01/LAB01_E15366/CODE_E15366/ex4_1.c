#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

int main(char argc,char **argv){

execl("/bin/ls","-1",argv[1],NULL);
puts("Program ls has terminated");

return 0;
}