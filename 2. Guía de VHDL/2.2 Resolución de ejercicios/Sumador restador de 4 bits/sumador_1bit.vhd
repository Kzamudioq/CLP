library ieee;
use ieee.std_logic_1164.all;

entity sumador_1bit is
    port (
        ci, a, b : in  std_logic;
        s, co    : out std_logic
    );
end entity sumador_1bit;

architecture behavior of sumador_1bit is
begin
    s <= ci xor a xor b;
    co <= (a and b) or (ci and (a xor b));
end architecture behavior;