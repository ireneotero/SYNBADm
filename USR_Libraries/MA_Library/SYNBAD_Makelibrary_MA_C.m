function SYNBAD_makelibrary_MA_C(input_file)
% SYNBAD_makelibrary_MA('name_of_library_input_file')
% generate odefile for MA kinetics library
% generate default parameter file for MA kinetics library
% generate default state file for MA kinetics library
% generate default transcripts promoters file for MA kinetics library

eval(sprintf(input_file));

name_file = sprintf('%s_odefile_c.c',library.name_of_function);

Promoters = library.promoters;
Transcripts = library.transcripts;
Prom_tf = library.prom_tf;
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
    for j=1:n_Promoters   
        counter=counter+1;
        fprintf(fidOut,'#define Y_%d_%d (amigo_model->pars[%d])\n',i,j,counter-1);
    end
end

fprintf(fidOut,'\n');

for i=1:(5*n_Promoters + 3*n_Transcripts + 3*n_Inducers)
    counter=counter+1;
    fprintf(fidOut,'#define K_%d (amigo_model->pars[%d])\n',i,counter-1);
end

fprintf(fidOut,'\n');

%INDUCERS

for i=1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define %s (amigo_model->pars[%d])\n',Inducers{i},counter-1);
end

fprintf(fidOut,'\n');

% STATES
counter=0;
for i=1:n_Promoters
    counter=counter+1;
    fprintf(fidOut,'#define %s Ith(z,%d)\n', Promoters{i}, counter-1);
    fprintf(fidOut,'#define d%s_dt Ith(zdot,%d)\n', Promoters{i}, counter-1);
end

fprintf(fidOut,'\n');

for i=1:n_Promoters
    counter=counter+1;
    fprintf(fidOut,'#define %s%s Ith(z,%d)\n',Promoters{i},Prom_tf{i}, counter-1);
    fprintf(fidOut,'#define d%s%s_dt Ith(zdot,%d)\n',Promoters{i},Prom_tf{i}, counter-1);
end

fprintf(fidOut,'\n');

for i=1:n_Transcripts
    counter=counter+1;
    fprintf(fidOut,'#define %s Ith(z,%d)\n',Transcripts{i},counter-1);
    fprintf(fidOut,'#define d%s_dt Ith(zdot,%d)\n',Transcripts{i},counter-1);
end

fprintf(fidOut,'\n');

for i=1:n_Transcripts
    counter=counter+1;
    fprintf(fidOut,'#define %sm Ith(z,%d)\n',Transcripts{i},counter-1);
    fprintf(fidOut,'#define d%sm_dt Ith(zdot,%d)\n',Transcripts{i},counter-1);
end

fprintf(fidOut,'\n');

for i=1:n_Inducers
    counter=counter+1;
    fprintf(fidOut,'#define %s%s Ith(z,%d)\n',Ind_tr{i},Inducers{i},counter-1);
    fprintf(fidOut,'#define d%s%s_dt Ith(zdot,%d)\n',Ind_tr{i},Inducers{i},counter-1);
end

fprintf(fidOut,'\n');


% PARAMETERS
for i=1:n_Promoters
    fprintf(fidOut,'#define kf_pt_%d K_%d\n',i,i);
end

fprintf(fidOut,'\n');

for i=1:n_Promoters
    fprintf(fidOut,'#define kb_pt_%d K_%d\n',i,i+n_Promoters);
end

fprintf(fidOut,'\n');

for i=1:n_Promoters
    fprintf(fidOut,'#define kdeg_pt_%d K_%d \n',i,i+2*n_Promoters);
end

fprintf(fidOut,'\n');

for i=1:n_Promoters
    fprintf(fidOut,'#define ktransc_%d K_%d\n',i,i+3*n_Promoters);
end

fprintf(fidOut,'\n');

for i=1:n_Promoters
    fprintf(fidOut,'#define kleak_%d K_%d\n',i,i+4*n_Promoters);
end

fprintf(fidOut,'\n');

for i=1:n_Transcripts
    fprintf(fidOut,'#define ktransl_%d K_%d\n',i,i+ 5*n_Promoters);
end

fprintf(fidOut,'\n');

for i=1:n_Transcripts
    fprintf(fidOut,'#define kdeg_m_%d K_%d\n',i,i+ 5*n_Promoters + n_Transcripts);
end

