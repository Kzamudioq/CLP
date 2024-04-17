library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter_tb is
end entity binary_counter_tb;

architecture sim of binary_counter_tb is
    constant N : integer := 4;  -- Número de bits del contador
    signal clk   : std_logic := '0';  -- Reloj de entrada
    signal reset : std_logic := '0';  -- Señal de reset
    signal count : std_logic_vector(N-1 downto 0);  -- Salida del contador
begin
    uut: entity work.binary_counter
        generic map (
            N => N
        )
        port map (
            clk   => clk,
            reset => reset,
            count => count
        );

    -- Estimulación
    stimulus: process
    begin
        reset <= '1';  -- Activa el reset
        wait for 10 ns;
        reset <= '0';  -- Desactiva el reset

        for i in 0 to 15 loop  -- Contar 16 ciclos de reloj
            clk <= not clk;  -- Invertir el reloj
            wait for 5 ns;
        end loop;

        -- Fin de la simulación
        wait;
    end process;
end architecture sim;