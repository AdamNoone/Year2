/*Program to maintain a database of employee records in memory */


#include <stdio.h>
#define MAX_PERSONS 100

/* Structure definitions */
struct state
{
  int counter_value;
  int acculumator_value;
  int location;
};
typedef struct state STATE;

struct pcb
{
  int id;
  char status[26];
  STATE dob;
  char priority[26];
  
};
typedef struct pcb EMPLOYEE;

/* Function prototypes */
void add_an_employee(EMPLOYEE []);
void delete_an_employee(EMPLOYEE []);
void display_an_employee(EMPLOYEE []);
void display_employee_details(EMPLOYEE *);
void init_database(EMPLOYEE []);
int search_database(EMPLOYEE [], int);
int menu(void);


void main()
{
	EMPLOYEE persons[MAX_PERSONS];
	int menu_choice;

  

	init_database(persons);


	do
	{
		menu_choice = menu();

		switch ( menu_choice )
		{
			case 1 :
						add_an_employee( persons );
						break;
			case 2 :
						delete_an_employee( persons );
						break;
			case 3 :
						display_an_employee( persons );
						break;
		}
	}
	while ( menu_choice != 0) ;
}




void add_an_employee( EMPLOYEE person_array[] )
{
	int i=0;

		while ( person_array[i].id!= 0 && i < MAX_PERSONS )
	  i++;

	if ( i == MAX_PERSONS )
	  printf("\nSorry, the database is full\n");
	else {  				   
	  printf( "\n\npcd id(1 to 3 digits, except 0) : " );
	  do
		 scanf( "%3d",&person_array[i].id );
	  while ( person_array[i].id <= 0 );

	  printf( "\nProcess status (Maximum 25 characters) : " );
	  scanf( "%25s",person_array[i].status );
	  
	  printf( "\ncounter value\n" );
	  printf( "     Day (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.counter_value );
	  printf( "   acculumator_value(1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.acculumator_value );
	  printf( "    location(1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.location );
	  printf( "\npriority  h/l(1 to 4 digits): " );
	  scanf( "%25s",&person_array[i].priority );
	 
	}
}


void delete_an_employee( EMPLOYEE person_array[] )

{
	
	int employee_number;
	int pos;


	printf("pcb id to delete(1 to 3 digits, except 0) :");
	do
	  scanf( "%3d",&employee_number );
	while ( employee_number <= 0 ) ;


	pos = search_database( person_array, employee_number );


	if ( pos == MAX_PERSONS )  
	  printf( "This employee is not in the database\n" );
	else                       
	  {
		 printf("pcb id %3d deleted", employee_number);
		 person_array[pos].id = 0;
	  }
}


void display_an_employee( EMPLOYEE person_array[] )
{
	int employee_number;
	int pos;

	
	printf("pcb id to Display (1 to 3 digits, except 0):" );
	do
	  scanf( "%3d",&employee_number );
	while ( employee_number <= 0 );


		pos = search_database( person_array, employee_number );

	
	if ( pos == MAX_PERSONS )  
	  printf( "This employee is not in the database\n" );
	else                       
	  display_employee_details( &person_array[pos] );
}


void display_employee_details( EMPLOYEE *ptr )
{
	printf("\n\n");
	printf("pbc id : %d\n",ptr->id);
	printf("Status       : %s\n",ptr->status);
	printf("Process state  : %2d/%2d/%2d\n",
									 ptr->dob.counter_value,ptr->dob.acculumator_value,ptr->dob.location);
	printf("Priority     : %s\n", ptr->priority);
}


void init_database( EMPLOYEE person_array[] )
{
	int i;

	for ( i=0; i < MAX_PERSONS; i++ )
	  person_array[i].id = 0;
}



int menu(void)
{
	int choice;

	/* Display the menu. */
	printf("\n\n 1.Add a process and add it to the array \n\n");
	printf(" 2. Delete (mark) a element as deleted \n\n");
	printf(" 3. Display the details of the process control block\n\n");
	printf(" 0. Quit\n\n");
	printf( "Please enter your choice (0 to 3) " );

	/* Get the option. */
	do
		scanf( "%d", &choice );
	while ( choice <0 || choice > 3 );

	return (choice);
}


int search_database( EMPLOYEE person_array[], int emp_number )
{
	int i = 0;


	while ( i < MAX_PERSONS && person_array[i].id != emp_number )
		i++;

	 return (i);
}