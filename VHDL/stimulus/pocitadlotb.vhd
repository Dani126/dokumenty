-- counter_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture struct of testbench is 
constant clk_period : time :=50ns;
    
    component counter is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            Q : out std_logic_vector(3 downto 0));
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal Q : std_logic_vector(3 downto 0);
begin
    DUT : counter
        port map(
        clk=> clk,
        reset=>reset,
        Q=>Q);

        process
         begin
            wait for 63 ns;
            reset <= '1';
            wait for 501 ns;
            reset <= '0';
            wait for 1 ns;
            reset <= '1';
            wait;
        end process;
clk_gen:process(clk)
begin  
    clk <=not clk after clk_period/2;
    end process;
   end struct; 