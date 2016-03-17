h1=[1 1]
h2=[1 -1]



%stem(h);
%y=conv(x,h);

x=randn(1,1e3); %--->rumore bianco
y1=conv(x,h1);
y2=conv(x,h2);
[f,Y]=fft_plot(y1,1,length(x));

%figure(1)
%    semilogy(abs(fft(x)));
figure(2)
    subplot(2,2,1)
        plot(y1)
        semilogy(abs(fft(y1))) %qui vedo il passa basso
    subplot(2,2,2)
        semilogy(abs(fft(y2))) %qui vedo il passa alto
    subplot(2,2,3)
        semilogy(f,abs(Y))
        
        


