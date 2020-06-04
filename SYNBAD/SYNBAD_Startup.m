

pwd_synbad=pwd;
addpath(genpath(pwd_synbad))

disp('  ')
disp('  >>>>>>>> SYNBAD has been added to the Matlab path <<<<<<<<')
disp('  ')

fprintf(1,'\n----> Adding paths to current MATLAB session....\n');

SYNBAD_path;

% DETECTS MALTLAB VERSION
matlab_version = ver('matlab');

% DETECTS OPERATING SYSTEM & GENERATES MEX OPTIONS FILES
fprintf(1,'\n----> To use C models run mex -setup and choose a valid compiler. Alternatively use GNUMEX.\n');


switch computer
    
    case {'PCWIN'}
        
        synbad_path;
        my_synbad_path=synbaddir.path;
        setenv('PATH', [getenv('PATH') ';' fullfile(my_synbad_path,'Kernel','libAMIGO','lib_win32','vs')]);
        if  ~isempty(strfind(synbaddir.path,' '))
            fprintf(2,'WARNING:\n\n\t\tYour synbad was installed in the path: %s\n\t\tThe path contains whitespace character, which can lead to errors using  C compilers.\n\t\tWe highly recommend to relocate synbad.\n',matlabroot)
        end

    case 'PCWIN64'
        
        SYNBAD_path;
        my_synbad_path=synbaddir.path;
        setenv('PATH', [getenv('PATH') ';' fullfile(my_synbad_path,'Kernel','libAMIGO','lib_win64')]);
        if  ~isempty(strfind(synbaddir.path,' '))
            fprintf(2,'WARNING:\n\n\t\tYour synbad was installed in the path: %s\n\t\tThe path contains whitespace character, which can lead to errors using  C compilers.\n\t\tWe highly recommend to relocate synbad.\n',matlabroot)
        end

        
    case 'MACI64'
        
        SYNBAD_path;
        my_synbad_path=synbaddir.path;
        setenv('DYLD_LIBRARY_PATH', ['/usr/local/lib:' getenv('DYLD_LIBRARY_PATH')]);
        !export DYLD_LIBRARY_PATH
end


fprintf(1,'\n----> Startup finished....\n');
clear synbaddir  current_dir  fid matlab_version  mexoptsbatpath  path_matlab
clear dll_mex  inputs  mexoptsbatfile  my_synbad_path   toolbox_path
