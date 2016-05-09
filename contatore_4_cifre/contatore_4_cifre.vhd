----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:04:21 05/02/2016 
-- Design Name: 
-- Module Name:    contatore_4_cifre - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contatore_4_cifre is
end contatore_4_cifre;

architecture Behavioral of contatore_4_cifre is

component Contatore_1_cifra is
	port(Clock, Enable_in, UpDown, Reset, Preset : in std_logic;
		N_preset : in std_logic_vector(3 downto 0);
		N : out std_logic_vector(3 downto 0);
		Enable_out : out std_logic);
end Contatore_1_cifra;



begin

C0:Contatore_1_cifra PORT MAP(Clock=>clock_timer_globale, 
										Enable_in => enable, 
										UpDown => updown,
										Reset => reset,
										Preset => preset,
										N_preset => npreset,
										N => N0, 
										Enable_out => enable_0_to_1);
										
C1:Contatore_1_cifra PORT MAP(Clock=>clock_timer_globale, 
										Enable_in => enable_0_to_1, 
										UpDown => updown,
										Reset => reset,
										Preset => preset,
										N_preset => npreset,
										N => N1, 
										Enable_out => enable_1_to_2);

C2:Contatore_1_cifra PORT MAP(Clock=>clock_timer_globale, 
										Enable_in => enable_1_to_2, 
										UpDown => updown,
										Reset => reset,
										Preset => preset,
										N_preset => npreset,
										N => N2, 
										Enable_out => enable_2_to_3);

C3:Contatore_1_cifra PORT MAP(Clock=>clock_timer_globale, 
										Enable_in => enable_2_to_3, 
										UpDown => updown,
										Reset => reset,
										Preset => preset,
										N_preset => npreset,
										N => N3, 
										Enable_out => open);
										
--C1:contatore_1_cifra PORT MAP(clock_timer=>clock_timer_globale, 
--										enable_in => enable_0_to_1, N_OUT => N1, 
--										enable_out => enable_1_to_2);
--C2:contatore_1_cifra PORT MAP(clock_timer=>clock_timer_globale, -
--										enable_in => enable_1_to_2, N_OUT => N2, 
--										enable_out => enable_2_to_3);
--C3:contatore_1_cifra PORT MAP(clock_timer=>clock_timer_globale, 
--										enable_in => enable_2_to_3, N_OUT => N3, 
--										enable_out => open);

end Behavioral;

