function [ crossgeneration ] = SelectionRW( population,generation,Fitness,n,pc,s )
      
  NewFitness=Fitness;
  crossgeneration=generation;
  %Normalize Fitness between 0 and 1
  
  minim=min(Fitness(:,1));
  maxim=max(Fitness(:,1));  
  NewFitness(:,1)= (Fitness(:,1)-minim)/(maxim-minim);

  %RouletteWheel
  s1=sum(NewFitness(:,1));%calculate sum
  NewFitness(:,1)=NewFitness(:,1)/s1;%calculate average
  NewFitness(:,1)=cumsum(NewFitness(:,1));%cumulative Sum
  
  for i=1:population-1
      if(rand<pc)% crossover with pc probability
         p1=find(rand<NewFitness(:,1),1,'first');%find the first chromosome
         p2=find(0.9*rand<NewFitness(:,1),1,'first');%find the second chromosome
         if (p1~=p2)
           [o1,o2]=Crossoverpart1(p1,p2,n,generation,s);%call crossover for every selection
           crossgeneration(i,:)=o1;%save offspring1
           crossgeneration(i+1,:)=o2;%save offspring2
        end
      end
  end

end

