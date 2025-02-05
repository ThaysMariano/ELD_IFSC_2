library ieee;
use ieee.std_logic_1164.all;

entity maquinaDeLavarASM is
port(
	clk, rst : in std_logic;
--	tempo : in integer range 0 to 1210;
	start, rapido, nivelCheio, nivelVazio : in std_logic;
	M1, M2, bomba, valvula : out std_logic;
	ZT : buffer std_logic
);

end entity;

-- fazer um contador


architecture arc_maquinaLavarASM of maquinaDeLavarASM is
	type state is (Parado, Enchendo1, Batento1, Molho, Batendo2, Esvaziando1, Enchendo2, Enxague, Esvaziando2,  Centrifugando, LIXO);
	signal pr_state, nx_state : state;
	signal tempo : integer range 0 to 1200;
	
begin 

	process(clk, rst, tempo)
		begin 
			if(rst='1') then
				pr_state<=Parado;
			elsif rising_edge(clk) then
				pr_state<=nx_state;
			end if;
		end process;
		
		--contador
		
		process(clk, ZT, rst)
		begin
			if(rst='1') then
				tempo<=0;
			elsif rising_edge(clk) then
				if (ZT='1' or tempo=1200)then 		--zt=0 or tempo=1210
					tempo<=0;
				else 
					tempo<=tempo+1;	
				end if;
			end if;
		end process;
	
			
		
	process(pr_state, start, rapido, nivelCheio, nivelVazio, tempo)
		begin
		
			--saidas--
			ZT<='0';
			M1<='0';
			M2<='0';
			bomba<='0';
			valvula<='0';
			
			case pr_state is
				when Parado =>
					if (start = '1') then
						nx_state<=Enchendo1;
					else 
						nx_state<=Parado;
					end if;
					
				when Enchendo1 =>
					valvula <= '1';
					
					if (nivelCheio= '1') then
						ZT<='1';
						nx_state<=Batento1;
					else 
						nx_state<=Enchendo1;
					end if;
					
				when Batento1 =>
					M1<='1';
					
					if(tempo =120) then
						ZT<='1';
						nx_state<=Molho;
					else 
						nx_state<=Batento1;
					end if;

				when Molho =>
					if (rapido='1') then 
						nx_state<= Esvaziando1;
					elsif (rapido='0' and tempo=900) then 
						ZT<='1';
						nx_state<=Batendo2;
					else
						nx_state<=Molho;
					end if;
	
				when Batendo2 =>
					M1<='1';
					
					if (tempo=1200) then
						nx_state<=Esvaziando1;
					else 
						nx_state<= Batendo2;
					end if;
					
				when Esvaziando1 =>
					bomba<='1';
					
					if(rapido='1') then
						nx_state<=Parado;
					elsif(rapido='0' and nivelVazio='1') then 
						nx_state<= Enchendo2;
					else 
						nx_state<=Esvaziando1;
					end if;
					
					
				when Enchendo2 =>
					valvula<='1';
					
					if (nivelCheio='1') then
						nx_state<=Enxague;
					else 
						nx_state<=Enchendo2;
					end if;
					
				when Enxague =>
					M1<='1';
					
					if (tempo=300) then 

						nx_state<=Esvaziando2;
					else
						nx_state<=Enxague;
			      end if;
					
				when Esvaziando2 =>
					bomba<='1';
					
					if(rapido='1') then 
						nx_state<=Parado;
					elsif (rapido='0' and nivelVazio='1') then 
						ZT<='1';
						nx_state<=Centrifugando;
					else
						nx_state<=Esvaziando2;
					end if;
					
				when centrifugando=>
					M2<='1';
					bomba<='1';
					
					if(tempo=300) then
						nx_state<=Parado;
					else 
						nx_state<=Centrifugando;
					end if;
					
					when others =>
						nx_state<=LIXO;
				
			
	
	end case;
	end process;
	end architecture;
	
	
