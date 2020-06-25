
#include <stdio.h>
#include <stdlib.h>

int main(void){
	int pid;
	pid=fork();
	
	if(pid<0){
	perror("fork");
	exit(1);
	}
	while(pid!=0){
		wait();
	}
	if(pid==0){
	puts("This is the child process");
	printf("My parent pid is %d\n",getppid());
	printf("My pid is %d\n",getpid());
	} 
	else{
	puts("This is the parent process");
	printf("My parent id is  %d\n",getppid());
	printf("My pid is  %d\n",getpid());
	}
	return 0;
}




