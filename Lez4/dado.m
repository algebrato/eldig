clear all
close all

Nmax=1000000;

N=ceil(rand(1,Nmax)*6);

media=zeros(1,Nmax); %la preallocazione velocizza molto 

tic
%for n=1:Nmax
%    media(n)=sum(N(1:n))/n;
%end
temp=0
for n=1:Nmax %algoritmo molto piu` veloce 
    temp=temp+N(n);
    media(n)=temp/n; %senza allocazione, queste sono Nmax chiamate di allocazione
end
toc

plot(media)
