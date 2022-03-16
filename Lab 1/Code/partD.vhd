

library ieee;
use ieee.std_logic_1164.all;

-- partD module --

-- the interface of the module--
entity partD is
  port (
    a : in std_logic_vector (15 downto 0);
    b : in std_logic_vector (15 downto 0);
    s : in std_logic_vector (1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    f : out std_logic_vector (15 downto 0));

end entity;

-- the implematation of the module--
architecture ALU16 of partD is
begin
  partDLogic:process (s, a, b, cIn)
  begin
    if s = "00" then --F=Logic shift left A --
      f <= a(14 downto 0) & '0'; -- add 0 in case of logic shift--
      cOut <= a(15);
    elsif s = "01" then--F=Rotate left A--
      f <= a(14 downto 0) & a(15);
      cOut <= a(15);
    elsif s = "10" then --F=Rotate left A with Carry--
      f <= a(14 downto 0) & cIn;
      cOut <= a(15);
    elsif s = "11" then --F = 0000--
      f <= x"0000";
      cOut <= '0';
    end if;
  end process;
end architecture;