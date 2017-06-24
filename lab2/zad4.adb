with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


procedure zad4 is
	
	protected Semaphore is
		entry P(value: in Positive);
		procedure V(value: in Positive);
	private
		level: Natural := 1;
		entry PP;
		tmp: Positive;
	end Semaphore;

	protected body Semaphore is
		entry P(value: in Positive) when PP'count = 0 is
		begin
			if value <= level then
				level := level - value;
			else
				tmp := value;
				requeue PP;
			end if;
		end P;
		entry PP when tmp <= level is
		begin
			level := level - tmp;
		end PP;
		procedure V(value: in Positive) is
		begin
			level := level + Value;
		end V;
	end Semaphore;
			
	task producer;
	task consumer;

	task body producer is
	begin
		for i in 1..100 loop
			Semaphore.P(1);
			Put_line("P1 in critical section");
			delay 1.0;
			Put_line("P1 out critical section");
			Semaphore.V(2);
		end loop;
	end;

	task body consumer is
	begin
		for i in 1..100 loop
			Semaphore.P(1);
			Put_line("P2 in critical section");
			delay 1.0;
			Put_line("P2 out critical section");
			Semaphore.V(2);
		end loop;
	end;
begin
	null;
end zad4;
