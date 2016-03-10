%!/usr/bin/octave

%f0		      2f0	
%DO RE MI FA SOL LA SI DO
%
%----> logaritmico ---->
%
%quindi DO# sara f_{D)#} = f0*2^(1/12)
%                f...    = f0*2^(2/12)

note = [0:12];
f0 = 440;
scala=(2.^note).^(1/12)*f0;
fsol = f0*scala(8);
fdo  = f0*scala(1);
%aggiungere note per fare un accordo

%ytot = y1+y2+y3 ...





 
