function [lam,Vp]=largeEig(A,u)
n=length(A);
lam=zeros(20,1);
Vp=zeros(600,20);
eps=1e-12;
for i=1:20
    X=rand(n,1);
    while (abs(norm(X)*norm(u)-abs(dot(X,u)))>eps)
        X=u/norm(u);
        u=A*X;
    end
    if dot(X,u)<0
        u=-u;
    end
    % Finding eigen value by multiplying both ends by transpose(u)
    lambda=(u'*A*u)/(u'*u);
    lam(i,1)=lambda;
    for j=1:600
        Vp(j,i)=u(j,1);
    end
    % Deflation
    line=rand(1,n);
    X=rand(1,n);
    while(abs(norm(X)*norm(line)-abs(dot(X,line)))>eps)
        X=line/norm(line);
        line=X*A;
    end
    if dot(X,line)<0
        line=-line;
    end
    A=A-lambda*(u*line)/(line*u);
end
end