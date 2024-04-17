library ieee;
use ieee.std_logic_1164.all;

entity flipflop_tb is
end entity flipflop_tb;

architecture tb_arch of flipflop_tb is
    -- Component declaration for the DUT (Design Under Test)
    component flipflop
        port (
            clk, rst, ena, d : in  std_logic;
            q                : out std_logic
        );
    end component flipflop;

    -- Signals for testbench
    signal clk, rst, ena, d, q : std_logic := '0';
begin
    -- Instantiate the DUT
    DUT : flipflop
        port map (
            clk => clk,
            rst => rst,
            ena => ena,
            d   => d,
            q   => q
        );

    -- Clock generation process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_process: process
    begin
        -- Apply stimulus
        rst <= '1'; -- Reset active high
        ena <= '1'; -- Enable
        d   <= '1'; -- Input data
        wait for 20 ns;

        rst <= '0'; -- De-assert reset
        wait for 10 ns;

        d <= '0'; -- Change input data
        wait for 10 ns;

        ena <= '0'; -- Disable
        wait for 10 ns;

        ena <= '1'; -- Re-enable
        wait for 10 ns;

        -- Add more stimulus here as needed

        wait;
    end process;
end architecture tb_arch;