----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:12 05/08/2015 
-- Design Name: 
-- Module Name:    Contatore_4_cifre - Behavioral 
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

entity Contatore_4_cifre is
PORT	(Clock_in, Enable, Reset, Preset, UpDown : in std_logic;
		N0_preset, N1_preset, N2_preset, N3_preset : in std_logic_vector(3 downto 0);
		N0, N1, N2, N3 : out std_logic_vector(3 downto 0));
end Contatore_4_cifre;

architecture V1 of Contatore_4_cifre is

signal enable_0_to_1, enable_1_to_2, enable_2_to_3 : std_logic;
 
	COMPONENT Contatore_1_cifra
	PORT(
		Clock : IN std_logic;
		Enable_in : IN std_logic;
		UpDown : IN std_logic;
		Reset : IN std_logic;
		Preset : IN std_logic;
		N_preset : IN std_logic_vector(3 downto 0);          
		N : OUT std_logic_vector(3 downto 0);
		Enable_out : OUT std_logic
		);
	END COMPONENT;

begin
	A_Inst_Contatore_1_cifra: Contatore_1_cifra PORT MAP(
		Clock => Clock_in,
		Enable_in => Enable,
		UpDown => UpDown,
		Reset => Reset,
		Preset => Preset,
		N_preset => N0_preset,
		N => N0,
		Enable_out => enable_0_to_1);

	B_Inst_Contatore_1_cifra: Contatore_1_cifra PORT MAP(
		Clock => Clock_in,
		Enable_in => enable_0_to_1,
		UpDown => UpDown,
		Reset => Reset,
		Preset => Preset,
		N_preset => N1_preset,
		N => N1,
		Enable_out => enable_1_to_2);
	
	C_Inst_Contatore_1_cifra: Contatore_1_cifra PORT MAP(
		Clock => Clock_in,
		Enable_in => enable_1_to_2,
		UpDown => UpDown,
		Reset => Reset,
		Preset => Preset,
		N_preset => N2_preset,
		N => N2,
		Enable_out => enable_2_to_3);
		
	D_Inst_Contatore_1_cifra: Contatore_1_cifra PORT MAP(
		Clock => Clock_in,
		Enable_in => enable_2_to_3,
		UpDown => UpDown,
		Reset => Reset,
		Preset => Preset,
		N_preset => N3_preset,
		N => N3,
		Enable_out => open);

end V1;