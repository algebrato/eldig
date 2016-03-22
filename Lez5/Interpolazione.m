clear all
close all
%mio segnale
x=[0:100];
y=(sin(50*x)+cos(100*x));

%lo decimo
yd=y(1:2:end);
xd=x(1:2:end);
%lo interpolo
xi=[1:0.5:100];
yi=interp1(xd,yd,xi,'linear');

plot(x,y,'--o');
hold on
plot(xi,yi,'--.');