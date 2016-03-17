clear all
close all

t=[0:1e-3:0.999+1/15];
f0 = 10;
fase_vett=[0:1e-2:2*pi];
figure(1)
for nf=1:length(fase_vett)
    fase=fase_vett(nf);
    y=sin(2*pi*t*f0+fase);
    [f,Y]=fft_plot(y,1,length(y));
    plot(f,abs(Y))
    hold on
end %for

%figure(2)
%finestro il segnale
w=kaiser(length(y),5)'; %va normalizzata
w=w/sum(w)*length(w); %voglio che abbia la stessa grandezza della finestra rettangolare

hold on

for nf=1:length(fase_vett)
    fase=fase_vett(nf);
    y=sin(2*pi*t*f0+fase);
    [f,Y]=fft_plot(y.*w,1,length(y));
    plot(f,abs(Y))
    hold on
end %for
grid on
