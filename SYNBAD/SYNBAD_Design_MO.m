function [results, inputs]= SYNBAD_Design_MO(inputs)

if(ischar(inputs))
    inputstemp=inputs;
    inputs=[];
    eval(sprintf(inputstemp));
end

inputs.design.type='MO';
inputs.internal.neq = 0;                 
inputs.internal.c_L = [0 0 0 ];          
inputs.internal.c_U = [Inf Inf Inf];     

P_ext_1 = inputs.modesign.min_objective_1;   % First Point in the Pareto Front
P_ext_n = inputs.modesign.min_objective_2;   % Last Point in the Pareto Front


upper_bound = linspace(ceil(P_ext_1(2)), ceil(P_ext_n(2)), inputs.modesign.econstraint_nint)

stp = upper_bound(1)-upper_bound(2);

inputs.internal.stp =stp;

inputs.internal.objective = 'SYNBAD_MO_Objf';

% tiempo aproximado de computacion

sprintf('Approximate total computation time: %0.2f hours',max(size(upper_bound))*inputs.optsol.maxtime/3600) 

for ii=1:1:max(size(upper_bound))
    
    it1=sprintf('interval %d: %f - %f \n',ii, upper_bound(ii)-stp,upper_bound(ii));
    disp('  ')
    disp('  >>>>>>>> ----------------------------------- <<<<<<<<')
    disp('  ')
    disp(it1);
    
    inputs.internal.UB = upper_bound(ii);
    inputs.internal.LB = upper_bound(ii)-stp;
    
    switch inputs.optsol.optsolver
        case 'ACO'
            [results{ii}, inputs,opstr]= SYNBAD_opt_aco_aux(inputs);
            
        case 'ESS'
            [results{ii}, inputs,opstr]= SYNBAD_opt_ess_aux(inputs);
            
        case 'MITS'
            [results{ii}, inputs,opstr]= SYNBAD_opt_mits_aux(inputs);
            
        case 'VNS'
            [results{ii}, inputs,opstr]= SYNBAD_opt_vns_aux(inputs);
            
    end
    
    
    disp('--------------------------------------------')
    it2=sprintf('interval %d, solution:',ii);
    disp(it2);
    
    
    switch inputs.optsol.optsolver
        case 'ESS'
            fisnan = find(isnan(results{ii}.fbest));
            fisinf = find(isinf(results{ii}.fbest));            
            
            if ~isempty(fisnan) || ~isempty(fisinf)
                disp('no feasible solution found within this interval')
            else
                
                it3=sprintf('fbest=%f\n',results{ii}.fbest);
                disp(it3);
                
                for jj=1:1:max(size(inputs.design.var_L))
                    if jj==1
                        fprintf('dvar_best=[%d\t',results{ii}.xbest(1));
                    elseif jj==max(size(inputs.design.var_L))
                        fprintf('%d]\n',results{ii}.xbest(jj));
                    else
                        fprintf('%d\t',results{ii}.xbest(jj));
                    end
                end
            end
             
        case 'MITS'
            fisnan = find(isnan(results{ii}.f));
            fisinf = find(isinf(results{ii}.f));            
            
            if ~isempty(fisnan) || ~isempty(fisinf)
                disp('no feasible solution found within this interval')
            else
                
                it3=sprintf('fbest=%f\n',results{ii}.f);
                disp(it3);
                
                for jj=1:1:max(size(inputs.design.var_L))
                    if jj==1
                        fprintf('dvar_best=[%d\t',results{ii}.x(1));
                    elseif jj==max(size(inputs.design.var_L))
                        fprintf('%d]\n',results{ii}.x(jj));
                    else
                        fprintf('%d\t',results{ii}.x(jj));
                    end
                end
            end           
      
    end

save RESULTS_MO_DESIGN results
            
end

end


 