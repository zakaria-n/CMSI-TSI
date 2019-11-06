function freeEv(A, X, tmax, dt, eps)
t=0;
while ((abs(max(X)-min(X))>eps)&&(t<tmax))
    X=expm(A*dt)*X;
    t=t+dt;
    surf(reshape(X,20,25));
    drawnow;    
end
t
end

    
