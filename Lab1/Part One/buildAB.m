%% Building the Laplace operator and the particular temperature points matrices
function [A, B] = buildAB()
B=zeros(500,1);
A=zeros(500);

for (i=1:1:500) 
    A(i,i)=-4;
    if (i>10)&&(i<20) 
            A(i, i+1)=1;
            A(i, i-1)=1;
            A(i,i+20)=1;
            A(i,i+460)=1; 
    elseif (i>1)&&(i<=10)
            A(i, i+1)=1;
            A(i, i-1)=1;
            A(i,i+380)=1;
            A(i,i+340)=1; 
    elseif (i>=492)&&(i<500) 
            A(i, i-1)=1; 
            A(i, i+1)=1; 
            A(i,i-20)=1; 
            A(i,i-460)=1; 
    elseif (i>20)&&(i<480) 
        A(i,i-20)=1; 
        A(i,i+20)=1; 
        A(i, i-1)=1; 
        A(i, i+1)=1;   
    end
end

for i=1:1:500
    test = 0;
    if ((mod(i,20)==1)||(mod(i,20)==0) || ((mod(i,10)==1) && (i<252)) || ((mod(i,10)==0)&&(i<252)))
        B(i) = 100;
        for j=1:1:500
            if (j==i) 
                    A(i,j)=1;
                else 
                    A(i,j)=0;
            end
        end
    end
    if ((i==195)||(i==196)||(i==215)||(i==216)||(i==405)||(i==406)||(i==425)||(i==426))
            B(i)=500;
            for j=1:1:500
                if (j==i) 
                    A(i,j)=1;
                else 
                    A(i,j)=0;
                end
            end
    end
    if ((i>=481)&&(i<=491))
            B(i)=100;
            for j=1:1:500
                if (j==i) 
                        A(i,j)=1;
                    else 
                        A(i,j)=0;
                end
            end
    end
end

end

