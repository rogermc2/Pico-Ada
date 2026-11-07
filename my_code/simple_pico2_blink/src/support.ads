
package Support is

   function Toggle_Logic (Current_Status : integer) return integer;
   function Ada_Get_Next_Status (Current_Status : integer) return integer;
   procedure Print_LED_Status (Status : Integer);

end Support; 