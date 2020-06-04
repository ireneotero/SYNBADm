%% DEFINE LIBRARY

 
library.name_of_function='HL';

library.promoters={'Plac1','Plac2','Plac3','Plac4','Plambda','Ptet1','Ptet2','ParaC'};  % list of promoters (ParaC=Pbad)
library.transcripts={'tetR','lacI','cI','araC'}; % list of protein conding regions
library.prom_tf={'lacI','lacI','lacI','lacI','cI','tetR','tetR','araC'}; % transcript affecting each promoter
library.prom_nhill=[4,4,4,4,2,2,2,2]; % Hill coefficients of Repressor-Promoter pairs
library.inducers={'IPTG','aTc'}; % list of inducer
library.ind_tr={'lacI','tetR'}; % transcript affected by each inducer


