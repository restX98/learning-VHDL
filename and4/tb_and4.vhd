library ieee;
use ieee.std_logic_1164.all;

entity TB_And4 is
end TB_And4;

architecture Beh of TB_And4 is

component And4 is
	port(
        a, b, c, d: in std_logic;
        q: out std_logic
    );		
end component;

signal a, b, c, d, q : std_logic;

begin
	dut: And4 port map(a, b, c, d, q);
	
	a <= '0' after 0 ns, '1' after 10 ns, '1' after 20 ns, '1' after 30 ns;
	b <= '1' after 0 ns, '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
	c <= '1' after 0 ns, '1' after 10 ns, '1' after 20 ns, '1' after 30 ns;
	d <= '0' after 0 ns, '1' after 10 ns, '1' after 20 ns, '0' after 30 ns;
end Beh;
