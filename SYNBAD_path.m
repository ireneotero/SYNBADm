
synbadversion='SYNBAD';
synbaddir=what(synbadversion);

if(length(synbaddir)<1)
    cprintf('*red','\n\n------> ERROR message\n\n');
    cprintf('red','\t\t synbad_path: The synbad version % could be found.\n\n',synbadversion);
    return;
   
end

if(length(synbaddir)>1)
    cprintf('*red','\n\n------> ERROR message\n\n');
    cprintf('red','\t\t synbad_path: You have multpile synbad_versions in your path, clear you path to avoid problems.\n\n');
    return;
    
end

inputs.pathd.synbad_path=synbaddir.path;