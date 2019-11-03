function [] = methExp2(A, temperature, Tmax, dt, mult, epsilon)

%% BUT : appliquer les exponentielles de matrices pour résoudre le problème 1
%% et animation de propagation de la température

T=0;
while ((T<Tmax))
% on enlève (abs(max(temperature)-min(temperature))>epsilon) car passe par
% des états intermediaires de stabilité (c'est expliqué dans PB2.m)
% la méthode exponentielle selon le cours
    if (mod(T,mult)==0) % si T est un multiple de notre choix, on procède au chauffage, c'est à dire
% qu'on remet les points MNOP et IJKL à 500
        temperature(195)=500;
        temperature(196)=500;
        temperature(215)=500;
        temperature(216)=500;
        temperature(405)=500;
        temperature(406)=500;
        temperature(425)=500;
        temperature(426)=500;
    end
    E=expm(A.*dt);
    temperature=E*temperature;
    T=T+dt;
    Affichage(temperature, 4) % on affiche la température à chaque iteration
    %pause (1)
    drawnow;
end

T

end