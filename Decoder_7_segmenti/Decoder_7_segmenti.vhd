
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_7_segmenti is
	PORT(
		U_NUMBER : in UNSIGNED(3 downto 0);
		SEGMENTS : out std_logic_vector (0 to 6)
		);
end Decoder_7_segmenti;

architecture Decoder of Decoder_7_segmenti is

begin
	SEGMENTS(0)<='0' when U_NUMBER=0 or U_NUMBER=2 or U_NUMBER=3 or U_NUMBER>4 else '1';
	SEGMENTS(1)<='0' when U_NUMBER=0 or U_NUMBER=1 or U_NUMBER=2 or U_NUMBER=3 or U_NUMBER=4 or U_NUMBER=7 or U_NUMBER=8 or U_NUMBER=9 else '1';
	SEGMENTS(2)<='0' when U_NUMBER=0 or U_NUMBER=1 or U_NUMBER=3 or U_NUMBER=4 or U_NUMBER=5 or U_NUMBER=6 or U_NUMBER=7 or U_NUMBER=8 or U_NUMBER=9 else '1';
	SEGMENTS(3)<='0' when U_NUMBER=0 or U_NUMBER=2 or U_NUMBER=3 or U_NUMBER=5 or U_NUMBER=6 or U_NUMBER=8 or U_NUMBER>9 else '1';
	SEGMENTS(4)<='0' when U_NUMBER=0 or U_NUMBER=2 or U_NUMBER=6 or U_NUMBER=8 or U_NUMBER>9 else '1';
	SEGMENTS(5)<='0' when U_NUMBER=0 or U_NUMBER=4 or U_NUMBER=5 or U_NUMBER=6 or U_NUMBER=8 or U_NUMBER>8 else '1';
	SEGMENTS(6)<='0' when U_NUMBER=2 or U_NUMBER=3 or U_NUMBER=4 or U_NUMBER=5 or U_NUMBER=6 or U_NUMBER=8 or U_NUMBER>8 else '1';
end Decoder;

