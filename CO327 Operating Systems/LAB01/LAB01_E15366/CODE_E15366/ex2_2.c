#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/wait.h>

int main(void){
int pid;
for(int i=0;i<3;i++){
pid=fork();

if (pid<0){
 perror("fork");
 exit(1);
}

if (pid==0){
puts("This is the child");
printf("my pid(child) is %d\n",getpid());
printf("my parent pid(chid) is %d\n",getppid());
//wait(2);
}
else 
puts("this is parent");
printf("my pid(parent) is %d\n",getpid());
printf("my parent(parent) is %d\n",getppid());
//wait(2);
}
return 0;
}