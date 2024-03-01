function Plots(A,name,mini,maxi,i,j,k)



[m,n]=size(A);


%  pixel=0.10225;
 pixel=1;

 switch nargin
     case 1
         imagesc((1:n),(1:m), A)
       
 
         axis image
xlabel('Length, mm')
ylabel('Width, mm')
xlabel('Length, pixel')
ylabel('Width, pixel')

set(gca,'FontSize',15)

     case 2 


         imagesc(1:n,1:m, A)

         axis image

xlabel('Length, pixel')
ylabel('Width, pixel')

set(gca,'FontSize',15)
title(name)


     case 4

         imagesc(1:n,1:m, A)
       

         axis image

xlabel('Length, pixel')
ylabel('Width, pixel')
   ax = gca;


 ax.CLim=([mini maxi]);
set(gca,'FontSize',15)
title(name)
axis image

     case 7

subplot(i,j,k),

        imagesc((1:n)*pixel,(1:m)*pixel, A)
% surf((1:n),(1:m), A,LineStyle='none')
         axis image
         xlabel('Length, mm')
         ylabel('Width, mm')

  colorbar
%   colormap Turbo
ax = gca;
 ax.CLim=([mini maxi]);
set(gca,'FontSize',15)
title(name)
 end

end
