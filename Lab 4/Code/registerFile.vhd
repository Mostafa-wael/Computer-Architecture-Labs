
-- libraries --
library ieee;
use ieee.std_logic_1164.all;
----------- Register File  module -----------

-- the interface of the module--
entity registerFileModule is
  generic (
    addressBusSize : integer := 2;
    dataBusSize : integer := 32);
  port (
    dataBus : inout std_logic_vector (dataBusSize - 1 downto 0);
    sourceAddress, destinationAddress : in std_logic_vector (addressBusSize - 1 downto 0);
    clk, rst, W_E, R_E : in std_logic);
end entity;

-- the implematation of the module--
architecture registerFile of registerFileModule is
  -- call components --
  component registersBlock is
    port (
      ENR, ENW : in std_logic_vector(2 ** addressBusSize - 1 downto 0);
      D : in std_logic_vector(dataBusSize - 1 downto 0);
      Q : out std_logic_vector(dataBusSize - 1 downto 0);
      Clk, rst : in std_logic);
  end component;

  component addressDecoder is
    port (
      inputAdd : in std_logic_vector (addressBusSize - 1 downto 0);
      decodedAdd : out std_logic_vector ((2 ** addressBusSize) - 1 downto 0);
      en : in std_logic);
  end component;

  -- define internal signals --
  signal sourceAddressDecoded, destinationAddressDecoded : std_logic_vector ((2 ** addressBusSize) - 1 downto 0);

begin
  -- define units --
  sourceDecoderUnit : addressDecoder generic map(inputSize => addressBusSize) port map(inputAdd => sourceAddress, decodedAdd => sourceAddressDecoded, en => R_E);
  destinationDecoderUnit : addressDecoder generic map(inputSize => addressBusSize) port map(inputAdd => destinationAddress, decodedAdd => destinationAddressDecoded, en => W_E);
  registersBlockUnit : registersBlock generic map(unitsNum => (2 ** addressBusSize, unitSize => dataBusSize)) port map(ENW => destinationAddressDecoded, ENR => sourceAddressDecoded, D => dataBus, Q => dataBus, clk => clk, rst => rst);

end;