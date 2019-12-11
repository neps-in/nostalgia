/**
 * Check if a given number is Factorial Number
 */

#include <stdio.h>
#include <conio.h>

#define TRUE 1
#define FALSE 0
main()
{
	int n,i,t,q;

	t = n; i = 2;
	
	printf("Enter N ?\n");
	scanf("%d",n);

	factorial = FALSE;
	while(){
		q = t;
		if( t % i != 0 ){
			factorial = FALSE;
			break;
		}
		t = q;
		i++;
	}
	factorial = TRUE;

	if( factorial ){
		printf("%d is a Factorial Number \n", n);
	} else {
		printf("%d is NOT a Factorial Number \n", n);
	}
}