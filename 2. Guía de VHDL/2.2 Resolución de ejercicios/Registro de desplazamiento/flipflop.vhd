-- Archivo: flipflop.vhd
library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
    port (
        clk, rst, ena, d : in  std_logic;
        q                : out std_logic
    );
end entity flipflop;

architecture behavior of flipflop is
    signal q_internal : std_logic := '0'; -- Estado inicial del flip-flop
begin
    process (clk, rst)
    begin
        if rst = '1' then
            q_internal <= '0'; -- Reset activo alto
        elsif rising_edge(clk) then
            if ena = '1' then
                q_internal <= d;
            end if;
        end if;
    end process;

    q <= q_internal;
end architecture behavior;