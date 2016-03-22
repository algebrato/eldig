clear all
close all

tau0=1e-3;
tau1=100*1e-9;

t=[0:1e4]*1e-9;

y0=exp(-t/tau0);
y1=exp(-t/tau1);
y=conv(y1,y0);



figure(1)
plot(t,y)


%per vedere la massima derivata potrei fare un filtro con B=[1 -1] e A=1
%oppure fare direttamente  Z=diff(y)
%dmax=max(Z)

%for K=1:100
%    z=diff(ymat(k,:));
%    Mmax(k)=max(z);
%end

%hist(Mmax)