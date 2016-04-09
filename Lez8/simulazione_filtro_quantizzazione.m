close all;
%xn --> H(Z) --y(n)
%  |
%  x(n) --> H(z)|Q -->yq(n)
% Q e` l'ipotetico operatore di quantizzazione.
% potrebbe essere un filtro IIR del primo ordine
N=1000;
y(1)=0;
y(2)=0;
yq(1)=0;
yq(2)=0;

%ora lo faccio del secondo ordine, quindi faccio comparire il ciclo limite
%anche con l'operatore floor
a1=1.61;
a2=-0.99;



nb=8; %numero di bit che voglio

for n=3:N
    if n==3
        x=1;
    else 
        x=0;
    end
    y(n)=a1*y(n-1)+a2*y(n-2)+x;
    %quantizzazione per numero di bit che voglio io
    yq(n)=floor( (a1*yq(n-1)+a2*yq(n-2)+x)*2^nb)/(2^nb); %va a zero
    %yq2(n)=round((a1*yq2(n-1)+x)*2^nb)/(2^nb); %resta costante
    
end
plot(y)
hold on
plot(yq)
grid on

%da un certo N in poi l'uscita non dipende piu` dall'ingresso
%piu` semplice caso di CICLO LIMITE : uscita di un sistema, da un certo N
%in poi non dipende piu` dall'ingresso.  Non e` piu` un sistema lineare, e
%si vede il ciclo limite. Ho il ciclo limite proprio perche` e` un filtro
%IIR, se fosse fir, proprio per definizione, non avrei un ciclo limite.

%nel caso del floor ho lo zero e non ho cicli limite. Quando l'ordine e`
%superiore a 1, anche con l'operatore floor esce un ciclo limite.