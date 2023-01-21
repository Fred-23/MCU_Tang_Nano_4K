library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity soc_top is
	port(
		xtal_clk, reset_n: in std_logic;
		gpio: inout std_logic_vector(7 downto 0);
		UART_TX: out std_logic
	);
end soc_top;

--Structural because of wiring and physical stuff
--Different from beahvior
architecture structural of soc_top is
	signal clk_doubler_out: std_logic;
	begin
		cortexM3_inst: entity work.Gowin_EMPU_Top
		port map (
			sys_clk => clk_doubler_out, -- now using a 54MHz clock from the PLL
			gpio(7 downto 0) => gpio, --gpio(15 downto 8) unused for now
			uart0_rxd => '1', --RX unused for now
			uart0_txd => UART_TX,
			reset_n => reset_n --reset button
		);

		pllvr_inst: entity work.Gowin_PLLVR
		port map (
			clkout => clk_doubler_out, --2x xtal_clk
			clkin => xtal_clk --reference input clock is the crystal oscillator
		);
end structural;