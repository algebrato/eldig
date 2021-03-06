%definire una funzione e disegnarne una superficie
%la funzione sara` una matrice quindi devo immaginarmi in questo senso
%Y sara` una matrice devo meshare una grid

[X,Y] = meshgrid([-2:0.1:2],[-2:0.1:2]); %questa struttura restituisce due oggetti

%una volta definita la base piano e` facile passare alla funzione

Z = X.*exp(-X.^2-Y.^2);

%paraboloide
%Z=X.^2+Y.^2;

%sombrero

[X,Y]=meshgrid([-10:0.1:10],[-10:0.1:10]);
r=sqrt(X.^2+Y.^2)
Z= sin(r)./r

%sfera
r=1;
[phi,theta]=meshgrid([0:5:180],[0:5:360]);
x=r*sin(phi).*cos(theta);
y=r*sin(phi).*sin(theta);
z=r*cos(phi); 

surf(Z)



