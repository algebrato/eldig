----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:31 04/21/2016 
-- Design Name: 
-- Module Name:    num - Behavioral 
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
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity num is
    Port ( SW : in STD_LOGIC_VECTOR(7 downto 0);
			  N_OUT : out UNSIGNED(3 downto 0);
			  SEG : out STD_LOGIC_VECTOR(0 to 6)
			 );
end num;

architecture Behavioral of num is

signal N: UNSIGNED(3 downto 0);

begin

N_OUT(0)<='0' when SW(0)='1' else '1';
N_OUT(1)<='0' when SW(1)='1' else '1';
N_OUT(2)<='0' when SW(2)='1' else '1';
N_OUT(3)<='0' when SW(3)='1' else '1';

N<=UNSIGNED(SW(7 downto 4));

SEG(0)<='0' when N=0 or N=2 or N=3 or N>4 else '1';
SEG(1)<='0' when N=0 or N=1 or N=2 or N=3 or N=4 or N=7 or N=8 or N=9 else '1';
SEG(2)<='0' when N=0 or N=1 or N=3 or N=4 or N=5 or N=6 or N=7 or N=8 or N=9 else '1';
SEG(3)<='0' when N=0 or N=2 or N=3 or N=5 or N=6 or N=8 or N>9 else '1';
SEG(4)<='0' when N=0 or N=2 or N=6 or N=8 or N>9 else '1';
SEG(5)<='0' when N=0 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';
SEG(6)<='0' when N=2 or N=3 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';

end Behavioral;

