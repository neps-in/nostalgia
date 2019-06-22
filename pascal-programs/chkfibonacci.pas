{ Program to check if two given numbers are consequtive fibonacci sequence.
Assume that when you give numbers first number is less than second number }

program chkfibonacci;

var f,x,y,c,d, yesno : integer;

begin

write('Enter two consequtive fibonacci sequence :');
read(c,d);

x:= -1; y := 1;
yesno := 0;
while( ( f + c ) <= d ) do
begin
	f := x+y;
	x := y;
	y := f;

	if ( (x+y) = c  ) then
	begin
	   if ( (y+c) = d ) then 
	   begin
	    yesno := 1 ;
	    break;
	   end;
	end;

end;

if yesno = 1 then
  write('They are two consequtive fibonacci numbers ',c:5,d:5)
else
  write('They are NOT two consequtive fibonacci numbers ',c:5,d:5);

end.