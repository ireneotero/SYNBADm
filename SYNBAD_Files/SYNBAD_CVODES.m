function [tspan,x] = SYNBAD_CVODES(fname,tspan,z0,parstr,atol,rtol,max_step_size)

n_states=length(z0);
if size(parstr.y,2)<size(parstr.y,1)
    parstr.y=parstr.y';
end
     
if size(parstr.k,2)<size(parstr.k,1)
    parstr.k=parstr.k';
end

if ~isfield(parstr,'u')
    parstr.u=[];
end
if size(parstr.u,2)<size(parstr.u,1)
    parstr.u=parstr.u';
end


pars=[parstr.y parstr.u parstr.k];
n_pars=length(pars);

t0=tspan(1);
tf=tspan(end);
t_s=tspan;

n_times=length(tspan);

max_error_test_fails=50;
max_num_steps=1000;
privstruct.n_exp=1;
inputs.ivpsol.nthread=1;
inputs.nlpsol.cvodes_gradient=0;
inputs.nlpsol.mkl_gradient=0;


inputs.model.n_st=n_states;
privstruct.n_obs{1}=0;
inputs.model.n_par=n_pars;
inputs.PEsol.n_theta=0;	
privstruct.n_s{1}=n_times;
inputs.PEsol.n_local_theta_y0{1}=0;
inputs.model.n_stimulus=0;	
privstruct.t_con{1}=2;
privstruct.index_observables{1}=[];

inputs.model.par=pars;
inputs.PEsol.index_global_theta=[];
inputs.PEsol.global_theta_guess=[];
inputs.PEsol.global_theta_min=[];
inputs.PEsol.global_theta_max=[];


privstruct.t_in{1}=t0;
privstruct.t_f{1}=tf;
privstruct.t_int{1}=t_s;

inputs.exps.exp_y0{1}=z0;

inputs.PEsol.index_local_theta_y0{1}=[];
inputs.PEsol.local_theta_y0_guess{1}=[];
inputs.PEsol.local_theta_y0_min{1}=[];
inputs.PEsol.local_theta_y0_max{1}=[];

privstruct.t_con{1}=[t0 tf];

privstruct.u{1}=[];
privstruct.pend{1}=[];

privstruct.exp_data{1}=[];
inputs.exps.Q{1}=[];
privstruct.w_obs{1}=[];		
	
inputs.ivpsol.atol=atol;
inputs.ivpsol.rtol=rtol;
inputs.ivpsol.max_step_size=max_step_size;
inputs.ivpsol.max_num_steps=max_num_steps;
inputs.ivpsol.max_error_test_fails=max_error_test_fails;
inputs.nlpsol.mkl_tol=1e-3;

feval(fname,'sim_CVODES');

x=outputs.simulation{1};

end