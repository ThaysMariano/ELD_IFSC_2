library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplicador is
	generic(W : natural :=8);

   port( 
      clk, reset: in std_logic;
      start: in std_logic;
      a_in, b_in: in std_logic_vector(W-1 downto 0);
      ready: out std_logic;
      r: out std_logic_vector(2*W-1 downto 0)
   );
end multiplicador;

architecture ifsc of multiplicador is
	signal r_uns : unsigned (2*W-1 downto 0);
	signal a_next, b_next, a_reg, b_reg : std_logic_vector(W-1 downto 0);
	signal r_next, r_reg : std_logic_vector(2*W-1 downto 0);
begin

	process(clk, reset)
	begin

		if(reset='1') then 
			r_reg <= (others=>'0');
			a_reg <= (others=>'0');
			b_reg <= (others=>'0');
		elsif rising_edge(clk) then
			r_reg <= r_next;
			a_reg <= a_next;
			b_reg <= b_next;
		end if;
	end process;

	a_next <= a_in;
	b_next <= b_in;
	r_uns <= unsigned(a_reg) * unsigned(b_reg);

	r_next <= std_logic_vector(r_uns);
	r <= r_reg;

end architecture;