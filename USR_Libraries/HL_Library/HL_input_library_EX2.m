 %% DEFINE LIBRARY

 
library.name_of_function='HLex2';

library.promoters={'Plac1','Plac2','Plambda','Ptet','ParaC'};  % list of promoters (ParaC=Pbad)
library.transcripts={'tetR','lacI','cI','araC'}; % list of protein conding regions
library.prom_tf={'lacI','lacI','cI','tetR','araC'}; % transcript affecting each promoter
library.prom_nhill=[4,4,2,2,2]; % Hill coefficients of Repressor-Promoter pairs
library.inducers={'IPTG','aTc'}; % list of inducer
library.ind_tr={'lacI','tetR'}; % transcript affected by each inducer


