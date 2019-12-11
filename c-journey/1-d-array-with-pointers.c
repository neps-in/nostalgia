/**
 * Magic Square - insert numbers
 * Work in progress
 */
#include <stdio.h>
#include <math.h>

void  intialise_array(int *arr, int n )
{  
	int i;

	for(i=0;i<n;i++)
	{
			arr = 0;
			arr++;
	}	
}

void  print_array(int *arr, int n )
{
	int i;

	for(i=0;i<n;i++)
	{
		printf("%5d", *arr);
		arr++;
	}	
}

main()
{
	int i,j,n,order,nr,nc,c,r;

	int arr[5]; 

	int *p;

	// Points to 0th element of the arr. 
    p = arr; 

	intialise_array( arr, 5);
	print_array( arr, 5);

}




