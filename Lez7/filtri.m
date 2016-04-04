clear all;
close all;
%numero di filtri FIR e IIR per creare il filtro con le caratteristiche che voglio
%Trovare il miglior compromesso che abbia il minor numero di poli (minor richiesta hardware)

%in fdatool --> realize model --> puoi simularlo
%obiettivo e` quello di avere un filtro che abbia la risposta in fase
%lineare

%Filtri FIR simmetrici

%convertire singola sezione --> coppure Edit-->convert structure

%dato un primo segnale x(n)=x1(n)+x2(n)+x3(n) 
%dove x1(n)=sin(2*pi*t*1)dove 
%x2(n)=sin(2*pi*t*2)
%x3(n)=sin(2*pi*t*10)

%il punto e` cercare di uccidere la sinusoide a 10Hz

Tc=0.01;
Fc=100;
t=[0:Tc:3];

%Impongo che il guadagno in frequenza sia=1 altrimenti ho un amplificatore
%Export come Hd --- filter(Hd,x)

%FIR simmetrico -> mantiene lo sfasamento --> Equiripple Risposta
%all'impulso simmetricosp
%IIR non lo mantiene --> tolgo la componente ad alta frequenza ma sfaso
%mettere il taglio tra 4 e 5 Hz

x1=sin(2*pi*1*t);
x2=sin(2*pi*2*t);
x3=sin(2*pi*10*t);


load FIRhd
x1_fir = filter(FIRhd,x1);
x2_fir = filter(FIRhd,x2);
x3_fir = filter(FIRhd,x3);

load IIRhd
x1_iir = filter(IIRhd,x1);
x2_iir = filter(IIRhd,x2);
x3_iir = filter(IIRhd,x3);

%figure(1)
%plot(t,x1)
%hold on
%plot(t,x2)
%hold on
%plot(t,x3)

figure(1)
    subplot(1,2,1)
        plot(t,x1_fir)
        hold on
        plot(t,x2_fir)
        hold on
        plot(t,x3_fir)
        title('Applicazione filtro FIR')
        grid on
    subplot(1,2,2)
        plot(t,x1_iir)
        hold on
        plot(t,x2_iir)
        hold on
        plot(t,x3_iir)
        title('Applicazione filtro IIR')
        grid on
figure(2)
    plot(t,x1_fir+x2_fir)
    hold on
    plot(t,x1_iir+x2_iir)
