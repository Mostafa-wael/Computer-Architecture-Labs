-- libraries --
library ieee;
use ieee.std_logic_1164.all;

-- fullAdder Module --
entity fullAdder is
  port (
    a, b : in std_logic;
    cIn : in std_logic;
    cOut : out std_logic;
    sum : out std_logic);
end fullAdder;

-- the implematation of the module--
architecture ALSU of fullAdder is
begin

  sum <= a xor b xor cIn;
  cOut <= (a and b) or (cIn and (a xor b));

end architecture;

--////////////////////////////////////////////////////////////////////////////--
--////////////////////////////////////////////////////////////////////////////--

-- libraries --
library ieee;
use ieee.std_logic_1164.all;

-- nFullAdder Module --
entity nFullAdder is
  generic (n : integer := 16);
  port (
    a, b : in std_logic_vector (n - 1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    sum : out std_logic_vector (n - 1 downto 0));
end nFullAdder;

-- the implematation of the module--
architecture ALSU of nFullAdder is
  -- call components --
  component fullAdder is
    port (
      a, b : in std_logic;
      cIn : in std_logic;
      cOut : out std_logic;
      sum : out std_logic);
  end component;
  signal temp : std_logic_vector(n downto 0);

begin

  temp(0) <= cIn;
  fullAdderLoop : for i in 0 to n - 1 generate
    currentAdder : fullAdder port map(a => a(i), b => b(i), cIn => temp(i), sum => sum(i), cOut => temp(i + 1));
  end generate;
  cOut <= temp(n);

end architecture;