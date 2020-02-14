-- FA_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity testbench is 
end testbench;
-- testbench musi byt napisane ako je,alebo zmenit nastavenia

architecture struct of testbench is
    
        signal sa, sb, scin, scout, ss  : std_logic;

        component FA is
            port(
                 a : in std_logic;
                 b : in std_logic;
                 cin : in std_logic;
                 s, cout : out std_logic
                 );
        end component;
begin
        DUT : FA    --tu neni bodkociarka,DUT je dane v settings
        port map(
            a =>sa,
            b =>sb,
            cin => scin,
            cout => scout,            
            s =>ss
            -- nalavo porty,napravo signaly,sipka ukazuje na signal
        );
        process     --pre sekvencne ulohy sa pouziva process
        begin
            SA <='0';
            SB <='0';
            scin <='0';
            wait for 100ns;
            SA <='0';
            SB <='0';
            scin <='1';
            wait for 100ns;
            SA <='0';
            SB <='1';
            scin <='0';
            wait for 100ns;
            SA <='0';
            SB <='1';
            scin <='1';
            wait for 100ns;
            SA <='1';
            SB <='0';
            scin <='0';
            wait for 100ns;
            SA <='1';
            SB <='0';
            scin <='1';
            wait for 100ns;
            SA <='1';
            SB <='1';
            scin <='0';
            wait for 100ns;
            SA <='1';
            SB <='1';
            scin <='1';
            wait for 100ns; --ak dam len wait,necha mi posledne...nebude mi opakovat

        end process;
end struct;