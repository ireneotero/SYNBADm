function out  =  SYNBAD_Plot_Pareto(input_file, mat_file)

eval(sprintf(input_file));

eval(sprintf('load %s',mat_file));


opstr.idx=inputs.design.idx;

opstr.name_odefile=inputs.model.ode_name;
opstr.n_real=inputs.model.n_real_var ;
opstr.n_int=inputs.model.n_integer_var ;

opstr.def_states = inputs.model.def_state_function;

eval(sprintf('par = %s;',inputs.model.def_param_function));

opstr.par=par;

opstr.ivpsol_rtol = inputs.ivpsol.rtol;                           % [] IVP solver integration tolerances
opstr.ivpsol_atol = inputs.ivpsol.atol;

opstr.D_max=inputs.design.D_max;
opstr.D_min=inputs.design.D_min;

P_ext_1 = inputs.modesign.min_objective_1;   % First Point in the Pareto Front
P_ext_n = inputs.modesign.min_objective_2;   % Last Point in the Pareto Front


upper_bound = linspace(P_ext_1(2),P_ext_n(2), inputs.modesign.econstraint_nint);

stp = upper_bound(2)-upper_bound(1);



OF1 =inputs.modesign.objective1;
OF2 =inputs.modesign.objective2; 

eval(sprintf('states= %s;',opstr.def_states));

count1 = 0;


inputs.optsol.optsolver
switch inputs.optsol.optsolver
    case 'ESS'
        for ii=1:1:size(results,2)
            if results{ii}.fbest ~= Inf
                count1 = count1 + 1;
                eval(sprintf('P(%d,:) = [%s(results{%d}.xbest,opstr), %s(results{%d}.xbest,opstr)]',count1, OF1, ii, OF2, ii));
                
            end
        end
    case 'VNS'
        for ii=1:1:size(results,2)
            if results{ii}.fbest ~= Inf
                count1 = count1 + 1;
                eval(sprintf('P(%d,:) = [%s(results{%d}.xbest,opstr), %s(results{%d}.xbest,opstr)]',count1, OF1, ii, OF2, ii));
                
            end
        end
        
    case 'MITS'        
        for ii=1:1:size(results,2)
            if results{ii}.f ~= Inf
                count1 = count1 + 1;
                eval(sprintf('P(%d,:) =[%s(results{%d}.xbest,opstr), %s(results{%d}.xbest,opstr)]',count1, OF1, ii, OF2, ii));
                
            end
        end
        
   case 'ACO'        
        for ii=1:1:size(results,2)
            if results{ii}.f ~= Inf
                count1 = count1 + 1;
                eval(sprintf('P(%d,:) = [%s(results{%d}.xbest,opstr), %s(results{%d}.xbest,opstr)]',count1, OF1, ii, OF2, ii));
                
            end
        end
end
    figure
for ii=1:1:count1   
    plot(P(ii,1), P(ii,2),'*')
    hold on
end

ax = gca;
    ax.YGrid = 'on';
    ax.XGrid = 'off';
    set(gca,'YTick',fliplr(upper_bound))
    set(gca,'YTickLabel',fliplr(upper_bound))
    
[a, b] = SYNBAD_ord_pareto(P);


 for ii=1:1:max(size(b))
plot(a(ii,1),a(ii,2),'o')
Label_Pareto{ii}=sprintf('Pareto%d',ii);
text(a(ii,1),a(ii,2),Label_Pareto{ii})
 end