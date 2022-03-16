
-- libraries --
library ieee;
use ieee.std_logic_1164.all;
library ieee;
use ieee.numeric_std.all;

----------- decoder module -----------

-- the interface of the module--
entity addressDecoder is
  generic (inputSize : integer := 2);
  port (
    inputAdd : in std_logic_vector (inputSize - 1 downto 0);
    decodedAdd : out std_logic_vector ((2 ** inputSize) - 1 downto 0);
    clk, rst, en : in std_logic);
end entity;

-- the implematation of the module--
architecture registerFile of addressDecoder is
begin
  decoding : process (clk) -- Synchronous Reset --
  begin
    if (falling_edge(clk)) then
      if (rst = '1') then
        decodedAdd <= (others => '0');
      else
        decodedAdd <= (others => '0'); -- init to 0000
        if (en = '1') then
          decodedAdd(to_integer(unsigned(inputAdd))) <= '1'; -- at 3 -> decodedAdd(3) <= 1 -> 1000
          -- in case of en='0' then decodedAdd is zeros
        end if;
      end if;
    end if;
  end process;

end;