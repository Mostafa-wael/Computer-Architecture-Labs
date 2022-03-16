library ieee;
use ieee.std_logic_1164.all;

-- partB module --

-- the interface of the module--
entity partB is
  generic (n : integer := 16);
  port (
    a, b : in std_logic_vector (n - 1 downto 0);
    sel : in std_logic_vector (1 downto 0);
    f : out std_logic_vector (n - 1 downto 0));

end entity;

-- the implematation of the module--
architecture ALSU of partB is
begin
  partBLogic:process (sel, a, b)
  begin
    if sel = "00" then --F = A and B--
      f <= a and b;
    elsif sel = "01" then --F = A or B--
      f <= a or b;
    elsif sel = "10" then --F = A xor B--
      f <= a xor b;
    elsif sel = "11" then --F = Not A--
      f <= not a;
    end if;
  end process;
end architecture;