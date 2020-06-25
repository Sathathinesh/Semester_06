#include <stdio.h>
#include <stdlib.h>
#include <assert.h>


struct Node
{
    int data;
    struct Node* next;
    
};


//count the number of times a given int occurs in list
int Count(struct Node* head,int n){
    struct Node* current=head;
    int count=0;
    while (current!=NULL)
    {
        //if number and number in list are same then increase count by 1
        if (current->data==n)
        {
            count++;
        }
        
    }
    return count;
        
   
}//count() end here




//function that takes a linked list and an integer index and returns
//the data value  stored in that index position
int GetNth(struct Node* head,int i){
    struct Node* current = head;
    int index=0;
    
    //loop while get a value for ith node
    while (current!=NULL){
        //if index and i are eaual then return the data
        if (index==i) {
            return current->data;
        }
        //otherwise go for the next node
        current=current->next;
        index++;
    }

    //here user asking for a out of range of a value of index
    assert(0);
    
    
    
}



//delete a list
void delete(struct Node** head){
    struct Node* current= *head;

    while (current!=NULL)
    {
        struct Node* nextVal=current->next;
        free(current);
        current =nextVal;
    }
    *head=NULL;
    
}

//insertNth function will insert a new node at an Nth point
void print(struct Node* head){
    struct Node* current=head;
    while (current!=NULL)
    {
        printf("%i ",current->data);
        current=current->next;
    }
    puts("");
    return;
    
    
}

//function to insert a  new node at a specific index
void insertNth(struct Node** head,int index,int d){
   
    int i=0;
    struct Node* current = *head;
    //allocate memmory for new node
   
    struct Node* NewNode = (struct Node*)malloc(sizeof(struct Node));
   
    //find the size of linked list and check wether index<=i
    while (current!=NULL){
        i++;
        current=current->next;
    }
    int size=i;
    if (index>i){
        assert(0);
    }
    printf("size is %i %i \n",size ,index);


    
    
    
    //case 1 inserting at the first index
    if (0==index){
        NewNode->data=d;
        NewNode->next=*head;
        *head=NewNode;
        return;
    }

    //case 2 inserting at middle
    current = *head;
    i=0;
    while (current->next!=NULL){
        if (index==i+1){
             //set data
            NewNode->data=d;
            //point to the next element
            NewNode->next=current->next;
            //point the previous element to temp
            current->next=NewNode;
            
            return;
        }
        //printf("current walue in midle %i i is %i \n",current->data,i);
        i++;
        current=current->next;      
    }
    //printf("current walue after midle %i \n",current->data);

    //now index pointing the last element
    //so if node has to be add in last index == i+1
    if (size==index){
        //case 3 at the end
        NewNode->data=d;
        NewNode->next=NULL;
        current->next=NewNode;
        return;
    }

    //otherwise index out o range
    puts("nope");
    assert(0);

}


//sorted insert function to insert a value in sorted order
void SortedInsert(struct Node** head,struct Node* node){
    struct Node* temp=(struct Node*)malloc(sizeof(struct Node));
    struct Node* current= temp;
    temp->next=*head;
    
    while ((current->next!=NULL) && ((current->next->data)<(node->data)))
    {   
        //printf("current data %i \n",current->data);
        current=current->next;
    }
    
    //if current and temp are still same then change head
    if (current==temp){
        node->next=temp->next;
        *head=node;
        free(temp);
        return;
    }

    node->next=current->next;
    current->next=node;
    
    //otherwise node is not
    return;
}

void InsertSort(struct Node** head){
    //assume first element is already sorted

    struct Node* result=NULL;
    struct Node* current= *head;
    struct Node* temp;



    //get every element from  list
    while (current!=NULL){   
        //printf("%i \n",current->data);

        //insert every elemnt to result
        temp=current->next;
        SortedInsert(&result,current);
        current=temp;
    }
    *head=result;
    

    return;
}


//append function to append to list
void Append(struct Node** a,struct Node** b){

    struct Node* currentA= *a;

    //traverse untill the last element of a
    while (currentA->next!=NULL)
    {
        currentA=currentA->next;
    }

    //point the last element of a to first element of b
    currentA->next=*b;


    //then set b to null
    *b=NULL;


}//append ends here


//remove dublicates function
void RemoveDublicates(struct Node** head){
    struct Node* current= *head;
    //traverse untill the last element of list
    
    while (current->next!=NULL){
        //if first and second elements are equal then link firtst and third element
        //the go from same element
        //printf("%i \n",current->data);
        if((current->data==current->next->data)){
            //if third element is null then no need to link but unlink the last element
            if (current->next->next!=NULL)
            {
               current->next=current->next->next;
               continue;
            }
            //if third element is null then no need to link but unlink the last element
            else
            {
                current->next=NULL;
                continue;
            }
        }
        //otherwise go for next element
         current=current->next;   
    }
}//end of removeDublicates()

//MoveNode function 
void MoveNode(struct Node** a,struct Node** b){
    //copy and remove first element from 2 nd list
    struct Node* copy= *b;
    (*b)= (*b)->next;
    //push it onto  the front of the first
    copy->next=*a;
    
    *a=copy;

}//moveNode end here


//Alterntaing split function
void AlternatingSplit(struct Node* head){
    struct Node* current=head;
    struct Node* first=NULL;
    struct Node* second=NULL;
    //move first element to first
    //then move second element to second
    while (current!=NULL){
        //printf("%i \n",current->data);
        MoveNode(&first,&current);
        //current=current->next;
        //printf("%i \n",current->data);
        if (current!=NULL){
            //printf("%i \n",current->data);
            MoveNode(&second,&current);
        }
        
        print(first);
    print(second);
    }
    

}//end of AlternatingSplit



int main(){
    struct Node* head=NULL;
    struct Node* h=NULL;
    head=(struct Node*)malloc(sizeof(struct Node));
    h=(struct Node*)malloc(sizeof(struct Node));
    struct Node* newn=NULL;
    newn=(struct Node*)malloc(sizeof(struct Node));
    int x=0;
    //allocate head
    head->data=x;
    head->next=NULL;
    h->data=2;
    h->next=NULL;
    puts("in main");
    insertNth(&head,1,1);
    insertNth(&head,2,052);
    insertNth(&head,3,40);
    insertNth(&head,4,50);
    insertNth(&head,5,60);
    print(head);
    insertNth(&h,1,1);
    insertNth(&h,2,2);
    insertNth(&h,3,1);
    insertNth(&h,4,2);
    //print(h);
    
    //newn->data=80;
    //newn->next=NULL;
    
    //SortedInsert(&h,newn);
    //print(head);
    //insertNth(&head,3,5);
    //InsertSort(&head);
    
   puts("after main");
   print(head);
   print(h);
   // Append(&head,&h);
   //MoveNode(&head,&h);
   // suffleMerge(h,head);
    //print(head);
    //RemoveDublicates(&head);
    //print(head);
    
    return 0;
   
}
