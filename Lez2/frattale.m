clear all
close all

n_iter = 1000;
%costruire una immagine che ha dimensione 4000x4000 con un frattale
m=8000; %dimensione immagine
cx=0;   %per spostare la finestra nel piano complesso
cy=0;  
l=1.5;

x=linspace(cx-l,cx+l,m); % costruisce un vettore come inizio cx-l e non puo` 
                         % superare cx+l, con m punti equispaziati.
y=linspace(cy-l,cy+l,m);

[X,Y]=meshgrid(x,y);

c=-0.745429;

Z = X+i*Y;

colormap prism(256);

dd=logspace(0,3,200); %vettore equispaziato(logaritmicamente) con primo
                      %punto 10^0 ultimo 10^3 e 200punti
count=1;

for n=1:n_iter
    Z=Z.^3+c; %cambiando un po' i parametri ottengo diversi frattali     
    W=exp(-abs(Z));
    if n>dd(count)
        imagesc(W);
        axis('square','equal','off');
        drawnow;
        count=count+1;
    end
end %for