fprintf(fidOut,'\n');

for i=1:n_Transcripts
    fprintf(fidOut,'#define kdeg_%d K_%d\n',i,i+ 5*n_Promoters + 2*n_Transcripts);
end

fprintf(fidOut,'\n');

for i=1:n_Inducers
    fprintf(fidOut,'#define kf_ind_%d K_%d\n',i, i + 5*n_Promoters + 3*n_Transcripts);
end

fprintf(fidOut,'\n');


for i=1:n_Inducers
    fprintf(fidOut,'#define kb_ind_%d K_%d\n',i, i + 5*n_Promoters + 3*n_Transcripts+ n_Inducers);
end

for i=1:n_Inducers
    fprintf(fidOut,'#defne kdeg_ind_%d K_%d\n',i, i + 5*n_Promoters + 3*n_Transcripts+ 2*n_Inducers);
end

fprintf(fidOut,'\n');

fprintf(fidOut,'int amigoRHS(realtype t, N_Vector z, N_Vector zdot, void *data){\n');

fprintf(fidOut,'\n');

fprintf(fidOut,'AMIGO_model* amigo_model=(AMIGO_model*)data;\n');
fprintf(fidOut,'\n');
fprintf(fidOut,'\tdouble MAXROW, MAXCOL;\n');
fprintf(fidOut,'\n');
% REACTIONS
for ii=1:1:n_Promoters
    fprintf(fidOut,'\tdouble rf_pt_%d=kf_pt_%d*%s*%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
    fprintf(fidOut,'\tdouble rb_pt_%d=kb_pt_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
    fprintf(fidOut,'\tdouble rdeg_pt_%d=kdeg_pt_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
end

fprintf(fidOut,'\n');


for ii=1:1:n_Promoters
    fprintf(fidOut,'\tdouble rtransc_%d=ktransc_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
    fprintf(fidOut,'\tdouble rleak_%d=kleak_%d*%s;\n',ii,ii,Promoters{ii});
end

fprintf(fidOut,'\n');

for jj=1:1:n_Transcripts
    fprintf(fidOut,'\tdouble rtransl_%d=ktransl_%d*%sm;\n',jj,jj,Transcripts{jj});
    fprintf(fidOut,'\tdouble rdeg_m_%d=kdeg_m_%d*%sm;\n',jj,jj,Transcripts{jj});
    fprintf(fidOut,'\tdouble rdeg_%d=kdeg_%d*%s;\n',jj,jj,Transcripts{jj});
end

fprintf(fidOut,'\n');

for kk=1:1:n_Inducers
    fprintf(fidOut,'\tdouble rf_ind_%d=kf_ind_%d*%s*%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'\tdouble rb_ind_%d=kb_ind_%d*%s%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'\tdouble rdeg_ind_%d=kdeg_ind_%d*%s%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
end

fprintf(fidOut,'\n');


% RHS of ODES
for i=1:n_Promoters
    
    maxrow='max(0,0)';
    for j=1:n_Transcripts
        maxrow=regexprep(maxrow,',0)',sprintf(',max(Y_%d_%d,0))',j,i));
    end
    
    fprintf(fidOut,'\tMAXROW=%s;\n',maxrow);
    fprintf(fidOut,'\td%s_dt  = - MAXROW * rf_pt_%d  + MAXROW * rb_pt_%d + MAXROW * rdeg_pt_%d;\n',Promoters{i},i,i,i);
    fprintf(fidOut,'\td%s%s_dt= + MAXROW * rf_pt_%d  - MAXROW * rb_pt_%d - MAXROW * rdeg_pt_%d;\n',Promoters{i},Prom_tf{i},i,i,i);
    fprintf(fidOut,'\n');
    
end

fprintf(fidOut,'\n');
fprintf(fidOut,'\n');

for jj=1:1:n_Transcripts
    
    pt = strcmp(Transcripts{jj},Prom_tf);
    idxp=find(pt>0);
    
    it = strcmp(Transcripts{jj},Ind_tr);
    idxi=find(it>0);
    
    maxrow='max(0,0)';
    for i=1:n_Transcripts
        maxrow=regexprep(maxrow,',0)',sprintf(',max(Y_%d_%d,0))',i,idxp));
    end
    
    maxcol='max(0,0)';
    for i=1:n_Promoters
        maxcol=regexprep(maxcol,',0)',sprintf(',max(Y_%d_%d,0))',jj,i));
    end
  
    if ~isempty(idxp) && isempty(idxi)
        fprintf(fidOut,'\tMAXROW=%s;\n',maxrow);
        fprintf(fidOut,'\tMAXCOL=%s;\n',maxcol);
        fprintf(fidOut,'\td%s_dt= - MAXROW * rf_pt_%d + MAXROW * rb_pt_%d+ MAXCOL * rtransl_%d - MAXCOL * rdeg_%d;\n',Transcripts{jj},idxp,idxp,jj,jj);
    elseif ~isempty(idxp) && ~isempty(idxi)
        fprintf(fidOut,'\tMAXROW=%s;\n',maxrow);
        fprintf(fidOut,'\tMAXCOL=%s;\n',maxcol);
        fprintf(fidOut,'\td%s_dt= - MAXROW * rf_pt_%d +MAXROW *rb_pt_%d+ MAXCOL * rtransl_%d - MAXCOL * rdeg_%d - rf_ind_%d + rb_ind_%d;\n',Transcripts{jj},idxp,idxp,jj,jj,idxi,idxi);
    else
        fprintf(fidOut,'\tMAXCOL=%s;\n',maxcol);
        fprintf(fidOut,'\td%s_dt=MAXCOL * rtransl_%d - MAXCOL * rdeg_%d;\n',Transcripts{jj},jj,jj);
    end
    
    fprintf(fidOut,'\n');
    
    fprintf(fidOut,'\td%sm_dt=- MAXCOL * rdeg_m_%d \n',Transcripts{jj},jj);
    for ii=1:n_Promoters
        fprintf(fidOut,'\t\t + Y_%d_%d * rtransc_%d + Y_%d_%d * rleak_%d\n',jj,ii,ii,jj,ii,ii);
    end
    fprintf(fidOut,';\n');
    
     fprintf(fidOut,'\n');
     fprintf(fidOut,'\n');
end

for ii=1:1:n_Inducers
    fprintf(fidOut,'d%s%s_dt= rf_ind_%d - rb_ind_%d - rdeg_ind_%d;\n',Ind_tr{ii},Inducers{ii},ii,ii,ii);    
end

fprintf(fidOut,'return(0);\n}\n\n');

fprintf(fidOut,'void amigoRHS_get_OBS(void* data){\n\n}\n\n');

fprintf(fidOut,'void amigoRHS_get_sens_OBS(void* data){\n\n}\n\n');

fprintf(fidOut,'void amigo_Y_at_tcon(void* data, realtype t, N_Vector y){\n\n}\n\n');

fprintf(fidOut,'\n');



%% PARAMETER DEFAULT VALUES
eval(sprintf('name_file2 = ''%s_default_parameters.m'';',library.name_of_function))

fidOut2 = fopen(name_file2, 'w');

fprintf(fidOut2,'function k=%s_default_parameters\n',library.name_of_function);

fprintf(fidOut2,'\n');



% PARAMETERS
for ii=1:1:n_Promoters
    fprintf(fidOut2,'kf_pt_%d=1;\n',ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'kb_pt_%d=1;\n',ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'kdeg_pt_%d=1;\n',ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'ktransc_%d=1;\n',ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'kleak_%d=1;\n',ii);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'ktransl_%d=1;\n',jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'kdeg_m_%d=1;\n',jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'kdeg_%d=1;\n',jj);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'kf_ind_%d=1;\n',kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'kb_ind_%d=1;\n',kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'kdeg_ind_%d=1;\n',kk);
end

fprintf(fidOut2,'\n');


% PARAMETERS

for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.name{%d}=''kf_pt_%d'';\n',ii,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.name{%d}=''kb_pt_%d'';\n',ii+n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.name{%d}=''kdeg_pt_%d'';\n',ii+2*n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.name{%d}=''ktransc_%d'';\n',ii+3*n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.name{%d}=''kleak_%d'';\n',ii+4*n_Promoters,ii);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.name{%d}=''ktransl_%d'';\n',jj+ 5*n_Promoters,jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.name{%d}=''kdeg_m_%d'';\n',jj+ 5*n_Promoters + n_Transcripts,jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.name{%d}=''kdeg_%d'';\n',jj+ 5*n_Promoters + 2*n_Transcripts,jj );
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.name{%d}=''kf_ind_%d'';\n',kk +  5*n_Promoters + 3*n_Transcripts,kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.name{%d}=''kb_ind_%d'';\n',kk + 5*n_Promoters + 3*n_Transcripts+ n_Inducers,kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.name{%d}=''kdeg_ind_%d'';\n',kk + 5*n_Promoters + 3*n_Transcripts+ 2*n_Inducers,kk);
end

fprintf(fidOut2,'\n');

fprintf(fidOut2,'k.value = zeros(%d,1);\n',5*n_Promoters+3*n_Transcripts+3*n_Inducers);

for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.value(%d)=kf_pt_%d;\n',ii,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.value(%d)=kb_pt_%d;\n',ii+n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.value(%d)=kdeg_pt_%d;\n',ii+2*n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.value(%d)=ktransc_%d;\n',ii+3*n_Promoters,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut2,'k.value(%d)=kleak_%d;\n',ii+4*n_Promoters,ii);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.value(%d)=ktransl_%d;\n',jj+ 5*n_Promoters,jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.value(%d)=kdeg_m_%d;\n',jj+ 5*n_Promoters + n_Transcripts,jj);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut2,'k.value(%d)=kdeg_%d;\n',jj+ 5*n_Promoters + 2*n_Transcripts,jj );
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kf_ind_%d;\n',kk +  5*n_Promoters + 3*n_Transcripts,kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kb_ind_%d;\n',kk + 5*n_Promoters + 3*n_Transcripts+ n_Inducers,kk);
end

