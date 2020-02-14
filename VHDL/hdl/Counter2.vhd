-- Counter2.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter2 is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            dir : in std_logic;
            Q : out std_logic_vector(3 downto 0));
end counter2;
architecture struct of counter2 is
begin
    
    process(clk,reset)
        variable vQ : std_logic_vector(3 downto 0);
    begin
        if reset = '0' then
            vQ := x"0";
        elsif clk'event and clk = '1' then
            if dir = '0' then
                vQ := vQ + 1;
                if vQ = x"9" then
                vQ := x"0";
                end if;
            else
                vQ := vQ - 1;
                if vQ = x"0" then
                    vQ := x"9";
                end if;
            end if;
        end if;
        Q<= vQ;
    end process;
end struct;