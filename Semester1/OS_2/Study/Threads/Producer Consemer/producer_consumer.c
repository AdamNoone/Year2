#include<stdio.h>
#include<semaphore.h>
#include<pthread.h>
#include<stdlib.h>
#define buffersize 10
pthread_mutex_t mutex;//declare mutex var 
pthread_t tidP[20],tidC[20];//there will be 20 producer threads and 20 Consumer threads
sem_t full,empty;//initialize vars
int counter;//counter
int buffer[buffersize];//initialize buffer

void initialize()
{
	pthread_mutex_init(&mutex,NULL);//initialize mutex 
	sem_init(&full,1,0);
	sem_init(&empty,1,buffersize);
	counter=0;
}

void write(int item)
{
	buffer[counter++]=item;
}

int read()
{
	return(buffer[--counter]);
}

void * producer (void * param)
{
	int waittime,item,i;
	item=rand()%5;
	waittime=rand()%5;
	sem_wait(&empty);
	pthread_mutex_lock(&mutex);
	printf("\nProducer has produced item: %d\n",item);
	write(item);
	pthread_mutex_unlock(&mutex);
	sem_post(&full);
}

void * consumer (void * param)
{
	int waittime,item;
	waittime=rand()%5;
	sem_wait(&full);
	pthread_mutex_lock(&mutex);
	item=read();
	printf("\nConsumer has consumed item: %d\n",item);
	pthread_mutex_unlock(&mutex);
	sem_post(&empty);
}

int main()
{
	int n1,n2,i;//vars
	initialize();//call the intilize function
	printf("\nEnter the no of producers: ");
	scanf("%d",&n1);//number of producers user wants
	printf("\nEnter the no of consumers: ");
	scanf("%d",&n2);//number of consumer user wants
	for(i=0;i<n1;i++)
		pthread_create(&tidP[i],NULL,producer,NULL);//create producer threads
	for(i=0;i<n2;i++)
		pthread_create(&tidC[i],NULL,consumer,NULL);//create consumer threads
	for(i=0;i<n1;i++)
		pthread_join(tidP[i],NULL);//join theads 
	for(i=0;i<n2;i++)
		pthread_join(tidC[i],NULL);//join theads

	//sleep(5);
	exit(0);
}