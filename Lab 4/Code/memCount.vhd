-- libraries --
library ieee;
use ieee.std_logic_1164.all;

----------- unitsNum Registers(unitSize-bit D Flip Flop) module -----------
-- the interface of the module--
entity memCount is
  generic (
    addressBusSize : integer := 4;
    dataBusSize : integer := 32);
  port (
    W_RE : in std_logic;
    dataBus : inout std_logic_vector (dataBusSize - 1 downto 0);
    Clk, rst : in std_logic);
end entity;

-- the implematation of the module--
architecture memCount of memCount is
  -- call components --
  component ram is
    port (
      clk : in std_logic;
      W_RE : in std_logic;
      address : in std_logic_vector(addressBusSize - 1 downto 0);
      datain : in std_logic_vector(dataBusSize - 1 downto 0);
      dataout : out std_logic_vector(dataBusSize - 1 downto 0));
  end component;
  component counter is
    port (
      clk : in std_logic;
      rst : in std_logic;
      Count : out std_logic_vector(addressBusSize - 1 downto 0));
  end component;

  -- define internal signals --
  signal addressFromCount : std_logic_vector (addressBusSize - 1 downto 0);

begin
  -- define units --
  ramUnit : ram generic map(addressBusSize => addressBusSize, dataBusSize => dataBusSize) port map(address => addressFromCount, dataout => dataBus, datain => dataBus, W_RE => W_RE, clk => clk);
  counterUnit : counter generic map(addressBusSize => addressBusSize) port map(Count => addressFromCount, clk => clk, rst => rst);
end architecture;