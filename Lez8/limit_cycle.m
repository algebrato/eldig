clear all
close all

nb=4;
N=200;
a1=-0.96;
y(1)=14;
yq(1)=y(1);
for n=2:N
    if n==2 
        x=1;
    else
        x=0; 
    end
    y(n)=a1*y(n-1)+x;
    yq(n)=round((yq(n-1)*a1 + x)*2^nb)/2^nb;
end

plot(y)
hold on
plot(yq,'r')
grid on


nb=7;
N=1000;
a1=3.7165;
a2=-5.3095;
a3= 3.4497;
a4= -0.8613;

%questi numeri si determinano con fdatool, per esempio mettendo una coppia
%di poli vicini alla circonferenza....o cmq ...una coppia di poli
%se passo per passo, ad ogni n piccolo, linearizzo il sistema, di quello
%essendo lineare che vale per piccoli valori di entrata e uscita, allora
%posso dire che il polo esce. In realta` non posso dirlo a cuor leggero per
%il semplice fatto che avendo l'operatore di quantizzazione il sistema non
%e` piu` lineare, non esiste la trasformata Z ... e in teoria non esistono
%i poli. Devo pensare il sistema linearizzato a pezzettini.

%a1=1.61;
%a2=-0.99;
clear y;
clear yq;
y(1)=0;
yq(1)=y(1);
y(2)=0;
y(3)=0;
y(4)=0;

yq(2)=y(2);
yq(3)=y(3);
yq(4)=y(4);


for n=5:N
    if n==5 
        x=1;
    else
        x=0; 
    end
    y(n)=a1*y(n-1)+a2*y(n-2)+x+a3*y(n-3)+a4*y(n-4);
    yq(n)=floor((yq(n-1)*a1+ yq(n-2)*a2+ x+ yq(n-3)*a3+ yq(n-4)*a4)*2^nb)/2^nb;
end
figure
plot(y)
hold on
plot(yq,'r')
grid on



%per ovviare al ciclo limite
%if |y|<10 ==> y=0 
%pero` il segnale e` distorto
%quindi dico:
%se vale if |y|<10 ==> y=0 per un certo tot di tempo T0
%allora taglia a zero. Quindi mantengo il mio segnale e se ho ciclo limite
%ce l'ho solo per un tempo T0 dopo lo stacco del segnale.


    