for kk=1:1:n_Inducers
    fprintf(fidOut2,'k.value(%d)=kdeg_ind_%d;\n',kk + 5*n_Promoters + 3*n_Transcripts+ 2*n_Inducers,kk);
end
fclose(fidOut2);



%% Z STATE VECTOR NAMES
eval(sprintf('name_file3 = ''%s_default_states.m'';',library.name_of_function))

fidOut3   = fopen(name_file3, 'w');

fprintf(fidOut3,'function z=%s_default_states(Y)\n',library.name_of_function);

fprintf(fidOut3,'\n');

fprintf(fidOut3,'NA = 6.0221415e23;  %% Avogadro (molecules in a mol)\n');
fprintf(fidOut3,'V = 1e-14;  %% Cell volume\n');
fprintf(fidOut3,'NAV = NA*V/1e9;  %% For concentration in nM\n');

fprintf(fidOut3,'\n');

fprintf(fidOut3,'z.z0 = zeros(%d,1);\n',2*n_Promoters+2*n_Transcripts+n_Inducers);
for ii=1:1:n_Promoters
    fprintf(fidOut3,'z.z0(%d) = max(Y(%d,:))/NAV;\n',ii,ii);
end


fprintf(fidOut3,'\n');
for ii=1:1:n_Promoters
    fprintf(fidOut3,'z.name{%d}=''%s'';\n', ii,  Promoters{ii});
