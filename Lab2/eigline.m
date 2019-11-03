function U = eigline(A)
n=size(A,1);
U=rand(1,n);
Y=rand(1,n);
eps=1e-10;
while (norm(U)*norm(Y)-abs(dot(U,Y))>eps)
    U=Y/norm(Y);
    Y=U*A;
end
end