library ieee;
use ieee.std_logic_1164.all;

entity Decoder2x4 is
    port (
        i: in std_logic_vector(1 downto 0);
        en: in std_logic;
        q: out std_logic_vector( 0 to 3)
    );
end Decoder2x4;

architecture Beh of Decoder2x4 is
begin
    q(0) <= en AND ( NOT i(1) ) AND (NOT i(0));
    q(1) <= en AND ( NOT i(1) ) AND i(0);
    q(2) <= en AND i(1) AND (NOT i(0));
    q(3) <= en AND i(1) AND i(0);
end Beh;