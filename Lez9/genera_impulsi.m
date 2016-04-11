clear all
close all
tau_det=18e-9;
tau_pmt=12e-9;

dt=2e-9;

sc=100;

t_lim=round(10*tau_pmt/dt*sc);
t=[0:t_lim]*(dt/sc);
y_pmt=t.^2.*exp(-t/tau_pmt);
y_pmt=y_pmt/sum(y_pmt);

t_lim=round(10*tau_det/dt*sc);
t=[0:t_lim]*(dt/sc);
y_det=exp(-t/tau_pmt);

y_sig=conv(y_pmt,y_det);

t_scala=[0:length(y_sig)-1]*dt/sc;
%figure(1)
%plot(t_scala,y_sig);
%grid on
%zoom on

y_sig=y_sig/max(y_sig);
n_max=floor(length(y_sig)/sc)-1;
ref_pulses=zeros(n_max,sc);
for n=1:sc
    ref_pulses(:,n)=y_sig(n:sc:n_max*sc+n-1);
end

%figure(2)
%plot(ref_pulses)
%grid on
%zoom on

T_final=1e-3;
rate=1e6;

N=round(1.2*T_final*rate);
delta_t_rand=rand(1,N);
delta_t_rand=-log(delta_t_rand)/rate;
%hist(delta_t_rand)
mean(delta_t_rand)

delta_t_rand=delta_t_rand/dt;

y_out=zeros(round(1.5*sum(delta_t_rand)),1);
t_start=0;


load source_a.txt
spettro=round(source_a);
spettro_cum=filter(1,[1 -1],spettro);

for k=1:N
    t_start=t_start+delta_t_rand(k);
    t_int=ceil(t_start);
    t_frac=floor((t_int-t_start)*sc)+1;
    amp_rand=floor(rand(1,1)*max(spettro_cum));
    bin=find(spettro_cum>=amp_rand, 1 );
    y_out(t_int:t_int+n_max-1,1)=y_out(t_int:t_int+n_max-1,1)+ref_pulses(:,t_frac)*bin;
end
noise=randn(size(y_out));
noise=conv(noise,y_pmt(1:sc:end));
noise=noise(1:length(y_out));
y_out=y_out+noise*1000;
y_out=y_out(10*n_max:10*n_max-1+floor(T_final/dt));

%figure(3)
t_out=[0:length(y_out)-1]*dt;
y_out=floor(y_out+100);
%plot(t_out,y_out)
%grid on
figure(5)
plot(spettro)
figure(4)
A=findpeaks(y_out,'Threshold',1e-2);
plot(A)
hist(A,[0:4095])







