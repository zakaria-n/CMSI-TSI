%% Building laplace operator and temperature matrices for part two of the lab
function [A,X] = buildAX()
A=zeros(500);
X=zeros(500,1);
for i=1:1:500
    if i==1
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
            A(i,i-20)=1; 
            A(i,i+20)=1;  
            A(i, i-1)=1; 
            A(i, i+1)=1; 
            A(i,i-360)=1;
         elseif (i==361)
             A(i,i)=-4;
            A(i,i-20)=1; 
            A(i,i+20)=1;  
            A(i, i+1)=1;
            A(i,i-360)=1;
         elseif (mod(i,20)==0)
              A(i,i)=-3;
             A(i,i+20)=1; 
             A(i, i-1)=1; 
             A(i, i-20)=1; 
         elseif (mod(i,20)==1)
             A(i,i)=-3;
             A(i,i+20)=1; 
             A(i, i+1)=1; 
             A(i, i-20)=1; 
        else
            A(i,i)=-4;
            A(i, i-1)=1; 
            A(i,i-20)=1; 
            A(i, i+20)=1; 
            A(i,i+1)=1;  
         end
    elseif (i>=482)&&(i<491) 
            A(i,i)=-3;
            A(i, i-1)=1; 
            A(i, i+1)=1; 
            A(i,i-20)=1; 
    elseif (i>=491)&&(i<500) 
            A(i,i)=-4;
            A(i, i-1)=1; 
            A(i, i+1)=1; 
            A(i,i-20)=1; 
            A(i,i-480)=1; 
    elseif (i==481)
            A(i,i)=-2;
            A(i, i+1)=1; 
            A(i,i-20)=1; 
    elseif (i==500)
            A(i,i)=-3;
            A(i, i-1)=1; 
            A(i,i-20)=1; 
            A(i,i-480)=1;    
    end
end

for i=1:500
    if ((i==195)||(i==196)||(i==215)||(i==216)||(i==405)||(i==406)||(i==425)||(i==426))
            
            X(i)=500;   
    end
end