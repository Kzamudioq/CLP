-- Archivo: sumador_1bit_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_1bit_tb is
end entity sumador_1bit_tb;

architecture behavior of sumador_1bit_tb is
    component sumador_1bit
        port (
            ci, a, b : in  std_logic;
            s, co    : out std_logic
        );
    end component;

    signal ci, a, b, s, co : std_logic;

begin
    uut: sumador_1bit port map (ci, a, b, s, co);

    -- Establecer los valores de prueba
    ci <= '0';
    a  <= '0';
    b  <= '0';
    wait for 10 ns;

    ci <= '0';
    a  <= '0';
    b  <= '1';
    wait for 10 ns;

    ci <= '0';
    a  <= '1';
    b  <= '0';
    wait for 10 ns;

    ci <= '0';
    a  <= '1';
    b  <= '1';
    wait for 10 ns;

    ci <= '1';
    a  <= '0';
    b  <= '0';
    wait for 10 ns;

    ci <= '1';
    a  <= '0';
    b  <= '1';
    wait for 10 ns;

    ci <= '1';
    a  <= '1';
    b  <= '0';
    wait for 10 ns;

    ci <= '1';
    a  <= '1';
    b  <= '1';
    wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;