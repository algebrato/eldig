clear all;
close all;

h1= [1 1];
h2= [1 -1];

x1 = ones(1,1e3); %segnale di uni
x2 = ones(1,1e3);
x2(2:2:end)= -1; %segnale alternato

y11 = conv(x1,h1);
y12 = conv(x1,h2);
y21 = conv(x2,h1);
y22 = conv(x2,h2);

figure(1)
subplot(2,2,1)
    plot(y11)
subplot(2,2,2)
    plot(y21)
subplot(2,2,3)
    plot(y12)
subplot(2,2,4)
    plot(y22)

[X1,Y1] = fft_plot(y11,1,1e3);
[X2,Y2] = fft_plot(y22,1,1e3);

figure(2)
subplot(1,2,1)
    semilogy(X1,abs(Y1))
subplot(1,2,2)
    semilogy(X2,abs(Y2))


