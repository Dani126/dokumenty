-- PISO.vhd
library ieee;
use ieee.std_logic_1164.all;

entity PISO is
    port(
        clk, ws    : in    std_logic;
        reset   : in    std_logic;
        D       : in    std_logic_vector(3 downto 0);
        Q       : out   std_logic_vector(3 downto 0));
end PISO;

architecture struct of PISO is
    
       signal sQ: std_logic_vector(3 downto 0);
begin
    
    process(clk, reset)
    begin
        if reset = '0' then
            sQ <= (others => '0');
        elsif clk'event and clk = '1' then
            if ws='0' then
                sQ <= '0' & sQ(3 downto 1);
            else   
                sQ <=D;
            end if;
        end if;
    end process;
    Q <= sQ;
end struct;