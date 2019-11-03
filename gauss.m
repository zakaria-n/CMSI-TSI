%% Gauss-Seidel method for solving large linear systems
function [X,itr] = gauss(A,B,eps)
%% Variables
n=size(A,1);
Xp=rand(n,1);
X=zeros(n,1);
itr=0;
%% Iteration implemeting Gauss-Seidel
while((max(abs((A*X-B))))>eps && itr<1000)
    for i=1:n
            s1=0;
            s2=0;
            for j=1:i-1
                s1=s1+A(i,j)*X(j,1);
            end
            for j=i+1:n
                s2=s2+A(i,j)*Xp(j,1);
            end
            X(i,1)=(1/A(i,i))*(B(i,1)-s1-s2);
    end
    Xp = X;
    itr=itr+1;
end
end