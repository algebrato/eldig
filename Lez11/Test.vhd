----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:35:17 04/18/2016 
-- Design Name: 
-- Module Name:    Test - Behavioral 
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
library IEEE; --la IEEE in particolare tutto della STD_LOGIC_1164
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test is  --entity e` il nome della scatola che finisce con END <scatola> definisco i segnali
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
			  E : out STD_LOGIC);
end Test;

-- contenuto della scatola
-- il Maximum combinational path delay: 5.259ns e` il massimo ritardo di calcolo combinatorio

architecture Behavioral of Test is

signal D : std_logic;


begin
--primo costrutto
D <= A AND B; 
E <= C AND D;

--secondo costrutto
--E <= A AND B AND C;

--terzo costrutto
--E <= A and B;
--E <= '1' when (A='1' and B='1')
--			else '0';








end Behavioral;

