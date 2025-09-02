-- ==============================================================
-- Top Module
-- Instantiates clock divider + 7-seg driver
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port (
        clk_in  : in  STD_LOGIC;                -- 100 MHz board clock
        anode   : out STD_LOGIC_VECTOR (3 downto 0); -- 7-seg anodes
        cathode : out STD_LOGIC_VECTOR (7 downto 0)  -- 7-seg cathodes
    );
end top_module;

architecture Behavioral of top_module is
    signal clk_500Hz : STD_LOGIC;
begin
    -- Instantiate clock divider
    clk_div_inst : entity work.clock_divider
        port map (
            clk_in  => clk_in,
            clk_out => clk_500Hz
        );

    -- Instantiate 7-seg driver
    seg_driver_inst : entity work.seven_seg_driver
        port map (
            clk     => clk_500Hz,
            anode   => anode,
            cathode => cathode
        );
end Behavioral;
