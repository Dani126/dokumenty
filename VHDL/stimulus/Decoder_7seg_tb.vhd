-- Decoder_7seg_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity testbench is 
end testbench;

architecture struct of testbench is
        signal sd : std_logic_vector(3 downto 0);
        signal sq : std_logic_vector(6 downto 0);
    component Decoder_7seg is 
    port(
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(6 downto 0)
        );
    end component;
begin 
    DUT : Decoder_7seg
        port map(
            D => sd,
            Q => sq
            );
process
begin
sd<="0000";
wait for 100 ns;
sd<="0001";
wait for 100 ns;
sd<="0010";
wait for 100 ns;
sd<="0011";
wait for 100 ns;
sd<="0100";
wait for 100 ns;
sd<="0101";
wait for 100 ns;
sd<="0110";
wait for 100 ns;
sd<="0111";
wait for 100 ns;
sd<="1000";
wait for 100 ns;
sd<="1001";
wait for 100 ns;
end process;
end struct;
