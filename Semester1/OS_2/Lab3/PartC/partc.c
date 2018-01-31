#include <stdio.h>
#define MAX_PERSONS 100

/* Structure definitions */




struct listNode {                                      
   char data; // each listNode contains a character 
   struct listNode *nextPtr; // pointer to next node
}; 

typedef struct listNode ListNode; // synonym for struct listNode
    
void display_an_employee(ListNode);

void main()
{
    display_an_employee(ListNode);

    
}


void display_employee_details( ListNode *ptr )
{
	printf("\n\n");
	printf("data : %d\n",ptr->data);
	printf("adrress       : %p\n",ptr);
}