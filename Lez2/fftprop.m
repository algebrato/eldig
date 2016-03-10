clear all
close all

%TRASFORMATA DEL GRADINO
%y=[zeros(1,1000) ones(1,100) zeros(1,1000)];
y=[ones(1,100) zeros(1,1000)]; %e` un seno cardinale! non cambia nulla
%y=[ones(1,100)] %sto traslando, dovrebbe venire uguale INVECE NO!! Non e` un seno cardinale
Y=fft(y);

%PROPRIETA` DI CONVOLUZIONE
%Vedremo che non verra`
a=[1 2 3 4 0 0];
b=[3 2 1 0 0 0];
A=fft(a);
B=fft(b);

z=conv(a,b);      %la proprieta` dice che Z=fft(z) = X Y, ma non e` cosi`
Z=fft(z)
ZZ=A.*B





%figure(1)
%plot(abs(Y))