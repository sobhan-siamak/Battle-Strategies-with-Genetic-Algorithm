function [ generation ] = initgeneration( n,population,s )
  
       soldier = zeros(population,n);   
       [m1,n1]=size(soldier);
       for i=1:m1
           sm=s;
           for j=1:n1
               numb=randi([0,s],[1,1]);
               if(numb<=sm)
                 soldier(i,j)=numb; 
               end
                 sumarr=sum(soldier(i,:));
                 sm=abs(sumarr-s);
               
           end
       end
       for i=1:m1
           sumsoldiers=sum(soldier(i,:));
           if(sumsoldiers<s)
               differ=s-sumsoldiers;
               [mn,indxmin]=min(soldier(i,:));
               soldier(i,indxmin)=soldier(i,indxmin)+differ;
               
           end
       end
       for i=1:2:m1
           soldier(i,:)=fliplr(soldier(i,:));
       end
       
  generation=soldier;
      
      
  


end

