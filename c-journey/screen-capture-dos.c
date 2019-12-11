/**
 * Screen Capture for DOS 
 * This works only on DOS, or atleast tested on DOS only.
 */

#include <stdio.h>
#include <bios.h>
#include <dos.h>
#include <fcntl.h>

void interrupt our();
int ticks;

void interrupt (*prev)();

char far *scr = (char far *)0xb00000001;

char mem[4000];

FILE *file1;
int i,j,k,t,bytes,key;

main()
{
	prev = getvect(8);
	setvect(8,our);
	keep(0, 1000);
}

void interrupt our(){
	ticks++;

	if( ticks == 182 ){
		(*prev)();
		runner();
		ticks = 0;
	}
	(*prev)();
}

runner() {
	for( i = 1; i <= 4000; i++){
		mem[i] = scr[i];
		scr[i] = ' ';
		key    = bioskey(0);
		for(i=0; i<3999 ; i++){
			scr[i] = mem[i];
			file1 = fopen("mytext.c","w+");
			for(i=0;i<=3999;i++){
				t = scr[i];
				putc(t,file1);
				bytes++;
			}// end for
		}// end for outer
	}// end for outermost
}
