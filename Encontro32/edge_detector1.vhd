library ieee;
use ieee.std_logic_1164.all;
entity edge_detector1 is
   port(
      clk, reset: in std_logic;
      strobe: in std_logic;
      p1: out std_logic
   );
end edge_detector1;

architecture moore_arch of edge_detector1 is
   type state_type is (zero, edge, one);
   signal state_reg, state_next: state_type;
begin
   -- state register
   process(clk,reset)
   begin
      if (reset='1') then
         state_reg <= zero;
      elsif (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- next-state logic
   process(state_reg,strobe)
   begin
      case state_reg is
         when zero=>
            if strobe= '1' then
               state_next <= edge;
            else
               state_next <= zero;
            end if;
         when edge =>
            if strobe= '1' then
               state_next <= one;
            else
               state_next <= zero;
            end if;
         when one =>
            if strobe= '1' then
               state_next <= one;
            else
               state_next <= zero;
            end if;
      end case;
   end process;
   -- Moore output logic
   p1 <= '1' when state_reg=edge else
         '0';
end moore_arch;
