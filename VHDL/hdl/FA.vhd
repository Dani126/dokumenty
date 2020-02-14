-- FA.vhd
library ieee;
use ieee.std_logic_1164.all;

entity FA is 
    port(
        a : in std_logic;
        b : in std_logic;
        Cin : in std_logic;
        s, cout : out std_logic
        );
end FA;

architecture struct of FA is
       signal s1, c1, c2 : std_logic;

       component HA is
             port(
                  a : in std_logic;
                  b : in std_logic;
                  s, c : out std_logic
        );
        end component;
begin
    HA1 : HA
    port map(
        a=> a,
        b=> b,
        c=> c1,
        s=> s1
    );

    HA2 : HA
    port map(
        a=> s1,
        b=> cin,
        c=> c2,
        s=> s
    );
    cout<= c1 or c2;


end struct;