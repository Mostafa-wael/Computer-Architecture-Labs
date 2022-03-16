-- libraries --
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

----------- ALU module -----------

-- the interface of the module--
entity ALU is
  generic (n : integer := 16);
  port (
    A, B : in std_logic_vector (n-1 downto 0);
    SEL : in std_logic_vector (3 downto 0);
    C_IN : in std_logic;
    C_OUT : out std_logic;
    F : out std_logic_vector (n-1 downto 0));

end entity;

-- the implematation of the module--
architecture ALSU of ALU is
  -- call components --
  component partA is
    port (
      a, b : in std_logic_vector (n - 1 downto 0);
      sel  : in std_logic_vector (1 downto 0);
      cIn  : in std_logic;
      cOut : out std_logic;
      f    : out std_logic_vector (n-1 downto 0));
  end component;

  component partB is
    port (
      a, b : in std_logic_vector (n - 1 downto 0);
      sel  : in std_logic_vector (1 downto 0);
      f    : out std_logic_vector (n-1 downto 0));
  end component;

  component partC is
    port (
      a, b : in std_logic_vector (n - 1 downto 0);
      sel  : in std_logic_vector (1 downto 0);
      cIn  : in std_logic;
      cOut : out std_logic;
      f    : out std_logic_vector (n-1 downto 0));
  end component;

  component partD is
    port (
      a, b : in std_logic_vector (n - 1 downto 0);
      sel  : in std_logic_vector (1 downto 0);
      cIn  : in std_logic;
      cOut : out std_logic;
      f    : out std_logic_vector (n-1 downto 0));
  end component;

  -- define internal signals --
  signal fA, fB, fC, fD : std_logic_vector(n-1 downto 0);
  signal cOutA, cOutC, cOutD : std_logic;

begin
  -- define units --
  unitA : partA port map(a => A, b => B, cIn => C_IN, sel => SEL(1 downto 0), cOut => cOutA, f => fA);
  unitB : partB port map(a => A, b => B, sel => SEL(1 downto 0), f => fB);
  unitC : partC port map(a => A, b => B, cIn => C_IN, sel => SEL(1 downto 0), cOut => cOutC, f => fC);
  unitD : partD port map(a => A, b => B, cIn => C_IN, sel => SEL(1 downto 0), cOut => cOutD, f => fD);
  
  -- Using Select, seems more logical here--
  with SEL(3 downto 2) select
  F <=
  fA when "00",
  fB when "01",
  fC when "10",
  fD when "11",
  (others => 'U') when others;
  
  with SEL(3 downto 2) select
  C_OUT <=
  cOutA when "00",
  cOutC when "10",
  cOutD when "11",
  'U' when others;
  
  --Another implematation: define process --
  -- process (SEL, fB, fC, fD, cOutC, cOutD)
  -- begin
  --   if SEL(3 downto 2) = "00" then
  --     F <= fA;
  --     C_OUT <= cOutA
  --   elsif SEL(3 downto 2) = "01" then
  --     F <= fB;
  --   elsif SEL(3 downto 2) = "10" then
  --     F <= fC;
  --     C_OUT <= cOutC;
  --   elsif SEL(3 downto 2) = "11" then
  --     F <= fD;
  --     C_OUT <= cOutD;
  --   end if;
  -- end process;

end architecture;