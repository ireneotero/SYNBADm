function [results, inputs,opstr] = SYNBAD_opt_aco_aux(inputs)

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
    obj_fun_name = inputs.internal.objective;
else
    obj_fun_name = inputs.design.objective;
    c_L = [0 0];
    c_U = [+Inf +Inf];
end

n_int = inputs.model.n_integer_var;
n_bin = inputs.model.n_binary_var;
n_cont = inputs.model.n_real_var;
me = 0;
m = 2;


opstr.n_real = n_cont;
opstr.n_int = n_int;


opstr.D_max = inputs.design.D_max;
opstr.D_min = inputs.design.D_min;
%

x_L = inputs.design.var_L;
x_U = inputs.design.var_U;
x_0 = inputs.design.var_0; % If commented, random initial point


if ~isempty(inputs.design.idx)
    idx = inputs.design.idx;
    
elseif ~isempty(inputs.design.par_x)
    idx = SYNBAD_parx_to_idx(inputs.design.par_x,inputs.model.def_param_function);
else
    idx=[];
end

opstr.idx = idx;

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


options.acc = 1e-10;        % Restriction tolerance and termination criterion for local solver
options.maxit = 100000000;  % Maxim number iterations 100000000
options.maxun = 100000000;  % Maximum number of consecutive iterations without improvement 100000000
options.maxfun = 1000000;   % Maximum function evaluations 1000000
options.maxtime = inputs.optsol.maxtime;        % Maximum time for solver run (in seconds)
options.startloc = false;   % Start with local solver run (true/false)
options.iprint = 3;
options.iout = 1; % On-screen
options.fex = -Inf;
options.x0 = x_0;
options.convergence_curve = true;
options.pnam = 'SYNBAD';
options.plot2D = true;
options.save_directory= cd;

eval(sprintf('obj_fun = @%s;',obj_fun_name));

problem.objfunc = obj_fun;
problem.ncont =n_cont;
problem.nint=n_int;
problem.nbin=n_bin;
problem.m=m;
problem.me=me;


problem.xl = x_L;
problem.xu = x_U;

options.maxeval = 1000000;  % maximal evaluations (e.g. 1000000)

options.oracle  = -Inf; % oracle parameter for penalty function
options.ants  = 100; % default 1000

options.print   = 2;
options.report  = 0;

options.loc_type     = inputs.optsol.aco.local.solver;
options.loc_start    = 0;
options.loc_solver   = 1;

results = ACO2_1(problem,options,opstr);      
      

