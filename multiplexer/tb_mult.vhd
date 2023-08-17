library ieee;
use ieee.std_logic_1164.all;

entity TB_Mult2x2 is
end TB_Mult2x2;

architecture Beh of TB_Mult2x2 is
    component Mux2x1 is
         port (
        a, b: in bit;
        s: in bit;
        z: out bit
    );
    end component;
    signal a, b, s, z: bit;
begin
    dut: Mux2x1 port map(a, b, s, z);
														  
	a <= '1' after 0 ns;
	b <= '0' after 0 ns;
	s <= '0' after 0 ns, '1' after 10 ns;
end Beh;