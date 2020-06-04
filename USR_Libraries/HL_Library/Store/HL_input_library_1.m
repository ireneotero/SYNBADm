%% DEFINE LIBRARY

 
Library.Name_of_function='HL';

Library.Promoters={'Plac1','Plac2','Plac3','Plac4','Plambda','Ptet1','Ptet2','ParaC'};  % list of promoters
Library.Transcripts={'tetR','lacI','cI','araC'}; % list of protein conding regions
Library.Prom_tf={'lacI','lacI','lacI','lacI','cI','tetR','tetR','araC'}; % transcript affecting each promoter
Library.Prom_nhill=[4,4,4,4,2,2,2,2]; % transcript affecting each promoter
Library.Inducers={'IPTG','aTc'}; % list of inducer
Library.Ind_tr={'lacI','tetR'}; % transcript affected by each inducer


