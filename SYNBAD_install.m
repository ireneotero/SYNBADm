function SYNBAD_install ()

SYNBAD_Startup;
SYNBAD_path;
fclose all;
initial_dir=cd;

switch computer

    case 'GLNX86'
        
        matlab_path=matlabroot;
        matlab_lib_path=fullfile(matlabroot,'bin','glnx86');
        AMIGO_libs='lib_linux64';
        
        fprintf(1,'----> If you want to use FORTRAN models in LINUX you need to install g95 compiler.\n');
        fprintf(1,'      Please follow instructions in the AMIGO installation guide.\n');
        
    case  'GLNXA64'

        matlab_path=matlabroot;
        matlab_lib_path=fullfile(matlabroot,'bin','glnxa64');
        AMIGO_libs='lib_linux64';
        
        fprintf(1,'----> If you want to use FORTRAN models in LINUX you need to install g95 compiler.\n');
        fprintf(1,'      Please follow instructions in the AMIGO installation guide.\n');

    case {'MACI64'}
        
        matlab_path= matlabroot;
        matlab_lib_path=fullfile(matlabroot,'bin','maci64');
        AMIGO_libs='lib_linux64';
        
        fprintf(1,'----> IMPORTANT!!!: Please note that under WIN or MAC 64bits FORTRAN models can not be used.\n');
    

    case 'PCWIN'
        
        warning('OS does not need installation');
        return
        
    otherwise

end

cd(fullfile(pwd,'Kernel','libAMIGO','lib_linux64'));
!chmod +x installf2c.sh
!./installf2c.sh

cd ..;


setenv('MATLAB_PATH',matlabroot);
setenv('MATLAB_LIB',matlab_lib_path);

switch computer
    case 'MACI64'
        setenv('CC','/usr/local/bin/gcc');
    otherwise
        setenv('CC','gcc');
end



!make clean
!make libAMIGO.a
!make libmxInterface.a

cd(initial_dir);

end


