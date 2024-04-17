library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador_1bit_tb is
end entity sumador_1bit_tb;

architecture testbench of sumador_1bit_tb is
    -- Component declaration for the unit under test (UUT)
    component sumador_1bit
        port (
            ci, a, b : in  std_logic;
            s, co    : out std_logic
        );
    end component;

    -- Signal declarations
    signal ci_sig, a_sig, b_sig : std_logic := '0';
    signal s_out, co_out         : std_logic;

begin
    -- Instantiate the unit under test (UUT)
    uut : sumador_1bit
    port map (
        ci => ci_sig,
        a  => a_sig,
        b  => b_sig,
        s  => s_out,
        co => co_out
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1
        ci_sig <= '0';
        a_sig <= '0';
        b_sig <= '0';
        wait for 10 ns;
        assert (s_out = '0' and co_out = '0')
            report "Test case 1 failed" severity error;

        -- Test case 2
        ci_sig <= '0';
        a_sig <= '1';
        b_sig <= '0';
        wait for 10 ns;
        assert (s_out = '1' and co_out = '0')
            report "Test case 2 failed" severity error;

        -- Test case 3
        ci_sig <= '1';
        a_sig <= '1';
        b_sig <= '1';
        wait for 10 ns;
        assert (s_out = '1' and co_out = '1')
            report "Test case 3 failed" severity error;

        -- End simulation
        wait;
    end process;

end architecture testbench;