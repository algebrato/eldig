library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sette_seg is
	Port ( enable : in STD_LOGIC ;
	SEG : out STD_LOGIC_VECTOR(0 to 6);
	AN : out STD_LOGIC_VECTOR(3 downto 0);
	CLK100M : in STD_LOGIC;
	CLK_1K_O : out STD_LOGIC
	);
end sette_seg;

architecture Behavioral of sette_seg is

signal N: UNSIGNED(3 downto 0);
signal NN: UNSIGNED(15 downto 0);
signal clk_1k: STD_LOGIC;



begin
--N_OUT <= STD_LOGIC_VECTOR(N);
CLK_1K_O <= clk_1k; --collego le varie scatole con i segnali

SEG(0)<='0' when N=0 or N=2 or N=3 or N>4 else '1';
SEG(1)<='0' when N=0 or N=1 or N=2 or N=3 or N=4 or N=7 or N=8 or N=9 else '1';
SEG(2)<='0' when N=0 or N=1 or N=3 or N=4 or N=5 or N=6 or N=7 or N=8 or N=9 else '1';
SEG(3)<='0' when N=0 or N=2 or N=3 or N=5 or N=6 or N=8 or N>9 else '1';
SEG(4)<='0' when N=0 or N=2 or N=6 or N=8 or N>9 else '1';
SEG(5)<='0' when N=0 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';
SEG(6)<='0' when N=2 or N=3 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';

AN <= "0000";

contatore_4bit:process(enable)
begin
	if rising_edge(enable) then
		if N=9  then N<= "0000";
			else N<=N+1;
		end if;
	end if;
end process contatore_4bit;


--il punto e` essere in grado di modificare il duty cycle del segnale.
--Ton/(Ton+Toff)

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







end Behavioral;

