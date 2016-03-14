function [y]=fsinc2(x,x0,D)
    y=sin(pi*(x-x0)*D)./sin(pi*(x-x0)); 
end