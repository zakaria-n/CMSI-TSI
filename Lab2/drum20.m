function drum20()
[A,u]=buildAU();
% Chaque vecteur propre contient 600 altitudes et représente une surface
eigV=zeros(600,1);
[lam,Vp]=largeEig(A,u);
for i=1:20
    for j=1:600
        eigV(j,1)=Vp(j,i);
    end
    surf(reshape(eigV,15,40));
    colorbar
    pause(0.5);
    drawnow;
end
end