-- ==============================================================
-- 7-Segment Driver
-- Input  : clock (500 Hz) from clock divider
-- Output : anodes + cathodes for 4-digit 7-seg display
-- Function: Display "4321" across 4 digits
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_seg_driver is
    Port (
        clk    : in  STD_LOGIC;                 -- 500 Hz clock
        anode  : out STD_LOGIC_VECTOR (3 downto 0);  -- Anodes (digit enable)
        cathode: out STD_LOGIC_VECTOR (7 downto 0)   -- Cathodes (segments + DP)
    );
end seven_seg_driver;

architecture Behavioral of seven_seg_driver is
    signal digit_number : integer range 0 to 3 := 0;
begin
    -- Digit selector process (cycling through 4 digits)
    process(clk)
    begin
        if rising_edge(clk) then
            if digit_number >= 3 then
                digit_number <= 0;
            else
                digit_number <= digit_number + 1;
            end if;
        end if;
    end process;

    -- Assign digit patterns for "4321"
    process(digit_number)
    begin
        case digit_number is
            when 0 => 
                cathode <= "11001111";  -- Show 1
                anode   <= "1110";      -- Rightmost digit active
            when 1 => 
                cathode <= "10010010";  -- Show 2
                anode   <= "1101";
            when 2 => 
                cathode <= "10000110";  -- Show 3
                anode   <= "1011";
            when 3 => 
                cathode <= "10011000";  -- Show 4
                anode   <= "0111";      -- Leftmost digit active
            when others =>
                cathode <= "11111111";  -- Blank
                anode   <= "1111";
        end case;
    end process;
end Behavioral;
