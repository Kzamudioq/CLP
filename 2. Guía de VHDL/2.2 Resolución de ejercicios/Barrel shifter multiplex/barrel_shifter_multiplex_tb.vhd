library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter_multiplexor_tb is
end entity barrel_shifter_multiplexor_tb;

architecture sim of barrel_shifter_multiplexor_tb is
    constant N     : integer := 8;  -- Número de bits de la entrada
    constant M     : integer := 3;  -- Desplazamiento máximo
    signal a       : std_logic_vector(N-1 downto 0);  -- Entrada
    signal s       : std_logic_vector(N-1 downto 0);  -- Salida
    signal des     : integer range 0 to M;  -- Desplazamiento
begin
    uut: entity work.barrel_shifter_multiplexor
        generic map (
            N => N,
            M => M
        )
        port map (
            a   => a,
            s   => s,
            des => des
        );

    -- Estimulación
    stimulus: process
    begin
        -- Establecer la entrada a algún valor inicial
        a <= "10101010";

        -- Realizar desplazamientos y observar la salida
        for i in 0 to M loop
            des <= i;
            wait for 10 ns;
        end loop;

        -- Fin de la simulación
        wait;
    end process;
end architecture sim;