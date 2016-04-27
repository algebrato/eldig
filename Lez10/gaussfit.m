clear all
close all
e=[randn(1,5000)+14 randn(1,50000)+11];
[y,x]=hist(e,[0:0.1:20]);
plot(x,y)
drawnow
rect=getrect;
if size(x,1)==1 
    x=x';
    y=y';
end

PESI=zeros(size(x));
PESI(find(x<(rect(1)+rect(3)) & x> rect(1)))=1;
ym=fittype('a1*exp(-(x-b1)^2/c1)+a2*exp(-(x-b2)^2/c2)+d','coeff',{'a1','b1','c1','a2','b2','c2','d'});
%f0=fit(x,y,ym,'StartPoint',[(rect(2)+rect(4)) rect(1)+rect(3)/2 rect(3)/4 (rect(2)+rect(4)) rect(1)+rect(3)/2 rect(3)/4 rect(2)],'Weight',PESI);
f0=fit(x,y,ym,'StartPoint',[2000 11 2 200 14 2 0],'Weight',PESI);

yfit=(f0.a1)*exp(-(x-f0.b1).^2/(f0.c1))+(f0.a2)*exp(-(x-f0.b2).^2/(f0.c2))+(f0.d);
hold on
plot(x,yfit.*PESI,'r')
f0
f1 = (f0.a1)*exp(-(x-f0.b1).^2/(f0.c1));
f2 = (f0.a2)*exp(-(x-f0.b2).^2/(f0.c2));
figure(7)
plot(x,f1)
hold on
plot(x,f2)
hold on
plot(x,f1+f2)
% f0.a1)*exp(-(x-f0.b1).^2/(f0.c1))
% 
% ym=fittype('a*exp(-((x-b)/c)^2)+d','coeff',{'a','b','c','d'});
% f0=fit(x,y,ym,'StartPoint',[(rect(2)+rect(4)) rect(1)+rect(3)/2 rect(3)/4 rect(1)]);
% 
% FWHM_P=f0.c/sqrt(2)*2.36/f0.b*100
