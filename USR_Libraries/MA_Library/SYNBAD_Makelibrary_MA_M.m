function output = SYNBAD_makelibrary_MA(input_file)
% SYNBAD_makelibrary_MA('name_of_library_input_file')
% generate odefile for MA kinetics library
% generate default parameter file for MA kinetics library
% generate default state file for MA kinetics library 
% generate default transcripts promoters file for MA kinetics library 

eval(sprintf(input_file));
eval(sprintf('name_file = ''%s_odefile.m'';\n',library.name_of_function))

Promoters = library.promoters;
Transcripts = library.transcripts;
Prom_tf = library.prom_tf;
Inducers = library.inducers;
Ind_tr = library.ind_tr;
n_Promoters = size(Promoters,2);
n_Transcripts = size(Transcripts,2);
n_Inducers = size(Inducers,2);

fidOut   = fopen(name_file, 'w');

fprintf(fidOut,'function dzdt = %s_odefile(t,z,parstr)\n', library.name_of_function);

fprintf(fidOut,'\n');

%Z 
%2 x NPROMS + 2x NTRANS + NINDUCERS

%VARIABLESENTERAS
%NtransxNproms
fprintf(fidOut,'y=parstr.y;\n');

%5*PROMS+3*NTRANS+3*NINDUCERS 
fprintf(fidOut,'k=parstr.k;\n');

%UNINDUCERS
fprintf(fidOut,'u=parstr.u;\n');


fprintf(fidOut,'\n');

