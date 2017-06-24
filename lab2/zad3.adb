with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure zad3 is
	
	type Index is mod 10;
	type Storage is array(Index) of Integer;
	protected Buffer is
		entry Put(item: in Integer);
		entry Get(item: out Integer);
	private
		buf: Storage;
		index_in, index_out: Index := 0;
		count: Integer := 0;
	end Buffer;

	protected body Buffer is
	entry Put(item: in Integer) when
		count < 10 is
	begin
		buf(index_in) := item;
		index_in := index_in + 1;
		count := count + 1;
	end Put;

	entry Get(item: out Integer) when
		count > 0 is
	begin
		item := buf(index_out);
		index_out := index_out + 1;
		count := count - 1;
	end Get;
	end Buffer;

	task producer;
	task consumer;

	task body producer is
	begin
		for i in 1..100 loop
			Buffer.Put(i);
			Put("producing");
			Put(i);
			new_line(1);
		end loop;
	end;

	task body consumer is
		element : Integer;
	begin
		for i in 1..100 loop
			Buffer.Get(element);
			Put("consuming");
			Put(element);
			new_line(1);
		end loop;
	end;
begin
	null;
end zad3;
