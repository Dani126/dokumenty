-- top.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
    port(
        clk             : in std_logic;
        clk_out_1Hz     : out std_logic;
        clk_out_100Hz   : out std_logic;
        segH            : out std_logic_vector(6 downto 0);
        segL            : out std_logic_vector(6 downto 0);
        button : in std_logic;
        LEDbtn : out std_logic
        );
end top;

architecture struct of top is
    
    signal clk1MHz       : std_logic;
    signal clk100Hz      : std_logic;
    signal clk1Hz        : std_logic;
    signal lock          : std_logic;
    signal sreset        : std_logic;
    signal btndb         : std_logic;
    signal nButton       : std_logic; 

    component PLL_1 is
       port(
        POWERDOWN, CLKA     :   in std_logic;
        LOCK, GLA           :   out std_logic);
    end component;

    component Stopwatch is 
        port(
            clk : in std_logic;
            button : in std_logic;
            reset : in std_logic;
            clk100 : out std_logic;
            clk1 : out std_logic;
            segH : out std_logic_vector(6 downto 0);
            segL : out std_logic_vector(6 downto 0));
           
     end component;

     component debouncer is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            input : in std_logic;
            Q : out std_logic);
      end component;

begin
    
    X_PLL : PLL_1
        port map(
            POWERDOWN   =>  '1',
            CLKA        =>  clk,
            LOCK        =>  lock,
            GLA         =>  clk1MHz);

    X_Stopwatch : Stopwatch
        port map(
            clk        =>  clk1MHz,
            button     =>  btndb,
            reset      =>  lock,
            clk100     =>  clk1Hz,
            clk1       =>  clk100Hz,
            segH       =>  segH,
            segL       =>  segL);
        
    X_Debouncer : debouncer
    port map(
        clk => clk100Hz,
        reset => lock,
        input => nButton,
        Q => btndb
        );
    nButton <= not button;

    LEDbtn <= btndb;
    clk_out_1Hz     <=  clk1Hz;
    clk_out_100Hz   <=  clk100Hz;

end struct;
        