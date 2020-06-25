#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

int main(void){
int pid;
pid=fork();

if (pid<0){
 perror("fork");
 exit(1);
}

if (pid==0){
printf("this is the child\n");
}
else 
printf("this is parent\n");

}