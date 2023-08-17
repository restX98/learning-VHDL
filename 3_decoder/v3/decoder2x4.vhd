library ieee;
use ieee.std_logic_1164.all;

entity Decoder2x4 is
    port (
        i : in std_logic_vector(1 downto 0);
        en: in std_logic;
        q : out std_logic_vector( 0 to 3)
    );
end Decoder2x4;

architecture Beh of Decoder2x4 is
begin
    q <= "1000" when en ='1' AND i= "00" else
         "0100" when en ='1' AND i= "01" else
         "0010" when en ='1' AND i= "10" else
         "0001" when en ='1' AND i= "11" else
         "0000";
end Beh;