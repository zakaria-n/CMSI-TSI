function [B]= deflate(A,lambda,U,V)
Z=(V*U)/(U*V);
B=A-lambda*Z;

