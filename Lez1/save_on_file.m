%clean all previous setting
clear all
%close all previous windows
close all

#t=[0:1E-3:1.999];
#y= sin(2*pi*t*1);

#plot(t,y);

%voglio memorizzarlo sul disco, su di un file ad esempio
A=2;
save pippo.mat A %(su matlab questo non e` leggibile)

save pippo.txt A -ascii %(questo su matlab dovrebbe essere leggibile)


%se faccio clear all e load pippo.txt chi assume il valore 2? IL FILE! quindi otterro`
%pippo=2 


% help plot --> da un help della funziona plot



