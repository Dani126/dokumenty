-- stopwatchcontrol_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture struct of testbench is
    
    constant clk_period : time := 10ms;

    signal clk : std_logic := '0';
    signal button : std_logic;
    signal enable : std_logic;
    signal reset : std_logic;
    signal sreset : std_logic;

    component stopwatchcontrol is
         port(
               clk: in std_logic;
               inreset: in std_logic;
               button : in std_logic;
               enable : out std_logic;
               outreset: out std_logic
               );
    end component;

begin
    DUT : stopwatchcontrol
    port map(
        clk => clk,
        inreset => sreset,
        button => button,
        enable => enable,
        outreset => reset
        );
    
    process
    begin
        sreset <= '0';
        wait for 10ns;
        sreset <= '1';
        button <= '0';
        wait for 100ms;
        button <= '1';
        wait for 400ms;
        button <= '0';
        wait for 100ms;
        button <= '1';
        wait for 1000ms;
        button <= '0';
        wait for 100ms;
        button <= '1';
        wait for 2500ms;
        button <= '0';
        wait;
    end process;

    clk_gen : process(clk)
    begin
        clk <= not clk after clk_period /2;
    end process;
end struct;
