function SYNBAD_makelibrary_HL_C(input_file)
% SYNBAD_makelibrary_HL('name_of_library_input_file')
% generate odefile for HL kinetics library
% generate default parameter file for HL kinetics library
% generate default state file for HL kinetics library 
% generate default promoters transcripts file for HL kinetics library 


eval(sprintf(input_file));
name_file = sprintf('%s_odefile_c.c',library.name_of_function);

Promoters = library.promoters;
Transcripts = library.transcripts;
Prom_tf = library.prom_tf;
Prom_nhill = library.prom_nhill;
Inducers = library.inducers;
Ind_tr = library.ind_tr;
n_Promoters = size(Promoters,2);
n_Transcripts = size(Transcripts,2);
n_Inducers = size(Inducers,2);
fidOut   = fopen(name_file, 'w');


fprintf(fidOut,'#include <amigoRHS.h>\n');
fprintf(fidOut,'#include <math.h>\n');
fprintf(fidOut,'#include <amigoJAC.h>\n');
fprintf(fidOut,'#include <amigoSensRHS.h>\n');

fprintf(fidOut,'\n');

fprintf(fidOut,'#define n_Transcripts %d\n',n_Transcripts);
fprintf(fidOut,'#define n_Promoters %d\n',n_Promoters');
fprintf(fidOut,'\n');

counter=0;

for i=1:n_Transcripts
    counter=counter+1;
    fprintf(fidOut,'#define %s Ith(z,%d)\n',Transcripts{i},counter-1);
    fprintf(fidOut,'#define d%s_dt Ith(zdot,%d)\n',Transcripts{i},counter-1);
end

fprintf(fidOut,'\n');

for i=1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define %s%s Ith(z,%d)\n',Ind_tr{i},Inducers{i},counter-1);
    fprintf(fidOut,'#define d%s%s_dt Ith(zdot,%d)\n',Ind_tr{i},Inducers{i},counter-1);
end

fprintf(fidOut,'\n');

counter=0;

for i=1:n_Transcripts
    for j=1:n_Promoters
        counter=counter+1;
        fprintf(fidOut,'#define Y_%d_%d (amigo_model->pars[%d])\n',i,j,counter-1);
    end
end


%INDUCERS
for i=1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define %s (amigo_model->pars[%d])\n',Inducers{i},counter-1);
end

fprintf(fidOut,'\n');

% PARAMETERS
for ii=1:1:n_Promoters
    counter=counter+1;
    fprintf(fidOut,'#define K_%s (amigo_model->pars[%d]) \n',Promoters{ii},counter-1);
end

fprintf(fidOut,'\n');

for ii=1:1:n_Transcripts
    counter=counter+1;
    fprintf(fidOut,'#define alpha_%s (amigo_model->pars[%d])\n',Transcripts{ii},counter-1);
end

fprintf(fidOut,'\n');

for ii=1:1:n_Transcripts
    counter=counter+1;
    fprintf(fidOut,'#define kdeg_%s (amigo_model->pars[%d])\n',Transcripts{ii},counter-1);
end

fprintf(fidOut,'\n');

for ii=1:1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define kf_%s%s (amigo_model->pars[%d])\n',Ind_tr{ii},Inducers{ii},counter-1);
end

fprintf(fidOut,'\n');

for ii=1:1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define kb_%s%s (amigo_model->pars[%d])\n',Ind_tr{ii},Inducers{ii},counter-1);
end

fprintf(fidOut,'\n');

for ii=1:1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define kdeg_%s%s (amigo_model->pars[%d])\n',Ind_tr{ii},Inducers{ii},counter-1);
end


fprintf(fidOut,'\n');

fprintf(fidOut,'int amigoRHS(realtype t, N_Vector z, N_Vector zdot, void *data){\n');

fprintf(fidOut,'\n');

fprintf(fidOut,'AMIGO_model* amigo_model=(AMIGO_model*)data;\n');

fprintf(fidOut,'\n');

% RHS of ODES
for jj=1:1:n_Transcripts    
    fprintf(fidOut,'d%s_dt= Y_%d_%d*alpha_%s/(1+K_%s*pow(%s,%d)) \n',Transcripts{jj},jj,1,Prom_tf{1},Promoters{1},Prom_tf{1},Prom_nhill(1));
    for ii=2:1:n_Promoters
        fprintf(fidOut,'\t\t\t+Y_%d_%d*alpha_%s/(1+K_%s*pow(%s,%d)) \n',jj,ii,Prom_tf{ii},Promoters{ii},Prom_tf{ii},Prom_nhill(ii));
    end
    it = strcmp(Transcripts{jj},Ind_tr);
    idxi=find(it>0);
    if ~isempty(idxi)
      fprintf(fidOut,'\t\t\t-kf_%s%s*%s*%s \n',Transcripts{jj},Inducers{idxi},Transcripts{jj},Inducers{idxi});
      fprintf(fidOut,'\t\t\t+kb_%s%s*%s%s \n',Transcripts{jj},Inducers{idxi},Transcripts{jj},Inducers{idxi});
    end
   
    fprintf(fidOut,'\t\t\t-kdeg_%s*%s;\n',Transcripts{jj},Transcripts{jj});
end

for kk=1:1:n_Inducers    
    fprintf(fidOut,'d%s%s_dt= kf_%s%s*%s*%s \n',Ind_tr{kk},Inducers{kk},Ind_tr{kk},Inducers{kk},Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'\t\t\t -kb_%s%s*%s%s \n',Ind_tr{kk},Inducers{kk},Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'\t\t\t -kdeg_%s%s*%s%s;\n',Ind_tr{kk},Inducers{kk},Ind_tr{kk},Inducers{kk});
end


fprintf(fidOut,'return(0);\n}\n\n');

fprintf(fidOut,'void amigoRHS_get_OBS(void* data){\n\n}\n\n');

fprintf(fidOut,'void amigoRHS_get_sens_OBS(void* data){\n\n}\n\n');

fprintf(fidOut,'void amigo_Y_at_tcon(void* data, realtype t, N_Vector y){\n\n}\n\n');

fprintf(fidOut,'\n');


fclose(fidOut);


%% PARAMETER DEFAULT VALUES
eval(sprintf('name_file2 = ''%s_default_parameters.m'';',library.name_of_function))

fidOut2 = fopen(name_file2, 'w');

fprintf(fidOut2,'function k=%s_default_parameters\n',library.name_of_function);

fprintf(fidOut2,'\n');
 
% PARAMETERS
for ii=1:1:n_Promoters
     fprintf(fidOut2,'K_%s=1;\n',Promoters{ii});
end
 
for ii=1:1:n_Transcripts
     fprintf(fidOut2,'alpha_%s=1;\n',Transcripts{ii});
end
 
for ii=1:1:n_Transcripts
     fprintf(fidOut2,'kdeg_%s=1;\n',Transcripts{ii});
end
 
for ii=1:1:n_Inducers
     fprintf(fidOut2,'kf_%s%s=1;\n',Ind_tr{ii},Inducers{ii});
end

for ii=1:1:n_Inducers
     fprintf(fidOut2,'kb_%s%s=1;\n',Ind_tr{ii},Inducers{ii});
end

for ii=1:1:n_Inducers
     fprintf(fidOut2,'kdeg_%s%s=1;\n',Ind_tr{ii},Inducers{ii});
end
 
fprintf(fidOut2,'\n');

% PARAMETERS
for ii=1:1:n_Promoters
     fprintf(fidOut2,'k.name{%d}=''K_%s'';\n',ii,Promoters{ii});
end
 
for ii=1:1:n_Transcripts
     fprintf(fidOut2,'k.name{%d}=''alpha_%s'';\n',n_Promoters+ii,Transcripts{ii});
end

for ii=1:1:n_Transcripts
     fprintf(fidOut2,'k.name{%d}=''kdeg_%s'';\n',n_Promoters+n_Transcripts+ii,Transcripts{ii});
end
 
for ii=1:1:n_Inducers
     fprintf(fidOut2,'k.name{%d}=''kf_%s%s'';\n',n_Promoters+2*n_Transcripts+ii,Ind_tr{ii},Inducers{ii});
end

for ii=1:1:n_Inducers
     fprintf(fidOut2,'k.name{%d}=''kb_%s%s'';\n',n_Promoters+2*n_Transcripts+n_Inducers+ii,Ind_tr{ii},Inducers{ii});
end

for ii=1:1:n_Inducers
     fprintf(fidOut2,'k.name{%d}=''kdeg_%s%s'';\n',n_Promoters+2*n_Transcripts+2*n_Inducers+ii,Ind_tr{ii},Inducers{ii});
end


fprintf(fidOut2,'\n');
 
fprintf(fidOut2,'k.value = zeros(%d,1);\n',n_Promoters+2*n_Transcripts+3*n_Inducers);

for ii=1:1:n_Promoters
     fprintf(fidOut2,'k.value(%d)=K_%s;\n',ii,Promoters{ii});
end

for ii=1:1:n_Transcripts
    fprintf(fidOut2,'k.value(%d)=alpha_%s;\n',ii+n_Promoters,Transcripts{ii}); 
end

for ii=1:1:n_Transcripts
    fprintf(fidOut2,'k.value(%d)=kdeg_%s;\n',ii+n_Promoters+n_Transcripts,Transcripts{ii}); 
end


for ii=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kf_%s%s;\n',ii+n_Promoters+2*n_Transcripts,Ind_tr{ii},Inducers{ii}); 
end

for ii=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kb_%s%s;\n',ii+n_Promoters+2*n_Transcripts+n_Inducers,Ind_tr{ii},Inducers{ii}); 
end
for ii=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kdeg_%s%s;\n',ii+n_Promoters+2*n_Transcripts+2*n_Inducers,Ind_tr{ii},Inducers{ii}); 
end

fclose(fidOut2);
% 

%% Z STATE VECTOR NAMES

eval(sprintf('name_file3 = ''%s_default_states.m'';',library.name_of_function))

fidOut3   = fopen(name_file3, 'w');

fprintf(fidOut3,'function z=%s_default_states\n',library.name_of_function);
 
fprintf(fidOut3,'\n');


fprintf(fidOut3,'z.z0 = zeros(%d,1);\n',n_Transcripts+n_Inducers);


fprintf(fidOut3,'\n');
for ii=1:1:n_Transcripts
    fprintf(fidOut3,'z.name{%d}=''%s'';\n', ii,Transcripts{ii});
end
for ii=1:1:n_Inducers
     fprintf(fidOut3,'z.name{%d}=''%s%s'';\n',n_Transcripts +ii, Ind_tr{ii},Inducers{ii});
end

fclose(fidOut3);

SYNBAD_compile(name_file,[library.name_of_function '_odefile_c']);

 %% Z TRANSCRIPTS AND PROMOTERS
 eval(sprintf('name_file4 = ''%s_transcripts_and_promoters.m'';',library.name_of_function))
 
 fidOut4  = fopen(name_file4, 'w');
 
 fprintf(fidOut4,'function [n_Transcripts,n_Promoters]=%s_transcripts_and_promoters\n',library.name_of_function);
 
 fprintf(fidOut4,'\n');
 
 fprintf(fidOut4,'n_Transcripts = %d;\n',n_Transcripts);
 fprintf(fidOut4,'n_Promoters = %d;\n',n_Promoters);
 
 
 fclose(fidOut4);