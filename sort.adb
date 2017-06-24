with Ada.Text_IO; use Ada.Text_IO;


procedure Sort is
	tab: array(1..10) of Integer :=(7,4,1,8,5,2,3,6,9,0);
	procedure Swap(Left, Right : in out Integer) is
		Temp : Integer := Left;
	begin
		Left := Right;
		Right := Temp;
	end Swap;
begin
	for i in tab'range loop
		Put_line(Integer'Image(tab(i)));
	end loop;
	for j in tab'range loop
		for i in tab'first..tab'last-j loop
			if tab(i) > tab(i+1) then
				swap(tab(i), tab(i+1));
			end if;
		end loop;
	end loop;
	Put_line("");
	for i in tab'range loop
		Put_line(Integer'Image(tab(i)));
	end loop;
end Sort;
