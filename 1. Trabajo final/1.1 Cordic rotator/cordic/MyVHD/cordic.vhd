library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity CORDIC is
    Port (
        clk : in STD_LOGIC;               -- Reloj del sistema
        start : in STD_LOGIC;             -- Señal de inicio
        angle : in STD_LOGIC_VECTOR(15 downto 0); -- Ángulo de entrada en formato fijo
        sine : out STD_LOGIC_VECTOR(15 downto 0); -- Seno del ángulo
        cosine : out STD_LOGIC_VECTOR(15 downto 0); -- Coseno del ángulo
        ready : out STD_LOGIC            -- Señal de dato listo
    );
end CORDIC;

architecture Behavioral of CORDIC is
    -- Definiciones de señales internas
    signal x, y, z : signed(15 downto 0);
    signal i : integer := 0;
    constant ITERATIONS : integer := 16; -- Número de iteraciones
    -- Tabla de ángulos atan precalculados para cada iteración en formato de punto fijo
    type angle_table_type is array(0 to ITERATIONS-1) of signed(15 downto 0);
    constant angles : angle_table_type := (
    "0010000000000000", -- atan(2^-0) = 45 grados = 0.785398163 rad
    "0001001011100100", -- atan(2^-1) = 26.565051177 rad
    "0000100111111011", -- atan(2^-2) = 14.036243467 rad
    "0000010100010001", -- atan(2^-3) = 7.125016349 rad
    "0000001010001011", -- atan(2^-4) = 3.576334375 rad
    "0000000101000101", -- atan(2^-5) = 1.789910608 rad
    "0000000010100010", -- atan(2^-6) = 0.895173710 rad
    "0000000001010001", -- atan(2^-7) = 0.447614170 rad
    "0000000000101000", -- atan(2^-8) = 0.223810500 rad
    "0000000000010100", -- atan(2^-9) = 0.111905677 rad
    "0000000000001010", -- atan(2^-10) = 0.055952892 rad
    "0000000000000101", -- atan(2^-11) = 0.027976452 rad
    "0000000000000010", -- atan(2^-12) = 0.013988227 rad
    "0000000000000001", -- atan(2^-13) = 0.006994114 rad
    "0000000000000001" -- atan(2^-14) = 0.003497057 rad
    );
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if start = '1' then
                -- Inicialización de variables
                x <= to_signed(7071, 16);  -- cos(45°) en punto fijo, aproximadamente 1/sqrt(2)
                y <= to_signed(0, 16);    -- seno inicial
                z <= signed(angle);       -- Convertir ángulo de entrada a signed
                i <= 0;
                ready <= '0';
            elsif i < ITERATIONS then
                -- Lógica del algoritmo CORDIC
                if z(i) = '1' then  -- Si el bit más significativo de z es 1
                    -- Rotación en sentido contrario a las agujas del reloj
                    x <= x - (y srl i);  -- Desplazamiento aritmético a la derecha
                    y <= y + (x srl i);
                    z <= z - angles(i);
                else
                    -- Rotación en sentido de las agujas del reloj
                    x <= x + (y srl i);
                    y <= y - (x srl i);
                    z <= z + angles(i);
                end if;
                i <= i + 1;  -- Incremento del índice de iteración
            else
                -- Escalado final y salida
                sine <= std_logic_vector(y);
                cosine <= std_logic_vector(x);
                ready <= '1';
            end if;
        end if;
    end process;
end Behavioral;