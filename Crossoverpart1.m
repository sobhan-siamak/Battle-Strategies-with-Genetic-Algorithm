function [ o1,o2 ] = Crossoverpart1(p1,p2,n,generation,s )
    
     

   parent1=generation(p1,:);
   parent2=generation(p2,:);
   o1=zeros(1,n);
   o2=zeros(1,n);
   onepoint=randi([1,n-1]);%select one point among length of chromosome
   
     % Create offspring1 with new genetic material
     o1(1:onepoint)=parent1(1:onepoint);
     sm=sum(o1);
     rm=abs(s-sm);
     for i=(onepoint+1):n
         if((parent2(i)<rm) && i~=n)
             o1(i)=parent2(i);   
             sm=sum(o1);
             rm=abs(s-sm);
         end
         if(parent2(i)>rm)
             o1(i)=rm; 
             break;
         end
         if(parent2(i)==rm)
             o1(i)=parent2(i); 
             break;
         end
         if((parent2(i)<rm) && i==n)
             o1(i)=rm;
         end
         
         
     end
      
     % Create offspring2 with new genetic material
     o2(1:onepoint)=parent2(1:onepoint);
     sm2=sum(o2);
     rm2=abs(s-sm2);
     for i=(onepoint+1):n
         if(parent1(i)<rm2  && i~=n)
             o2(i)=parent1(i);   
             sm2=sum(o2);
             rm2=abs(s-sm2);
         end
         if(parent1(i)>rm2)
             o2(i)=rm2; 
             break;
         end
         if(parent1(i)==rm2)
             o2(i)=parent1(i); 
             break;
         end
         if((parent1(i)<rm) && i==n)
             o2(i)=rm;
         end
         
     end
     so1=sum(o1);
     so2=sum(o2);
     [mino1,minindx]=min(o1);
     [mino2,minindx2]=min(o2);
     if(so1<s)
         o1(minindx)=o1(minindx)+(s-so1);
     end
     if(so2<s)
         o2(minindx2)=o2(minindx2)+(s-so2);
     end



end

