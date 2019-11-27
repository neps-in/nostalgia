/**
 *  Save & Reboot - DOS
 *  This program is written for DOS & Tested in DOS
 */

#include <dos.h>

void interrupt (*prev)();
void interrupt cur();
void interrupt (*reboot)();
char far *kb = (char far *)0x41c;

unsigned long far *num;

main()
{   
	//reboot instruction is present in 0xffff0000;
	num = (unsigned long far *)0xffff0000;

	// Get the interrupt vector and save it
	prev = getvect(9);

	// Now keep the new interrupt vector routine in the vector table
	setvect(9, cur);

	keep(0, 1000);
}

void interrupt cur()
{
	reboot = num;

	if ( importb(0x60) == 68 )
	{
		*((char far *)0x400 + *kb) = 0;
		*((char far *)0x400 + *kb + 1) = 60;

		if( *kb == 60 )
		{
			*kb = 30;
		} else {
			*kb = *kb + 2;
			(*rboot)();
		}
	}

	(*prev)();
}