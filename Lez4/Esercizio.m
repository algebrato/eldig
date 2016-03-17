%Esercizio

% partire dalle risposte h1 [1 1] e h2 [1 -1] e applicarlo a vari segnali.
% a train, al rumore bianco

% Sintetizzare un filtro noi

%caricare qualcosa campionato a 8192Hz
t=[1:length(y)]/8192;
ynoise=sin(2*pi*t*100);
ybrutto=y+ynoise/4;

%costruire un filtro che elimini la sinusoide "cattiva" e restituisca
%ancora il segnale "bello" originale