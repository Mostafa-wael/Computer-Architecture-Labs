-- libraries --
library ieee;
use ieee.std_logic_1164.all;

-- partA module --
entity partA is
  generic (n : integer := 16);
  port (
    a, b : in std_logic_vector (n - 1 downto 0);
    sel : in std_logic_vector (1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    f : out std_logic_vector (n - 1 downto 0));
end entity;

-- the implematation of the module--
architecture ALSU of partA is
  component nFullAdder is
    port (
      a, b : in std_logic_vector (n - 1 downto 0);
      cIn : in std_logic;
      cOut : out std_logic;
      sum : out std_logic_vector (n - 1 downto 0));
  end component;

  -- define internal signals --
  signal inputA, inputB : std_logic_vector(n - 1 downto 0);
  signal inputC:std_logic;

begin
  -- define units --
  nFullAdderUnit : nFullAdder generic map(n) port map(a => inputA, b => inputB, cIn => inputC, sum => f, cOut => cOut);

  -- define Process --
  setInputs : process (sel, a, b, cIn)
  begin
    if sel = "00" then --F = A OR F = A + 1--
      inputA <= a;
      inputB <= (others => '0');
      inputC<= cIn;
    elsif sel = "01" then --F = A + B OR F = A + B + 1--
      inputA <= a;
      inputB <= b;
      inputC<= cIn;
    elsif sel = "10" then --F = A - B OR F = A - B - 1--
      inputA <= a;
      inputB <= "not" (b);
      inputC<= cIn;
    elsif sel = "11" and cIn = '0' then --F =  A - 1--
      inputA <= a;
      inputB <= (others => '1');
      inputC<= cIn;
    elsif sel = "11" and cIn = '1' then --F = 0--
      inputA <= (others => '0');
      inputB <= (others => '0');
      inputC<= '0';
    end if;
  end process;

end architecture;
