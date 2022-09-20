

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% @Copy by  Sobhan Siamak %%%%%%%%%%%%%%%

%% This Program is the Battle Strategy Using Genetic Algorithm
% Representation = Permutation
clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%% Definition of Problem %%%%%%%%%%%%%%%%%%

n=4;%the length of Chromosome that is the same number of battles
s=20;%the number of soldiers
%b=4;%the number of battles
population=50; %the size of population
tournomentsize=3;
%% probabily you may change this part %Remember%
%calculate the number of chromosome for crossover and mutation
pc=0.85;% the probability of Crossover
%crossnumber=2*round((pc*population)/2);% the number of crossover
pm=0.15;% the probability of mutation
%mutatenumber=round(pm*population);% the number of mutation
%%
tic %start Time
%% Initial Generation
generation = initgeneration(n,population,s);
gn=generation;
generationcount=100;% the number of generation for running program
Fitness = FitnessEvaluation(population,n,generation);

BestFitness=zeros(generationcount,1);
AvgFitness=zeros(generationcount,1);

%% main loop

%% Part1 Crossover and Selection are optional
for i=1:generationcount
    
 %% Selection Function based on Roulette wheel
  % crossgeneration=SelectionRW(population,generation,Fitness,n,pc,s);
   %%in SelectionRW Function  or selection parent we call crossover
   %%Crossover=Crossover();no need
   %% Selection Tournoment
      crossgeneration=SelectionTournoment(population,generation,Fitness,n,tournomentsize,pc,s);
    %%in SelectionRW Function  or selection parent we call crossover
    %%Crossover=Crossover();no need
    %% Rf Tournoment Selection with Rf Ratio
   
    %crossgeneration= RfTournomentselection(population,generation,Fitness,n,tournomentsize,pc,s);
    %%in SelectionRW Function  or selection parent we call crossover
    %%Crossover=Crossover();no need
    
 %% Mutation based on Swap
   %otherGeneration=Mutationpart1(crossgeneration,s,n,pm,population);
   %NewFitnessNext=FitnessEvaluation(population,n,otherGeneration);
  %% Mutation based on Inversion
  otherGeneration=Mutation2(crossgeneration,s,n,pm,population);
  NewFitnessNext=FitnessEvaluation(population,n,otherGeneration);
  %% Survival Selection with elitism   
      %NewGeneration = 10% of best parents and 90% of best offsprings
      NewGeneration=SurvivalSelection(generation,otherGeneration,population,Fitness,NewFitnessNext,n);
      NewFitness=FitnessEvaluation(population,n,NewGeneration);
      generation=otherGeneration;
      Fitness=NewFitnessNext;       
     %End of transmite best chromosomes from one generation to other  generation
   
  %% Display Best Fitness in every Generation
   BestFitness(i)=max(NewFitness(:,1));
   AvgFitness(i)=(sum(NewFitness(:,1)))/population;
   disp(['Generation= ' num2str(i)  '  Wining Strategy=BestFitness= ' num2str(BestFitness(i))]);
   
   if(i==95)
        gn1=generation;
    end
   
    if(i==96)
        gn2=generation;
    end
    if(i==97)
        gn3=generation;
    end
    
end

FinalFitness=NewFitness;
FinalGeneration=NewGeneration;
FinalFitness=sortrows(FinalFitness);%sort ascending Final Fitness 
FinalFitness=flipud(FinalFitness);%sort descending Final Fitness
bestindex=FinalFitness(1,2);

%% Display Best Strategy, and Best Fitness

disp(['Final wining Strategy=Best Strategy=' num2str(FinalGeneration(bestindex,:))]);
disp(['Best Fitness=' num2str(FinalFitness(1,1))]);
disp(['Time is:' num2str(toc)]); % stop Time

%% Plot Best and Average Fitness based on Generations
figure(1)
plot(BestFitness,'b');
xlabel('Generation');
ylabel('Fitness');
%legend('BestStrategy=Blue    AVGStrategy=Red');
title('Battle Strategy');
hold on
plot(AvgFitness,'r');
legend({'BestStrategy', 'AVGStrategy'},'Location','southwest','FontSize',12);
%legend('boxoff')
hold off




