library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CORDIC_tb is
end CORDIC_tb;

architecture Behavioral of CORDIC_tb is
    constant CLK_PERIOD : time := 10 ns; -- Periodo del reloj
    signal clk_tb : std_logic := '0'; -- Señal de reloj para el banco de pruebas
    signal start_tb : std_logic := '0'; -- Señal de inicio para el banco de pruebas
    signal angle_tb : std_logic_vector(15 downto 0) := (others => '0'); -- Ángulo de entrada para el banco de pruebas
    signal sine_tb, cosine_tb : std_logic_vector(15 downto 0); -- Salidas del banco de pruebas
    signal ready_tb : std_logic := '0'; -- Señal de listo para el banco de pruebas

begin
    -- Proceso de generación de reloj
    clk_process : process
    begin
        while now < 1000 ns loop
            clk_tb <= not clk_tb;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Proceso de estímulo
    stim_process : process
        variable sine_integer : integer;
        variable cosine_integer : integer;
    begin
        wait for 20 ns; -- Espera para la inicialización
        
        -- Caso de prueba 1: Ángulo de 45 grados
        start_tb <= '1'; -- Señal de inicio activada
        angle_tb <= "0010000000000000"; -- Ángulo de entrada de 45 grados
        wait for 100 ns; -- Espera a que el módulo complete el cálculo
        start_tb <= '0'; -- Desactiva la señal de inicio
        wait until ready_tb = '1'; -- Espera hasta que los datos estén listos
        
        -- Convierte std_logic_vector a entero y muestra los resultados
        sine_integer := to_integer(unsigned(sine_tb));
        cosine_integer := to_integer(unsigned(cosine_tb));
        report "Sen(45°): " & integer'image(sine_integer);
        report "Coseno(45°): " & integer'image(cosine_integer);
        
        -- Caso de prueba 2: Ángulo de 30 grados
        wait for 20 ns; -- Espera para el próximo caso de prueba
        start_tb <= '1'; -- Señal de inicio activada
        angle_tb <= "0001100000000000"; -- Ángulo de entrada de 30 grados
        wait for 100 ns; -- Espera a que el módulo complete el cálculo
        start_tb <= '0'; -- Desactiva la señal de inicio
        wait until ready_tb = '1'; -- Espera hasta que los datos estén listos
        
        -- Convierte std_logic_vector a entero y muestra los resultados
        sine_integer := to_integer(unsigned(sine_tb));
        cosine_integer := to_integer(unsigned(cosine_tb));
        report "Sen(30°): " & integer'image(sine_integer);
        report "Coseno(30°): " & integer'image(cosine_integer);
        
        -- Agrega más casos de prueba según sea necesario
        
        wait;
    end process;
    
    -- Instancia del módulo CORDIC
    UUT : entity work.CORDIC
    port map (
        clk => clk_tb,
        start => start_tb,
        angle => angle_tb,
        sine => sine_tb,
        cosine => cosine_tb,
        ready => ready_tb
    );
    
end Behavioral;