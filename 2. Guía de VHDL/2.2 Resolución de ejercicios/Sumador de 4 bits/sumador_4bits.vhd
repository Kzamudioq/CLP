-- Archivo: sumador_4bits.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_4bits is
    port (
        ci        : in  std_logic;
        a, b      : in  std_logic_vector(3 downto 0);
        s         : out std_logic_vector(3 downto 0);
        co        : out std_logic
    );
end entity sumador_4bits;

architecture behavior of sumador_4bits is

    component sumador_1bit
        port (
            ci, a, b : in  std_logic;
            s, co    : out std_logic
        );
    end component;

    signal co_temp : std_logic_vector(3 downto 0);
    signal s_temp  : std_logic_vector(3 downto 0);

begin

    -- Conexiones de los sumadores de 1 bit
    sumador_0: sumador_1bit port map (ci, a(0), b(0), s_temp(0), co_temp(0));
    sumador_1: sumador_1bit port map (co_temp(0), a(1), b(1), s_temp(1), co_temp(1));
    sumador_2: sumador_1bit port map (co_temp(1), a(2), b(2), s_temp(2), co_temp(2));
    sumador_3: sumador_1bit port map (co_temp(2), a(3), b(3), s_temp(3), co_temp(3));

    -- Salidas del sumador
    s <= s_temp;
    co <= co_temp(3);

end architecture behavior;