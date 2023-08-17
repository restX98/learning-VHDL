library ieee;
use ieee.std_logic_1164.all;

entity And2 is
    port(
        x, y: in std_logic;
        z: out std_logic
    );
end And2;

architecture Beh of And2 is
begin
    z <= x and y;
end Beh;