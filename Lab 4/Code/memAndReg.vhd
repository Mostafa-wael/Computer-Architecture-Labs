-- libraries --
library ieee;
use ieee.std_logic_1164.all;

----------- unitsNum Registers(unitSize-bit D Flip Flop) module -----------
-- the interface of the module--
entity memAndReg is
  generic (
    memAddressBusSize : integer := 4;
    regFileAddressBusSize : integer := 2;
    dataBusSize : integer := 32);
  port (
    mem_W_RE : in std_logic; 
    reg_R_E : in std_logic; 
    reg_W_E : in std_logic; 
    sourceAddress, destinationAddress : in std_logic_vector (regFileAddressBusSize - 1 downto 0);
    Clk, rst : in std_logic);
end entity;

-- the implematation of the module--
architecture memAndReg of memAndReg is
  -- call components --
  component ram is
    port (
      clk : in std_logic;
      W_RE : in std_logic;
      address : in std_logic_vector(memAddressBusSize - 1 downto 0);
      datain : in std_logic_vector(dataBusSize - 1 downto 0);
      dataout : out std_logic_vector(dataBusSize - 1 downto 0));
  end component;
  component counter is
    port (
      clk : in std_logic;
      rst : in std_logic;
      Count : out std_logic_vector(memAddressBusSize - 1 downto 0));
  end component;
  component registerFileModule is
    port (
      dataBus : inout std_logic_vector (dataBusSize - 1 downto 0);
      sourceAddress, destinationAddress : in std_logic_vector (regFileAddressBusSize - 1 downto 0);
      clk, rst, W_E, R_E : in std_logic);
  end component;

  -- define internal signals --
  signal addressFromCount : std_logic_vector (memAddressBusSize - 1 downto 0);
  signal dataBus :  std_logic_vector (dataBusSize - 1 downto 0);

begin
  -- define units --
  counterUnit : counter            generic map(memAddressBusSize => memAddressBusSize)                                 port map(Count => addressFromCount, clk => clk, rst => rst);
  ramUnit     : ram                generic map(memAddressBusSize => memAddressBusSize, dataBusSize => dataBusSize)     port map(address => addressFromCount, dataout => dataBus, datain => dataBus, W_RE => mem_W_RE, clk => clk);
  regFileUnit : registerFileModule generic map(memAddressBusSize => regFileAddressBusSize, dataBusSize => dataBusSize) port map(sourceAddress => sourceAddress, destinationAddress=>destinationAddress,  dataBus => dataBus, R_E => reg_R_E, W_E => reg_W_E, clk => clk, rst => rst);
end architecture;