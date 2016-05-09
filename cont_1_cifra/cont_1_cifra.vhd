library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Contatore_1_cifra is
port(Clock, Enable_in, UpDown, Reset, Preset : in std_logic;
	  N_preset : in std_logic_vector(3 downto 0);
	  N : out std_logic_vector(3 downto 0);
	  Enable_out : out std_logic);
end Contatore_1_cifra;

architecture V0 of Contatore_1_cifra is
signal C : unsigned(3 downto 0);
 
begin
p1:process(Clock)
begin
	if rising_edge(Clock) then
		if (Reset='1') then
			C<=(others =>'0');
		else
			if (Preset='1') then
				C<= unsigned(N_preset);
			else
				if (Enable_in='1') then
					if (UpDown='1') then
						if (C=9) then
							C<=(others =>'0');
						else
							C<= C+1;
						end if;
					else
						if (C=0) then
							C<="1001";
						else
							C<= C-1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;	
Enable_out <= '1' when Enable_in='1' and ((C=9 and UpDown='1') or (C=0 and UpDown='0')) else '0';
N<= std_logic_vector(C);
end V0;