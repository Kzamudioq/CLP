-- Archivo: multiplexor_2x1.vhd
library ieee;
use ieee.std_logic_1164.all;

entity multiplexor_2x1 is
    port (
        sel       : in  std_logic;
        data0, data1 : in  std_logic;
        output    : out std_logic
    );
end entity multiplexor_2x1;

architecture behavior of multiplexor_2x1 is
begin
    process(sel, data0, data1)
    begin
        if sel = '0' then
            output <= data0;
        else
            output <= data1;
        end if;
    end process;
end architecture behavior;