program histogram;
{ 
  Given input: An array of numbers say 12, 13, 11, 2, 15, 19, 22, 22, 22, 21, 11 
  Output should be 
  Numbers   Occurance
  12		1
  13		1
  11		2
  2         1
  15        1
  19        1
  22        3
  21        1
	
}

var a,h: array[0..100] of integer;
	i,m,n: integer;

begin
	writeln('How many students ? ');
	read(n);

	for i:= 0 to 100 do
		h[i] := 0;

	for i:= 1 to n do 
	begin
		write('Enter mark: ');
		read(m);
        a[i] := m;
		h[m] := h[m] + 1;
	end;
    
    writeln('Numbers':10, 'Frq.':5);
	for i:= 0 to 100 do
	begin
	     { if( h[i] > 0 ) then }
		 writeln(a[i]:10,h[i]:5);
	end

end.