library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity ram is
  generic (
    addressBusSize : integer := 4;
    dataBusSize : integer := 32);
  port (
    clk : in std_logic;
    W_RE : in std_logic;
    address : in std_logic_vector(addressBusSize - 1 downto 0);
    datain : in std_logic_vector(dataBusSize - 1 downto 0);
    dataout : out std_logic_vector(dataBusSize - 1 downto 0));
end entity ram;

architecture syncrama of ram is

  type ram_type is array(0 to (2 ** addressBusSize) - 1) of std_logic_vector(dataBusSize - 1 downto 0);
  signal ram : ram_type;

begin
  process (clk) is
  begin
    if rising_edge(clk) then
      if W_RE = '1' then
        ram(to_integer(unsigned(address))) <= datain;
      end if;
    end if;
  end process;

  dataout <= ram(to_integer(unsigned(address))) when (W_RE = '0')
    else (others => 'Z');
end syncrama;

-- mem load -filltype dec -filldata 700 -fillradix hexadecimal -skip 0 /memcount/ramUnit/ram