%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE: Find oscillatory circuit from a library of 4 promoters and 11
% inducers. Mass Action Kinetics.

% REF:  Otero-Muras I and Banga JR 2014, Lecture Notes in Computer Science.

% Single Objective
% Constrained 3D problem
% Binary variables. 
% Solver: ESS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%================================
% MIXED INTEGER MODEL FRAMEWORK
%================================
inputs.model.lib_type ='MA_Library';  %Choose 'MA_Library'|'HL_Library'|'CN_Library'
inputs.model.ode_name ='MA_odefile_c';
inputs.model.n_integer_var = 0;
inputs.model.n_real_var = 0;
inputs.model.n_binary_var = 44;
inputs.model.def_param_function= 'MA_default_parameters_1';
inputs.model.def_state_function= 'MA_default_states';
inputs.model.transc_promot_function = 'MA_transcripts_and_promoters';
inputs.model.u_values = [];

%============================
% DESIGN PROBLEM OPTIONS
%============================
inputs.design.objective = 'OF_Oscil';

inputs.design.idx = [];
inputs.design.par_x = [];

inputs.design.var_L = zeros(1,44);
inputs.design.var_U = ones(1,44);
inputs.design.var_0 = zeros(1,44);

inputs.design.D_max = 3;  % only applies in MITS, ESS, ACO
inputs.design.D_min = 3;  % only applies in MITS, ESS, ACO

%====================================
% SIMULATE OPTIONS
%=====================================
inputs.simulate.var_circuit = [0 0 0 0 0 0 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
inputs.simulate.tspan = 0:10:40000;
inputs.simulate.objective = {'OF_Oscil'};

%==================================
% MINLP SOLVER OPTIONS
%==================================
inputs.optsol.optsolver = 'ESS';       % Choose MINLP solver 'ESS'|'MITS'|'ACO'|'VNS'
inputs.optsol.maxtime = 300;
inputs.optsol.maxeval = [];

%ess options
inputs.optsol.ess.local.solver = 'misqp';


%==================================
% IVP SOLVER OPTIONS
%==================================
inputs.ivpsol.rtol = 1.0D-7;                            % [] IVP solver integration tolerances
inputs.ivpsol.atol = 1.0D-7;

