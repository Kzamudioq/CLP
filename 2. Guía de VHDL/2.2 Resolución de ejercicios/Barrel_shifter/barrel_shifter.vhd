-- Archivo: barrel_shifter.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter is
    generic (
        N : integer := 8  -- Número de bits de la entrada
    );
    port (
        a    : in  std_logic_vector(N-1 downto 0);  -- Entrada
        s    : out std_logic_vector(N-1 downto 0);  -- Salida
        des  : in  integer range 0 to N-1  -- Desplazamiento
    );
end entity barrel_shifter;

architecture behavior of barrel_shifter is
begin
    process(a, des)
    begin
        for i in 0 to N-1 loop
            if i-des >= 0 and i-des < N then
                s(i) <= a(i-des);
            else
                s(i) <= '0'; 
            end if;
        end loop;
    end process;
end architecture behavior;