function [] = methExp(A, temperature, Tmax, dt, epsilon)

%% BUT : appliquer les exponentielles de matrices pour r�soudre le probl�me 1
%% et animation de propagation de la temp�rature

T=0;
while ((abs(max(temperature)-min(temperature))>epsilon)&&(T<Tmax))
% la m�thode exponentielle selon le cours
    E=expm(A.*dt);
    temperature=E*temperature;
    T=T+dt;
    Affichage(temperature, 3) % on affiche la temp�rature � chaque iteration
    pause (1)
    drawnow;
end

end