-- Archivo: sumador_4bits.vhd
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Definición de la entidad
entity Sumador4bits is
    Port (
        a, b : in  std_logic_vector(3 downto 0); -- Entradas de 4 bits
        ci   : in  std_logic;                    -- Carry de entrada
        s    : out std_logic_vector(3 downto 0); -- Salida de 4 bits
        co   : out std_logic                     -- Carry de salida
    );
end Sumador4Bits;

-- Arquitectura del sumador de 4 bits
architecture Behavioral of Sumador4bits is
    signal sum1, sum2, sum3 : std_logic; -- Señales intermedias para las sumas parciales
begin
    -- Implementación de las sumas parciales
    sum1 <= a(0) xor b(0) xor ci;
    sum2 <= a(1) xor b(1) xor (a(0) and b(0)) xor (ci and (a(0) xor b(0)));
    sum3 <= a(2) xor b(2) xor (a(1) and b(1)) xor ((a(0) and b(0)) or (a(1) and (b(0) or ci)) or (b(1) and ci)) ;

    -- Definición de las salidas
    s <= (sum3 & sum2 & sum1 & (a(3) xor b(3) xor (a(2) and b(2)) xor ((a(1) and b(1)) or (a(2) and (b(1) or sum2)) or (b(2) and sum1))));
    co <= (a(3) and b(3)) or ((a(2) and b(2)) or ((a(1) and b(1)) or (a(2) and (b(1) or sum2)) or (b(2) and sum1))) or (a(3) and (b(2) or b(1) or sum2)) or (b(3) and (a(2) or a(1) or sum1)) ;
end Behavioral;