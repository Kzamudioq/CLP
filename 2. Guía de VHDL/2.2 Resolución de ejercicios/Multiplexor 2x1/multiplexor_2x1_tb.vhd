library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_2x1_tb is
end entity multiplexor_2x1_tb;

architecture behavior of multiplexor_2x1_tb is
    -- Component declaration
    component multiplexor_2x1
        port (
            sel       : in  std_logic;
            data0, data1 : in  std_logic;
            output    : out std_logic
        );
    end component;

    -- Signals declaration
    signal sel     : std_logic := '0';
    signal data0   : std_logic := '0';
    signal data1   : std_logic := '1';
    signal output  : std_logic;

begin
    -- Instantiate the multiplexor
    uut_multiplexor : multiplexor_2x1
        port map (
            sel => sel,
            data0 => data0,
            data1 => data1,
            output => output
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Change selection signal after 10 ns
        wait for 10 ns;
        sel <= '1';
        wait for 10 ns;
        sel <= '0';
        wait for 10 ns;
        data0 <= '1';
        wait for 10 ns;
        data1 <= '0';
        wait;
    end process stimulus_process;

end architecture behavior;