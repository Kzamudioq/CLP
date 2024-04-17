-- Archivo: barrel_shifter_tb.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter_tb is
end entity barrel_shifter_tb;

architecture behavior of barrel_shifter_tb is
    constant N     : integer := 8;  -- Número de bits de la entrada
    signal a       : std_logic_vector(N-1 downto 0);  -- Entrada
    signal s       : std_logic_vector(N-1 downto 0);  -- Salida
    signal des     : integer range 0 to N-1;  -- Desplazamiento
begin
    uut: entity work.barrel_shifter
        generic map (
            N => N
        )
        port map (
            a   => a,
            s   => s,
            des => des
        );

    -- Establecer los valores de prueba
    a <= "01010101";
    des <= 0;
    wait for 10 ns;

    des <= 2;
    wait for 10 ns;

    des <= 5;
    wait for 10 ns;

    des <= 7;
    wait for 10 ns;

    des <= 3;
    wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;