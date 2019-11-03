%% Cleaning 
close all
clearvars
clc
%% Initialising temperature for particular points
tic
B=zeros(500,1);
B(405,1)=500; %
B(406,1)=500; %
B(425,1)=500; %
B(426,1)=500; %
B(195,1)=500; %
B(196,1)=500; %
B(215,1)=500; %
B(216,1)=500; %
for i=1:20:481
    B(i,1)=100; %
    B(i+19,1)=100; %
end
for i=10:20:250
    B(i,1)=100; %
    B(i+1,1)=100; %
end
for i=481:491
    B(i,1)=100; %
end

%% Building the Laplace operator matrix
N=500;
A=zeros(500);
A(1,1)=1;A(500,500)=1;
for i=2:499
    if (mod(i,20)==0 || mod(i,20)==1)
        A(i,i)=1;
    
    elseif (i>=481 && i<=491)
        A(i,i)=1;
    
    elseif (mod(i-10,20)==0 || mod(i-10,20)==1)
        A(i,i)=1;
    
    elseif (mod(i-11,20)==0 || mod(i-11,20)==1)
        A(i,i)=1;    
    
    elseif (i<=9)
        A(i,i)=-4;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+20)=1;
        A(i,i+360)=1;
   
    elseif (i>=12 && i<=19)
        A(i,i)=-4;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+20)=1;
        A(i,i+480)=1;
    
    elseif (i>=492 && i<=499)
        A(i,i)=-4;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i-20)=1;
        A(i,i-480)=1;
    
    elseif (i>=362 && i<=370)
        A(i,i)=-5;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i+20)=1;
        A(i,i-20)=1;
        A(i,i-360)=1;
    
    else
    A(i,i)=-4;
    A(i,i-1)=1;
    A(i,i+1)=1;
    A(i,i-20)=1;
    A(i,i+20)=1;
    end
        
end
%% Determining equilibrium state
%[u,itr]=gauss(A,-B,1e-5); %-B because otherwise I get negative temperatures? Must review with professor
%[u,itr]=jacobi(A,-B,1e-5); 
[u,itr]=relaxed(A,-B,1e-5);
%% Reshaping temperature matrix back to square for display
disp=zeros(20,25);
cp = 1;
for i=1:25
    for j=20:-1:1
        disp(j,i)=u(cp,1);
        cp=cp+1;       
        end
end
figure(1);
surf(disp);
toc