% Run Example 1
% 
% clear all
% clc

disp('SYNBAD_Design_SO(''Example1'')')
pause(5)


SYNBAD_Design_SO('Example1')

disp('Optimization finished. Results of the optimization are stored in RESULTS_DESIGN.mat')
pause(5)


close all

disp('For simulation of the obtained result, you can:')
disp('1. set inputs.simulate.var_circuit in the input script as the obtained optimum vector and run SYNBAD_Simulate(''Example1'')')
disp('2. run Example1, load RESULTS_DESIGN, set inputs.simulate.var_circuit = results.x and run SYNBAD_Simulate(inputs)')
pause(5)

load RESULTS_DESIGN

eval(sprintf('Example1'))

inputs.simulate.var_circuit = results.x;

disp('SYNBAD_Simulate(inputs)')
pause(5)

SYNBAD_Simulate(inputs)