library ieee;
use ieee.std_logic_1164.all;

entity TB_Dec is
end TB_Dec;

architecture Beh of TB_Dec is
    component Decoder2x4 is
        port (
            i : in std_logic_vector(1 downto 0);
            en: in std_logic;
            q : out std_logic_vector( 0 to 3)
        );
    end component;
    signal i: std_logic_vector(1 downto 0);
    signal en: std_logic;
    signal q: std_logic_vector( 0 to 3);
begin
    dut: Decoder2x4 port map(i, en, q);
														  
	en <= '0' after 0 ns, '1' after 10 ns, '0' after 50 ns;
	i <= "00" after 0 ns, "01" after 20 ns, "10" after 30 ns, "11" after 40 ns;
end Beh;