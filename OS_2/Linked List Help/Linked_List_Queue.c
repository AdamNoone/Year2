/*Code by Adam Noone (C16448216) and Brendan O'Dowd (C16476404)
This program uses a linked list dynamic data structure to implement a queue structure IT services ticketingsystem.
The system will enable the user add tickets when IT fix requests are received via phone.
the user can         1. Enqueue a request 
                          2. Dequeue a request
                          3. View the Queue
                          
    The max number of requests in the queue at any one time is 5
    so if someone tries to add a 6th request they will get a message saying the queue is full*/
                        






#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<stdlib.h>





struct ticket {  //stuct that contains the information of each Caller
    char Name[30];
    long int PhoneNum;
    char Description [500];
    char Time[20];
};


struct Node {  //struct that controls the linked list 
    struct ticket data;//nested data struct
    struct Node *next;
}*front = NULL, *rear = NULL;



void insert( char *, long, char *, char * );//function that allows user to put tickets into the queue
void delete1();//function that allows user to delete tickets from the queue
void display();//function that displays the queue on screen 
int list_counter = 0;//counter used to make sure no more than 5 tickets are on the queue



void main() {
        int choice, value;//variable used to control what menu option user selects 
        char Phone[30],  Name[30], garbage[40];//garbage variable used to clean up data such as remove new line characters.
        long int PhoneNum;//callers phone number
        char Description[500];//callers problem
        char Time[20];//time of call

    //clrscr();
     printf("\n:: Queue Implementation using Linked List ::\n");

     while(1) {
              printf("\n\n****** MENU ******\n\n");
              printf("1. Insert\n2. Delete\n3. Display\n4. Exit\n");
              printf("Enter your choice: ");
              scanf("%d",&choice);//user inputs what they want to do
              fgets( garbage, sizeof(garbage), stdin);  //Remove newline character.

        switch(choice)//switch statement

        {
          case 1://if user chooses option1
              
                printf("Enter name: ");
                fgets(  Name, sizeof(Name),stdin );//get name
                Name[strcspn(Name, "\n")] = 0;  //Remove newline character.
    
              
                printf("Enter phone:");
                fgets( Phone, sizeof(Phone), stdin);//get phone number
                PhoneNum  = atol(Phone);//long int
    
              
               printf("Enter description:");
               fgets( Description, sizeof(Description), stdin);//description of problem
               Description[strcspn(Description, "\n")] = 0;  //Remove newline character.
    
               printf("Enter time:");
               fgets( Time, sizeof(Time), stdin);//get time of call
               Time[strcspn(Time, "\n")] = 0;  //Remove newline character.
    
               insert( Name, PhoneNum, Description, Time );//Call insert function an pass Name, PhoneNum, Description, Time
         break;

       case 2://if user selects 2
           
          delete1();//call delete function
          break;

       case 3://if user selects 3
           
          display();//call dispaly function
        break;

    case 4://if user selects 4
        
        exit(0);//exit program

    default:///if user does not selct option between 1 and 4
        
        printf("\nWrong selection!!! Please try again!!!\n");
    }
  }
 }


  void insert( char *Name, long PhoneNum, char *Description, char *Time ) //puts value on end of queue
 { 
         if (list_counter < 5)   //if less than 5 items on the queue  
         {
             
          struct Node *newNode;//declare a new node
          newNode = (struct Node*)malloc(sizeof(struct Node));//allocate memory for node
              
          strcpy( newNode->data.Name, Name );                          //
          newNode->data.PhoneNum = PhoneNum;                           //COPY DATA INTO NEW NODE
          strcpy( newNode->data.Description, Description );            // 
          strcpy( newNode->data.Time, Time );                          //
          newNode->next = NULL;//SET PIONTER TO NULL
    
          if(front == NULL) front = rear = newNode;//if noting in node then front = newnode
              
              else {//else
                rear -> next = newNode;//rear points to newnode
                rear = newNode;
              }
              printf("\nInsertion is Success!!!\n");
              list_counter ++;//increment counter
      }
      
      else 
      {
        printf("\nQueue is full\n");//ther are 5 or more elements in the queue
      }
 }


 void delete1() { //This function takes value from start of queue
     
     if (front == NULL) printf("\nQueue is Empty!!!\n");//if there is noting in the queue
         
        else {
            struct Node *temp = front;//temp variable = front of queue
            front = front->next;//front of queue now bocmes element which was second in queue
            printf("\nDeleted element: %d\n", temp->data);
            free(temp);//free variable for hen next ticket is deleted 
            list_counter --;//decrement list counter 
        }
 }


 void display() { //displays the queue
     
    if (front == NULL) printf("\nQueue is Empty!!!\n");//if queue is empty
            else {
                struct Node *temp = front;//temp var = struct at front of Queue
                while(temp->next != NULL) {//will print while pointer isnt = NULL
                    printf("\nName : %s   ",temp->data.Name);                       //
                    printf("\nPhone Number : %ld   ",temp->data.PhoneNum);          //
                    printf("\nDescription : %s   ",temp->data.Description);         //PRINT THE TICKET DATA
                    printf("\nTime : %s  ------------",temp->data.Time);            //
                    printf("\n                       |");
                    printf("\n                       |");
                    printf("\n                       |");
                    printf("\n                  <----");
                    temp = temp->next;//point to next ticket 
                }
                
                            printf("\nName : %s   ",temp->data.Name);                   //
                            printf("\nPhone Number : %ld   ",temp->data.PhoneNum);      //
                            printf("\nDescription : %s   ",temp->data.Description);     //PRINT THE LAST TICKETS DATA 
                            printf("\nTime : %s  ------------",temp->data.Time);        //
                            printf("\n                        |");
                            printf("\n                        |");
                            printf("\n                        |");
                            printf("\n               NULL<----");//points to NULL as its the last ticket 
                        } 
 }