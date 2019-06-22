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
	i,j,m,n: integer;

begin
	writeln('How many students ? ');
	read(n);

	for i:= 0 to 20 do
		h[i] := 0;

	for i:= 0 to n do 
	begin
		write('Enter mark: ');
		read(a[i]);
        
	end;
    writeln('j := ':10,' a[j]:=  ':10, ' h[j] :=  ':10 );

    for i:= 0 to 20 do
    begin
        for j:= 0 to n do
        begin
            if a[j] = i then
		        h[i] := h[i] + 1;
	      
	    end;
	  { writeln( i:10 ,a[i]:10,h[i]:10 ); }

    end;
    
    writeln('Numbers':10, 'Frq.':5);
	for i:= 0 to 20 do
	begin
	     { if( h[i] > 0 ) then }
		 write(i:10);

		 for j:= 1 to h[i] do
		    write('*':3);
		 
		 writeln;
	end

end.