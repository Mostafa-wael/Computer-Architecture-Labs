library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------

entity counter is
  generic (
    addressBusSize : integer := 4);
  port (
    clk : in std_logic;
    rst : in std_logic;
    Count : out std_logic_vector(addressBusSize - 1 downto 0));
end counter;
-------------------------------------------------------

architecture counter of counter is
  signal preCount : unsigned(addressBusSize - 1 downto 0);
begin
  decrement : process (clk, rst)
  begin
    if rst = '1' then -- Async
      preCount <= X"A"; --10
    elsif rising_edge(Clk) then
      preCount <= preCount - 1; -- we aren't handling the underflow
    end if;
  end process;

  Count <= std_logic_vector(preCount);

end architecture;

-- To test the counter --
-- add wave -position insertpoint sim:/counter/*
-- force -freeze sim:/counter/clk 1 0, 0 {50 ps} -r 100
-- force -freeze sim:/counter/rst 1 0
-- run
-- force -freeze sim:/counter/rst 0 0
-- run
-- run
-- run
-- run
-- run
-- run
-- run
-- run
-- run
-- run
-- run