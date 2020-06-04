%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE: Find circuit with optimal switch-like behaviour and protein production cost starting from a
% library of 4 transcripts and 8 promoters. Hill Kinetics. 

% REF:  [1] Otero-Muras I and Banga JR 2014, Lecture Notes in Computer Science.
    % similar problem although SWITCH_OF differs from [1]
% Multi - Objective (performance vs protein production cost)
% Constrained 3D problem. 
% Real and Binary variables. 
% Solver: ESS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%================================
% MIXED INTEGER MODEL FRAMEWORK
%================================
inputs.model.lib_type ='HL_Library';  %Choose 'MA_Library'|'HL_Library'|'CN_Library'
inputs.model.ode_name ='HL_odefile_c';
inputs.model.n_integer_var = 0;
inputs.model.n_real_var = 0;
inputs.model.n_binary_var = 32;
inputs.model.def_param_function= 'HL_default_parameters_1';
inputs.model.def_state_function= 'HL_default_states_1';
inputs.model.transc_promot_function= 'HL_transcripts_and_promoters';
inputs.model.u_values=[40;0];

%============================
% DESIGN PROBLEM OPTIONS
%============================S
inputs.design.idx =[];
inputs.design.par_x=[];
inputs.design.var_L = zeros(1,32);
inputs.design.var_U = ones(1,32);
inputs.design.var_0 =  [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];
inputs.design.D_max = 3;  % only applies in MITS, ESS, ACO
inputs.design.D_min = 3;  % only applies in MITS, ESS, ACO


% SINGLE OBJECTIVE 
%============================
inputs.design.objective='OF_Switch';
    
% MULTIPLE OBJECTIVE
%============================
inputs.modesign.objective1 = 'OF_Switch';
inputs.modesign.objective2 = 'OF_Cost';

inputs.modesign.min_objective_1 = [ -0.999999273459281      3.587147803596945e+03];
inputs.modesign.min_objective_2 = [  -0.959449867537731        259.147216801563];

% important!: min_objective_1(2)>min_objective_2(2)

inputs.modesign.econstraint_nint = 7;

%============================
% SIMULATE OPTIONS
%============================ 
inputs.simulate.var_circuit =   [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0]; 
inputs.simulate.tspan = 0:1:1000;
inputs.simulate.objective={'OF_Switch', 'OF_Cost'};

%==================================
% MINLP SOLVER OPTIONS
%==================================
inputs.optsol.optsolver = 'ESS';       % Choose MINLP solver 'ESS'|'MITS'|'ACO'|'VNS'
inputs.optsol.maxtime = 1500;
inputs.optsol.maxeval = [];
inputs.optsol.ess.local.solver = 'misqp';
%==================================
% IVP SOLVER OPTIONS
%==================================
inputs.ivpsol.rtol=1.0D-7;           % [] IVP solver integration tolerances
inputs.ivpsol.atol=1.0D-7;


