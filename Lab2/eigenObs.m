function [EG,EXC,EXL] = eigenObs(A)
EG=zeros(length(A),1);
EXC=zeros(length(A));
EXL=zeros(length(A));
i=1;
while i<=length(A)
    V=eigcol(A);
    U=eigline(A);
    lam=lambda(A);
    EG(i,1)=lam;
    EXC(:,i)=V;
    EXL(:,i)=U;
    A=A-lam*(V*U)/(U*V);
    i=i+1;
end
end
