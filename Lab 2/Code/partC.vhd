
library ieee;
use ieee.std_logic_1164.all;

-- partC module --

-- the interface of the module--
entity partC is
  generic (n : integer := 16);
  port (
    a, b : in std_logic_vector (n - 1 downto 0);
    sel : in std_logic_vector (1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    f : out std_logic_vector (n - 1 downto 0));

end entity;

-- the implematation of the module--
architecture ALSU of partC is
begin
  partCLogic:process (sel, a, b, cIn)
  begin
    if sel = "00" then --F=Logic shift right A --
      f <= '0' & a(n-1 downto 1); -- add 0 in case of logic shift--
      cOut <= a(0);
    elsif sel = "01" then --F=Rotate right A--
      f <= a(0) & a(n-1 downto 1);
      cOut <= a(0);
    elsif sel = "10" then --F=Rotate right A with Carry--
      f(n-1 downto 0) <= cIn & a(n-1 downto 1);
      cOut <= a(0);
    elsif sel = "11" then --F=Arithmetic shift right A--
      f <= a(n-1) & a(n-1 downto 1); -- duplicate the last bit in case of arithmatic shift--
      cOut <= a(0);
    end if;
  end process;
end architecture;