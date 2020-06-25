#include <fcntl.h> 
#include <sys/stat.h> 
#include <sys/types.h> 
#include <unistd.h> 

#define MAX_SIZE 1024 
int main() 
{ 
int fd,i; 
char * fifo = "/tmp/fifo"; 
 char buff[MAX_SIZE] = "abcdef"; 


//  capitalizes the letters
int x = strlen(buff); 
   	for (i=0;i<x;i++){
         if (isalpha(buff[i])){ 
            buff[i]= toupper(buff[i]);
            }
	 }

mkfifo(fifo,0666); 
fd = open(fifo, O_WRONLY);
write(fd,buff,MAX_SIZE);
close(fd);


return 0; 
}
