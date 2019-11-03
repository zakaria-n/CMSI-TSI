function [EG,EXC] = eigen(A)

N=size(A,1);
EG=zeros(N,1);
EXC=zeros(N,N);
for i=1:N
    X=zeros(N,1);
    Y=rand(N,1);
    X(1,1)=1;
    Y=A*X;
    while abs(abs(dot(Y,X))-norm(X)*norm(Y))>1e-4
        X=Y/norm(Y); 
        Y=A*X;  
    end
    V=Y;
    Y=A*X;
    EG(i,1)=Y(1,1)/X(1,1);     
    EXC(:,i)=V;
    Y=rand(1,N);
    X=Y/norm(Y);
    Y=X*A;
    while abs(abs(dot(Y,X))-norm(X)*norm(Y))>1e-4
        X=Y/norm(Y);  
        Y=X*A;   
    end
    U=Y;
    A=A-EG(i,1)*((V*U)/(U*V));
end
end

