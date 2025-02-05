library ieee;
use ieee.std_logic_1164.all;

entity maquinaRefriASM is
port(
	clk, rst : in std_logic;
	x : in integer range 0 to 25; -- 5 bits para escever o 25
	dev5, dev10 : out integer range 0 to 2;	
	prod : out integer range 0 to 2

);
end entity;

architecture arc_maquinaRefriASM of maquinaRefriASM is
	type state is (ST0, ST5, ST10, ST15, ST20, ST25, ST30, ST35, ST40, ST45);
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
	
	process(pr_state, x)
	begin 
	
	--saidas--
	
		dev5 <= 0;
		dev10 <= 0;
		prod <= 0;
		
		case pr_state is
			when ST0 =>
			
				if(x=5) then
					nx_state<= ST5;
				elsif(x=10) then
					nx_state<=ST10;
				elsif(x=25) then		
					nx_state<= ST25;
				else
                nx_state <= ST0;
				end if;
				
			when ST5 =>
			
				if(x=5) then
					nx_state<= ST10;
				elsif(x=10) then
					nx_state<=ST15;
				elsif(x=25) then
					nx_state<= ST30;
				else
                nx_state <= ST5;
				end if;
				
					
			when ST10 =>
		
				if(x=5) then
					nx_state<= ST15;
				elsif(x=10) then
					nx_state<=ST20;
				elsif(x=25) then
					nx_state<= ST35;
				else
                nx_state <= ST10;
				end if;
				
			when ST15 =>

				if(x=5) then
					nx_state<= ST20;
				elsif(x=10) then
					nx_state<=ST25;
				elsif(x=25) then
					nx_state<= ST40;
				else
                nx_state <= ST15;
				end if;
				
					
			when ST20 =>
			
				if(x=5) then
					nx_state<= ST25;
				elsif(x=10) then
					nx_state<=ST30;
				elsif(x=25) then
					nx_state<= ST45;
				else
                nx_state <= ST20;
				end if;
				
			when ST25 =>
			
				prod <= 1;
					nx_state<=ST0;

		
			when ST30 =>
				prod <= 1;
				dev5 <= 1;
					nx_state<= ST0;
					
			when ST35 =>
				prod <= 1;
				dev10 <= 1;
				nx_state <= ST0;


			When ST40 => 
				prod <= 1;
				dev10 <= 1;
				dev5 <= 1;
					nx_state<= ST0;
				
			when ST45 =>
				dev5 <= 1;
				dev10 <= 1;
					nx_state <= ST30;

		end case;
	end process;
	
end architecture;
		
		
		
		
		
		
		
		

	