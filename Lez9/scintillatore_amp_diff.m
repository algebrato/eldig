%distribuzione di eventi con ampiezza diversa.

load source_a.txt;
spettro=source_a;

%cosi` ho la certezza che siano valori interi
spettro=round(spettro);

%distribuzione cumulativa del segnale. Integrare il sengale
%so come e` fatto il filtro integratore.
spettro_um = filter(1,[1 -1],spettro); %mi restituisce l'integrale del segnale
amp_rand=floor(rand(1,1)*max(spettro_um));
%bin e` esattamente l'ampiezza desiderata
bin=find(spettro_um >= amp_rand,1); %=min(find(spettro_um >= amp_rand))
%ref_pulse(:,t)*bin; cosi` ho il segnale con la giusta ampiezza

