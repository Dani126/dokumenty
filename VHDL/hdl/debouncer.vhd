-- debouncer.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity debouncer is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            input : in std_logic;
            Q : out std_logic);
end debouncer;
architecture struct of debouncer is

    signal Sreset,Scount,Sd : std_logic;
begin
    
    Sreset<=reset and (input xor Sd);

    counter: process(clk,Sreset)
        variable count : std_logic_vector(3 downto 0);
    begin
        if Sreset = '0' then
            Scount <= '0';
            count:= (others => '0');

        elsif clk'event and clk = '1' then

            if count = "1111" then
                Scount <= '1';
            
            else
                count:= count+1;
                
            end if;
        end if;
    end process;

    dff : process(reset, Scount)
    begin
        if reset = '0'then
            Sd<= '0';
        elsif Scount'event and Scount = '1' then
            Sd<= input;
        end if;
    end process;

    Q <= Sd;
end struct;