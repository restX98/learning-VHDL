library ieee;
use ieee.std_logic_1164.all;

entity dp_semaphore is
	port (
		clk, wCount, selCount, start: in std_logic;
		cond: out std_logic
	);
end dp_semaphore;

architecture Beh of dp_semaphore is
    signal theshold: integer range 0 to 50;
    signal newCount: integer range 0 to 50;
    signal count: integer range 0 to 50;
begin

    theshold <= 9 when selCount='0' else 49;

    cond <= '0' when theshold < count else '1';
	
	process(clk)
	begin
		if falling_edge(clk) and (wCount='1' or start='1') then
			if theshold < count and not start='1' then
				count <= 1;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
    
    --alternative

    -- newCount <= 1 when theshold < count or start='1' else count + 1;

	-- process(clk)
	-- begin
	-- 	if falling_edge(clk) and (wCount='1' or start='1') then
	-- 		count <= newCount;
	-- 	end if;
	-- end process;
end Beh;