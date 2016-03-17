clear all
close all

t=[0:1e-3:0.999];
f0 = 10;
y=sin(2*pi*t*f0);
[f,Y]=fft_plot(y,1,20000);
plot(f,abs(Y))

hold on
w=kaiser(length(y),5)'; %va normalizzata
w=w/sum(w)*length(w); %voglio che abbia la stessa grandezza della finestra rettangolare

[f,Y]=fft_plot(y.*w,1,20000);
plot(f,abs(Y))

