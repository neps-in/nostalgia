/**
 * Duplicate Removal from sorted array - 1D Array
 */

#include <stdio.h>

int main()
{
	int a[20],b[20],i,j,n;

	printf("N = ? ");
	scanf("%d",&n);
	for(i=0;i < n;i++){
		printf("a [ %d ] = ?",i);
		scanf("%d",&a[i]);
	}

	j=0;
	for(i=1;i < n; i++)
	{
		if( a[i] != a [i-1] ){
			b[j] = a[i-1];
			j++;
		}
	}
	b[j] = a[n];
	for(i=1;i <=j;i++){
		printf("%d \n", b[i] );
	}


}