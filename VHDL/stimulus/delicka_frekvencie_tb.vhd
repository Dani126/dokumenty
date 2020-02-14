-- delicka_frekvencie_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture struct of testbench is 
constant clk_period : time :=1 us;
    
    component delicka is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            clk100 : inout std_logic;
            clk1 : inout std_logic);
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal clk100 : std_logic := '0';
    signal clk1 : std_logic := '0';
begin
    DUT : delicka
        port map(
        clk=> clk,
        reset=>reset,
        clk100=>clk100,
        clk1=>clk1);
       
        process
         begin
            wait for 5 ns;
            reset <= '1';
            wait;
         end process;
clk_gen:process(clk)
begin  
    clk <=not clk after clk_period/2;
    end process;
end struct; 

