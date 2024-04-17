-- Archivo: barrel_shifter_multiplexores.vhd
library ieee;
use ieee.std_logic_1164.all;

entity barrel_shifter_multiplexor is
    generic (
        N          : integer := 8;  -- Número de bits de la entrada
        M          : integer := 3   -- Desplazamiento máximo
    );
    port (
        a           : in  std_logic_vector(N-1 downto 0);  -- Entrada
        s           : out std_logic_vector(N-1 downto 0);  -- Salida
        des         : in  integer range 0 to M             -- Desplazamiento
    );
end entity barrel_shifter_multiplexor;

architecture behavior of barrel_shifter_multiplexor is
begin
    process(a, des)
    begin
        for i in 0 to N-1 loop
            if i-des >= 0 and i-des < N then
                s(i) <= a(i-des);
            else
                s(i) <= '0'; -- Rellena con ceros si el desplazamiento es mayor que el tamaño de la entrada
            end if;
        end loop;
    end process;
end architecture behavior;