function [X,itr] = relaxed(A,B,eps)
%% Initial variable, matrices
D=diag(diag(A));
U=triu(A)-D;
L=A-D-U;
M=D+L;
N=-U;
omega=1e-2;
Pie=inv(D+omega*L)*((1-omega)*D-omega*U);
rho=max(max(abs(eig(Pie))));
%% Loop to find the optimal omega (the one that minimises rho(Pie))
for omega2=omega:1e-2:2
    newPie=inv(D+omega2*L)*((1-omega2)*D-omega2*U);
    newrho=max(max(abs(eig(newPie))));
    if(newrho<rho)
        rho=newrho;
        omega=omega2;
        Pie=newPie;
    end
end
%% The main iteration (relaxation method)
n=size(A,1);
Xp=rand(n,1);
X=rand(n,1);
itr=0;
while((max(abs((A*X-B))))>eps && itr<1000)
    X=(inv(D+omega*L))*((1-omega)*D*Xp-omega*U*Xp+omega*B);
    Xp=X;
    itr=itr+1;
end
end