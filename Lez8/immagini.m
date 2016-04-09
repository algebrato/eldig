clear all;
close all;

load spine;
imagesc(X)
axis equal
colormap(map)

%map e` una matrice a 3 colonne, per i relativi 3 colori
%Per il filtraggio delle immagini si usano quasi sempre filtri
%FIR
%L'immagine essendo una matrice, anche il filtro sara` una matrice

%perche` filtro fir? perche` la risposta "all'impulso" sdeve avere risposta
%finita. E` una immagine di dimensione finita. 
%il filtraggio pero` ingrandisce un po' l'immagine, C'e` un modo per
%tagliare i bordi e rendela dello stesso size iniziale.

%faccio un filtro lowering "mediando" le nove caselline adiacenti
%1/9 1/9 1/9
%1/9 1/9 1/9
%1/9 1/9 1/9

FILTRO1=ones(10,10)/9; %LOWESS
FILTRO2=[-1 -1 -1; -1 8 -1; -1 -1 -1]; %Mette in risalto i CONTORNI dell'immagine originale
FILTRO3=[-1 -1 -1; 2 2 2; -1 -1 -1]; %Mette in risalto le discontinuita` solo orizzontali


X2=filter2(FILTRO3,X);
figure(2)
imagesc(X2)
colormap(jet)
axis equal

%per le foto --> fare l'effetto mosso

%--> se non conosco di quanto si e` mossa la fotocamera, devo dedurlo dalla
%foto, quindi ci sara` da fare una autocorrelazione.







