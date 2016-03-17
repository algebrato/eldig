close all
clear all
%segnali finestrati, il seno cardinale scende come 1/f, posso scegliere 
%una finestratura migliore in modo da rendere piu` ripida la discesa

%con proprieta` migliori della finestra, si intende una cosa che scende di
%piu`

%una prima finestra e` quella TRIANGOLARE
% -->la trasformata la faccio con fft_plot
%il triangolo ha un comportamento migliore per 
%frequenze distanti, ma per f=0 e` piu` LARGO!
N=100;

w=[1:N/2 N/2:-1:1];
wo=ones(1,N);
wh=hanning(N)';
wk=kaiser(N,5)';

[f,Y]=fft_plot(w/sum(w),1,20000);
[fo,Yo]=fft_plot(wo/sum(wo),1,20000);
[fh,Yh]=fft_plot(wh/sum(wh),1,20000);
[fk,Yk]=fft_plot(wk/sum(wk),1,20000);

semilogy(f,abs(Y))
%hold on
%semilogy(fo,abs(Yo))
%hold on
%semilogy(fh,abs(Yh))
hold on
semilogy(fk,abs(Yk))