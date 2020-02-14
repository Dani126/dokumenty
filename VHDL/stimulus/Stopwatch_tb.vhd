-- Stopwatch_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture struct of testbench is
    
    constant clk_period : time :=1 us;
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal clk100 : std_logic ;
    signal clk1 : std_logic ;
    signal segH_data : std_logic_vector(6 downto 0) ;
    signal segL_data : std_logic_vector(6 downto 0) ;

        component Stopwatch is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            clk100 : out std_logic;
            clk1 : out std_logic;
            segH : out std_logic_vector(6 downto 0);
            segL : out std_logic_vector(6 downto 0)
            );
           
        end component;

begin
    DUT : Stopwatch 
        port map(
            clk     =>  clk,
            reset   =>  reset,
            clk100  =>  clk100,
            clk1    =>  clk1,
            segH    => segH_data,
            segL    => segL_data);
    process
    begin
        wait for 100 ns;
        reset   <= '1';
        wait for 12000 ms;
    end process;

clk_gen:process(clk)
begin  
    clk <=not clk after clk_period/2;
    end process;
end struct; 


