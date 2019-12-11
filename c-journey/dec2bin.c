/** 
 * Decimal To Binary with Fraction - todebug
 */

#include <stdio.h>
#include <conio.h>

main()
{
	int i,j;
	float n,p,t;

	printf("N with decimal or fractional part as 2.4 ? ");
	scanf("%f",&n);

	t = n; i= 1;
	while(n > 0){
		p = n * 2;
		ne[i] = trunc(p);
		n = p - trunc(p);
		i++;
	}

	printf("Given Number : %d", t);

	printf("Binary Eqvalent : ");
	for(j = 0; j < i-1; j++){
		printf("%d",a[j]);
	}
}