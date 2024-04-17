library IEEE;
use IEEE.std_logic_1164.all;

entity sumador_restador_4bits_tb is
end sumador_restador_4bits_tb;

architecture testbench of sumador_restador_4bits_tb is
    -- Component declaration
    component sumador_restador_4bits is
        port (
            a_i   : in  std_logic_vector(3 downto 0);  -- 4-bit A input
            b_i   : in  std_logic_vector(3 downto 0);  -- 4-bit B input
            ci_i  : in  std_logic;                     -- Carry In for the 1st bit
            op_i  : in  std_logic;                     -- Operation control (0: add, 1: subtract)
            s_o   : out std_logic_vector(3 downto 0);  -- 4-bit Sum Out
            co_o  : out std_logic                      -- Carry Out
        );
    end component;

    -- Signals declaration
    signal a_i     : std_logic_vector(3 downto 0) := "0000";
    signal b_i     : std_logic_vector(3 downto 0) := "0000";
    signal ci_i    : std_logic := '0';
    signal op_i    : std_logic := '0';
    signal s_o     : std_logic_vector(3 downto 0);
    signal co_o    : std_logic;

begin
    -- Instantiate the DUT (Device Under Test)
    DUT: sumador_restador_4bits 
        port map (
            a_i => a_i, 
            b_i => b_i, 
            ci_i => ci_i, 
            op_i => op_i, 
            s_o => s_o, 
            co_o => co_o
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test cases
        a_i <= "0000"; b_i <= "0000"; ci_i <= '0'; op_i <= '0'; -- 0 + 0
        wait for 10 ns;
        
        a_i <= "0001"; b_i <= "0001"; ci_i <= '0'; op_i <= '0'; -- 1 + 1
        wait for 10 ns;
        
        a_i <= "0001"; b_i <= "0001"; ci_i <= '0'; op_i <= '1'; -- 1 - 1
        wait for 10 ns;
        
        a_i <= "1000"; b_i <= "0001"; ci_i <= '0'; op_i <= '0'; -- 8 + 1
        wait for 10 ns;
        
        a_i <= "1000"; b_i <= "0001"; ci_i <= '1'; op_i <= '0'; -- 8 + 1 (with carry in)
        wait for 10 ns;

        -- Add more test cases as needed
        
        wait;
    end process stimulus_process;

end testbench;