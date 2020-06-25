#include <stdio.h>
#include <stdlib.h>


int main(){
	
struct sockaddr_in myaddr,clientaddr;
int sockfd,newsockfd;
listen(sockfd,5);
clilen = sizeof(cli_addr);
static int counter=0;
while (1){
/* New socket descriptor is returned each time a client connects*/
newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);

if (newsockfd < 0){
perror("ERROR on accept");
exit(1);
}
pid = fork();
if (pid < 0)
{
perror("ERROR onfork");
close(sockfd);
exit(1);
}
if (pid == 0)
{
/* In child process which the handles client connection */
char buf[100];
counter++;
snprintf(buf,sizeof buf, "hi %d",counter);
send(newsockfd,buf,strlen(buf,0));
close(sockfd);
handle_client(newsockfd);
exit(0);
}
else{
/* In parent process which continues to listen for new clients */
close(newsockfd);
}

}

return 0;
}
