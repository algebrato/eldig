close all;
clear all;

%seno cardinale 
x=[-5:1e-4:5];
y=fsinc(x,0,10);

%seno cardinale continuo (di un segnale discreto)
y2=fsinc2(x,0,10);

%somma di seni cardinali
temp=zeros(1,size(x,2));
for w=-100:1:100 %queste sono 13 componenti
    yy=fsinc(x,w,10);
    temp=temp+yy;   
end %(if)

figure(1)
plot(abs(y2))
hold on
plot(abs(temp))

