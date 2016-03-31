%B1=[1, -z0]
%B2=[1, -z0*]
t=[1:0.01:10];

%IL PUNTO E` la frequenza di campionamento
%E` 100!!! 1/100
z1=exp(i*2*pi*1/100);
z2=exp(-i*2*pi*1/100);


A=[1];
B1=[1, -z1];
B2=[1, -z2];
B=conv(B1,B2)



s=sin(2*pi*5*t)+cos(2*pi*3.5*t);
w=s+sin(2*pi*1*t);


%B=conv(B1,B2) (se ho tanti punti, al posto di calcolare a mano posso farlo
%fare a matlab)

%A=[1]
%B=[1, -1.44, 1]

y=filter(B,A,w);

figure(1)
freqz(B,A,10000,100) %taglia proprio la frequenza 1000
figure(2)
plot(t,s)
figure(3)
plot(t,y)


%solitamente per prototipare i filtri si usano dei tool tipo fdatool
%do una banda sulle y -- e una manda sulle x
%la "banda" sulle y mi dice dove il filtro puo` variare
%definisco dei limiti...non mi interessa cosa fa..ma metto io dei paletti
%notching --> per eliminare una frequenza netta
%cacchio, ma il notching e` molto piu` bello del nostro, come  mai?
%lo zero ha quel valore....non si scappa. Ha aggiunto un polo!!!!
%Un polo vicino allo zero. Esporto i parametri A e B
num=[0.7976   -1.5920    0.7976]
den=[1.0000   -1.5920    0.5952]

y2=filter(num,den,w)

figure(4)
plot(t,y2)





