#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/wait.h>

int main(void){

if (fork()==0){
printf("this is the child\n");
}
else{ 
printf("this is parent\n");
wait(NULL);
//printf("child has terminated\n");
}
//printf("bye\n");
return 0;
}