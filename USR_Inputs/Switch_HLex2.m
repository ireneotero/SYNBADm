%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXAMPLE 2: Find switch MultiObjective

% REF:  Otero-Muras I and Banga JR 2020, Springer Protocols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%================================
% MIXED INTEGER MODEL FRAMEWORK
%================================
inputs.model.lib_type ='HL_Library';  %Choose 'MA_Library'|'HL_Library'|'CN_Library'
inputs.model.ode_name ='HLex2_odefile_c';
inputs.model.n_integer_var = 0;
inputs.model.n_real_var = 0;
inputs.model.n_binary_var = 20;
inputs.model.def_param_function= 'HLex2_parameters_1';
inputs.model.def_state_function= 'HLex2_default_states';
inputs.model.transc_promot_function= 'HLex2_transcripts_and_promoters';
inputs.model.u_values=[40;0];

%============================
% DESIGN PROBLEM OPTIONS
%============================S
inputs.design.idx =[];
inputs.design.par_x=[];

inputs.design.var_L = zeros(1,20);
inputs.design.var_U = ones(1,20);
inputs.design.var_0 = zeros(1,20);
inputs.design.D_max = 2;  % only applies in MITS, ESS, ACO
inputs.design.D_min = 2;  % only applies in MITS, ESS, ACO


% MULTIPLE OBJECTIVE 
%============================
inputs.modesign.objective1='OF1_Switch';
inputs.modesign.objective2='OF2_Cost';   
% inputs.modesign.min_objective_1=[-0.9989 2517.49]; extreme point 1a
% inputs.modesign.min_objective_1=[-0.9799 2450.49]; extreme point 1b
inputs.modesign.min_objective_1=[-0.97972 2467.09]; 
inputs.modesign.min_objective_2=[-0.7608  1134.89];
inputs.modesign.econstraint_nint = 5;
%============================
% SIMULATE OPTIONS
%============================ 
inputs.simulate.var_circuit =  [1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]; 
inputs.simulate.tspan = 0:1:1000;
inputs.simulate.objective={'OF1_Switch','OF2_Cost'};

%==================================
% MINLP SOLVER OPTIONS
%==================================
inputs.optsol.optsolver='ESS';       % Choose MINLP solver 'ESS'|'MITS'|'ACO'|'VNS'
inputs.optsol.maxtime = 1000;
inputs.optsol.maxeval = [];
inputs.optsol.ess.local.solver = 'misqp';


%==================================
% IVP SOLVER OPTIONS
%==================================
inputs.ivpsol.rtol=1.0D-7;           % [] IVP solver integration tolerances
inputs.ivpsol.atol=1.0D-7;


