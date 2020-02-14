-- PISO_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture struct of testbench is 

constant clk_period : time :=50ns;

signal clk : std_logic := '0';
signal reset : std_logic := '0';
signal ws: std_logic := '0';
signal D : std_logic_vector(3 downto 0) := x"0";
signal Q : std_logic_vector(3 downto 0);

component PISO is
    port(
        clk, ws    : in    std_logic;
        reset   : in    std_logic;
        D       : in    std_logic_vector(3 downto 0);
        Q       : out   std_logic_vector(3 downto 0));
end component;



begin
    DUT : PISO
        port map(
        clk=> clk,
        reset=>reset,
        ws=>ws,
        D=>D,
        Q=>Q);
    process
        begin
                wait for 63 ns;
                reset <= '1';
                wait for 48 ns;
                D<= x"5";
                wait for 100 ns;
                ws <= '1';
                wait for 58 ns;
                ws <= '0';

                wait for 300 ns;
                D<= x"8";
                wait for 100 ns;
                ws <= '1';
                wait for 58 ns;
                ws <= '0';
                wait;
    end process;

clk_gen:process(clk)
begin  
    clk <=not clk after clk_period/2;
    end process;
   end struct; 

