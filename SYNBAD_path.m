function synbaddir = synbad_path
% synbad_path  Simplified version
% Adds all SYNBAD subfolders to the MATLAB path and returns the root path.
% No version check.

    % Get the folder containing this file (SYNBAD root)
    root_path = fileparts(mfilename('fullpath'));

    % Add all subfolders recursively to the MATLAB path
    addpath(genpath(root_path));

    % Return the synbaddir struct for SYNBAD_Startup
    synbaddir.path = root_path;

end
