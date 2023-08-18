library ieee;
use ieee.std_logic_1164.all;

entity cu_semaphore is
	port(
		start, clk, cond: in std_logic;
		red, yellow, green: out std_logic;
		wCount, selCount: out std_logic
	);	 
end cu_semaphore;

architecture Beh of cu_semaphore is
    type States is (vRed, yellowGreen, vGreen, yellowRed);
    signal state: States;
begin
	-- evoluzione della macchina a stati
	process(clk)
	begin
        -- se siamo sul fronte di discesa del clock
		-- if clk'event and clk'last_value='1' and clk='0' then
        if falling_edge(clk) then --alternative
			case state is
				when vRed =>
					if start='1' then state <= yellowGreen;
					else state <= vRed;
					end if;
				when yellowGreen =>
					if cond='0' then state <= vGreen;
					else state <= yellowGreen;	
					end if;
				when vGreen =>
					if cond='0' then state <= yellowRed;
					else state <= vGreen;
					end if;
				when yellowRed => -- when others =>
					if cond ='0' then state <= vRed;
					else state <= yellowRed;
					end if;
			end case;
		end if;	
	end process;
	
	-- generazione dei segnali di controllo e delle uscite
	process(state)
	begin	
		case state is
			when vRed =>
				red <= '1';	 
				yellow <= '0';
				green <= '0';
				wCount <= '0';
				selCount <= '0';
			when yellowGreen | yellowRed =>
				red <= '0';
				yellow <= '1';
				green <= '0';
				wCount <= '1';
				selCount <= '0';
			when vGreen => -- when others =>
				red <= '0';	 
				yellow <= '0';
				green <= '1';
				wCount <= '1';
				selCount <= '1';
		end case;	
	end process;

	-- alternative senza process:
	--  wCount <= '0' when state = vRed else '1';
	--  selCount <= '1' when state = vGreen else '0';
	--  red <= '1' when state = vRed else '0';
	--  yellow <= '1' when state = yellowGreen or state = yellowRed else '0';
	--  green <= '1' when state = vGreen else '0';
end Beh;
