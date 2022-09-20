function [ fitness ] = FitnessEvaluation( population,n,generation )

    fitness=zeros(population,2);
    [m1,n1]=size(generation);
    
    for i=1:population
        counter=0;
        for j=1:population
            if(i~=j)% each colonel never battle with yourself
                fittemp=generation(i,:)-generation(j,:);
                for k=1:n1
                    if(fittemp(k)<0)
                        counter=counter+0;
                    end
                    if(fittemp(k)==0)
                        counter=counter+1;
                    end
                    if(fittemp(k)>0)
                        counter=counter+2;
                    end
                end
            end
        end
        fitness(i,1)=counter;
        fitness(i,2)=i;
    end

end

