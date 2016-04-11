%clear all;
%close all;
%simulare il segnale che arriva ad un rilevatore di particelle
%arrivano due impulsi poissoniani con un rate R eventi con un certo 
%spettro
%dt=2nS;
%sc=100

%in oputput deve esserci la forma del segnale

%Detector--> (foto-tubo) --> ADC -->y_out

%base tempi, esponenziale decrescente
tau_det=18e-9;
tau_pmt=12e-9;
dt=2e-9;
sc=100;
t_lim=round(10*tau_det/dt*sc);
t=[0:t_lim]*dt/sc;

%segnale di luce che esce dal detector
y_det=exp(-t/tau_det);

%ora, per ricavare quello che arriva all'ADC devo sapere la risposta del
%fototubo

t_lim_pmt=round(10*tau_pmt/dt*sc);
t_pmt=[0:t_lim_pmt]*dt/sc;

%segnale di luce che esce dal detector
y_pmt=t_pmt.^2.*(exp(-t_pmt/tau_pmt));
y_segnale=conv(y_det,y_pmt);
t_scala=[0:length(y_segnale)-1]*dt/sc;

%segnale campionato a 20ps
%generato a questo campionemto molto fitto
%perche` ora devo estrarre le 100 cose  distanti 2ns
y_segnale=y_segnale/max(y_segnale);

%impulsi di riferimento, sottocampiono e lo metto sulla prima riga
%sottocampiono, spostando un po e lo metto sulla seconda riga
%cosi` per 100 volte in modo da avere i 100 campioni, cmapionati a 2ns
n_max=floor(length(y_segnale)/sc-1);
ref_pulses=zeros(n_max,sc);

for n=1:sc
    ref_pulses(:,n)=y_segnale(n:sc:n_max*sc+n-1);
end


T_final=0.001;
%ora bisogna generale il segnale
R=1000000; %provare anche con un milione
%1.2 fattore di sicurezza

N=round(T_final*R*1.2);
delta_t_rand=rand(1,N);
delta_t_rand=-log(delta_t_rand)/R;
delta_t_rand=delta_t_rand/dt;

%distribuzione delle ampiezze
%mi serve il vettore y_out pieno di zeri.
y_out=zeros(round(1.5*sum(delta_t_rand)),1);

%ad ogni interazione aggiungo un impulso
t_start=0; %il tempo assoluto del primo parte da zero
for k=1:N
    t_start=t_start+delta_t_rand(k);
    t_int=ceil(t_start);
    t_frac=floor(t_int-t_start)*sc+1;
    y_out(t_int:t_int+n_max-1,1)=y_out(t_int:t_int+n_max-1,1)+ref_pulses(:,t_frac);
end
    
y_out=y_out(10*n_max:10*n_max+floor(T_final)*dt)
t_out=[0:length(y_out)-1]*dt;


figure(1)
plot(t_scala,y_segnale);
figure(2)
plot(ref_pulses)
grid on
zoom on
figure(3)
hist(delta_t_rand)
figure(4)
plot(t_out,y_out)







