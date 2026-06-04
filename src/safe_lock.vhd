library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity safe_lock is
    Port (
        password_in : in  STD_LOGIC_VECTOR(3 downto 0);
        enter       : in  STD_LOGIC;

        unlock      : out STD_LOGIC;
        alarm       : out STD_LOGIC
    );
end safe_lock;

architecture Behavioral of safe_lock is

constant STORED_PASSWORD : STD_LOGIC_VECTOR(3 downto 0) := "1010";

begin

process(password_in, enter)
begin

    if enter = '1' then

        if password_in = STORED_PASSWORD then

            unlock <= '1';
            alarm <= '0';

        else

            unlock <= '0';
            alarm <= '1';

        end if;

    else

        unlock <= '0';
        alarm <= '0';

    end if;

end process;

end Behavioral;