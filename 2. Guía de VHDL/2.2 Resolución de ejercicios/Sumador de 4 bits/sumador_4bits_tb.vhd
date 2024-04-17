-- Archivo: sumador_4bits_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_4bits_tb is
end sumador_4bits_tb;

architecture behavior of sumador_4bits_tb is
    -- Señales para las entradas
    signal a_tb, b_tb : std_logic_vector(3 downto 0);
    signal ci_tb      : std_logic;
    -- Señales para las salidas
    signal s_tb       : std_logic_vector(3 downto 0);
    signal co_tb      : std_logic;

begin
    -- Instancia del sumador de 4 bits
    uut: entity work.Sumador4Bits
        port map (
            a => a_tb,
            b => b_tb,
            ci => ci_tb,
            s => s_tb,
            co => co_tb
        );

    -- Estímulos
    stimuli: process
    begin
        -- Prueba con diferentes entradas
        a_tb <= "0000"; b_tb <= "0000"; ci_tb <= '0'; wait for 10 ns;
        a_tb <= "0001"; b_tb <= "0001"; ci_tb <= '0'; wait for 10 ns;
        a_tb <= "0010"; b_tb <= "0010"; ci_tb <= '0'; wait for 10 ns;
        a_tb <= "0100"; b_tb <= "0100"; ci_tb <= '0'; wait for 10 ns;
        a_tb <= "1000"; b_tb <= "1000"; ci_tb <= '0'; wait for 10 ns;
        a_tb <= "1111"; b_tb <= "1111"; ci_tb <= '0'; wait for 10 ns;

        -- Prueba con carry en 1
        a_tb <= "1111"; b_tb <= "1111"; ci_tb <= '1'; wait for 10 ns;
        
        wait;
    end process;

end behavior;