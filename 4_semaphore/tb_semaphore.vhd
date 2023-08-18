library ieee;
use ieee.std_logic_1164.all;

entity TB_sem is
end TB_sem;


architecture Beh of TB_sem is

    component cu_semaphore is
        port(
            start, clk, cond: in std_logic;
            red, yellow, green: out std_logic;
            wCount, selCount: out std_logic
        );		
    end component;

    component dp_semaphore is
        port(
            clk, wCount, selCount, start: in std_logic;
            cond: out std_logic
        );		
    end component;

    signal start, clk, cond: std_logic;
    signal red, yellow, green: std_logic;
    signal wCount, selCount: std_logic;
begin
	dut1: cu_semaphore port map(start, clk, cond, red, yellow, green, wCount, selCount);
	dut2: dp_semaphore port map(clk, wCount, selCount, start, cond);
	
	start <= '1' after 0 ns, '0' after 11 ns;
	
	process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;
end Beh;
