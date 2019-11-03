function [] = methExp(A, temperature, Tmax, dt, epsilon)

%% BUT : appliquer les exponentielles de matrices pour résoudre le problème 1
%% et animation de propagation de la température

T=0;
while ((abs(max(temperature)-min(temperature))>epsilon)&&(T<Tmax))
% la méthode exponentielle selon le cours
    E=expm(A.*dt);
    temperature=E*temperature;
    T=T+dt;
    Affichage(temperature, 3) % on affiche la température à chaque iteration
    pause (1)
    drawnow;
end

end