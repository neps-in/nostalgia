/**
 * Program - To find n C r
 */

#include <stdio.h>
#include <conio.h>

main()
{
	int n,r,p,q, nrc;

	printf('Enter the value of n, r (r <= n) ');

	if(( r > n ) || ( n < 0 )){
		printf(" Invalid n or r or both please retry \n");
	}

	p= n;
	q= 1;
	nrc = 0;
	i= 2;

	while( i <= r ){
		p = p * ( n - i + 1);
		q = q * i;
		i++;
	}

	nrc = p / q ;
	printf("%d C %d := %d " ,n,	r,	ncr);
}