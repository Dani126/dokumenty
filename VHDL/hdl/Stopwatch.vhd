-- Stopwatch.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Stopwatch is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            clk100 : out std_logic;
            clk1 : out std_logic;
            segH : out std_logic_vector(6 downto 0);
            segL : out std_logic_vector(6 downto 0)
            );
           
end Stopwatch;

architecture struct of Stopwatch is
      signal vclk100 : std_logic;
      signal vclk1 : std_logic;
      signal secCount : integer range 0 to 99;
      signal segH_data : std_logic_vector(3 downto 0);
      signal segL_data : std_logic_vector(3 downto 0);
      
      component delicka is 
        port(
            clk : in std_logic;
            reset : in std_logic;
            clk100 : inout std_logic;
            clk1 : inout std_logic);
      end component;

      component Decoder_7seg is 
         port(
             D : in std_logic_vector(3 downto 0);
             Q : out std_logic_vector(6 downto 0)
             );
      end component;

      component Decoder_10 is 
          port(
             data : in integer range 0 to 99;
             segH,segL: out std_logic_vector(3 downto 0)
             );
       end component;


begin
    
   X_Divider : delicka
        port map(
            clk     =>  clk,
            reset   =>  reset,
            clk100  =>  vclk100,
            clk1    =>  vclk1);

    X_SEG_H : Decoder_7seg
        port map(
            D => segH_data,
            Q => segH);
    X_SEG_L : Decoder_7seg
        port map(
            D => segL_data,
            Q => segL);
    X_SEG_decoder_10 : Decoder_10
        port map(
             data => secCount,
             segH => segH_data,
             segL => segL_data
            );
    sec_count_process : process(reset, vclk1)
        variable vCount : integer range 0 to 99;
    begin
        if reset = '0' then 
            vCount := 0;
        elsif vclk1'event and vclk1 = '1' then
            vCount := vCount + 1;
            if vCount = 100 then 
               vCount:= 0;
            end if;
        end if;
        secCount <= vCount;
     end process;

    clk100  <=  vclk100;
    clk1    <=  vclk1;
end struct;