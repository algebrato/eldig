clear all
close all

% simulazione impulsi

tau0=1e-3; % le due costanti di tempo
tau1=100e-9;

t0=[0:1e6]*1e-9; % base tempi per segnale "lento"

y0=exp(-(t0-100e-6)/tau0); % segnale "lento" con partenza a 100 us
y0((t0-100e-6)<0)=0;

t1=t0(1:1000); % base tempi per segnale "veloce" piu' corta per risparmiare tempo di CPU per fare la convoluzione
y1=exp(-t1/tau1);

y=conv(y0,y1); % convoluzione
y=conv(y,y1); % convoluzione

ysc=y(1:2e5); % 200 mila punti intorno alla transizione

figure(1)
plot(ysc,'linewidth', 2)
grid on
title('Segnale sovracampionato a 1 ns pseudo-continuo');
canali=[600:0.5:800];
N=20;
ymat=zeros(N,2000);
for dn=1:N % simulazione sottocampionamento
    temp=ysc(dn:N:end);
    ymat(dn,:)=temp(4001:6000);
end

figure(2) % tutti i segnali sovrapposti in colori diversi
plot(ymat','linewidth',2)
grid on
title('Segnali campionati a 20 ns sovrapposti');

ymatder=diff(ymat'); % derivata dei segnali nella matrice, equivalente a fare N derivate in un ciclo FOR

figure(3)
plot(ymatder)
grid on
title('Derivate dei segnali sovrapposte');
figure(4)
maxder=max(ymatder); % calcolo del massimo per colonna, equivalente a calcolarli separatamente in un ciclo FOR
hist(maxder,canali); % molto brutto!
title('Distribuzione dei massimi dei segnali di fig. 3');
grid on
figure(5)
plot(maxder)
grid on
title('Massimo stimato in funzione dello scostamento tra inizio segnale e campionamento')
disp(['Errore senza interpolazione: ' num2str(std(maxder)/mean(maxder)*100) '%']) % errore percentuale 

% procedura di interpolazione di un fattore 20
x=[1:size(ymat,2)]; % numero di colonne di ymat
xi=[1:0.1:size(ymat,2)];
figure(6)
W=ones(1,N);
filtro_ricostruttore=conv(W,W);
filtro_ricostruttore=conv(filtro_ricostruttore,W);
filtro_ricostruttore=filtro_ricostruttore/sum(filtro_ricostruttore)*N;
ymatder=ymatder'; % la voglio per righe
for n=1:size(ymatder,1) % numero di righe di ymat
    %temp=interp1(x,ymat(n,:),xi,'cubic'); 
    temp=zeros(1,2000*N); % interpolazione "a mano"... in alternativa alla riga sopra
    temp(1:N:size(ymatder,2)*N)=ymatder(n,:);
    temp=conv(temp,filtro_ricostruttore); % fine interpolazione a mano
    temp=temp(1:end-3*N); % la fine del segnale non e' correttamente calcolata
    maxderinterp(n)=max(temp);
    plot(temp)
    hold on
end
grid on
title('Derivate dei segnali sovracampionati sovrapposte');
figure(7)
hist(maxderinterp,canali)
grid on
title('Distribuzione dei massimi dei segnali di fig. 6');
figure(8)
plot(maxderinterp)
grid on
title('Distribuzione del massimo dei segnali interpolati in fig. 6');
disp(['Nuovo errore: ' num2str(std(maxderinterp)/mean(maxderinterp)*100) '%']) % nuovo errore percentuale
