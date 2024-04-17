-- Archivo: flipflop_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity flipflop_tb is
end entity flipflop_tb;

architecture behavior of flipflop_tb is
    component flipflop
        port (
            clk, rst, ena, d : in  std_logic;
            q                : out std_logic
        );
    end component;

    signal clk, rst, ena, d, q : std_logic;

begin
    uut: flipflop port map (clk, rst, ena, d, q);

    -- Establecer los valores de prueba
    clk <= '0';
    rst <= '0';
    ena <= '0';
    d   <= '0';
    wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    d   <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    ena <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    rst <= '1'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    clk <= '1'; wait for 10 ns;
    rst <= '0'; wait for 10 ns;
    clk <= '0'; wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;