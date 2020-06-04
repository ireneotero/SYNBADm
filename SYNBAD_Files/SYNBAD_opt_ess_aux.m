function [results, inputs,opstr] = SYNBAD_opt_ess_aux(inputs)


if(ischar(inputs))
    inputstemp=inputs;
    inputs=[];
    eval(sprintf(inputstemp));
end


if inputs.design.type == 'MO';    
    inputs.internal.c_L=[0 0 0];
    inputs.internal.c_U=[Inf Inf Inf]; 
    c_L = inputs.internal.c_L;
    c_U = inputs.internal.c_U;
    opstr.OF_1 = inputs.modesign.objective1;
    opstr.OF_2 = inputs.modesign.objective2;
    opstr.stp=inputs.internal.stp;
    opstr.UB=inputs.internal.UB;
    obj_fun = inputs.internal.objective;
else
    obj_fun = inputs.design.objective;
    c_L = [0 0];
    c_U = [+Inf +Inf];
end

%inputs.internal.neq=0;
neq = 0;

opstr.D_max = inputs.design.D_max;
opstr.D_min = inputs.design.D_min;
%

x_L = inputs.design.var_L;
x_U = inputs.design.var_U;
x_0 = inputs.design.var_0; % If commented, random initial point


int_var = inputs.model.n_integer_var;
bin_var = inputs.model.n_binary_var;

opts.maxtime = inputs.optsol.maxtime;
opts.maxeval = inputs.optsol.maxeval;

opts.local.solver = inputs.optsol.ess.local.solver;



if ~isempty(inputs.design.idx)
    idx = inputs.design.idx;
    
elseif ~isempty(inputs.design.par_x)
    
    idx = SYNBAD_parx_to_idx(inputs.design.par_x,inputs.model.def_param_function);
else
    idx=[];
end

opstr.idx = idx;

opstr.n_real = inputs.model.n_real_var;
opstr.n_int = inputs.model.n_integer_var;

if(strcmp(inputs.model.lib_type,'MA_Library'));
    eval(sprintf('[n_Transcripts,n_Promoters] = %s;',inputs.model.transc_promot_function));
    opstr.n_Transcripts = n_Transcripts;
    opstr.n_Promoters = n_Promoters;
end

opstr.def_states = inputs.model.def_state_function;

eval(sprintf('par = %s;',inputs.model.def_param_function));

opstr.par = par;

opstr.name_odefile=inputs.model.ode_name;

opstr.ivpsol_rtol = inputs.ivpsol.rtol;                           % [] IVP solver integration tolerances
opstr.ivpsol_atol = inputs.ivpsol.atol;

results = SYNBAD_opt_ess(x_L,x_U,x_0,neq,c_L,c_U,obj_fun,int_var,bin_var,opts,opstr);

