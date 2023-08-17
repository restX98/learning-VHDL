library ieee;
use ieee.std_logic_1164.all;

entity Mux2x1 is
    port (
        a, b: in bit;
        s: in bit;
        z: out bit
    );
end Mux2x1;
architecture Beh of Mux2x1 is
    begin
    z <= a after 1 ns when s = '0' else
    b after 1 ns ;
end Beh;