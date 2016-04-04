clear all;
close all;

i=imread('street2.jpg');
%i e` un oggetto a 3 dimensioni di tipo uint8
%ha tre layer perche` un primo piano contiene la R uno  la G e l'altro la B

i1=i;
i1(:,:,3)=0; %ha sollo il canale ROSSO
i1(:,:,2)=0;

%immagine negativa
i2=i1;
i2=255-i1;


imagesc(i)
whos;uint8 