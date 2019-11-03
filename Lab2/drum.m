%% Cleaning 
close all
clearvars
clc
%% Building the Laplace operator matrix
tic
A=zeros(600);
for i=1:600
    if (i==1) %Top left corner
        A(i,i)=1;
    elseif (i>=586 && i<=600) %right border
        A(i,i)=1;
    elseif (mod(i,15)==0) %bottom border
        A(i,i)=1; 
    elseif (mod(i,15)==1 && i>=211) %top right border (bold)
        A(i,i)=1; 
    elseif ((i==146)||(i==161)||(i==176)||(i==191)||(i==206)||(i==221)||(i==236)||(i==251)||(i==266)||(i==281)) %fixation in the middle
        A(i,i)=1;
    elseif (mod(i,15)==1 && i>=16 && i<211) %top left border
        A(i,i)=-3;
        A(i,i+1)=1;
        A(i,i+15)=1;
        A(i,i-15)=1;
    elseif (i<=15 && A(i,i)==0) %left border
        A(i,i)=-3;
        A(i,i+1)=1;
        A(i,i-1)=1;
        A(i,i+15)=1;
    else %the rest
        A(i,i)=-4;
        A(i,i-1)=1;
        A(i,i+1)=1;
        A(i,i-15)=1;
        A(i,i+15)=1;
    end
end
%% Finding the drum's vibration frequencies, answering the questions
[EG,EXC] = eigenObs(A); %Only problem left: improve eigen (lol you thought)
% [EG,EXC]=eigen(A);
% EG=eig(A);
N=length(EG);

smallest50=zeros(50,1);
largest20=zeros(20,1);

% SEG=sort(abs(EG)); %sorted eigen value column %problem: simulation only works 
                                              %when EG itself is sorted and
                                              %used later instead of only doing
                                              %the sorting  to get
                                              %smallest 50 and largest 20

%Question 1
for i=1:20
    largest20(i,1)=EG(i,1);
end
for i=1:50
    smallest50(i,1)=EG(N-i+1,1);
end

%Question 2
target=6.82;
closest=EG(1,1);
for i=1:N
    distance=abs(abs(closest)-target);
    if (abs(abs(EG(i,1))-target)<distance)
        closest=EG(i,1);
    end
end
disp(closest);

%Question 3
correspondingVibrations=zeros(N,70);
for i=1:50
    for j=1:N
        if (smallest50(i,1)==EG(j,1))
            correspondingVibrations(:,i)=EXC(:,j);
        end
    end
end
for i=1:20
    for j=1:N
        if (largest20(i,1)==EG(j,1))
            correspondingVibrations(:,50+i)=EXC(:,j);
        end
    end
end

figure(1);
title('Smallest frequencies');
for i=1:50
    P=reshape(correspondingVibrations(:,i),40,15);
    surf(P);
    pause(0.1);
end

figure(2)
title('Largest frequencies');
for i=51:70
    P2=reshape(correspondingVibrations(:,i),40,15);
    surf(P2);
    pause(0.1);
end
toc