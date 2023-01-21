library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity soc_top is
	port(
		xtal_clk, reset_n: in std_logic;
		gpio: inout std_logic_vector(7 downto 0);
		UART_TX: out std_logic
	);
end soc_top;


architecture Behavioral of soc_top is
    component Gowin_EMPU_Top
	port (
		sys_clk: in std_logic;
		gpio: inout std_logic_vector(15 downto 0);
		uart0_rxd: in std_logic;
		uart0_txd: out std_logic;
		reset_n: in std_logic
        );
    end component;

--    soc_top: Gowin_EMPU_Top
--        port map (
--            sys_clk => sys_clk_i,
--            gpio => gpio_io,
--            uart0_rxd => uart0_rxd_i,
--            uart0_txd => uart0_txd_o,
--            reset_n => reset_n_i
--        );

--    signal clk_1_hz: std_logic :='0';
--    signal sig_led: std_logic :='0';
--    signal compteur_clock : std_logic_vector (23 downto 0):=(others=>'0');
    
    

    begin
        cortexM3_inst: entity work.Gowin_EMPU_Top
		port map (
			sys_clk => xtal_clk, -- direct connection to 27MHz crystal oscillator
			gpio(7 downto 0) => gpio, --gpio(15 downto 8) unused for now
			uart0_rxd => '1', --RX unused for now
			uart0_txd => UART_TX,
			reset_n => reset_n --reset button
		);
           
  

end Behavioral;