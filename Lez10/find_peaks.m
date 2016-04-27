clear all;
close all;

load y_out;

n=1;
N=length(y_out);

%contatori quindi sono interi
cont_ris=1;
cont_su=0;
cont_giu=0;

massimo=0; %variabile "analogica"
LIM_SU=10;
LIM_GIU=10;

%questi sono segnali 0/1
TRIGGER_SU=0;
TRIGGER_GIU=0;

SOGLIA = 50;

while(n<N)
    if y_out(n+1) > y_out(n)
        cont_su=cont_su+1;
        cont_giu=0;
    else
        cont_su=0;
        cont_giu=cont_giu+1;
    end
    
    if cont_su > LIM_SU
        TRIGGER_SU=1;
    end
    
    if (cont_giu > LIM_GIU && TRIGGER_SU==1)
        TRIGGER_GIU=1;
    end
    
    if (massimo < y_out(n+1) && cont_giu==0)
        massimo=y_out(n+1);
    end
    
    if(TRIGGER_SU ==1 && TRIGGER_GIU==1)
        if(massimo >= SOGLIA)
            ris(cont_ris)=massimo;
            cont_ris=cont_ris+1;
        end
        TRIGGER_SU=0;
        TRIGGER_GIU=0;
        massimo=0;
    end
    n=n+1;
end
figure(1)

hist(ris,1000)


%posso rappresentare il workflow come segnali
%segnale  -- sengnale count-su (retta) segnale trigger su ecc ecc....

    
        






