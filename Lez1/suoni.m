clear all;
close all;

%finisco una base tempi
%campionamento a 44100Hz
tc=1e-5;
t=[0:tc:5];
fz=440;

y=sin(2*pi*t*fz);

%lui legge solo tra -1 e 1
%sound(y,1/tc);
%soundsc(...) #autoscala tra -1 e 1

%riscalare tra -1 e 1

ymaxmod=max(abs(y));
y=y/ymaxmod;


%se dico di sentire la y*10, con sound, la funzione viene troncata. Risultato il segnale e` molto distorto <---> esempio 0 di un distorsore per la chitarra.



