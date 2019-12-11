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

	int arr[5] = { 1, 2, 3, 4, 5 }; 

	int *p;


	// We need to figureout this 
	int  (*ptr)[5];

	// Points to 0th element of the arr. 
    p = arr; 

	// Points to the whole array arr. 
    ptr = &arr;  

    printf("p = %p, ptr = %p\n", p, ptr); 
    printf("p value 	= %d before incrementing \n", *p );
    printf("ptr value 	= %d before incrementing \n", (*ptr)[0] );

    p++;  
    ptr++; 

   	printf("p value = %u AFTER incrementing \n", *p );
    printf("ptr value = %u AFTER incrementing \n", (*ptr) );

    printf("p = %p, ptr = %p\n", p, ptr); 


	printf("sizeof(p) = %lu, sizeof(*p) = %lu\n", 
                          sizeof(p), sizeof(*p)); 
    printf("sizeof(ptr) = %lu, sizeof(*ptr) = %lu\n",  
                        sizeof(ptr), sizeof(*ptr)); 


	//[]={1,3,4,6,2};
	
	// order = 3;
	// order = pow(order,2);

	// intialise_array( arr, 5);
	// print_array( arr, 5);

	// for(n=1;n<order;n++)
	// {
	// 	square[r][c] = n;
	// 	nr = r % order + 1;
	// 	nc = c % order + 1;
	// 	if ( square[r,c] != 0 )
	// 	{
	// 		r = nr; c = nc;
	// 	} else {
	// 		r = r - 1;
	// 	}
	// }


}




