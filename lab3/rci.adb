with Ada.Text_IO; use Ada.Text_IO;

package body RCI is
   Max: constant Positive := 100;
   wpisy: array (1..Max) of Wpis;

   procedure Wstaw(p: in Wpis) is
   begin
      wpisy(p.numer) := p;
      -- Put_line(Positive'Image(p.numer) & ". " & p.nazwa);
   end;

   function Nazwa(n: in Positive) return String is
   begin
      return wpisy(n).nazwa;
   end;
end RCI;

