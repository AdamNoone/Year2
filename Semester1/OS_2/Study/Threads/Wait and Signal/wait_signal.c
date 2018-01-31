/******************************************************************************
* FILE: condvar.c
* DESCRIPTION:
*   Example code for using Pthreads condition variables.  The main thread
*   creates three threads.  Two of those threads increment a "count" variable,
*   while the third thread watches the value of "count".  When "count" 
*   reaches a predefined limit, the waiting thread is signaled by one of the
*   incrementing threads. The waiting thread "awakens" and then modifies
*   count. The program continues until the incrementing threads reach
*   TCOUNT. The main program prints the final value of count.
* SOURCE: Adapted from example code in "Pthreads Programming", B. Nichols
*   et al. O'Reilly and Associates. 
* LAST REVISED: 10/14/10  Blaise Barney
******************************************************************************/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_THREADS  3
#define TCOUNT 10
#define COUNT_LIMIT 12

int     count = 0;//counter
pthread_mutex_t count_mutex;//declare mutex variable
pthread_cond_t count_threshold_cv;//declare mutex variable

void *inc_count(void *t) //increment counter function 
{
  int i;//counter
  long my_id = (long)t;//thread id 

  for (i=0; i < TCOUNT; i++) {
    pthread_mutex_lock(&count_mutex);//lock the mutex
    count++;//increment the conter

    /* 
    Check the value of count and signal waiting thread when condition is
    reached.  Note that this occurs while mutex is locked. 
    */
    if (count == COUNT_LIMIT) { //if count = 12
      printf("inc_count(): thread %ld, count = %d  Threshold reached. ", //the treshold is reached 
             my_id, count);
      pthread_cond_signal(&count_threshold_cv);// unlocks the mutex & sends the siganl to thread one so it nows mutex has been unlocked 
      printf("Just sent signal.\n");
      }//else
    printf("inc_count(): thread %ld, count = %d, unlocking mutex\n",  //print counter value
	   my_id, count);
    pthread_mutex_unlock(&count_mutex);//unlock the mutext for thread 3 (thread one wont come on cpu as its waiting on a signal,whereas thread 2 & 3 are still operating on a yest and set formula)

    /* Do some work so threads can alternate on mutex lock */
    sleep(1);//sleeps to allow other threads onto cpu
    }
  pthread_exit(NULL);
}

void *watch_count(void *t) 
{
  long my_id = (long)t;//thread id 

  printf("Starting watch_count(): thread %ld\n", my_id);//starts thread

  /*
  Lock mutex and wait for signal.  Note that the pthread_cond_wait routine
  will automatically and atomically unlock mutex while it waits. 
  Also, note that if COUNT_LIMIT is reached before this routine is run by
  the waiting thread, the loop will be skipped to prevent pthread_cond_wait
  from never returning.
  */
  pthread_mutex_lock(&count_mutex);//lock the mutex
  while (count < COUNT_LIMIT) {//while count is less than 12
    printf("watch_count(): thread %ld Count= %d. Going into wait...\n", my_id,count);
    //Note that the pthread_cond_wait routine will automatically and atomically unlock mutex while it waits aloowing threads 2 and 3 on cpu
	//you call the wait funtion ,this unlocks the mutex allow for other processes to run 
	 //  and itself wont access the cpu until it recives a signal
	pthread_cond_wait(&count_threshold_cv, &count_mutex);//waits for unlock signal from thread 2 and 3 (occurs when counter = 12)
    printf("watch_count(): thread %ld Condition signal received. Count= %d\n", my_id,count);
    printf("watch_count(): thread %ld Updating the value of count %d...\n", my_id,count);
    count += 125;//increase counter value by 125
    printf("watch_count(): thread %ld count now = %d.\n", my_id, count);
    }
  printf("watch_count(): thread %ld Unlocking mutex.\n", my_id);
  pthread_mutex_unlock(&count_mutex);//this thread has now finisheed all it execution so will unlock mutex
  pthread_exit(NULL);
}

int main(int argc, char *argv[])
{
  int i, rc; //counters
  long t1=1, t2=2, t3=3;//thread numbers
  pthread_t threads[3];//gonna create 3 threads
  pthread_attr_t attr;//intalize thraed attributes

  /* Initialize mutex and condition variable objects */
  pthread_mutex_init(&count_mutex, NULL);//intialize mutex
  pthread_cond_init (&count_threshold_cv, NULL);

  /* For portability, explicitly create threads in a joinable state */
  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
  pthread_create(&threads[0], &attr, watch_count, (void *)t1);//create thread1
  pthread_create(&threads[1], &attr, inc_count, (void *)t2);//create thread2
  pthread_create(&threads[2], &attr, inc_count, (void *)t3);//create thread3

  /* Wait for all threads to complete */
  for (i = 0; i < NUM_THREADS; i++) {
    pthread_join(threads[i], NULL);//joins thread to ensure they dont finish before main 
  }
  printf ("Main(): Waited and joined with %d threads. Final value of count = %d. Done.\n", 
          NUM_THREADS, count);//will diplay after al threads have finished execution

  /* Clean up and exit */
  pthread_attr_destroy(&attr);
  pthread_mutex_destroy(&count_mutex);
  pthread_cond_destroy(&count_threshold_cv);
  pthread_exit (NULL);

}

