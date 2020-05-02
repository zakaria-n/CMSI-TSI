function CL=closestTo(A,u,re,im)
n=length(A);
I=eye(n);
c=complex(re,im);
Z=inv(A-c*I);
eps=1e-12;
X=rand(n,1);
while (abs(norm(X)*norm(u)-abs(dot(X,u)))>eps)
    X=u/norm(u);
    u=Z*X;
end
if dot(X,u)<0
        u=-u;
end
lambda=(u'*Z*u)/(u'*u);
CL=c+1/lambda;
end
