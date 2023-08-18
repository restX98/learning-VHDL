library ieee;
use ieee.std_logic_1164.all;

entity ffsr is
    port (
        s, r: in bit;
        q: buffer bit := '0';
		qn: buffer bit := '1'
    );
end ffsr;

architecture Beh of ffsr is

begin
	qn <= NOT (s OR q);
    q <= NOT (r OR qn);
end Beh;