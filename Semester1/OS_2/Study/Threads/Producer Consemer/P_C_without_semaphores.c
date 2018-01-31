
#include<stdio.h>
#include<stdlib.h>
 
int mutex=1,full=0,empty=3,x=0;//intialize vars
 
int main()
{
    int n;
    void producer();//producer function
    void consumer();//concumer function
    int wait(int);//wait function
    int signal(int);//signal function
    printf("\n1.Producer\n2.Consumer\n3.Exit");
    while(1)
    {
        printf("\nEnter your choice:");
        scanf("%d",&n);//user enters there choice
        switch(n)//switch statement
        {
            case 1:    if((mutex==1)&&(empty!=0))//if sem is > 0     and     buffer is not full 
                        producer();//calls the producer 
                    else
                        printf("Buffer is full!!");
                    break;
            case 2:    if((mutex==1)&&(full!=0))//if sem is > 0    and  buffer is not empty
                        consumer();//calls the consumer
                    else
                        printf("Buffer is empty!!");
                    break;
            case 3:
                    exit(0);//exit the program
                    break;
        }
    }
    
    return 0;
}
 
int wait(int s)//wait funtion
{
    return (--s);//decrements semaphore
}
 
int signal(int s)//signal funtion
{
    return(++s);//increments semaphore
}
 
void producer()
{
    mutex=wait(mutex);//sem = sem - 1 .........1-1 = 0   means no other threads can get access 
    full=signal(full);//increments value of full as a space has been filled
    empty=wait(empty);//decrements empty value as a space has been filled
    x++;//increment the x value 
    printf("\nProducer produces the item %d",x);
    mutex=signal(mutex);//signal that new process is allowed on cpu by sem = sem + 1 .........0+1 = 1
}
 
void consumer()
{
    mutex=wait(mutex);//sem = sem - 1 .........1-1 = 0   means no other threads can get access 
    full=wait(full);//decrements value of full as a space has been consumed
    empty=signal(empty);//increments value of empty as a space has been consumed
    printf("\nConsumer consumes item %d",x);
    x--;//decremt x value
    mutex=signal(mutex);//signal that new process is allowed on cpu by sem = sem + 1 .........0+1 = 1
}