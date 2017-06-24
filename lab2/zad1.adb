with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure Tasks is

	task producer;
	task consumer;
	task type BUF is
		entry Put (param : in  Integer);
		entry Get (param : out Integer);
	end BUF;

	buffer : Integer;
	bufTask : BUF;

	task body producer is
	begin
		for i in 1..10 loop
			bufTask.Put(i);
			Put("producing");
			Put(i);
			new_line(1);
		end loop;
	end;

	task body consumer is
		element : Integer;
	begin
		for i in 1..10 loop
			bufTask.Get(element);
			Put("consuming");
			Put(element);
			new_line(1);
		end loop;
	end;

	task body BUF is
	begin
		for i in 1..10 loop
			accept Put(param : in Integer) do
				buffer := param;
			end Put;
			accept Get(param : out Integer) do
				param := buffer;
			end Get;
		end loop;
	end;
begin
	null;
end Tasks;
