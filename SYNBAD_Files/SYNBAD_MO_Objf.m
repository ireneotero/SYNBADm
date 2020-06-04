function [f,g] = SYNBAD_MO_Objf(vy,opstr)

stp=opstr.stp;
UB =opstr.UB;
D_max=opstr.D_max;
   
OF_1 = opstr.OF_1;
OF_2 = opstr.OF_2;



%constraints
eval(sprintf('g(1) = -%s(vy,opstr) +  UB;',OF_2));
eval(sprintf('g(2) = +%s(vy,opstr) - (UB - stp);',OF_2));
 
g(3) = +D_max - sum(vy);                          % sum(y)<=D_max    

%objective_function_p
eval(sprintf('f = %s(vy,opstr);',OF_1));




