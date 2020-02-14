-- counter.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            Q : out std_logic_vector(3 downto 0));
end counter;
architecture struct of counter is
    signal sQ : std_logic_vector(3 downto 0);
begin
    
    process(clk,reset)
    begin
        if reset = '0' then
            sQ <= (others => '0');
        elsif clk'event and clk = '1' then
            sQ <= sQ + 1;
        end if;
    end process;
      Q <= sQ;
end struct;