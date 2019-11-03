function []=monitor(U)
disp=zeros(20,25);
    cp = 1;
    for i=1:25
        for j=20:-1:1
            disp(j,i)=U(cp,1);
            cp=cp+1;       
        end
    end
end