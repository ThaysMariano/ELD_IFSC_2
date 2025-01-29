-- Cópia Máquina de Estado e anotações 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity copiaMaquinaEstados is
port (
	clk, rst : in std_logic;
	x : in integer range 0 to 2; -- 2 bits pois o exemplo vai até 2 apenas
	y : out std_logic -- 1 bit pois so vai ate 1 no exemplo
	);
end entity;

architecture arqCOpiaMaqEst of copiaMaquinaEstados is
	type state is (A, B, C, D, LIXO);		--Cria os estados do tipo state
	Signal pr_state, nx_state : state;	--sinais do tipo state, o atual e o próximo
	
begin

-- logica sequencial --
	process(clk, rst)
	begin
		if(rst='1') then
			pr_state <= A;		-- Ao dar rst o estado atual é o A
		elsif rising_edge(clk) then
			pr_state <= nx_state;	--Na borda do clock o novo estado é passado para o atual
		end if;
	end process;
	
-- logica combinacional

	process(pr_state, x) --o que sera usado para analise
	begin

			y<='0'; --saida padrao
			
		case pr_state is --analisa onde a maquina está agora
			
			when A =>		--quando a maquina estiver em A
				if(x=2) then
					nx_state<= B;
				else 
					nx_state<=A;
				end if;				--se x=2, o proximo est será B, se nao A
				
			
			when B =>
				if(x=1) then 
					nx_state<=A;
				elsif(x=0) then
					nx_state<=C;
				else
					nx_state<=B;
				end if;
					
			
			When C =>
				y<='1';
				
				if(x=1) then 
					nx_state <= A;
				else 
					nx_state<=C;
				end if;
			
			
			when others =>
				nx_state<=LIXO;
			
		end case;
	end process;
end architecture;
		