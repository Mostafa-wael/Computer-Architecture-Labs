-- libraries --
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

----------- ALU module -----------

-- the interface of the module--
entity ALU is
  port (
    A : in std_logic_vector (15 downto 0);
    B : in std_logic_vector (15 downto 0);
    S : in std_logic_vector (3 downto 0);
    C_IN : in std_logic;
    C_OUT : out std_logic;
    F : out std_logic_vector (15 downto 0));

end entity;

-- the implematation of the module--
architecture ALU16 of ALU is
  -- call components --
  component partB is
    port (
      a : in std_logic_vector (15 downto 0);
      b : in std_logic_vector (15 downto 0);
      s : in std_logic_vector (1 downto 0);
      f : out std_logic_vector (15 downto 0));
  end component;

  component partC is
    port (
      a : in std_logic_vector (15 downto 0);
      b : in std_logic_vector (15 downto 0);
      s : in std_logic_vector (1 downto 0);
      cIn : in std_logic;
      cOut : out std_logic;
      f : out std_logic_vector (15 downto 0));
  end component;

  component partD is
    port (
      a : in std_logic_vector (15 downto 0);
      b : in std_logic_vector (15 downto 0);
      s : in std_logic_vector (1 downto 0);
      cIn : in std_logic;
      cOut : out std_logic;
      f : out std_logic_vector (15 downto 0));
  end component;

  -- define internal signals --
  signal fB : std_logic_vector(15 downto 0);
  signal fC : std_logic_vector(15 downto 0);
  signal fD : std_logic_vector(15 downto 0);
  signal cOutC, cOutD : std_logic;

begin
  -- define units --
  unitB : partB port map(a => A, b => B, s => S(1 downto 0), f => fB);
  unitC : partC port map(a => A, b => B, cIn => C_IN, s => S(1 downto 0), cOut => cOutC, f => fC);
  unitD : partD port map(a => A, b => B, cIn => C_IN, s => S(1 downto 0), cOut => cOutD, f => fD);
  
  -- Using Select, seems more logical here--
  with S(3 downto 2) select
  F <=
  fB when "01",
  fC when "10",
  fD when "11",
  (others => 'U') when others;
  
  with S(3 downto 2) select
  C_OUT <=
  cOutC when "10",
  cOutD when "11",
  'U' when others;
  
  --Another implematation: define process --
  -- process (S, fB, fC, fD, cOutC, cOutD)
  -- begin
  --   if S(3 downto 2) = "00" then
  --     F <= x"0000";
  --   elsif S(3 downto 2) = "01" then
  --     F <= fB;
  --   elsif S(3 downto 2) = "10" then
  --     F <= fC;
  --     C_OUT <= cOutC;
  --   elsif S(3 downto 2) = "11" then
  --     F <= fD;
  --     C_OUT <= cOutD;
  --   end if;
  -- end process;

end architecture;