end
for ii=1:1:n_Promoters
    fprintf(fidOut3,'z.name{%d}=''%s%s'';\n',n_Promoters+ii,Promoters{ii},Prom_tf{ii});
end
for ii=1:1:n_Transcripts
    fprintf(fidOut3,'z.name{%d}=''%s'';\n',2*n_Promoters+ii,Transcripts{ii});
end
for ii=1:1:n_Transcripts
    fprintf(fidOut3,'z.name{%d}=''%sm'';\n',2*n_Promoters+n_Transcripts+ii,Transcripts{ii});
end
for ii=1:1:n_Inducers
    fprintf(fidOut3,'z.name{%d}=''%s%s'';\n',2*n_Promoters+2*n_Transcripts+ii,Ind_tr{ii},Inducers{ii});
end

fclose(fidOut3);




%% Z STATE VECTOR NAMES
eval(sprintf('name_file4 = ''%s_transcripts_and_promoters.m'';',library.name_of_function))

fidOut4  = fopen(name_file4, 'w');

fprintf(fidOut4,'function [n_Transcripts,n_Promoters]=%s_transcripts_and_promoters\n',library.name_of_function);

fprintf(fidOut4,'\n');

fprintf(fidOut4,'n_Transcripts = %d;\n',n_Transcripts);
fprintf(fidOut4,'n_Promoters = %d;\n',n_Promoters);


SYNBAD_compile(name_file,[library.name_of_function '_odefile_c']);

fclose(fidOut4);