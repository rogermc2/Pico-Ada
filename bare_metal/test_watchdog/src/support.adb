
--  with Interfaces; use Interfaces;

with Led; use Led;

package body Support is

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

   -- External reference to the UART handle defined in the C HAL/main context
   --  huart2 : aliased int; -- The specific type doesn't matter for getting the address
   --  pragma Import (C, huart2, "huart2");
   --
   --  -- HAL Constants
   --  HAL_MAX_DELAY : constant unsigned := 16#FFFFFFFF#;
   --
   --  -- Import of the STM32 HAL UART Transmit function
   --  -- HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
   --  function HAL_UART_Transmit
   --    (huart   : System.Address;
   --     pData   : System.Address;
   --     Size    : unsigned_short;
   --     Timeout : unsigned) return int;
   --  pragma Import (C, HAL_UART_Transmit, "HAL_UART_Transmit");

   -------------------------------------------------------------------------
   -- int _write(int file, char *ptr, int len) {
   --   HAL_UART_Transmit(&huart2, (uint8_t *)ptr, len, HAL_MAX_DELAY);
   --   return len;
   -- }
   -------------------------------------------------------------------------
   --  function Write (File : int; Ptr : System.Address; Len : int) return int is
   --     Status : int;
   --  begin
   --     -- Call HAL_UART_Transmit with the address of huart2, the buffer pointer,
   --     -- the length (cast to uint16_t), and the max delay constant.
   --     Status := HAL_UART_Transmit
   --       (huart    => huart2'Address,
   --        pData    => Ptr,
   --        Size     => unsigned_short (Len),
   --        Timeout  => HAL_MAX_DELAY);
   --
   --     -- Return the number of characters written, as required by the _write syscall
   --     return Len;
   --  end Write;

end Support;
