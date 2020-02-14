-- stopwatchcontrol.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity stopwatchcontrol is
    port(
        clk: in std_logic;
        inreset: in std_logic;
        button : in std_logic;
        enable : out std_logic;
        outreset: out std_logic
        );
end stopwatchcontrol;

architecture struct of stopwatchcontrol is
    
    signal pocitadlo : integer;
begin
    
    process (clk,inreset)
    begin
        if inreset = '0' then
            pocitadlo <= 0;
        elsif clk'event and clk = '1' then
            if button = '1' then
                pocitadlo <= pocitadlo +1;
            else 
                pocitadlo <= 0;
            end if;
        end if;
    end process;

    process(button, inreset)
    begin
        if inreset = '0' then 
            enable <= '0';
            outreset<= '1';
        elsif button'event and button = '0' then
            if pocitadlo < 50 then
                enable <= '0';
                outreset<= '1';
            elsif pocitadlo <200 then 
                enable <= '1';
                outreset <= '1';
            else 
                enable <= '1';
                outreset <= '0';
            end if;
        end if;
    end process ;

end struct;
            