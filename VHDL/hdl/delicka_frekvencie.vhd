-- delicka_frekvencie.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity delicka is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            clk100 : inout std_logic;
            clk1 : inout std_logic);
end delicka;

architecture struct of delicka is
      signal vclk100 : std_logic;
      signal vclk1 : std_logic;
begin
    
    process(clk,reset)
        variable pocitadlo : std_logic_vector(12 downto 0);

    begin
        if reset = '0' then
            pocitadlo := (others => '0');
            vclk100 <= '0';
        elsif clk'event and clk = '1' then
            pocitadlo := pocitadlo + 1;
            if pocitadlo = x"1388" then
                pocitadlo := (others => '0');
                vclk100<= not vclk100;
            end if;
        end if;
        clk100<=vclk100;
    end process;

    process(clk100,reset)
        variable pocitadlo1 : std_logic_vector(6 downto 0);

    begin
        if reset = '0' then
            pocitadlo1 := (others => '0');
            vclk1 <= '0';
        elsif clk100'event and clk100 = '1' then
            pocitadlo1 := pocitadlo1 + 1;
            if pocitadlo1 = x"32" then
                pocitadlo1 := (others => '0');
                vclk1<= not vclk1;
            end if;
        end if;
        clk1<=vclk1;
    end process;
end struct;