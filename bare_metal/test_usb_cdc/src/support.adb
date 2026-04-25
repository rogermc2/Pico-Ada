
with Interfaces; use Interfaces;

with Led; use Led;
with RP2350_UART;

package body Support is

   subtype Byte is Unsigned_8;

   Count   : Natural := 1;
   Freeze  : Natural := 0;

   procedure Task_Blocking_Led_Flash (Led_Pin : Natural) is
   begin
      if Count = 100 then
         Toggle_Led  (Led_Pin);
         Freeze := Freeze + 1;
      end if;

      if Count = 1000 then
         Toggle_Led (Led_Pin);
         Count := 0;
      end if;

      if Freeze = 6 then
         loop
            null;
         end loop;
      end if;

   end Task_Blocking_Led_Flash;

   procedure UART_Read_Line is
      use RP2350_UART;
      Buffer : String (1 .. 128);
      Index  : Natural := 1;

      function UART_Byte_Available return Boolean is
      begin
         -- Check UART RX FIFO not empty
         --  return (UART0_UARTFR_RXFE = 0);
         --  UART0_UARTFR Flag Register
         return ((UART0_UARTFR and 16#10#) = 0);
      end UART_Byte_Available;

      function UART_Read return Byte is
      begin
         -- Read from UART data register
         return Byte (UART0_UARTDR);
      end UART_Read;

   begin
      loop
         if UART_Byte_Available then
            declare
               C : Character := Character'Val (UART_Read);
            begin
               if C = ASCII.LF or else C = ASCII.CR then
                  -- End of line
                  exit;
               else
                  if Index <= Buffer'Last then
                     Buffer (Index) := C;
                     Index := Index + 1;
                  end if;
               end if;
            end;
         end if;
      end loop;

      -- Now Buffer (1 .. Index-1) contains the "command line"

   end UART_Read_Line;

end Support;
