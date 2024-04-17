-- Archivo: sumador_4bits_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_4bits_tb is
end entity sumador_4bits_tb;

architecture behavior of sumador_4bits_tb is
    component sumador_4bits
        port (
            ci        : in  std_logic;
            a, b      : in  std_logic_vector(3 downto 0);
            s         : out std_logic_vector(3 downto 0);
            co        : out std_logic
        );
    end component;

    signal ci      : std_logic;
    signal a, b    : std_logic_vector(3 downto 0);
    signal s       : std_logic_vector(3 downto 0);
    signal co      : std_logic;

begin
    uut: sumador_4bits port map (ci, a, b, s, co);

    -- Establecer los valores de prueba
    ci <= '0';
    a  <= "0000";
    b  <= "0000";
    wait for 10 ns;

    ci <= '0';
    a  <= "0001";
    b  <= "0011";
    wait for 10 ns;

    ci <= '1';
    a  <= "0001";
    b  <= "0011";
    wait for 10 ns;

    ci <= '0';
    a  <= "1111";
    b  <= "1111";
    wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;