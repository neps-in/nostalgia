/**
 * Binary Search - input array should be sorted
 */

#include <stdio.h>
#include <conio.h>

main()
{
	int a[100],i,n,x;

	printf("N or array size : \n", n);
	scanf("%d",&n);

	for(i=0; i<n;i++)
	{
		printf(" a[%d] = ? ");
		scanf("%d",&a[i]);
	}

	upper = n;
	lower = 1;

	while( a[mid] == x || lower < upper ){
		mid = (upper + lower) div 2;

		if( x > a[mid] ){
			lower = mid + 1;
		} else {
			upper = mid - 1;
		}
	}
}