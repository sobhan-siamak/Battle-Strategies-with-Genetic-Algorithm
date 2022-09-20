function [ NewGeneration ] = Mutationpart1( crossgeneration,s,n,pm,population )
    % Swap Mutation
   [n1,m1]=size(crossgeneration);
   for i=1:population
       if(rand<pm)%mutation with pm probability
           mpoint=randi([1,n1]);%select random one chromosome for mutation
           parent=crossgeneration(mpoint,:);
           swpoint1=randi([1,n]);
           swpoint2=randi([1,n]);
           while (swpoint1==swpoint2)
                    swpoint2=randi([1,n]);
           end
           temp=parent(swpoint1);
           parent(swpoint1)=parent(swpoint2);
           parent(swpoint2)=temp;
               
           
           crossgeneration(mpoint,:)=parent();
       end
       
   end

   NewGeneration=crossgeneration;
    
end

