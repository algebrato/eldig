clear all
close all
Tc=0.01;
t=[0:Tc:3];
x1=sin(2*pi*t*1);
x2=sin(2*pi*t*3);
x3=sin(2*pi*t*10);
x=x1+x2+x3;

figure(1)
title('segnale x somma e le sue tre componenti')
plot(t,x1)
hold on
plot(t,x2,'r')
plot(t,x3,'g')

plot(t,x,'k')
grid on
zoom on


load Hd_FIR

y11=filter(Hd_FIR,x1);
y12=filter(Hd_FIR,x2);
y13=filter(Hd_FIR,x3);
y1=filter(Hd_FIR,x);
figure(2)
title('segnale y da FIR e le sue tre componenti')
plot(t,y11)
hold on
plot(t,y12,'r')
plot(t,y13,'g')

plot(t,y1,'k')
grid on
zoom on

load HD_IIR
y21=filter(Hd_IIR,x1);
y22=filter(Hd_IIR,x2);
y23=filter(Hd_IIR,x3);
y2=filter(Hd_IIR,x);
figure(3)
title('segnale y da IIR e le sue tre componenti')
plot(t,y21)
hold on
plot(t,y22,'r')
plot(t,y23,'g')

plot(t,y2,'k')
grid on
zoom on
