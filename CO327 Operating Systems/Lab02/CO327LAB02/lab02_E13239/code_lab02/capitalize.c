/*Now write a program where the parent reads a string from the user and send it to the child
and the child capitalizes each letter and sends back the string to parent and parent displays
it. You'll need two pipes to communicate both ways.


**/


#include <stdio.h>
#include <string.h> 
#include <unistd.h> 
#include <fcntl.h> 
#include <sys/types.h> 
#include <sys/stat.h> 
#include <ctype.h>
#include<sys/wait.h>

#define BUFF_SIZE 100

int main(int argc, char * argv[]){
	char buf[BUFF_SIZE];
	int parent_child[2];      //pipe for parent to child communication
	int child_parent[2];      //pipe for child to parent communication
	pid_t pid;
	ssize_t count;
  int status;
  
	pid = fork();
	if(pid < 0) {
		perror("Error in Fork");
		return -1;
	}
 
	//code for parent's function
	if(pid > 0) {
	  int i;
	  close(parent_child[0]);
    close(child_parent[1]); 
	 
		char buff_send[BUFF_SIZE];
		char buff_recv[BUFF_SIZE];
		close(parent_child[0]);
		printf("Enter the string needed to be converted to upper case\n");
		scanf("%s",buff_send);
		write(parent_child[1],buff_send,8);
		close(parent_child[1]);
		
		sleep(5); 
		int count = read(child_parent[0], buff_recv, BUFF_SIZE);
		buff_recv[count] = '\0';   
	}
  
	//code for child's function
	if(pid == 0) { 	
		char buff[BUFF_SIZE]; 
		close(parent_child[1]);
		close(child_parent[0]); 
		sleep(5); 
		
		int count = read(parent_child[0], buff, BUFF_SIZE);
		buff[count] = '\0';
		close(parent_child[0]);

		int x = strlen(buff); 
		int i;
   		for (i=0;i<x;i++){
         	   if (isalpha(buff[i])){ 
          		buff[i]= toupper(buff[i]);					//used inbuilt function toupper()
				}
	   	}

		write(child_parent[1],buff,8);
		close(child_parent[1]);
	
	}
	wait(&status);
	return 0;
}
