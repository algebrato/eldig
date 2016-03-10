clear all
close all

syms a b t x y

y=a*x^2+b;

%differenzio
diff(y)
%pretty output
pretty(diff(y))

fourier(y)% questo fa tutto symbolico fft e ifft sono invece le controparti
          % numeriche di una sequenza.