-- Archivo: sumador_restador_4bits.vhd
library ieee;
use ieee.std_logic_1164.all;

entity sumador_restador_4bits is
    port (
        sr_ctrl   : in  std_logic; -- Señal de control: '0' para suma, '1' para resta
        a, b      : in  std_logic_vector(3 downto 0);
        s         : out std_logic_vector(3 downto 0);
        co        : out std_logic
    );
end entity sumador_restador_4bits;

architecture behavior of sumador_restador_4bits is

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
    process(sr_ctrl)
    begin
        if sr_ctrl = '0' then -- Suma
            sumador_0: sumador_1bit port map ('0', a(0), b(0), s_temp(0), co_temp(0));
            sumador_1: sumador_1bit port map (co_temp(0), a(1), b(1), s_temp(1), co_temp(1));
            sumador_2: sumador_1bit port map (co_temp(1), a(2), b(2), s_temp(2), co_temp(2));
            sumador_3: sumador_1bit port map (co_temp(2), a(3), b(3), s_temp(3), co_temp(3));
        elsif sr_ctrl = '1' then -- Resta (mediante complemento a 2)
            sumador_0: sumador_1bit port map ('1', a(0), not b(0), s_temp(0), co_temp(0));
            sumador_1: sumador_1bit port map (co_temp(0), a(1), not b(1), s_temp(1), co_temp(1));
            sumador_2: sumador_1bit port map (co_temp(1), a(2), not b(2), s_temp(2), co_temp(2));
            sumador_3: sumador_1bit port map (co_temp(2), a(3), not b(3), s_temp(3), co_temp(3));
        end if;
    end process;

    -- Salidas del sumador
    s <= s_temp;
    co <= co_temp(3);

end architecture behavior;