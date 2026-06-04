library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity safe_lock_tb is
end safe_lock_tb;

architecture Behavioral of safe_lock_tb is

component safe_lock
    Port (
        password_in : in  STD_LOGIC_VECTOR(3 downto 0);
        enter       : in  STD_LOGIC;

        unlock      : out STD_LOGIC;
        alarm       : out STD_LOGIC
    );
end component;

signal password_in : STD_LOGIC_VECTOR(3 downto 0);
signal enter       : STD_LOGIC := '0';

signal unlock      : STD_LOGIC;
signal alarm       : STD_LOGIC;

begin

uut : safe_lock
port map(
    password_in => password_in,
    enter       => enter,
    unlock      => unlock,
    alarm       => alarm
);

process
begin

    ------------------------------------------------
    -- CORRECT PASSWORD
    ------------------------------------------------
    password_in <= "1010";
    enter <= '1';

    wait for 20 ns;

    enter <= '0';

    wait for 20 ns;

    ------------------------------------------------
    -- WRONG PASSWORD
    ------------------------------------------------
    password_in <= "1100";
    enter <= '1';

    wait for 20 ns;

    enter <= '0';

    wait for 20 ns;

    wait;

end process;

end Behavioral;