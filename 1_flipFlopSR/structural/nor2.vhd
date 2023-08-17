library ieee;
use ieee.std_logic_1164.all;

entity Nor2 is
    port(
        x, y: in bit;
        z: buffer bit
    );
end Nor2;

architecture Beh of Nor2 is
begin
    z <= x nor y;
end Beh;