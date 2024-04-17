-- Archivo: multiplexor_2x1_tb.vhd
library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_2x1_tb is
end entity multiplexor_2x1_tb;

architecture behavior of multiplexor_2x1_tb is
    component multiplexor_2x1
        port (
            sel       : in  std_logic;
            data0, data1 : in  std_logic;
            output    : out std_logic
        );
    end component;

    signal sel       : std_logic;
    signal data0, data1 : std_logic;
    signal output    : std_logic;

begin
    uut: multiplexor_2x1 port map (sel, data0, data1, output);

    -- Establecer los valores de prueba
    sel    <= '0';
    data0  <= '0';
    data1  <= '1';
    wait for 10 ns;

    sel    <= '1';
    data0  <= '0';
    data1  <= '1';
    wait for 10 ns;

    sel    <= '0';
    data0  <= '1';
    data1  <= '0';
    wait for 10 ns;

    sel    <= '1';
    data0  <= '1';
    data1  <= '0';
    wait for 10 ns;

    -- Fin de la simulación
    wait;
end architecture behavior;