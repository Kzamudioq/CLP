-- Archivo: binary_counter.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binary_counter is
    generic (
        N : integer := 4  -- Número de bits del contador
    );
    port (
        clk     : in  std_logic;           -- Reloj de entrada
        reset   : in  std_logic;           -- Señal de reset
        count   : out std_logic_vector(N-1 downto 0)  -- Salida del contador
    );
end entity binary_counter;

architecture structural of binary_counter is
    signal internal_count : unsigned(N-1 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            internal_count <= (others => '0');  -- Reinicia el contador cuando se activa el reset
        elsif rising_edge(clk) then
            internal_count <= internal_count + 1;  -- Incrementa el contador en cada flanco de subida del reloj
        end if;
    end process;

    count <= std_logic_vector(internal_count);  -- Convierte la cuenta interna a un vector std_logic
end architecture structural;