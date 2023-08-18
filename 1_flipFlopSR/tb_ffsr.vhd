library ieee;
use ieee.std_logic_1164.all;

entity TB_ffsr is
end TB_ffsr;

architecture Beh of TB_ffsr is
    component ffsr is
        port (
            s, r: in bit;
            q, qn: inout bit
        );
    end component;
    signal s, r, q, qn: bit;
begin
    dut: ffsr port map(s, r, q, qn);
														  
	s <= '0' after 0 ns, '1' after 10 ns , '0' after 11 ns, '1' after 40 ns, '0' after 41 ns;
    r <= '0' after 0 ns , '1' after 20 ns, '0' after 21 ns, '1' after 30 ns, '0' after 31 ns;
end Beh;