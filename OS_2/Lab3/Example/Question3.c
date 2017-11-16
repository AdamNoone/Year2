/*Program to maintain a database of employee records in memory */


#include <stdio.h>
#define MAX_PERSONS 100

/* Structure definitions */
struct date
{
  int day;
  int month;
  int year;
};
typedef struct date DATE;

struct personnel
{
  int number;
  char surname[26];
  char first_name[11];
  DATE dob;
  int dept;
  DATE joined;
};
typedef struct personnel EMPLOYEE;

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

		while ( person_array[i].number != 0 && i < MAX_PERSONS )
	  i++;

	if ( i == MAX_PERSONS )
	  printf("\nSorry, the database is full\n");
	else {  				   
	  printf( "\n\nEmployee Number (1 to 3 digits, except 0) : " );
	  do
		 scanf( "%3d",&person_array[i].number );
	  while ( person_array[i].number <= 0 );

	  printf( "\nEmployee  Surname (Maximum 25 characters) : " );
	  scanf( "%25s",person_array[i].surname );
	  printf( "\n       First Name (Maximum 10 characters) : " );
	  scanf( "%10s",person_array[i].first_name );
	  printf( "\nDate of Birth\n" );
	  printf( "     Day (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.day );
	  printf( "   Month (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.month );
	  printf( "    Year (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].dob.year );
	  printf( "\nDepartment Code (1 to 4 digits): " );
	  scanf( "%4d",&person_array[i].dept );
	  printf( "\nDate Joined\n" );
	  printf( "     Day (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].joined.day );
	  printf( "   Month (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].joined.month );
	  printf( "    Year (1 or 2 digits) : " );
	  scanf( "%2d",&person_array[i].joined.year );
	}
}


void delete_an_employee( EMPLOYEE person_array[] )

{
	
	int employee_number;
	int pos;


	printf("Employee Number to Delete (1 to 3 digits, except 0) :");
	do
	  scanf( "%3d",&employee_number );
	while ( employee_number <= 0 ) ;


	pos = search_database( person_array, employee_number );


	if ( pos == MAX_PERSONS )  
	  printf( "This employee is not in the database\n" );
	else                       
	  {
		 printf("Employee %3d deleted", employee_number);
		 person_array[pos].number = 0;
	  }
}


void display_an_employee( EMPLOYEE person_array[] )
{
	int employee_number;
	int pos;

	
	printf("Employee Number to Display (1 to 3 digits, except 0):" );
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
	printf("Employee Number: %d\n",ptr->number);
	printf("Surname        : %s\n",ptr->surname);
	printf("Initial        : %s\n",ptr->first_name);
	printf("Date of Birth  : %2d/%2d/%2d\n",
									 ptr->dob.day,ptr->dob.month,ptr->dob.year);
	printf("Department     : %d\n", ptr->dept);
	printf("Date Joined    : %2d/%2d/%2d\n",
						  ptr->joined.day,ptr->joined.month,ptr->joined.year);
}



void init_database( EMPLOYEE person_array[] )
{
	int i;

	for ( i=0; i < MAX_PERSONS; i++ )
	  person_array[i].number = 0;
}



int menu(void)
{
	int choice;

	/* Display the menu. */
	printf("\n\n 1. Add     an Employee\n\n");
	printf(" 2. Delete  an Employee\n\n");
	printf(" 3. Display an Employee\n\n");
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


	while ( i < MAX_PERSONS && person_array[i].number != emp_number )
		i++;

	 return (i);
}