-- Archivo: registro_desplazamiento_comportamiento_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity registro_desplazamiento_comportamiento_tb is
end entity registro_desplazamiento_comportamiento_tb;

architecture behavior of registro_desplazamiento_comportamiento_tb is
    component registro_desplazamiento_comportamiento
        port (
            clk, rst, e : in  std_logic;
            d           : in  std_logic_vector(3 downto 0);
            s           : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk, rst, e      : std_logic := '0';
    signal d                : std_logic_vector(3 downto 0) := "0000";
    signal s                : std_logic_vector(3 downto 0);

begin
    uut: registro_desplazamiento_comportamiento port map (clk, rst, e, d, s);

    -- Establecer los valores de prueba
    clk <= '0';
    rst <= '0';
    e   <= '0';
    d   <= "0000";
    wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    d   <= "1010"; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    e   <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;