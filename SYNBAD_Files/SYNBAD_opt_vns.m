function Results = SYNBAD_opt_vns(x_L,x_U,x_0,neq,c_L,c_U,obj_fun,int_var,bin_var,opts,opstr)



problem.x_L = x_L;
problem.x_U = x_U;
problem.x_0 = x_0; % If commented, random initial point
problem.f = obj_fun;
problem.neq = neq;
problem.c_L=c_L;
problem.c_U=c_U;

problem.int_var = int_var
problem.bin_var = bin_var


algorithm = 'VNS';



Results = MEIGO(problem,opts,algorithm,opstr);

