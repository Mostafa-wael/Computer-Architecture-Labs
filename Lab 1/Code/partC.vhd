
library ieee;
use ieee.std_logic_1164.all;

-- partC module --

-- the interface of the module--
entity partC is
  port (
    a : in std_logic_vector (15 downto 0);
    b : in std_logic_vector (15 downto 0);
    s : in std_logic_vector (1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    f : out std_logic_vector (15 downto 0));

end entity;

-- the implematation of the module--
architecture ALU16 of partC is
begin
  partCLogic:process (s, a, b, cIn)
  begin
    if s = "00" then --F=Logic shift right A --
      f <= '0' & a(15 downto 1); -- add 0 in case of logic shift--
      cOut <= a(0);
    elsif s = "01" then --F=Rotate right A--
      f <= a(0) & a(15 downto 1);
      cOut <= a(0);
    elsif s = "10" then --F=Rotate right A with Carry--
      f(15 downto 0) <= cIn & a(15 downto 1);
      cOut <= a(0);
    elsif s = "11" then --F=Arithmetic shift right A--
      f <= a(15) & a(15 downto 1); -- duplicate the last bit in case of arithmatic shift--
      cOut <= a(0);
    end if;
  end process;
end architecture;