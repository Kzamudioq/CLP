-- Archivo: registro_desplazamiento_comportamiento.vhd
library ieee;
use ieee.std_logic_1164.all;

entity registro_desplazamiento_comportamiento is
    port (
        clk, rst, e : in  std_logic;
        d           : in  std_logic_vector(3 downto 0);
        s           : out std_logic_vector(3 downto 0)
    );
end entity registro_desplazamiento_comportamiento;

architecture behavior of registro_desplazamiento_comportamiento is
    signal registro : std_logic_vector(3 downto 0) := "0000";
begin
    process (clk, rst)
    begin
        if rst = '1' then
            registro <= "0000";  -- Reset activo alto
        elsif rising_edge(clk) then
            if e = '1' then
                registro <= d & registro(3 downto 1); -- Desplaza a la derecha
            end if;
        end if;
    end process;

    s <= registro;
end architecture behavior;