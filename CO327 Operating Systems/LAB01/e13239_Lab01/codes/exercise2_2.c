#include <stdio.h>
#include <stdlib.h>

int main(void){
	int pid;
	for (int i=0;i<3;i++){
		pid=fork();
		if(pid<0){
			perror("fork");
			exit(1);
		}
		if(pid==0){
			puts("A Child is created");
			printf("My pid(child) is %d\n",getpid());
			printf("My parent pid(child) is %d\n",getppid());
			wait(2);
		} 
		else{
			puts("A Parent is created");
			printf("My pid(parent) is  %d\n",getpid());
			printf("My parent(parent) id is  %d\n",getppid());
			wait(2);
		}		
	}
return 0;
}
