library ieee;
use ieee.std_logic_1164.all;

entity maquinaDeLavar is
port(
	clk, rst : in std_logic;
	tempo : in integer 0 to 1210;
	start, rapido, nivelCheio, nivelVazio : in std_logic;
	M1, M2, bomba, valvula, zeraTempo : out std_logic
);

end entity;

-- fazer um contador


architecture arc_maquinaLavar of maquinaDeLavar is
	type state is (Parado, Enchendo1, ZT1, Batento1, ZT2, Molho, ZT3, Batendo2, Esvaziando1, Enchendo2, Enxague, Esvaziando2, Centrifugando, Lixo);
	signal pr_state, nx_state : state;
	
begin 

	process(clk, rst)
		begin 
			if(rst='1') then
				pr_state<=ST0;
			elsif rising_edge(clk) then
				pr_state<=nx_state;
			end if;
		end process;
		
	process(pr_state, start, rapido, nivelCheio, nivelVazio, tempo)
		begin
		
			--saidas--
			ZT<=0;
			M1<=0;
			M2<=0;
			B<=0;
			V<=0;
			
			case pr_state is
				when Parado =>
					if (start = '1') then
						nx_state<=Enchendo1;
					else 
						nx_state<=Parado;
					end if;
					
				when others =>
					nx_state<= Lixo;
			
	
	end case;
	end process;
	end architecture;
	
	
