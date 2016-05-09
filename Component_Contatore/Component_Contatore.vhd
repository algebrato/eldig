library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Component_Contatore is
	Port ( 
	enable_in : in STD_LOGIC ;
	SEG : out STD_LOGIC_VECTOR(0 to 6);
	N_out : out STD_LOGIC_VECTOR(3 downto 0);
	enable_out : out STD_LOGIC;
	AN : out STD_LOGIC_VECTOR(3 downto 0);
	CLK100M : in STD_LOGIC;
	CLK_1K_O : out STD_LOGIC
	);
end Component_Contatore;

architecture Behavioral of Component_Contatore is

signal N: UNSIGNED(3 downto 0);
signal NN: UNSIGNED(15 downto 0);
signal clk_1k: STD_LOGIC;

begin
CLK_1K_O <= clk_1k; --collego le varie scatole con i segnali

SEG(0)<='0' when N=0 or N=2 or N=3 or N>4 else '1';
SEG(1)<='0' when N=0 or N=1 or N=2 or N=3 or N=4 or N=7 or N=8 or N=9 else '1';
SEG(2)<='0' when N=0 or N=1 or N=3 or N=4 or N=5 or N=6 or N=7 or N=8 or N=9 else '1';
SEG(3)<='0' when N=0 or N=2 or N=3 or N=5 or N=6 or N=8 or N>9 else '1';
SEG(4)<='0' when N=0 or N=2 or N=6 or N=8 or N>9 else '1';
SEG(5)<='0' when N=0 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';
SEG(6)<='0' when N=2 or N=3 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';

AN <= "0000";

mod_freq:process(CLK100M)
begin
	if rising_edge(CLK100M) then
		if NN=49999  then
			NN<=(others => '0');
			clk_1k <= not clk_1k; 
			else 
			NN<=NN+1;
		end if;
	end if;
end process mod_freq;


contatore_1_cifra:process(clk_1k)
begin
	if rising_edge(contatore_1_cifra) then
		if(reset = '1') then
			C <=(others => '0');
		else
			if(preset ='1') then
				C<= C_preset;
			else
				if(enable_in='1')then
					if(up_down='1')then
						if C = 9 then
							C <=(others=>'0');
						else
							C<=C+1;
						end if;
					else
						if C=0 then
							C <= "1001";
						else
							C<=C-1;
					end if;
				end if;
			end if;
end process contatore_1_cifra;

enable_out <= '1' when(((C=9) and up_down='1') or (C=0 and up_down='0')) and  else '0';



end Behavioral;

