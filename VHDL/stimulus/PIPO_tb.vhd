-- PIPO_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture struct of testbench is 

constant clk_period : time :=50ns;

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal D : std_logic_vector(3 downto 0) := x"0";
signal Q : std_logic_vector(3 downto 0);

component PIPO is
    port(
        clk     : in    std_logic;
        reset   : in    std_logic;
        D       : in    std_logic_vector(3 downto 0);
        Q       : out   std_logic_vector(3 downto 0));
end component;

begin
    DUT : PIPO
        port map(
        clk=> clk,
        reset=>reset,
        D=>D,
        Q=>Q);
process
begin
    wait for 63 ns;
    reset <= '1';
    wait for 48 ns;
    D<= x"A";
    wait for 22 ns;
    D<= x"4";
    wait for 56 ns;
    D<= x"7";
    wait for 103 ns;
    D<= x"C";
    wait for 90 ns;
    D<= x"1";
    wait for 55 ns;
    D<= x"2";
    wait;
end process; clk_gen:process(clk)
begin  
    clk <=not clk after clk_period/2;
    end process;
   end struct; 

