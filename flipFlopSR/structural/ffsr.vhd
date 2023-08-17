library ieee;
use ieee.std_logic_1164.all;

entity ffsr is
    port (
        s, r : in bit;
        q: buffer bit := '0';
		qn: buffer bit := '1'
    );
end ffsr;

architecture Netlist of ffsr is
    component Nor2 is
        port (
            x, y: in bit;
            z   : buffer bit
        );
    end component;
	signal tmpQ	: bit := '0';
	signal tmpQn : bit := '1';
begin
	q <= tmpQ after 0 ns;
	qn <= tmpQn after 1 ns;
	U1: Nor2 port map (s, q, tmpQn);
	U2: Nor2 port map (r, qn, tmpQ);	
end Netlist;