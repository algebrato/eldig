clear all;
close all;

t=[0:1e-2:1];
y=sin(2*pi*t*10);

%finestro meglio il segnale
%f0 = 1
%WIN = cos(pi*t)
%FIN = y.*WIN


figure(1)
[f,Y] = fft_plot(y,1e-2,length(t));
plot(f,abs(Y),'.')
grid on
hold on

t=[0:1e-2:0.99];
y=sin(2*pi*t*10);
[f,Y] = fft_plot(y,1e-2,length(t));
plot(f,abs(Y),'r.')

% il segnale e` finito, quindi e` come se stessi facendo
% la fft di un segnale composto da una sinusoide e da una
% funzione a gradino. Quindi ottengo un sinc
% Questo segnale e` moltiplicato per una finestra rettangolare.
% Il segnale e` una moltiplicazione, in fft ho una convoluzione
% Prendere una finestra temporale che sia almeno piu` grande di
% un fattore 100



