/*

Lab Test 2 A semaphore implementation of the producer consumer problem

 Only an implementation using the skeleton code given below will be acceptable to implement
 the producer/consumer bounded buffer problem.

if any other code version is used it will result in zero marks  
	
*/	
	
	
	
#include <pthread.h>
#include <stdio.h>
#include <semaphore.h>    

#define BUFF_SIZE 6

char buffer[BUFF_SIZE];   // the bounded buffer - to be implemented as a circular buffer
int Add = 0;    //producer index pointer 
int Remove = 0;   // consumer index pointer



// declare semaphore variables as global variables
sem_t empty_elements;
sem_t full_elements;
sem_t mutex;


//  The producer function 
void Put(char item)
{
  
  // shows the item that was produced
    printf("Producing %c ...\n", item);
	
  // INSERT CODE FOR THE PRODUCER ALGORITHM AS DESCRIBED IN THE CLASS NOTES.
    
  
    wait(empty_elements);//decrements empty value as a space has been filled
    mutex=wait(mutex);//sem = sem - 1 .........1-1 = 0   means no other threads can get access 
    mutex=signal(mutex);//signal that new process is allowed on cpu by sem = sem + 1 .........0+1 = 1
	signal(full_elements)
	
}
 

 //The producer thread used to call a producer function 10 times. 
  void * Producer()
{
    int i;

    
	for(i = 0; i < 10; i++)
    {
      Put((char)('A'+ i % 26));   // Call the Put (producer algorithm) function passing a to it an alphabetical character 
    }
   	
}




//  insert code for the consumer function: code to run the consumer algorithm as described in the notes
void Get () 

{

    // INSERT CODE FOR P FUNCTIONS FOR THE FULL AND MUTEX SEMAPHORES ********    
					int item;
					sem_wait(&full_elements);
					pthread_mutex_lock(&mutex)
  
    /* enter the critical region of the bounded buffer (removing item from buffer!!!)   */  
		item = buffer[Remove];
	    
		//  INSERT CODE TO MOVE POINTER FOR CONSMUER POINTER TO ITS NEXT POSITION IN THE BOUNDED BUFFER
        // in this case the buffer is implemented as a circular buffer		
				
					
					//item= buffer[--counter]);
					
					if (Buffer == BUFF_SIZE)
					{
						Buffer =0
					}
					
					else 
					{
						Buffer ++;
					}
						
		  
  
  
  // INSERT CODE  FOR THE V FUNCTIONS OF THE MUTEX AND EMPTY SEMAPHORES}************
  
 
  
  
                  printf("consuming %c ...\n", item);

                    pthread_mutex_unlock(&mutex);
					sem_post(&empty_elements)
}




// the consumer thread: this calls the consumer algorithm function (Get) 10 times 
void * Consumer()
{
  
    
   int i;
       
    for(i = 0; i < 10; i++)
   {
       Get();//calling the get function
       sleep(1);  // to ensure that all chars are not consumed just as they are produced.  	 
   }
}




int main()
{
	
	   pthread_t idProduce, idConsume;       // thread ID variables
      
       int rc1, rc2;
	
	
	// INSERT CODE TO INITALISE ALL THREE SEMAPHORE
	    sem_init(&mutex,0,1);
		sem_init(&full_elements,0,0);
	    sem_init(&empty_elements,1,0);
		
		
	
		
	
	// create thread for producer
	
	if( (rc1=pthread_create( &idProduce, NULL, Producer, NULL)) )
   {
      printf("Thread creation failed: %d\n", rc1);
   }
	
	
	//INSERT CODE TO CREATE THREAD FOR CONSUMER 
	
	
   if( (rc2=pthread_create( &idConsume, NULL, Consumer, NULL)) )
   {
      printf("Thread creation failed: %d\n", rc1);
   }
   
   
     
   //INSERT CODE THAT ensures the CHILD THREADS finish before the MASTER THREAD (the main process)
			
	if(pthread_join(rc1, NULL))	/* wait for the thread 1 to finish */
    {
      printf("\n ERROR joining thread");
      exit(1);
    }

    if(pthread_join(rc2, NULL))        /* wait for the thread 2 to finish */
    {
      printf("\n ERROR joining thread");
      exit(1);
    }

   
   // INSERT CODE TO DESTROY ALL THE THREE SEMAPHORES
   
			em_destroy( &mutex );
            sem_destroy( &full_elements);
            sem_destroy( &empty_elements);
            
	return 0;
	
	
	
}