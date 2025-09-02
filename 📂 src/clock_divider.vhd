-- ==============================================================
-- Clock Divider
-- Input  : 100 MHz clock from Nexys 3 board
-- Output : 500 Hz clock (square wave) for 7-seg multiplexing
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    Port (
        clk_in  : in  STD_LOGIC;   -- 100 MHz input clock
        clk_out : out STD_LOGIC    -- 500 Hz output clock
    );
end clock_divider;

architecture Behavioral of clock_divider is
    -- Since 100 MHz = 10 ns period,
    -- 500 Hz = 2 ms period = 200,000 cycles
    -- Divide by 200,000 → toggle output every 100,000 cycles
    signal count    : natural range 0 to 99999 := 0;
    signal clk_500  : STD_LOGIC := '0';
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if count = 99999 then
                count   <= 0;
                clk_500 <= not clk_500; -- toggle output
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_500;
end Behavioral;
