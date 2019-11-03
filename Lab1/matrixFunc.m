%% Cleaning 
close all
clearvars
clc
%% Building the Laplace operator matrix
N=500;
A=zeros(N);
for i=1:N
    if (i==1)
        A(i,i)=-3;
        A(i,i+360)=1;
        A(i, i+1)=1;
        A(i, i+20)=1;
    elseif (i>1)&&(i<10)
        A(i,i)=-4;
        A(i, i+1)=1;
        A(i, i-1)=1;
        A(i,i+20)=1;
        A(i,i+360)=1;
    elseif (i==10)
         A(i,i)=-3;
         A(i, i+20)=1;
         A(i, i-1)=1;
         A(i,i+360)=1;
    elseif (i==11)
         A(i,i)=-3;
         A(i, i+20)=1;
         A(i, i+1)=1;
         A(i,i+480)=1;
    elseif (i>11)&&(i<20)
         A(i,i)=-4;
         A(i, i+20)=1;
         A(i, i-1)=1;
         A(i,i+1)=1;
         A(i,i+480)=1; 
    elseif (i==20)
         A(i,i)=-3;
         A(i, i+20)=1;
         A(i, i-1)=1;
         A(i,i+480)=1;
    elseif  (i>20)&&(i<=240)&&((mod(i,20)==1)||(mod(i,10)==1))
         A(i,i)=-3;
         A(i, i+20)=1;
         A(i, i+1)=1;
         A(i,i-20)=1;
    elseif  (i>20)&&(i<=240)&&((mod(i,20)==0)||(mod(i,10)==0))
         A(i,i)=-3;
         A(i, i+20)=1;
         A(i, i-1)=1;
         A(i,i-20)=1; 
     elseif (i>20)&&(i<=480)
         if ((i>=362)&&(i<=370))
            A(i,i)=-5;
            A(i,i-20)=1; %en x
            A(i,i+20)=1;  %en x
            A(i, i-1)=1; %en y
            A(i, i+1)=1; %en y 
            A(i,i-360)=1;
         elseif (i==361)
            A(i,i)=-4;
            A(i,i-20)=1; %en x
            A(i,i+20)=1;  %en x
            A(i, i+1)=1; %en y 
            A(i,i-360)=1;
         elseif (mod(i,20)==0)
            A(i,i)=-3;
            A(i,i+20)=1;  %en x
            A(i, i-1)=1; %en y
            A(i, i-20)=1; %en y
         elseif (mod(i,20)==1)
            A(i,i)=-3;
            A(i,i+20)=1;  %en x
            A(i, i+1)=1; %en y
            A(i, i-20)=1; %en y
        else
            A(i,i)=-4;
            A(i, i-1)=1; %en y
            A(i,i-20)=1; %en x
            A(i, i+20)=1; %en y
            A(i,i+1)=1; %en x  
        end
    elseif (i>=482)&&(i<491) 
            A(i,i)=-3;
            A(i, i-1)=1; %en y
            A(i, i+1)=1; %en y
            A(i,i-20)=1; %en x
    elseif (i>=491)&&(i<500) 
            A(i,i)=-4;
            A(i, i-1)=1; %en y
            A(i, i+1)=1; %en y
            A(i,i-20)=1; %en x
            A(i,i-480)=1; %en x
    elseif (i==481)
            A(i,i)=-2;
            A(i, i+1)=1; %en y
            A(i,i-20)=1; %en x
    elseif (i==500)
            A(i,i)=-3;
            A(i, i-1)=1; %en y
            A(i,i-20)=1; %en x
            A(i,i-480)=1; %en x     
    end
end
%% Building the temperature matrix
U= zeros(N,1);
for i=1:N
    if ((i==195)||(i==196)||(i==215)||(i==216)||(i==405)||(i==406)||(i==425)||(i==426))
            U(i)=500;    
    end
end
%% Problem 1
t=0; %time
eps=1e-5;
dt=1;
tmax=180;
while(abs(max(U)-min(U))>eps && (t<=tmax))
    E=expm(A*dt);
    U=E*U;
    t=t+dt;
    monitor(U);
    pause(1);
    drawnow;
end
%% Problem 2
T=0;
Tmax=300;
while (T<Tmax)
    if(mod(T,3)==0)
        U(195)=500;
        U(196)=500;
        U(215)=500;
        U(216)=500;
        U(405)=500;
        U(406)=500;
        U(425)=500;
        U(426)=500;
    end
    E=expm(A*dt);
    U=E*U;
    T=T+dt;
    monitor(U);
    pause(1);
    drawnow;
end
disp(T);   