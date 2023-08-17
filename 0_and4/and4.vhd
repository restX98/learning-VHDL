library ieee;
use ieee.std_logic_1164.all;

entity And4 is
    port(
        a, b, c, d: in std_logic;
        q: out std_logic
    );
end And4;

architecture Netlist of And4 is
    component And2 is
        port(
            x, y: in std_logic;
            z: out std_logic
        );
    end component;
    signal s1, s2: std_logic;
begin
    U1: And2 port map (a, b, s1); -- assegnazione sequenziale
    U2: And2 PORT MAP (x => c, z => s2, y => d); -- assegnazione spcifica
	U3: And2 PORT MAP (s1, s2, q);
end Netlist;
