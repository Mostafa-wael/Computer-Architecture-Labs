-- libraries --
library ieee;
use ieee.std_logic_1164.all;

----------- Register(unitSize-bit D Flip Flop) module -----------
-- the interface of the module--
entity DFFregister is
  generic (unitSize : integer := 32);
  port (
    d : in std_logic_vector(unitSize - 1 downto 0);
    q : out std_logic_vector(unitSize - 1 downto 0);
    Clk, rst, enW : in std_logic);
end entity;

-- the implematation of the module--
architecture registerFile of DFFregister is
begin
  registerLogic : process (Clk) -- Synchronous Reset --
  begin
    if falling_edge(Clk) then
      if rst = '1' then
        q <= (others => '0');
      elsif enW = '1' then
        q <= d;
      end if;
    end if;
  end process;
end architecture;

-- libraries --
library ieee;
use ieee.std_logic_1164.all;

----------- unitsNum Registers(unitSize-bit D Flip Flop) module -----------
-- the interface of the module--
entity registersBlock is
  generic (
    unitsNum : integer := 4;
    unitSize : integer := 32);
  port (
    ENR, ENW : in std_logic_vector(unitsNum - 1 downto 0);
    D : in std_logic_vector(unitSize - 1 downto 0);
    Q : out std_logic_vector(unitSize - 1 downto 0);
    Clk, rst : in std_logic);
end entity;

-- the implematation of the module--
architecture registerFile of registersBlock is
  -- call components --
  component DFFregister is
    port (
      d : in std_logic_vector(unitSize - 1 downto 0);
      q : out std_logic_vector(unitSize - 1 downto 0);
      Clk, rst, enW : in std_logic);
  end component;

  -- define internal signals --
  type signalsArray is array (unitsNum - 1 downto 0) of std_logic_vector(unitSize - 1 downto 0);
  signal tempQ, tempD : signalsArray;

begin
  --   DFFregister1 : DFFregister generic map(unitSize) port map(enW => ENW(0),d => tempD(0), q => tempQ(0), clk => clk, rst => rst);
  --   DFFregister2 : DFFregister generic map(unitSize) port map(enW => ENW(1),d => tempD(1), q => tempQ(1), clk => clk, rst => rst);
  --   DFFregister3 : DFFregister generic map(unitSize) port map(enW => ENW(2),d => tempD(2), q => tempQ(2), clk => clk, rst => rst);
  --   DFFregister4 : DFFregister generic map(unitSize) port map(enW => ENW(3),d => tempD(3), q => tempQ(3), clk => clk, rst => rst);

  --   registerLogic : process (Clk) -- Synchronous Reset --
  --   begin
  --     if rising_edge(Clk) then
  --       if rst = '1' then
  --         Q <= (others => '0');
  --       elsif ENR(0) = '1' then
  --         Q <= tempQ(0);
  --       elsif ENR(1) = '1' then
  --         Q <= tempQ(1);
  --       elsif ENR(2) = '1' then
  --         Q <= tempQ(2);
  --       elsif ENR(3) = '1' then
  --         Q <= tempQ(3);
  --       else
  --         Q <= (others => 'Z');
  --       end if;

  --       if ENW(0) = '1' then
  --         tempD(0) <= D;
  --       elsif ENW(1) = '1' then
  --         tempD(1) <= D;
  --       elsif ENW(2) = '1' then
  --         tempD(2) <= D;
  --       elsif ENW(3) = '1' then
  --         tempD(3) <= D;
  --       end if;
  --     end if;
  --   end process;

  DFFregisterLoop : for i in 0 to unitsNum - 1 generate
    DFFregisterUnit : DFFregister generic map(unitSize) port map(enW => ENW(i), d => tempD(i), q => tempQ(i), clk => clk, rst => rst);

    registerLogic : process (Clk) -- Synchronous Reset --
    begin
      if rising_edge(Clk) then
        if rst = '1' then
          Q <= (others => '0');
          -- to make it generic, we want to replace those--
          --Start--
        elsif ENR(0) = '1' then
          Q <= tempQ(0);
        elsif ENR(1) = '1' then
          Q <= tempQ(1);
        elsif ENR(2) = '1' then
          Q <= tempQ(2);
        elsif ENR(3) = '1' then
          Q <= tempQ(3);
          --End--
          -- with this--
          --Start--
        -- elsif ENR(i) = '1' then
        --   Q <= tempQ(i);
          --End--
        elsif ENR = (ENR'range => '0') then
          Q <= (others => 'Z');
        end if;
        if ENW(i) = '1' then
          tempD(i) <= D;
        end if;
      end if;
    end process;
  end generate;

end architecture;