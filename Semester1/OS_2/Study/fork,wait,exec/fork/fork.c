#include <unistd.h>
#include <stdio.h>
int main()
{
        int i;// variable 
        printf("hello before fork \n");
        printf("i : %d\n",i); //will print the value of i before the process  fork called 

        i=fork(); //call the fork  whic creaets the child ,and and assign either 0 or 1 into i
        printf("\n");

        if(i==0)// if 0 was assingned to i  then the the child pocess will be called 
        {
                printf("Child has started\n\n");
                printf("child printing first time \n");
                printf("getpid : %d getppid : %d \n",getpid(),getppid());
                sleep(5);//will make child process pause for 5 seconds
                printf("\nchild printing second time \n");
                printf("getpid : %d getppid : %d \n",getpid(),getppid());
        }
        else )// if 0 was not assingned to i then the the parent process will be called 
        {
                printf("parent has started\n");
                printf("getpid : %d  getppid : %d \n",getpid(),getppid());
                printf("\n");
        }

        printf("Hi after fork i : %d\n",i);

        return 0;
}
