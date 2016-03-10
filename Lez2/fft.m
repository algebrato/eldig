clear all
close all
%fft e ifft sono la DFT e la DFT inversa 
%
%x=[1 : 100];
%x=[1 1 1 1];
t=[0:1e-2:1]; %--> DIVERSISSIMO
%t=[0:1e-2:0.99]
y=sin(2*pi*t*10);
Y=fft(y)  %--> il valore nel primo posto e` l'area, come detto a lezione

figure(1) %apro una finestra
%plot(real(X))
%hold on
%plot(imag(X),'r')
%grid on

plot(abs(Y),'.-')
%figure(2)
%semilogx(abs(Y),'.-')

