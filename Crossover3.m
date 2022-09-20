function [ o1,o2 ] = Crossover3( p1,p2,n,generation,s )

   parent1=generation(p1,:);
   parent2=generation(p2,:);
   
   onepoint=randi([1,n-1]);%select one point among length of chromosome
   
   o1=[parent1(1:onepoint) parent2(onepoint+1:end)];%offspring1
   o2=[parent2(1:onepoint) parent1(onepoint+1:end)];%offspring2

   
     so1=sum(o1);
     so2=sum(o2);
     [mino1,minindx]=min(o1);
     [mino2,minindx2]=min(o2);
     [maxo1,maxindx]=max(o1);
     [maxo2,maxindx2]=max(o2);
     if(so1<s)
         o1(minindx)=o1(minindx)+(s-so1);
         
     end
     if(so2<s)
          
         o2(minindx2)=o2(minindx2)+(s-so2);
     end
     if(so1>s)
         o1(maxindx)=abs(o1(maxindx)-(so1-s));
         
     end
     if(so2>s)
          
         o2(minindx2)=abs(o2(maxindx2)-(so1-s));
     end


end

