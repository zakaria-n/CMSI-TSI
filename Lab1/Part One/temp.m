%% Visualising equilibrium state temperature on metal piece
function temp(A,B)
[A, B] = buildAB();
[u,itr]=gauss(A,B,1e-5);
% [u,itr]=jacobi(A,B,1e-5);
% [u,itr]=relaxed(A,B,1e-5);
surf(reshape(u,20,25));
figure(1);