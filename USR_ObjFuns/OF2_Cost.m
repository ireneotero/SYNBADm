function [f,g] = OF2_Cost(vy,opstr)

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


tspan = 0:1:1000;  % seg
parstr.u(1) = 40;
parstr.u(2) = 0;


ivpopt = odeset('RelTol',opstr.ivpsol_rtol,'AbsTol',opstr.ivpsol_atol);

if opstr.name_odefile(end)=='c'
  [t,z_IPTG]=SYNBAD_CVODES('HLex2_odefile_c',tspan,z0,parstr,opstr.ivpsol_rtol,opstr.ivpsol_atol,Inf);
else
  [t,z_IPTG] = ode45(@HLex2_odefile,tspan,z0,ivpopt,parstr);
end

tetRi = z_IPTG(:,1);
lacIi = z_IPTG(:,2);
cIi = z_IPTG(:,3);
araCi = z_IPTG(:,4);

K_Plac1=k(1);
K_Plac2=k(2);
K_Plambda=k(3);
K_Ptet=k(4);
K_ParaC=k(5);

alpha_tetR=k(6);
alpha_lacI=k(7);
alpha_cI=k(8);
alpha_araC=k(9);

n_Transcripts=4;
n_Promoters=5;

Y=reshape(y,n_Promoters,n_Transcripts);
Y=Y';


ECost_IPTG = +Y(1,1)*alpha_lacI./(1+K_Plac1*lacIi.^4) ...
			+Y(1,2)*alpha_lacI./(1+K_Plac2*lacIi.^4) ...		
			+Y(1,3)*alpha_cI./(1+K_Plambda*cIi.^2) ...
			+Y(1,4)*alpha_tetR./(1+K_Ptet*tetRi.^2) ...
			+Y(1,5)*alpha_araC./(1+K_ParaC*araCi.^2) ...		
            +Y(2,1)*alpha_lacI./(1+K_Plac1*lacIi.^4) ...
			+Y(2,2)*alpha_lacI./(1+K_Plac2*lacIi.^4) ...	
			+Y(2,3)*alpha_cI./(1+K_Plambda*cIi.^2) ...
			+Y(2,4)*alpha_tetR./(1+K_Ptet*tetRi.^2) ...
			+Y(2,5)*alpha_araC./(1+K_ParaC*araCi.^2) ...	
			+Y(3,1)*alpha_lacI./(1+K_Plac1*lacIi.^4) ...
			+Y(3,2)*alpha_lacI./(1+K_Plac2*lacIi.^4) ...		
			+Y(3,3)*alpha_cI./(1+K_Plambda*cIi.^2) ...
			+Y(3,4)*alpha_tetR./(1+K_Ptet*tetRi.^2) ...
			+Y(3,5)*alpha_araC./(1+K_ParaC*araCi.^2) ...		
            +Y(4,1)*alpha_lacI./(1+K_Plac1*lacIi.^4) ...
			+Y(4,2)*alpha_lacI./(1+K_Plac2*lacIi.^4) ...		
			+Y(4,3)*alpha_cI./(1+K_Plambda*cIi.^2) ...
			+Y(4,4)*alpha_tetR./(1+K_Ptet*tetRi.^2) ...
			+Y(4,5)*alpha_tetR./(1+K_ParaC*araCi.^2); 
		
		


parstr.u(1) = 0;
parstr.u(2) = 40;


if opstr.name_odefile(end)=='c' 
  [t,z_aTc]=SYNBAD_CVODES('HLex2_odefile_c',tspan,z0,parstr,1e-7,1e-7,Inf);
else
  [t,z_aTc] = ode45(@HLex2_odefile,tspan,z0,[],parstr);
end

tetRa = z_aTc(:,1);
lacIa = z_aTc(:,2);
cIa = z_aTc(:,3);
araCa = z_aTc(:,4);

ECost_aTc = +Y(1,1)*alpha_lacI./(1+K_Plac1*lacIa.^4) ...
			+Y(1,2)*alpha_lacI./(1+K_Plac2*lacIa.^4) ...		
			+Y(1,3)*alpha_cI./(1+K_Plambda*cIa.^2) ...
			+Y(1,4)*alpha_tetR./(1+K_Ptet*tetRa.^2) ...
			+Y(1,5)*alpha_araC./(1+K_ParaC*araCa.^2) ...		
            +Y(2,1)*alpha_lacI./(1+K_Plac1*lacIa.^4) ...
			+Y(2,2)*alpha_lacI./(1+K_Plac2*lacIa.^4) ...	
			+Y(2,3)*alpha_cI./(1+K_Plambda*cIa.^2) ...
			+Y(2,4)*alpha_tetR./(1+K_Ptet*tetRa.^2) ...
			+Y(2,5)*alpha_araC./(1+K_ParaC*araCa.^2) ...	
			+Y(3,1)*alpha_lacI./(1+K_Plac1*lacIa.^4) ...
			+Y(3,2)*alpha_lacI./(1+K_Plac2*lacIa.^4) ...		
			+Y(3,3)*alpha_cI./(1+K_Plambda*cIa.^2) ...
			+Y(3,4)*alpha_tetR./(1+K_Ptet*tetRa.^2) ...
			+Y(3,5)*alpha_araC./(1+K_ParaC*araCa.^2) ...		
            +Y(4,1)*alpha_lacI./(1+K_Plac1*lacIa.^4) ...
			+Y(4,2)*alpha_lacI./(1+K_Plac2*lacIa.^4) ...		
			+Y(4,3)*alpha_cI./(1+K_Plambda*cIa.^2) ...
			+Y(4,4)*alpha_tetR./(1+K_Ptet*tetRa.^2) ...
			+Y(4,5)*alpha_tetR./(1+K_ParaC*araCa.^2);  
		
Ecost_sum = sum(ECost_IPTG) + sum(ECost_aTc); % Cost Proxy

%ECost_IPTGn = trapz(t, ECost_IPTG); 
%ECost_aTcn =trapz(t, ECost_aTc); 
%Ecost_sum = sum(ECost_IPTGn) + sum(ECost_aTcn); % Cost


f = Ecost_sum;

% discard solutions with positive values of performance 
if OF1_Switch(vy,opstr)>0 || isnan(OF1_Switch(vy,opstr)) || isinf(OF1_Switch(vy,opstr))
    f=1e10;
end


g(1) = +D_max - sum(y);   
g(2) = -D_min + sum(y);       
       