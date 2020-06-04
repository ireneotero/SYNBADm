function [f,g] = OF1_Switch(vy,opstr)

% REF: Springer Protocols (example 2)

idx = opstr.idx;
par = opstr.par;

n_real = opstr.n_real;
n_int = opstr.n_int;

x = vy(1:n_real);
y_int = vy(n_real+1:n_real+n_int);
y_bin = vy(n_real+n_int+1:end);
y = [y_int;y_bin];

k = par.value;

for ii=1:1:size(idx,2)
	 k(idx{ii})=x(ii);
end

D_max = opstr.D_max;
D_min = opstr.D_min;

eval(sprintf('states= %s;',opstr.def_states));

z0=states.z0;
parstr.k = k;
parstr.y = y;

tspan = 0:0.1:1000; 
parstr.u(1) = 40;
parstr.u(2) = 0;

ivpopt = odeset('RelTol',opstr.ivpsol_rtol,'AbsTol',opstr.ivpsol_atol);
if opstr.name_odefile(end)=='c'
  [t,z_IPTG]=SYNBAD_CVODES('HLex2_odefile_c',tspan,z0,parstr,opstr.ivpsol_rtol,opstr.ivpsol_atol,Inf);
else
  [t,z_IPTG] = ode45(@HLex2_odefile,tspan,z0,ivpopt,parstr);
end

lacI_IPTG = z_IPTG(end,2);
tetR_IPTG = z_IPTG(end,1);

parstr.u(1) = 0;
parstr.u(2) = 40;

if opstr.name_odefile(end)=='c'
  [t,z_aTc]=SYNBAD_CVODES('HLex2_odefile_c',tspan,z0,parstr,opstr.ivpsol_rtol,opstr.ivpsol_atol,Inf);
else
  [t,z_aTc] = ode45(@HLex2_odefile,tspan,z0,ivpopt,parstr);
end

lacI_aTc = z_aTc(end,2);
tetR_aTc = z_aTc(end,1);

if lacI_IPTG <1e-6
    lacI_IPTG=0;
end
if tetR_IPTG <1e-6
   tetR_IPTG=0;
end
if lacI_aTc <1e-6
   lacI_aTc=0;
end
if tetR_aTc<1e-6
    tetR_aTc=0;  
end


f = -((lacI_aTc - lacI_IPTG)/lacI_aTc + (tetR_IPTG - tetR_aTc)/tetR_IPTG)/2;

%keyboard
if isnan(f)
    f = 1e10;
end

    
g(1) = +D_max - sum(y);   
g(2) = -D_min + sum(y);





       