function Output=Filtering_Surface(Matrix,max_size) 

Four=fft2(Matrix); % Фурье от Матрицы


Memory=Descending_Maximum_Matrix((Four),max_size);% Выбираем max_size максимальных элементов

Q=Four;


for i=1:max_size

    Q(Memory(i,2),Memory(i,3))=0; % И зануляем их

end

QQ=ifft2(Q);



% [RMSFull,PVFFull]=RMS_PV(Matrix);
% figure,
% subplot(2,1,1),imagesc(Matrix),
% title([name1,', RMS=',  num2str(RMSFull) ' нм, PV=', num2str(PVFFull), ' нм'])
% 
%      axis image
%   colorbar
% ax = gca;
% 
%  ax.CLim=([mini maxi]);
%   set(gca, 'ydir', 'reverse','FontSize',15);
% 
% [RMSF,PVF]=RMS_PV(Matrix-real(QQ));
% subplot(2,1,2),imagesc(Matrix-real(QQ))
% title([name2,', RMS=',  num2str(RMSF) ' нм, PV=', num2str(PVF), ' нм'])
%   axis image
%   colorbar
% ax = gca;
%  ax.CLim=([mini maxi]);
%   set(gca, 'ydir', 'reverse','FontSize',15);

Output=Matrix-real(QQ);

end


function  Memory=Descending_Maximum_Matrix(Matrix,n)



% Matrix=[2 3; 1 5;];
% n=2;

Memory=zeros(n,3);

    for k=1:n
    [value,i,j]=Maximum_for_Matrix(Matrix);

    Memory(k,:)=[value,i,j];

    Matrix(i,j)=0;

    end



end


function [value,i,j]=Maximum_for_Matrix(Matrix)



value=Matrix(1,1);
[m,n]=size(Matrix);
Q=zeros(1,3);


    for i=1:m
                for j=1:n
            if  abs(Matrix(i,j))>=abs(value)
                value=Matrix(i,j);
                Q=[value, i, j];

            end
                end

    end

   value = Q(1);
     i = Q(2);
     j = Q(3);

end
