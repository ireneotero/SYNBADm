% Run Example 5

clear all
clc


disp('SYNBAD_Design_MO(''Example5'')')
pause(5)

SYNBAD_Design_MO('Example5')

disp('Optimization finished. Results of the optimization are stored in RESULTS_MO_DESIGN.mat')
pause(5)

close all

disp('Plot the Pareto front (use the obtained results file)')
pause(5)

load RESULTS_MO_DESIGN
disp('SYNBAD_Plot_Pareto(''Example5'',''RESULTS_MO_DESIGN'')')
pause(5)

SYNBAD_Plot_Pareto('Example5','Results_MO_DESIGN')







