%% Jacobi method for solving large linear systems
function [X,itr] = jacobi(A,B,eps)
%% Variables
n=size(A,1);
Xp=rand(n,1);
X=zeros(n,1);
itr=0;
%% Loop implementing the Jacobi alogrithm
while((max(abs((A*X-B))))>eps && itr<1000)
    
        for i=1:n
            s=0;
            for j=1:n
                if i~=j
                    s=s+A(i,j)*Xp(j,1);
                end
            end
            X(i,1)=(1/A(i,i))*(B(i,1)-s);

        end
        Xp = X;
        itr=itr+1;
        
end
end

