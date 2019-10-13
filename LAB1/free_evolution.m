%% Cleaning 
close all
clearvars
clc
%% Initializing temperature for particular points
eps=1e-5;
u=zeros(20,25);
for k=1:25
    u(1,k)=100;
    u(20,k)=100;
end
for k=1:20
    u(k,1)=100;
    u(k,25)=100;
end
for k=1:13
    u(10,k)=100;
    u(11,k)=100;
end
u(5,21)=500;
u(5,22)=500;
u(6,21)=500;
u(6,22)=500;
u(15,10)=500;
u(15,11)=500;
u(16,10)=500;
u(16,11)=500;
%% Loop to determine equilibrium state
t=1;
for k=2:19
    for q=2:24
            u(k,q)=(1/4)*(u(k,q+1)+u(k,q-1)+u(k+1,q)+u(k-1,q));
            t=t+1;
            surf(u)
            drawnow

    end
    
end

