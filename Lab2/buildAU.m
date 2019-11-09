function [A,u] = buildAU()
%% Building the altitude column matrix
u=ones(600,1);
% Fixed at 0
u(1,1)=0;
% Upper line
for i=211:15:586
    u(i)=0;
end
% Middle line
for i=146:15:296
    u(i)=0;
end
% Bottom line
for i=15:15:600
    u(i)=0;
end
% Right string
for i=586:600
    u(i)=0;
end
%% Building the Laplace operator matrix
A=zeros(600);
% Default coefficients
for i=1:600
    A(i,i)=-4;
end
% Case1: two neighbours
A(1,1)=-2;
A(15,15)=-2;
A(586,586)=-2;
A(600,600)=-2;
% Case 2: three neighbours
for i=16:15:571
    A(i,i)=-3;
    A(i+14,i+14)=-3; %14 because we're starting off at 16
end
% Three neighbours for left edge
for i=2:14
    A(i,i)=-3;
end
% Setting to 1 the 4 neighbours for the rest of the points 
for i=1:600
    if u(i,1)~=0
        if i>1
            A(i,i-1)=1;
        end
        if i<600
            A(i,i+1)=1;
        end
        if i>15
            A(i,i-15)=1;
        end
        if i<586
            A(i,i+15)=1;
        end
    end
    if u(i,1)==0
        A(i,i)=1;
    end
end
end