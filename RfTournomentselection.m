function [ crossgeneration ] = RfTournomentselection( population,generation,Fitness,n,tournomentsize,pc,s )
  

  Rfratio=1/3;
  TourPool=zeros(tournomentsize,n);
  NewFitness=Fitness; 
  crossgeneration=generation;
  [m1,n1]=size(generation);
  Tournomentwins=zeros(m1,n1);
  fitnesstour=zeros(tournomentsize,2);
  for i=1:m1
      %select point of players
      pointA=randi([1,m1]);
      pointB=randi([1,m1]);
      while (pointA==pointB)
         pointB=randi([1,m1]);
      end
      pointC=randi([1,m1]);
       while (pointB==pointC)
          pointC=randi([1,m1]);
       end
      %select players
      
          TourPool(1,:)=crossgeneration(pointA,:);
          TourPool(2,:)=crossgeneration(pointB,:);
          TourPool(3,:)=crossgeneration(pointC,:);
      %Tournoment with Rf Ratio
        for i1=1:tournomentsize
          cnt=0;
          for j=1:tournomentsize
              if(i1~=j)
                  ftemp=TourPool(i1,:)-TourPool(j,:);
                  [mx,indmx]=max(ftemp);
                  if(mx>0)
                     extra=ceil(Rfratio*mx);
                     ftemp(indmx)=0;
                     for k=1:n1
                        if((k~=indmx) && mx>0)
                            ftemp(k)=ftemp(k)+extra;
                            mx=mx-extra;
                        end
                        if(mx+extra>0)
                            ftemp(k)=ftemp(k)+extra;
                        end
                     end
                  end
                  for k1=1:n1
                      if(ftemp(k1)<0)
                         cnt=cnt+0;
                      end
                      if(ftemp(k1)==0)
                         cnt=cnt+1;
                      end
                      if(ftemp(k1)>0)
                         cnt=cnt+2;
                      end
                 end
              end
          end
          fitnesstour(i1,1)=cnt;
          fitnesstour(i1,2)=i1;
        end
        fitnesstour=sortrows(fitnesstour);%sort ascending FitnessTour 
      fitnesstour=flipud(fitnesstour);%sort descending FitnessTour
      bestindextour=fitnesstour(1,2);% index of winner among 3 players
      if(bestindextour==1)
          Tournomentwins(i,:)=TourPool(1,:);
      end
      if(bestindextour==2)
          Tournomentwins(i,:)=TourPool(2,:);
      end
      if(bestindextour==3)
         Tournomentwins(i,:)=TourPool(3,:);
          
      end
      
  end
   %% call crossover
   for i=1:population-1
      if(rand<pc)% crossover with pc probability
        % p1=find(rand<NewFitness(:,1),1,'first');%find the first chromosome
        % p2=find(0.9*rand<NewFitness(:,1),1,'first');%find the second chromosome
        p1=randi([1,m1]);
        p2=randi([1,m1]);
        
       if (p1~=p2)
        [o1,o2]=Crossoverpart1(p1,p2,n,Tournomentwins,s);%call crossover for every selection
        crossgeneration(i,:)=o1;%save offspring1
        crossgeneration(i+1,:)=o2;%save offspring2
      end
      end
  end
    

end

