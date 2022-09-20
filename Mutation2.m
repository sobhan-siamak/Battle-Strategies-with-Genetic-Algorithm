function [ NewGeneration ] = Mutation2( crossgeneration,s,n,pm,population )
     % Inversion Mutation
    [n1,m1]=size(crossgeneration);
   for i=1:population
       if(rand<pm)%mutation with pm probability
           mpoint=randi([1,n1]);%select random one chromosome for mutation
           parent=crossgeneration(mpoint,:);
           swpoint1=randi([1,n]);
           swpoint2=randi([1,n]);
           if(swpoint1<swpoint2)
               temp1=fliplr(parent(swpoint1:swpoint2));
               parent(swpoint1:swpoint2)=temp1;               
           end
           if(swpoint1>swpoint2)
               temp2=fliplr(parent(swpoint2:swpoint1));
               parent(swpoint2:swpoint1)=temp2;
           end
           
           
           crossgeneration(mpoint,:)=parent();
       end
   end


   NewGeneration=crossgeneration;
end

