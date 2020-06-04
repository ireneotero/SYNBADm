function out= SYNBAD_integra(input_file)

eval(sprintf(input_file));

n_real = inputs.model.n_real_var;
n_int = inputs.model.n_integer_var;

idx = inputs.design.idx;
vy = inputs.simulate.var_circuit;

tspan=inputs.simulate.tspan;

eval(sprintf('par = %s;',inputs.model.def_param_function));

x = vy(1:n_real);

y_int=vy(n_real+1:n_real+n_int);
y_bin = vy(n_real+1:end);

switch inputs.model.lib_type
    case 'MA_Library'        
        eval(sprintf('[n_Transcripts,n_Promoters] = %s;',inputs.model.transc_promot_function));
        Y = reshape(y_bin,n_Transcripts,n_Promoters)';        
        eval(sprintf('states= %s(Y);',inputs.model.def_state_function));
    case 'HL_Library'        
        eval(sprintf('states= %s;',inputs.model.def_state_function));
    case 'CN_Library' 
        eval(sprintf('states= %s;',inputs.model.def_state_function));
end

z0=states.z0;

% deterministic simulation

y=[y_int;y_bin];

parstr.y = y;
parstr.x = x;
parstr.k = par.value;
parstr.idx = idx;
parstr.u=inputs.model.u_values;


% disp('start simulation')
% tic
eval(sprintf('odefile_f = @%s;',inputs.model.ode_name));
[t,X] = ode15s(odefile_f,tspan,z0,[],parstr);
% toc
% disp('end simulation')

speciesnames=states.name;

plot(t,X)
legend(speciesnames)
