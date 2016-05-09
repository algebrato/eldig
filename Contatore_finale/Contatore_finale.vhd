----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:15 05/05/2016 
-- Design Name: 
-- Module Name:    Contatore_finale - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contatore_finale is
	PORT(
		CLK100M : in STD_LOGIC;
		SW : in STD_LOGIC_VECTOR(7 downto 0);
		SEG : out std_logic_vector (0 to 6);
		AN : out std_logic_vector(3 downto 0);
		Led : out std_logic_vector(7 downto 0)
	);
end Contatore_finale;

architecture CONT_FIN of Contatore_finale is

COMPONENT Contatore_4_cifre is
	PORT(
		Clock_in, Enable, Reset, Preset, UpDown : in std_logic;
		N0_preset, N1_preset, N2_preset, N3_preset : in std_logic_vector(3 downto 0);
		N0, N1, N2, N3 : out std_logic_vector(3 downto 0));
end COMPONENT;

COMPONENT Decoder_7_segmenti is
	PORT( 
		U_NUMBER : in UNSIGNED(3 downto 0);
		SEGMENTS : out std_logic_vector (0 to 6));
end COMPONENT;


signal fsel:std_logic_vector(1 downto 0);
--signal x:std_logic_vector(1 downto 0);
signal x:UNSIGNED(1 downto 0);
signal limite:UNSIGNED(15 downto 0);
signal CC:UNSIGNED(15 downto 0);
signal C:UNSIGNED(15 downto 0);
signal clock_1khz:std_logic;
signal clock_timer:std_logic;
signal clock_t:std_logic;
signal N0_g, N1_g, N2_g, N3_g, N0_preset, N1_preset, N2_preset, N3_preset:std_logic_vector(3 downto 0);
signal N: UNSIGNED(3 downto 0);

begin
	
	Led(0) <=SW(0);
	Led(1) <=SW(1);
	Led(2) <=SW(2);
	Led(3) <=SW(3);
	Led(4) <=SW(4);
	Led(5) <=SW(5);
	Led(6) <=SW(6);
	Led(7) <=SW(7);
	
	fsel <= SW(7 downto 6);
	N0_preset<="0000";
	N1_preset<="0000";
	N2_preset<="0000";
	N3_preset<="0001";
	
	CONT_4_CFR:Contatore_4_cifre PORT MAP(
		Clock_in => clock_t,
		Enable => SW(0),
		Reset => SW(1),
		Preset => SW(2),
		UpDown => SW(3),
		N0_preset=>N0_preset,
		N1_preset=>N1_preset,
		N2_preset=>N2_preset,
		N3_preset=>N3_preset,
		N0 => N0_g,
		N1 => N1_g,
		N2 => N2_g,
		N3 => N3_g);

	divisore10e5:process(CLK100M)
	begin
		if rising_edge(CLK100M) then
			if CC=49999  then
				CC<=(others => '0');
				clock_1khz <= not clock_1khz; 
				else 
				CC<=CC+1;
			end if;
		end if;
	end process divisore10e5;

	
	AN(0)<='0' when x="00" else '1';
	AN(1)<='0' when x="01" else '1';
	AN(2)<='0' when x="10" else '1';
	AN(3)<='0' when x="11" else '1';

	
	
	with fsel select
		limite<=to_unsigned(1,16) when "00",
			to_unsigned(4,16) when "01",
			to_unsigned(49,16) when "10",
			to_unsigned(499,16) when others;


	contatore_f_variabile:process(clock_1khz)
	begin
		if rising_edge(clock_1khz) then
			if C >= limite then
				C<=(others=>'0');
				clock_t <= not clock_t;
				else
				C<=C+1;
			end if;
		end if;
	end process contatore_f_variabile;

	clock_timer<= clock_1khz when fsel ="00" else clock_t;

	
	contatore_2_bit:process(clock_1khz)
	begin
		if rising_edge(clock_1khz) then
			x<=x+1;
		end if;
	end process contatore_2_bit;


	with x select
		N <= 	unsigned(N0_g) when "00",
		unsigned(N1_g) when "01",
		unsigned(N2_g) when "10",
		unsigned(N3_g) when others;
		

DECODER:Decoder_7_segmenti PORT MAP(
		U_NUMBER=> N,
		SEGMENTS => SEG(0 to 6));

end CONT_FIN;

