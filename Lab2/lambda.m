function l = lambda(A)
n=size(A,1);
V=rand(n,1);
Y=rand(n,1);
bool=0;
eps=1e-10;
while (norm(V)*norm(Y)-abs(dot(V,Y))>eps)
    V=Y/norm(Y);
    Y=A*V;
    if (((V'*Y)/(norm(V)*norm(Y)))==-1)
       bool=1;
       break
    end
end
[Xi,i]=max(V);
if bool==0
    l=Y(i,1)/V(i,1);
else 
    l=(-1)*Y(i,1)/V(i,1);
end
end