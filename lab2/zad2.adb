with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure zad2 is

	task producer;
	task consumer;
	task type BUF is
		entry Put (param : in  Integer);
		entry Get (param : out Integer);
	end BUF;

	bufTask : BUF;

	task body producer is
	begin
		for i in 1..100 loop
			bufTask.Put(i);
			Put("producing");
			Put(i);
			new_line(1);
		end loop;
	end;

	task body consumer is
		element : Integer;
	begin
		for i in 1..100 loop
			bufTask.Get(element);
			Put("consuming");
			Put(element);
			new_line(1);
		end loop;
	end;

	task body BUF is
		buffer : array(0..9) of  Integer;
		bufSize : Integer := 10;
		prodIndex : Integer := 1;
		consIndex : Integer := 1;
		elemCount : Integer := 0;
	begin
		for i in 1..200 loop
			select
			when elemCount < bufSize => accept Put(param : in Integer) do
					buffer(prodIndex) := param;
					prodIndex := prodIndex mod bufSize;
					elemCount := elemCount + 1;
				end Put;
			or
			when elemCount > 0 => accept Get(param : out Integer) do
					param := buffer(consIndex);
					consIndex := consIndex mod bufSize;
					elemCount := elemCount - 1;
				end Get;
			end select;
		end loop;
	end;
begin
	null;
end zad2;
