package body C_Interface is

   function Ada_Get_Next_Status (Current_Status : int) return int is
   begin
      --  Simple toggle logic written in Ada
      if Current_Status = 0 then
         return 1;
      else
         return 0;
      end if;
      
   end Ada_Get_Next_Status;

end C_Interface;
