
package body Systick is

   procedure Configure_Systick is
   begin
      Ticks_Regs.PROC0_CYCLES := 1;

      --  TICKS_PROC0_CTRL = TICKS_PROC0_CTRL_ENABLE(1);
      Ticks_Regs.PROC0_CTRL := TICKS_PROC0_CTRL_ENABLE_MASK;

      SysTick_Regs.RVR := SYSTICK_TOP;

      --  M33_SYST_CVR = 0;
      SysTick_Regs.CVR := 0;

      --  M33_SYST_CSR = M33_SYST_CSR_CLKSOURCE(0) | M33_SYST_CSR_TICKINT(0) |
      --                 M33_SYST_CSR_ENABLE (1);
      --  Ada equivalent of bitwise OR with literals 0 and 1
      SysTick_Regs.CSR := (0 and M33_SYST_CSR_CLKSOURCE_MASK) or
                          (0 and M33_SYST_CSR_TICKINT_MASK) or
                          M33_SYST_CSR_ENABLE_MASK;
   end Configure_Systick;

   function System_Tick return Boolean is
   begin
      --  return M33_SYST_CSR & M33_SYST_CSR_COUNTFLAG_MASK;
      return (SysTick_Regs.CSR and M33_SYST_CSR_COUNTFLAG_MASK) /= 0;
   end System_Tick;

end Systick;
