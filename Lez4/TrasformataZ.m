%x(n) --->h(n)--->y(n)
%il problema si presenta se h(n) ha durata infinita.
%Ma a partire dall'H(z) posso scrivere solo i coefficienti della 
%trasformata Z. Non scrivo piu` h=[1/2 1/4 1/8 ... inf]
% %Quindi descrivo h(n) infinita con pochissimi dati della trasformata Z.
%           1                                  [1 ]    =B
% H(Z) = -------- e questi sono due vettori ----------    
%         1 - 2Z                              [1,1/2]  =A
%se A=1 il sistema e` FIR, non ha poli. E` sempre diverso da zero.

x=[zeros(1,100) 1 zeros(1,100)]; %una delta isolata da un po' di zeri
%B = [1 2 3 2 1];
%A = [1];                         %dovrebbe essere un sistema FIR

B = [1, -1, 2];                          %questo produce un
A = [1, -0.8];                     %segnale esponenziale decrescente %del tipo: y(n)=0.8 y(n-1)+x(n) con la
                                  %condizione y(0)=1
                                  %Dove ha il polo? Y(Z) = 0.8 Y(Z)z^-1
                                  %+X(z) --> ricavo Y(z) divido per X(z) e
                                  %ho la risposta H(Z) ... e ho facile
                                  %calcolare il polo. In questo caso, polo
                                  %in z=0.8


y=filter(B,A,x);                 %filter

%A=[1];            %questo sistema fa la media mobile di 100 valori
%B=ones(1,100);    %ma in frequenza? 99 zeri sulla circonferenza e 1 in zero
                  %quello che e` intuibile in un dominio, non e` banale
                  %sapere quello che succede nell'altro dominio. E` chiaro
                  %cosa stia succedendo nel tempo, ma molto meno chiaro in
                  %frequenza. 

%dati i vettori A e B che definiscono il mio sistema, posso chiedere varie
%cose:
%impz(B,A,50) %resituisce la risposta di un sistema
zplane(B,A);  %trova i poli del sistema


%se il sistema e` stabile posso calcolare la risposta in frequenza.
freqz(B,A,1000,1000) 





%stem(y)
