
function SYNBAD_Startup
% SYNBAD_Startup - Start up SYNBAD toolbox
% Adds all paths, initializes synbaddir, and prepares environment
% No version check, compatible with simplified synbad_path.m

fprintf('\n  >>>>>>>> SYNBAD has been added to the Matlab path <<<<<<<<\n\n');
fprintf('----> Adding paths to current MATLAB session....\n');

% Ensure SYNBAD root folder is on path
% This allows MATLAB to find synbad_path.m
addpath(genpath(fileparts(mfilename('fullpath'))));

% Get SYNBAD root path from simplified synbad_path function
synbaddir = SYNBAD_path;   % <- captures the returned struct
my_synbad_path = synbaddir.path;

% Detect MATLAB version (optional, keep for info)
matlab_version = ver('matlab');

% Operating system detection and MEX setup hints
fprintf('\n----> To use C models run mex -setup and choose a valid compiler. Alternatively use GNUMEX.\n');

switch computer
    case {'PCWIN'}
        % 32-bit Windows
        setenv('PATH', [getenv('PATH') ';' fullfile(my_synbad_path,'Kernel','libAMIGO','lib_win32','vs')]);

    case 'PCWIN64'
        % 64-bit Windows
        setenv('PATH', [getenv('PATH') ';' fullfile(my_synbad_path,'Kernel','libAMIGO','lib_win64')]);

    case 'MACI64'
        % macOS
        setenv('DYLD_LIBRARY_PATH', ['/usr/local/lib:' getenv('DYLD_LIBRARY_PATH')]);
        !export DYLD_LIBRARY_PATH

    otherwise
        fprintf('Warning: Operating system not explicitly supported by this startup script.\n');
end

fprintf('\n----> Startup finished....\n');

% Clean workspace from temporary variables
clear my_synbad_path matlab_version
end
