% Run Example 3

clear all
clc

disp('SYNBAD_Design_SO(''Example3'')')
pause(5)


SYNBAD_Design_SO('Example3')

disp('Optimization finished. Results of the optimization are stored in RESULTS_DESIGN.mat')
pause(5)


close all

disp('For simulation of the obtained result, you can:')
disp('1. set inputs.simulate.var_circuit in the input script as the obtained optimum vector and run SYNBAD_Simulate(''Example3'')')
disp('2. run Example3, load RESULTS_DESIGN, set inputs.simulate.var_circuit = results.xbest and run SYNBAD_Simulate(inputs)')
pause(5)

load RESULTS_DESIGN

eval(sprintf('Example3'))

inputs.simulate.var_circuit = results.xbest;

disp('SYNBAD_Simulate(inputs)')
pause(5)

SYNBAD_Simulate(inputs)