function varargout= SYNBAD_Simulate(inputs)

if(ischar(inputs))   
    inputstemp=inputs;
    inputs=[];
    eval(sprintf(inputstemp));
end

u = inputs.model.u_values;

if size(u,2)>size(u,1)  
    u=u';
end

vy = inputs.simulate.var_circuit;

n_real = inputs.model.n_real_var;  
n_int = inputs.model.n_integer_var;

x = vy(1:n_real);
y_int = vy(n_real+1:n_real+n_int);
y_bin = vy(n_real+n_int+1:end);
y = [y_int;y_bin];


if ~isempty(inputs.design.idx)
    idx = inputs.design.idx;
elseif ~isempty(inputs.design.par_x)
    idx = SYNBAD_parx_to_idx(inputs.design.par_x,inputs.model.def_param_function);
else
    idx=[];
end

eval(sprintf('par = %s;',inputs.model.def_param_function));

k = par.value;

for ii=1:1:size(idx,2)
	 k(idx{ii})=x(ii);
end


switch inputs.model.lib_type
    case 'MA_Library'        
        eval(sprintf('[n_Transcripts,n_Promoters] = %s;',inputs.model.transc_promot_function));
        opstr.n_Transcripts = n_Transcripts;
        opstr.n_Promoters = n_Promoters;
        Y = reshape(y_bin,n_Promoters,n_Transcripts);
        Y = Y';
        eval(sprintf('states= %s(Y);',inputs.model.def_state_function));      
    case 'HL_Library'        
        eval(sprintf('states= %s;',inputs.model.def_state_function));
    case 'CN_Library' 
        eval(sprintf('states= %s;',inputs.model.def_state_function));
end

z0=states.z0;

parstr.y = y;
parstr.k = k;
parstr.u = u;
opstr.u=u;

tspan=inputs.simulate.tspan;


eval(sprintf('odefile_f = @%s;',inputs.model.ode_name));

opstr.name_odefile=inputs.model.ode_name;

if opstr.name_odefile(end)=='c'
  [t,z]=SYNBAD_CVODES(opstr.name_odefile,tspan,z0,parstr,1e-6,1e-6,Inf);
else
  [t,z] = ode15s(odefile_f,tspan,z0,[],parstr);
end


figure(1)
plot(t,z)
legend(states.name)

title('Circuit dynamics')

cont = 0;
for ii=1:1:size(z,2) 
    if any(z(:,ii)>1e-10)
        cont = cont+1;
        state_name{cont}=states.name{ii};
        zz{cont}=z(:,ii);
    end
end

m1 = ceil(cont/2);

figure(2)

for jj=1:1:cont
subplot(m1,2,jj)
     plot(t,zz{jj})
     ylabel(state_name{jj})
     xlabel('t')  
end



opstr.idx = inputs.design.idx;
opstr.par=par;

opstr.n_real=n_real ;
opstr.n_int=n_int;
opstr.D_max=inputs.design.D_max;
opstr.D_min=inputs.design.D_min;
opstr.def_states = inputs.model.def_state_function;

opstr.ivpsol_rtol = inputs.ivpsol.rtol;                           % [] IVP solver integration tolerances
opstr.ivpsol_atol = inputs.ivpsol.atol;

if isfield(inputs.simulate,'objective')
    if iscell(inputs.simulate.objective)
      
        n_obj = max(size(inputs.simulate.objective));
        
            for ii=1:1:n_obj
                varargout{ii}= eval(sprintf('%s(vy,opstr);',inputs.simulate.objective{ii}))
            end
       
    else
        varargout = eval(sprintf('%s(vy,opstr);',inputs.simulate.objective));
        
    end
else
    varargout={};
      
end


figure(3)

eval(sprintf('[n_Transcripts,n_Promoters] = %s;',inputs.model.transc_promot_function));
opstr.n_Transcripts = n_Transcripts;
opstr.n_Promoters = n_Promoters;


for ii=1:1:n_Transcripts+1
   eval(sprintf('Transcript_names{ii}=''t%d'';',n_Transcripts+2-ii));
end

for jj=1:1:n_Promoters+1
   eval(sprintf('Promoter_names{jj}=''P%d'';',jj-1));
end


Y=reshape(y_bin,n_Promoters,n_Transcripts);
Y=Y';


ax(1)=newplot;
set(gcf,'nextplot','add');
set(ax(1),'Xlim',[1,n_Promoters+1],'Ylim',[1,n_Transcripts+1],'XTick',0.5+0:1:n_Promoters+1,'YTick',0.5+0:1:n_Transcripts+1,'XTicklabel',Promoter_names, 'YTicklabel',Transcript_names);
ax(2)=axes('position',get(ax(1),'position'),'Visible', 'off');

imagesc((1:n_Promoters)+0.5,(1:n_Transcripts)+0.5,Y);           
colormap([1 1 1; 1 0 0]);                             


set(ax(2),'Xlim',[1,n_Promoters+1],'Ylim',[1,n_Transcripts+1],'XTick',0:1:n_Promoters+1,'YTick',0:1:n_Transcripts+1,'XTicklabel','','Yticklabel','', 'GridLineStyle','-','XGrid','on','YGrid','on');

title('Circuit superstructure matrix (active pairs in red)')


