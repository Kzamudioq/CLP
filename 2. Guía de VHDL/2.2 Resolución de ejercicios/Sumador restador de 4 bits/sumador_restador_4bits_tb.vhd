-- Archivo: sumador_restador_4bits_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_restador_4bits_tb is
end entity sumador_restador_4bits_tb;

architecture behavior of sumador_restador_4bits_tb is
    component sumador_restador_4bits
        port (
            sr_ctrl   : in  std_logic; -- Señal de control: '0' para suma, '1' para resta
            a, b      : in  std_logic_vector(3 downto 0);
            s         : out std_logic_vector(3 downto 0);
            co        : out std_logic
        );
    end component;

    signal sr_ctrl : std_logic;
    signal a, b    : std_logic_vector(3 downto 0);
    signal s       : std_logic_vector(3 downto 0);
    signal co      : std_logic;

begin
    uut: sumador_restador_4bits port map (sr_ctrl, a, b, s, co);

    -- Establecer los valores de prueba
    sr_ctrl <= '0'; -- Suma
    a  <= "0000";
    b  <= "0000";
    wait for 10 ns;

    sr_ctrl <= '0'; -- Suma
    a  <= "0001";
    b  <= "0011";
    wait for 10 ns;

    sr_ctrl <= '1'; -- Resta
    a  <= "0001";
    b  <= "0011";
    wait for 10 ns;

    sr_ctrl <= '0'; -- Suma
    a  <= "1111";
    b  <= "1111";
    wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;