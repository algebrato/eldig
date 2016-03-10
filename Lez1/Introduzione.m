%scalari

A=1  #risponde
A=2; #non risponde

%vettori decido se sia riga o colonna

%riga di 4 elementi
B = [1 2 3 4];

%colonna di 4 elementi
D = [5;4;3;2]
%oppure
D = [5 4 3 2]' #lo traspongo

%Matrici
M = [1 2 ; 3 5]

%Moltiplicazione
C = [1 2]'

E = D*C #prodotto riga per colonna

% moltiplicazione per scalare

M*3

%Prodotto PUNTO-PUNTO moltiplica C_i= A_i * B_i (devono avere stessa dimensione)
A = [1 2 3 4];
B = [5 6 7 8];
MM = A.*B;            %Il punto mi dice che e` un punto punto

B= [1 2 3 4]
B1 = B+1
                      %matrice composta da due vettori di prima
M = [B;B1]

%scomporre oggetti complicati in oggetti semplici
%voglio prelevare la prima riga di una matrice e assegnarla ad una variabile

A = M(1,:)            %questo e` B perche` ho preso la prima riga
                      %il primo blocco 2x2
AA=M(1:2 ; 1:2) 

%1:2 -> il vettore [1 2]

%rappresentare il seno, con 1000punti per periodo e periodo 1 secondo

t=[0:1999]/1000; #la mia frazione di tempo
%oppure
t=[0:1E-3:2] #numeri da zero a 2 spaziati di un millesimo

%definisco la funziona

nu=1;
y= sin(2*pi*t*nu);

%per plottare -> i punti vengono uniti da tratti di retta. t e y hanno la stessa dimensione.

plot(t,y) 

%per vedere i size dei vettori
size(y)

%Abbellire il grafico
grid on

% singoli punti
plot(t,y,".") %.- -. o cambiare colore

% per disegnare y^2 ... e` un'operazione punto-punto quindi y.^2

