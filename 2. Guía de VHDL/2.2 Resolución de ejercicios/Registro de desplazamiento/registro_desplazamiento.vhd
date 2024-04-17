-- Archivo: registro_desplazamiento.vhd
library ieee;
use ieee.std_logic_1164.all;

entity registro_desplazamiento is
    port (
        clk, rst, e : in  std_logic;
        d           : in  std_logic_vector(3 downto 0);
        s           : out std_logic_vector(3 downto 0)
    );
end entity registro_desplazamiento;

architecture behavior of registro_desplazamiento is
    component flipflop
        port (
            clk, rst, ena, d : in  std_logic;
            q                : out std_logic
        );
    end component;

    signal q1, q2, q3, q4 : std_logic;
begin
    FF1: flipflop port map (
        clk => clk,
        rst => rst,
        ena => e,
        d   => d(0),
        q   => q1
    );

    FF2: flipflop port map (
        clk => clk,
        rst => rst,
        ena => e,
        d   => d(1),
        q   => q2
    );

    FF3: flipflop port map (
        clk => clk,
        rst => rst,
        ena => e,
        d   => d(2),
        q   => q3
    );

    FF4: flipflop port map (
        clk => clk,
        rst => rst,
        ena => e,
        d   => d(3),
        q   => q4
    );

    s(0) <= q1;
    s(1) <= q2;
    s(2) <= q3;
    s(3) <= q4;
end architecture behavior;