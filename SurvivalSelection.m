function [ NewGeneration ] = SurvivalSelection( generation,otherGeneration,population,Fitness,NewFitnessNext,n )
    
    % the rate of elitism is %10
    m1=(1/10)*population;%elitism
    n1=(9/10)*population;%other from offspring
    n2=size(population,1);
    NewGeneration=zeros(population,n);
    F1=sortrows(Fitness);%Ascending sort of  fitness belong to before generation
    F1=flipud(F1);%Descending sort of fitness  belong to before generation
    F2=sortrows(NewFitnessNext);%Ascending sort of  fitness belong to new generation
    F2=flipud(F2);%Descending sort of fitness  belong to new generation

    for i=1:m1
        NewGeneration(i,:)=generation(F1(i,2),:);%transmite %10 of  best before generation to new generation        
    end
    for i=(m1+1):n2
        NewGeneration(i,:)=otherGeneration(F2(i,2),:);%transmite of best current generation to new generation
        
    end
end

