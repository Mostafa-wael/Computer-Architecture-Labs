

library ieee;
use ieee.std_logic_1164.all;

-- partD module --

-- the interface of the module--
entity partD is
  generic (n : integer := 16);
  port (
    a, b : in std_logic_vector (n - 1 downto 0);
    sel : in std_logic_vector (1 downto 0);
    cIn : in std_logic;
    cOut : out std_logic;
    f : out std_logic_vector (n - 1 downto 0));

end entity;

-- the implematation of the module--
architecture ALSU of partD is
begin
  partDLogic:process (sel, a, b, cIn)
  begin
    if sel = "00" then --F=Logic shift left A --
      f <= a(n-2 downto 0) & '0'; -- add 0 in case of logic shift--
      cOut <= a(n-1);
    elsif sel = "01" then--F=Rotate left A--
      f <= a(n-2 downto 0) & a(n-1);
      cOut <= a(n-1);
    elsif sel = "10" then --F=Rotate left A with Carry--
      f <= a(n-2 downto 0) & cIn;
      cOut <= a(n-1);
    elsif sel = "11" then --F = 0000--
      f <= x"0000";
      cOut <= '0';
    end if;
  end process;
end architecture;