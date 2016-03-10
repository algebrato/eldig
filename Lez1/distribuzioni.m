%rand == > distribuzione uniforme tra  0 e 1
%randn ==> distribuzione normale, xm = 0 e sigma=1

                  %riga di 10000 numeri casuali
randn(1,1e4)

                  %mostro che e` a media nulla

Id = ones(1e4,1); %colonna di 10000 uni
ZZ = zeros(1,3);  %riga di 3 zeri

size(Id,1)        %fammi vedere quando e` lunga la riga
size(Id,2)        %fammi sapere qunado e` lunga la colonna

sum(Id)           %se e` un vettore somma tutti i suoi elementi
                  %se e` una matrice ottieni una somma delle sue colonne
	      %sum(sum(M)) se M e` matrice restituisce la somma 
              %di tutti gli elementi della matrice

%deviazione standard:

stddd = sqrt(sum(n.^2)/N)

%se voglio cambiare il valor medio
%e sigma

n = 2*randn(1,1e4)+3
n

%questa ha sigma 2 e vm 3
%voglio usare una funzione di distrubuzione custom per esempio l'esponenziale

hist(n,nch) prendo -n n e lo divido in nch

%n e` il mio vettore di numeri casuali, prende il minimo e il massimo di n e lo divide in nch.

%posso pero` passare direttamente i canali
canali=[0:1000]

%cercando di costruire la distribuzione esponenziale dalla uniforme

a = rand(1,1e5);
ea = -log(a);
hist(ea,100)





