%% DEFINE LIBRARY

 
Library.Name_of_function='MA';
Library.Name_of_matfile_default_param='MA1';

Library.Promoters={'P1','P2','P3','P4'};  % list of promoters
Library.Transcripts={'cI','tetR','araC','lacI','luxI','luxR','lasI','lasR','ccdB','ccdA','ccdA2'}; % list of protein conding regions
Library.Prom_tf={'cI','tetR','araC','lacI'}; % transcript affecting each promoter
% Library.Inducers={'IPTG','aTc'}; % list of inducer
% Library.Ind_tr={'lacI','tetR'}; % transcript affected by each inducer


Library.Inducers=[]; % list of inducer
Library.Ind_tr=[]; % transcript affected by each inducer