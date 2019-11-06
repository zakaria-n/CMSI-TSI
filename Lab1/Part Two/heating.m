function heating(A, X, tmax, dt, m, eps)
t=0;
while(t<tmax && (abs(500-min(X))>eps))
    if (mod(t,m)==0)
        X(195)=500;
        X(196)=500;
        X(215)=500;
        X(216)=500;
        X(405)=500;
        X(406)=500;
        X(425)=500;
        X(426)=500;
    end
    X=expm(A*dt)*X;
    t=t+dt;
    surf(reshape(X,20,25));
    drawnow;
end
t
end
