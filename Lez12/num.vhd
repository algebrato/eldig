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


--Tutto quello che entra in SEZIONE LOGICA CONCORRENTE -- e` tutto in parallelo (non conta l'ordine)
--non ho un prima o un dopo (solo logica combinatoria -> le uscite al tempo t sono una funzione al tempo t).
--Ma posso aver bisogno di un ordine (logica sequenziale) out(t)=f(I(t))_{t<=t_0} quindi gli ingressi dipenderanno anche 
--da quello che e` successo nel passato. Uguale a scrivere a out(t_0) = g(I(t_0), stati(t_0)), gli stati sono informazioni
--interne alal scatola.
--Un contatore e` un oggetto di logica sequenziale. L'ingresso e` un segnale di tipo "enable" se passo da 0 a 1 allora incrementa di 1
--passo da uno stato all'altro da una certa regola
entity num is
    Port ( SW : in STD_LOGIC_VECTOR(7 downto 0);
			  N_OUT : out UNSIGNED(3 downto 0);
			  SEG : out STD_LOGIC_VECTOR(0 to 6)
			 );
end num;

architecture Behavioral of num is

signal N: UNSIGNED(2 downto 0);

begin
--flipflop di tipo D
contatore_3bit:process(enable)
begin
	if rising_edge(enable) then
		--N <= N+1; --sfrutto algebra di bool (perdo il riporto)
		--oppure, in modo diverso
		if N=7  then N<= "000";
			else N<=N+1
		end if
	end if

end process contatore_3bit;

--possibili rappresentazioni della stessa cosa (porta AND)
C <= A and B;
C <= '1' when A='1' and B='1' else '0';
porta_and:process(A,B)
begin
if A='1' and B='1' then
	C <='1';
	else
	C <= '0';
end if;
end process porta_and;

--possibili interpretazioni del multiplexer
with sel select
	C <= A when '1',
	     B when '0';
--implementazione della porta AND col multiplexer
with sel select 
	C <= '1' when '11',
		  '0' when others;



--N_OUT(0)<='0' when SW(0)='1' else '1';
--N_OUT(1)<='0' when SW(1)='1' else '1';
--N_OUT(2)<='0' when SW(2)='1' else '1';
--N_OUT(3)<='0' when SW(3)='1' else '1';

--N<=UNSIGNED(SW(7 downto 4));

--SEG(0)<='0' when N=0 or N=2 or N=3 or N>4 else '1';
--SEG(1)<='0' when N=0 or N=1 or N=2 or N=3 or N=4 or N=7 or N=8 or N=9 else '1';
--SEG(2)<='0' when N=0 or N=1 or N=3 or N=4 or N=5 or N=6 or N=7 or N=8 or N=9 else '1';
--SEG(3)<='0' when N=0 or N=2 or N=3 or N=5 or N=6 or N=8 or N>9 else '1';
--SEG(4)<='0' when N=0 or N=2 or N=6 or N=8 or N>9 else '1';
--SEG(5)<='0' when N=0 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';
--SEG(6)<='0' when N=2 or N=3 or N=4 or N=5 or N=6 or N=8 or N>8 else '1';

--processi--
--P1:process(A,B,C) --sensivity list

                  --parte dichiarativa
						--parte implementativa --dentro una entity posso avere tanti processi quanti ne voglio
						--la struttura del processo, come blocco, sono all'interno della sezione concorrente.
						--stanno tutte parallelamente nella entity. I processi, sono tra loro concorrenti (agiscono in modo indipendente)
						--ma all'interno di un processo c'e` un "prima" e un "dopo" c'e` una certa idea di sequenzialita`
						--i processi parlano tra loro tramite i segnali! Oppure posso usare le VARIABILI. Sono piu` astratte

--end process P1;



end Behavioral;
















