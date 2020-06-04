function idx = SYNBAD_parx_to_idx(inputs_design_par_x,function_name)

eval(sprintf('k=%s;',function_name))

for ii=1:1:size(inputs_design_par_x,2)
    if iscell(inputs_design_par_x{ii})
        inputs_design_par_x{ii}
        numel(inputs_design_par_x{ii})
        for jj=1:1:numel(inputs_design_par_x{ii})
            idx{ii}(jj)=find(strcmp(inputs_design_par_x{ii}{jj},k.name));
        end
    else
        idx{ii}=find(strcmp(inputs_design_par_x{ii},k.name));
    end
end


