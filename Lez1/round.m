load train
fs
plot(y) 
sound(y,fs)
%dovrebbe essere il fischio di un treno

%se faccio
%sound(y,2fs) ... tiro o accartoccio la base tempi
y1(10000:end) = y1(10000:end)/5




t=size(y)

%altrimenti size*2/3 non e` detto che sia un intero.


y1 = y(1:round(t*2/3))
y2 = y(round(t*2/3):eof)/5  




%round ==> arrotonda all'intero piu` vicino
%floor
%ceil  



