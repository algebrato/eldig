clear all
close all

figure(1)
b1_=[-1:0.01:1];
b2_=[-1:0.01:1];
cont=1;
for n1=1:length(b1_)
    b1=b1_(n1);
    for n2=1:length(b2_)
        b2=b2_(n2);
        det=b1.^2-4*b2;
        if det>=0
            z1=-b1+sqrt(det);
            z2=-b1-sqrt(det);
        else
            z1=-b1+i*sqrt(-det);
            z2=-b1-i*sqrt(-det);
        end
        zeri(cont)=z1;
        cont=cont+1;
        zeri(cont)=z2;
        cont=cont+1;
    end
end
figure(1)
plot(real(zeri),imag(zeri),'.')
grid on
axis equal
hold on

% circonferenza
cont=1;
for phi=0:1e-3:2*pi
    circ(cont)=cos(phi)+i*sin(phi);
    cont=cont+1;
end
plot(real(circ),imag(circ),'r','linewidth',2);
