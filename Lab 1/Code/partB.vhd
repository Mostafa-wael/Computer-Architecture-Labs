library ieee;
use ieee.std_logic_1164.all;

-- partB module --

-- the interface of the module--
entity partB is
  port (
    a : in std_logic_vector (15 downto 0);
    b : in std_logic_vector (15 downto 0);
    s : in std_logic_vector (1 downto 0);
    f : out std_logic_vector (15 downto 0));

end entity;

-- the implematation of the module--
architecture ALU16 of partB is
begin
  partBLogic:process (s, a, b)
  begin
    if s = "00" then --F = A and B--
      f <= a and b;
    elsif s = "01" then --F = A or B--
      f <= a or b;
    elsif s = "10" then --F = A xor B--
      f <= a xor b;
    elsif s = "11" then --F = Not A--
      f <= not a;
    end if;
  end process;
end architecture;