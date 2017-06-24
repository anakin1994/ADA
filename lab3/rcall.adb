with Ada.Text_IO, RCI;
use  Ada.Text_IO;

procedure rcall is
   p: RCI.Wpis;
begin
   p.numer := 1;
   p.nazwa(1..5) := "Darek";

   Put_line(p.nazwa);
   RCI.Wstaw(p);
   Put_line(RCI.Nazwa(1));
end rcall;
