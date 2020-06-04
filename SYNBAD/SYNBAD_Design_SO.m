function [results, inputs]= SYNBAD_Design_SO(inputs)


if(ischar(inputs))   
    inputstemp=inputs;
    inputs=[];
    eval(sprintf(inputstemp));
end


inputs.design.type = 'SO';    
switch inputs.optsol.optsolver

    case 'ACO'
        [results, inputs,opstr]= SYNBAD_opt_aco_aux(inputs);

    case 'ESS'
        [results, inputs,opstr]= SYNBAD_opt_ess_aux(inputs);

    case 'MITS'
        [results, inputs,opstr]= SYNBAD_opt_mits_aux(inputs);

    case 'VNS'
        [results, inputs,opstr]= SYNBAD_opt_vns_aux(inputs);
end

save RESULTS_DESIGN results