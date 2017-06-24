package RCI is
   pragma Remote_Call_Interface;

   type Wpis is record 
      numer: Positive;
      nazwa: String(1..10);
   end record;

   procedure Wstaw(p: in Wpis);
   function Nazwa(n: in Positive) return String;
end RCI;

