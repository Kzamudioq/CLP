library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter_tb is
end entity barrel_shifter_tb;

architecture tb_arch of barrel_shifter_tb is
    -- Constant declaration for the input size
    constant N : integer := 8;
    
    -- Signals for testbench
    signal a    : std_logic_vector(N-1 downto 0);
    signal s    : std_logic_vector(N-1 downto 0);
    signal des  : integer range 0 to N-1;
begin
    -- Instantiate the DUT
    DUT : entity work.barrel_shifter
        generic map (
            N => N
        )
        port map (
            a   => a,
            s   => s,
            des => des
        );

    -- Stimulus process
    stim_process: process
    begin
        -- Apply stimulus
        a <= "10101010"; -- Input data
        des <= 0; -- No shift 
        wait for 10 ns;

        des <= 2; -- Shift right by 2
        wait for 10 ns;

        des <= 5; -- Shift left by 5
        wait for 10 ns;

        wait;
    end process;
end architecture tb_arch;