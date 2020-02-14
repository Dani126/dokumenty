-- SIPO.vhd
library ieee;
use ieee.std_logic_1164.all;

entity SIPO is
    port(
        clk     : in    std_logic;
        reset   : in    std_logic;
        D       : in    std_logic;
        Q       : out   std_logic_vector(3 downto 0));
end SIPO;

architecture struct of SIPO is
    
       signal sQ: std_logic_vector(3 downto 0);
begin
    
    process(clk, reset)
    begin
        if reset = '0' then
            sQ <= (others => '0');
        elsif clk'event and clk = '1' then
            sQ <= d & sQ(3 downto 1);
        end if;
    end process;
    Q <= sQ;
end struct;