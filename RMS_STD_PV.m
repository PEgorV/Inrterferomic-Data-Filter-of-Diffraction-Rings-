function [RMS,STD,PV]=RMS_STD_PV(X)
 % Поиск RMS и PV

[m,n]=size(X);


k=1;

for i=1:m
    for j=1:n
    
        if  X(i,j)~=0 

              Y(k)=X(i,j);

       k=k+1;

        end


    end
end



Len=length(Y);

M=mean(Y);

Q=0;
S=0;
for k=1:Len


    Q=Q+(Y(k)-M)^2;
    S=S+(Y(k))^2;

end


RMS=sqrt(1/Len*Q);
STD=sqrt(1/Len*S);
PV=abs(max(Y)-min(Y));

end
