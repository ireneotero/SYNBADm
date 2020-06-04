%% DEFINE library
 
library.name_of_function='MA';

library.promoters={'P1','P2','P3','P4'};  % list of promoters
library.transcripts={'cI','tetR','araC','lacI','luxI','luxR','lasI','lasR','ccdB','ccdA','ccdA2'}; % list of protein conding regions
library.prom_tf={'cI','tetR','araC','lacI'}; % transcript affecting each promoter


library.inducers={}; % list of inducer
library.ind_tr={}; % transcript affected by each inducer