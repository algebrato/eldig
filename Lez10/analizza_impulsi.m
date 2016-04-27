clear all;
close all;
load y_out;
y_out1=y_out;
B=[-ones(1,50) ones(1,50)];
y_out=filter(B,1,y_out1);
%y_out1=y_out1(1:10000);
%y_out=y_out1;
n=1;
N=length(y_out);
cont_ris=1;
trigger_su=0;
trigger_giu=0;
cont_su=0;
cont_giu=0;
massimo=0;
LIM_SU=50;
LIM_GIU=20;
while (n<N)
    
    if (massimo < y_out(n+1) && cont_giu==0)
        massimo = y_out(n+1);
    end
    
    if y_out(n+1) > y_out(n)
        cont_giu=0;
        cont_su=cont_su+1;
    else
        cont_su=0;
        cont_giu=cont_giu+1;
    end
    
    if cont_su>LIM_SU
        trigger_su=1;
    end
    
    if cont_giu>LIM_GIU && trigger_su==1
        trigger_giu=1;
    end
        %debug4(n)=0;
    
    if (trigger_su ==1 && trigger_giu==1)
        if (massimo>400)
            ris(cont_ris)=massimo;
        
            cont_ris=cont_ris+1;
            %debug4(n)=1;
        
        end
        trigger_su=0;
        trigger_giu=0;
        massimo=0;
        end
    n=n+1;
    
%   debug1(n)=cont_su;
%   debug2(n)=cont_giu;
%   debug3(n)=massimo;
   
end

%plot(y_out)
%hold on
%plot(debug1,'r')
%plot(debug2,'g')
%plot(debug3,'k')
%plot(debug4*1000,'c')
%grid on

figure(1)
hist(ris,1000)
figure(2)
plot(y_out1)
figure(3)
freqz(B,1,10000,500e6);