fprintf(fidOut,'n_Transcripts=%d;\n',n_Transcripts);
fprintf(fidOut,'n_Promoters=%d;\n',n_Promoters');

fprintf(fidOut,'\n');

fprintf(fidOut,'Y=reshape(y,n_Promoters,n_Transcripts);\n');
fprintf(fidOut,'Y=Y'';\n');
fprintf(fidOut,'\n');

% INPUTS
for ii=1:1:n_Inducers
    fprintf(fidOut,'%s=u(%d);\n', Inducers{ii}, ii);
end

fprintf(fidOut,'\n');

% STATES
for ii=1:1:n_Promoters
    fprintf(fidOut,'%s=z(%d);\n', Promoters{ii}, ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut,'%s%s=z(%d);\n',Promoters{ii},Prom_tf{ii}, n_Promoters+ii);
end
for ii=1:1:n_Transcripts
    fprintf(fidOut,'%s=z(%d);\n',Transcripts{ii},2*n_Promoters+ii);
end
for ii=1:1:n_Transcripts
    fprintf(fidOut,'%sm=z(%d);\n',Transcripts{ii},2*n_Promoters+n_Transcripts+ii);
end
for ii=1:1:n_Inducers
    fprintf(fidOut,'%s%s=z(%d);\n',Ind_tr{ii},Inducers{ii},2*n_Promoters+2*n_Transcripts+ii);
end

fprintf(fidOut,'\n');


% PARAMETERS
for ii=1:1:n_Promoters
    fprintf(fidOut,'kf_pt_%d=k(%d);\n',ii,ii);
end
for ii=1:1:n_Promoters
    fprintf(fidOut,'kb_pt_%d=k(%d);\n',ii,ii+n_Promoters);
end
for ii=1:1:n_Promoters
    fprintf(fidOut,'kdeg_pt_%d=k(%d);\n',ii,ii+2*n_Promoters);
end
for ii=1:1:n_Promoters  
        fprintf(fidOut,'ktransc_%d=k(%d);\n',ii,ii+3*n_Promoters);    
end
for ii=1:1:n_Promoters     
         fprintf(fidOut,'kleak_%d=k(%d);\n',ii,ii+4*n_Promoters);    
end
for jj=1:1:n_Transcripts
    fprintf(fidOut,'ktransl_%d=k(%d);\n',jj,jj+ 5*n_Promoters);
end
for jj=1:1:n_Transcripts
      fprintf(fidOut,'kdeg_m_%d=k(%d);\n',jj,jj+ 5*n_Promoters + n_Transcripts);
end
for jj=1:1:n_Transcripts
    fprintf(fidOut,'kdeg_%d=k(%d);\n',jj,jj+ 5*n_Promoters + 2*n_Transcripts );
end

for kk=1:1:n_Inducers
    fprintf(fidOut,'kf_ind_%d=k(%d);\n',kk,kk +  5*n_Promoters + 3*n_Transcripts);
end

for kk=1:1:n_Inducers
    fprintf(fidOut,'kb_ind_%d=k(%d);\n',kk,kk + 5*n_Promoters + 3*n_Transcripts+ n_Inducers);
end

for kk=1:1:n_Inducers
    fprintf(fidOut,'kdeg_ind_%d=k(%d);\n',kk,kk + 5*n_Promoters + 3*n_Transcripts+ 2*n_Inducers);
end


fprintf(fidOut,'\n');

% REACTIONS
for ii=1:1:n_Promoters
    fprintf(fidOut,'rf_pt(%d)=kf_pt_%d*%s*%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
    fprintf(fidOut,'rb_pt(%d)=kb_pt_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
    fprintf(fidOut,'rdeg_pt(%d)=kdeg_pt_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
end

for ii=1:1:n_Promoters   
        fprintf(fidOut,'rtransc(%d)=ktransc_%d*%s%s;\n',ii,ii,Promoters{ii},Prom_tf{ii});
        fprintf(fidOut,'rleak(%d)=kleak_%d*%s;\n',ii,ii,Promoters{ii});  
end

for jj=1:1:n_Transcripts
    fprintf(fidOut,'rtransl(%d)=ktransl_%d*%sm;\n',jj,jj,Transcripts{jj});
    fprintf(fidOut,'rdeg_m(%d)=kdeg_m_%d*%sm;\n',jj,jj,Transcripts{jj});
    fprintf(fidOut,'rdeg(%d)=kdeg_%d*%s;\n',jj,jj,Transcripts{jj});
end

for kk=1:1:n_Inducers
    fprintf(fidOut,'rf_ind(%d)=kf_ind_%d*%s*%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'rb_ind(%d)=kb_ind_%d*%s%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
    fprintf(fidOut,'rdeg_ind(%d)=kdeg_ind_%d*%s%s;\n',kk,kk,Ind_tr{kk},Inducers{kk});
end

fprintf(fidOut,'\n');

% RHS of ODES
for ii=1:1:n_Promoters
    fprintf(fidOut,'d%s=-max(Y(:,%d))*rf_pt(%d) + max(Y(:,%d))*rb_pt(%d) + max(Y(:,%d))*rdeg_pt(%d);\n',Promoters{ii},ii,ii,ii,ii,ii,ii);  
    fprintf(fidOut,'d%s%s=max(Y(:,%d))*rf_pt(%d) - max(Y(:,%d))*rb_pt(%d) -  max(Y(:,%d))*rdeg_pt(%d);\n',Promoters{ii},Prom_tf{ii},ii,ii,ii,ii,ii,ii);
    
end


for jj=1:1:n_Transcripts
    pt = strcmp(Transcripts{jj},Prom_tf);
    idxp=find(pt>0);
    
    it = strcmp(Transcripts{jj},Ind_tr);
    idxi=find(it>0);
    
    if ~isempty(idxp)&& isempty(idxi)        
        fprintf(fidOut,'d%s=-max(Y(:,%d))*rf_pt(%d) + max(Y(:,%d))*rb_pt(%d)+ max(Y(%d,:))*rtransl(%d) - max(Y(%d,:))*rdeg(%d);\n',Transcripts{jj},idxp,idxp,idxp,idxp,jj,jj,jj,jj);
    elseif ~isempty(idxp)&& ~isempty(idxi)        
         fprintf(fidOut,'d%s=-max(Y(:,%d))*rf_pt(%d) + max(Y(:,%d))*rb_pt(%d)+ max(Y(%d,:))*rtransl(%d) - max(Y(%d,:))*rdeg(%d) - rf_ind(%d) + rb_ind(%d);\n',Transcripts{jj},idxp,idxp,idxp,idxp,jj,jj,jj,jj,idxi,idxi);
    else       
        fprintf(fidOut,'d%s=max(Y(%d,:))*rtransl(%d) - max(Y(%d,:))*rdeg(%d);\n',Transcripts{jj},jj,jj,jj,jj);
    end

    fprintf(fidOut,'d%sm=-max(Y(%d,:))*rdeg_m(%d) ...\n',Transcripts{jj},jj,jj);
    for ii=1:1:n_Promoters-1
        fprintf(fidOut,'\t\t\t+ Y(%d,%d)*rtransc(%d) + Y(%d,%d)*rleak(%d)...\n',jj,ii,ii,jj,ii,ii);
    end
    fprintf(fidOut,'\t\t\t+ Y(%d,%d)*rtransc(%d) + Y(%d,%d)*rleak(%d);\n',jj,n_Promoters,n_Promoters,jj,n_Promoters,n_Promoters);
end


for ii=1:1:n_Inducers
    fprintf(fidOut,'d%s%s= rf_ind(%d) - rb_ind(%d) - rdeg_ind(%d);\n',Ind_tr{ii},Inducers{ii},ii,ii,ii);    
end

fprintf(fidOut,'\n');

fprintf(fidOut,'dzdt=zeros(%d,1);\n',2*n_Promoters+2*n_Transcripts+n_Inducers);

% dzdt
for ii=1:1:n_Promoters
    fprintf(fidOut,'dzdt(%d)=d%s;\n', ii,  Promoters{ii});
end
for ii=1:1:n_Promoters
    fprintf(fidOut,'dzdt(%d)=d%s%s;\n',n_Promoters+ii,Promoters{ii},Prom_tf{ii});
end
for ii=1:1:n_Transcripts
    fprintf(fidOut,'dzdt(%d)=d%s;\n',2*n_Promoters+ii,Transcripts{ii});
end
for ii=1:1:n_Transcripts
    fprintf(fidOut,'dzdt(%d)=d%sm;\n',2*n_Promoters+n_Transcripts+ii,Transcripts{ii});
end
for ii=1:1:n_Inducers
    fprintf(fidOut,'dzdt(%d)=d%s%s;\n',2*n_Promoters+2*n_Transcripts+ii,Ind_tr{ii},Inducers{ii});
end

fclose(fidOut);


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


fclose(fidOut4);