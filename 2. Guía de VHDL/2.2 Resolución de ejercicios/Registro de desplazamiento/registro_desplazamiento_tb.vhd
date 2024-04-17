library ieee;
use ieee.std_logic_1164.all;

entity registro_desplazamiento_tb is
end entity registro_desplazamiento_tb;

architecture tb_arch of registro_desplazamiento_tb is
    -- Component declaration for the DUT (Design Under Test)
    component registro_desplazamiento
        port (
            clk, rst, e : in  std_logic;
            d           : in  std_logic_vector(3 downto 0);
            s           : out std_logic_vector(3 downto 0)
        );
    end component registro_desplazamiento;

    -- Signals for testbench
    signal clk, rst, e : std_logic := '0';
    signal d : std_logic_vector(3 downto 0) := "0000";
    signal s : std_logic_vector(3 downto 0);

begin
    -- Instantiate the DUT
    DUT : registro_desplazamiento
        port map (
            clk => clk,
            rst => rst,
            e   => e,
            d   => d,
            s   => s
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
        e   <= '1'; -- Enable
        d   <= "1100"; -- Input data
        wait for 20 ns;

        rst <= '0'; -- De-assert reset
        wait for 10 ns;

        d <= "0010"; -- Change input data
        wait for 10 ns;

        e <= '0'; -- Disable
        wait for 10 ns;

        e <= '1'; -- Re-enable
        wait for 10 ns;

        -- Add more stimulus here as needed

        wait;
    end process;
end architecture tb_arch;