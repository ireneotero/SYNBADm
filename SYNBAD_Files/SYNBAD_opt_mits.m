function Results = SYNBAD_opt_mits(obj_fun,x_L,x_U,n_int,n_bin,m,me,options,opstr)

[solution,nfeval_ts,ifail,LM,nLM ] = mits(obj_fun,x_L,x_U,n_int,n_bin,m,me,options,opstr)
 Results = solution;
