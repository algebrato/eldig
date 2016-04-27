clear all
close all
%uno corto
load train;
A=y';

%uno lungo
load handel;
B=y';
clc

s=1;
figure(1)
subplot(2,1,1)
t=[0:length(A)-1]/8192;
plot(t,A)
grid on
title('A')
figure(2)
subplot(2,1,1)
t=[0:length(B)-1]/8192;
plot(t,B)
grid on
title('B')

[f,Y]=fft_plot(A,1/8192,length(A));
figure(1)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT A')
if (s==1)
    sound(A);
end
[f,Y]=fft_plot(B,1/8192,length(B));
figure(2)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT B')
if (s==1)
    sound(B);
end
%interpolo perche` voglio nascondere A in B, quindi B deve essere poco
%alterato da A, viceversa voglio recuperare bene A una volta tolto B

Ainterp=interp1([0:length(A)-1],A,[0:1/5:length(A)-1],'spline');
Ainterp=[Ainterp zeros(1,length(B)-length(Ainterp));];
[f,Y]=fft_plot(Ainterp,1/8192,length(Ainterp));

figure(3)
subplot(2,1,1)
t=[0:length(Ainterp)-1]/8192;
plot(t,Ainterp)
grid on
title('A interp')

[f,Y]=fft_plot(Ainterp,1/8192,length(Ainterp));
figure(3)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT A interp')
if (s==1)
    sound(Ainterp);
end
%genero del rumore -- inizia il mascheramento
rr=rand(size(Ainterp));
rr0=(rr<0.5)*2-1; %e` molto facile avere -1 1 -1 perche se moltiplico per 2 volte questo ottengo il segno iniziale
Ainterp1=Ainterp.*rr0;

figure(4)
subplot(2,1,1)
t=[0:length(Ainterp1)-1]/8192;
plot(t,Ainterp)
grid on
title('A interp1')

[f,Y]=fft_plot(Ainterp1,1/8192,length(Ainterp1));
figure(4)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT A interp1')
if (s==1)
    sound(Ainterp1);
end

Ainterp1_fft=fft(Ainterp1);

%voglio che rr1 sia simmetrico perche` poi va moltiplicato per la
%trasformata di Ainterp1
%quindi avro` uno pseudo rumore bianco anche nel TEMPO!!!
%voglio un segnale simmetrico perche` poi avro una antitrasformata reale.
rr=rand(size(Ainterp1_fft));
rr1=rr(2:end);
rr1=(rr1+rr1(end:-1:1))/2;
rr1=(rr1<0.5)*2-1;
rr1=[1 rr1];

Ainterp2_fft=Ainterp1_fft.*rr1;

figure(5)
subplot(2,1,1)
t=[0:length(Ainterp2_fft)-1]/8192;
Ainterp2=ifft(Ainterp2_fft);
plot(t,Ainterp2)
grid on
title('A interp2');

[f,Y]=fft_plot(Ainterp2,1/8192,length(Ainterp2));
figure(5)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT A interp2')
if (s==1)
    sound(Ainterp2);
end

C=B+Ainterp2*0.15; %sommo solo il 15% di A in B


figure(6)
subplot(2,1,1)
t=[0:length(C)-1]/8192;
plot(t,C)
grid on
title('C');

[f,Y]=fft_plot(C,1/8192,length(C));
figure(6)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C')
if (s==1)
    sound(C);
end

C_fft=fft(C);
C1_fft=C_fft.*rr1;

disp('Step1...')
pause


figure(7)
subplot(2,1,1)
t=[0:length(C)-1]/8192;
C1=ifft(C1_fft);
plot(t,C1)
grid on
title('C1');

[f,Y]=fft_plot(C1,1/8192,length(C1));
figure(7)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C1')
if (s==1)
    sound(C1);
end

disp('Step2...')
pause


C2=C1.*rr0;

figure(8)
subplot(2,1,1)
t=[0:length(C2)-1]/8192;
plot(t,C2)
grid on
title('C2');

[f,Y]=fft_plot(C2,1/8192,length(C2));



disp('Decimazione...')
pause

C3=C2(1:5:length(A)*5);
figure(9)
subplot(2,1,1)
t=[0:length(C3)-1]/8192;
plot(t,C3)
grid on
title('C3');

[f,Y]=fft_plot(C3,1/8192,length(C3));
figure(9)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C3')
if (s==1)
    sound(C3);
end


disp('Filtraggio...')
pause

[b,a]=butter(5,0.08); %0.2
C4=filter(b,a,C2);

figure(10)
subplot(2,1,1)
t=[0:length(C4)-1]/8192;
plot(t,C4)
grid on
title('C4');

[f,Y]=fft_plot(C4,1/8192,length(C4));
figure(10)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C4')
if (s==1)
    sound(C4);
end

disp('Decimazione...')
pause
C5=C4(1:5:length(A)*5);
figure(11)
subplot(2,1,1)
t=[0:length(C5)-1]/8192;
plot(t,C5)
grid on
title('C5');

[f,Y]=fft_plot(C5,1/8192,length(C5));
figure(11)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C5')
if (s==1)
    sound(C5);
end

C5_fft=fft(C5);
C5_fft=C5_fft.*abs(C5_fft);
C6=ifft(C5_fft);
C6=C6/max(abs(C6));


disp('Miglioramento...')
pause
figure(12)
subplot(2,1,1)
t=[0:length(C6)-1]/8192;
plot(t,C6)
grid on
title('C6');

[f,Y]=fft_plot(C6,1/8192,length(C6));
figure(12)
subplot(2,1,2)
semilogy(f,abs(Y))
grid on
title('FFT C6')
if (s==1)
    sound(C6);
end
