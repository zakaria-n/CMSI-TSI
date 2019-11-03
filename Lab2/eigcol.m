function V = eigcol(A)
n=size(A,1);
V=rand(n,1);
Y=rand(n,1);
eps=1e-10;
while (norm(V)*norm(Y)-abs(dot(V,Y))>eps)
    V=Y/norm(Y);
    Y=A*V;
end
end

    