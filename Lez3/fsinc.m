function [y]=fsinc(x,x0,D)
    y=sin(pi*(x-x0)*D)./(pi*(x-x0)); 
end