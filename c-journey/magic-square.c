/**
 * Magic Square - insert numbers
 * Work in progress
 */
#include <stdio.h>
#include <math.h>

void  intialise_matrix(int* mat, int rows, int cols )
{  
	int i,j;

	for(i=0;i<rows;i++)
	{
		for(j=0;j<cols;j++)
		{
			mat[ i * cols + j ] = 0;
		}
	}	
}

void  print_matrix(int* mat, int rows, int cols )
{
	int i,j;

	for(i=0;i<rows;i++)
	{
		for(j=0;j<cols;j++)
		{
			printf("%5d",mat[i* cols + j]);
		}
		printf("\n");

	}	
}

main()
{
	int i,j,n,order,nr,nc,c,r, *square;
	order = 3;
	order = pow(order,2);

	intialise_matrix( square, 3, 3);
	print_matrix( square, 3, 3);

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




