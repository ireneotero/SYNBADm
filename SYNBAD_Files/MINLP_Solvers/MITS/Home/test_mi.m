function [  ] = test_mi(irunin,nrunin,maxrepeatin,plot_figin,plot_convin)
%(MI)NLP test programme
%*********************************************************************          
%                                                                               
%      testprogram for mits/misqp using the problems described in init.m:         
% 
%
%      purpose:
%      -------
%
%      the test problems are executed within a loop. a decision is made which
%      of the test runs is considered to be successful, and performance results
%      are evaluated.
%
%
%      output:
%      ------
%
%      three files are generated by the test program, on for individual results
%      (test.dat), same in latex table format (test.tex) and a file with 
%      performance results of the used solver (solver.dat).
%
%      a) test.dat:
%
%
%   IF MAXREPEAT == 1
%
%      typical contants of test.dat without lines generated by the mits routine:
%
% mitp1 2 3 0 1 0 120 -0.10009690d+05 -0.10009690d+05 0.27444189d+04 0.223d-07 0.000d+00 0.2100d+0
% mitp2 0 2 0 4 0  21  0.31000000d+02  0.31000000d+02 0.42500000d+02 0.000d+00 0.000d+00 0.0100d+0
% mitp .......
%
%      the following data are listed:
%
%       1.  mitp     (test problem number)  
%       2.  ncont    (number of cont variables)
%       2.  nint     (number of int variables)
%       3.  nbin     (number of int variables)
%       4.  me       (number of equality constraints)                                        
%       5.  m        (number of constraints)                                        
%       6.  ifail    (convergence criterion)                             
%       7.  nf       (number of objective function evaluations)                     
%       8.  fex      (exact objective function value)
%       9.  f        (computed objective function value)
%      10.  f0       (start objective function value)
%      11.  dfx      (relative error in objective function)                   
%      12.  dgx      (maximum of constraint violations)                                              
%      13.  cpu      (cpu time)                                              
%
%   IF MAXREPEAT > 1
%
%      typical contants of test.dat without lines generated by the mits routine:
%
% mitp1 2 3 0 0 1 2 0 272 264 280 1.000e+000 2.344e-001 3.438e-001
%
%      the following data are listed:
%
%       1.  mitp     (test problem number)  
%       2.  ncont    (number of cont variables)
%       2.  nint     (number of int variables)
%       3.  nbin     (number of int variables)
%       4.  me       (number of equality constraints)                                        
%       5.  m        (number of constraints)                                        
%       6.  repeat   (number of test runs)                             
%       7.  unsucc   (number of unsuccessful runs) 
%               function evaluations (only sucessful runs)
%       8.  mean     (mean number of objective function evaluations)
%       9.  min      (minimum number of objective function evaluations)
%      10.  max      (maximum number of objective function evaluations)
%               cpu time (only successful runs)
%      11.  mean     (mean run time)                   
%      12.  min      (minimum run time)                                              
%      13.  max      (maximum run time)                                              
%
%      b) test.tex:
%
%      same with latex separators
%
%
%      c) solver.dat:
%
%      contains the output of the used solver
%
%
%
%
%      version:
%      -------
%
%      1.0   July 2005
%
%
%      author (c):
%      ----------
%
%      Oliver Exler,
%      IIM - CSIC, 
%      Vigo (Spain)
%
%*********************************************************************    
global irun ncont_global nint_global nbin_global m_global me_global
%
%   set parameters
%
switch nargin
    case 0
        irunin=[];nrunin=[];maxrepeatin=[];plot_figin=[];plot_convin=[];
    case 1
        nrunin=[];maxrepeatin=[];plot_figin=[];plot_convin=[];        
    case 2
        maxrepeatin=[];plot_figin=[];plot_convin=[];        
    case 3
        plot_figin=[];plot_convin=[];        
    case 4
        plot_convin=[];
end
% Oliver 21-04-10
if isempty(irunin)|irunin<1
    irunin=1;
end
if isempty(nrunin)|nrunin>96  
    nrunin=96;  % number of problems in init.m
end
if irunin>nrunin
    irunin=nrunin;  
end
irun=irunin;
nrun=nrunin;
% Oliver 21-04-10
if isempty(maxrepeatin)
    maxrepeatin=1;
end
maxrepeat=maxrepeatin;
if isempty(plot_figin)
    plot_figin=false;
end
plot_fig=plot_figin;
if isempty(plot_convin)
    plot_convin=false;
end
plot_conv=plot_convin;
%
%   open output files      
%
folder = 'results/';
iout1 = fopen([folder 'test.dat'],'w');
iout2 = fopen([folder 'test.tex'],'w');
iout3 = fopen([folder 'solver.dat'],'w');

% On-screen
% iout3=1;
% iout1=1;

if (maxrepeat>1)
    fprintf(iout1,['                                                       '...
        '                      |          fun          |                   cpu\n']);
    fprintf(iout1,['pnam                          ncont nint nbin   me    m'...
        '   repeat   unsucc     mean      min      max        mean         min         max\n']);
    fprintf(iout1,['-------------------------------------------------------'...
        '---------------------------------------------------------------------------------\n']);   
else
    fprintf(iout1,['pnam                         ncont nint nbin   me    m' ...
        ' ifail       nf              fex                f'...
        '               f0        dfx1         dgx         cpu\n']);
    fprintf(iout1,['------------------------------------------------------'...
        '-------------------------------------------------------------------'...
        '-----------------------------------\n']);   
end

%
%   tolerances for evaluating results
%
epssucc=0.001;   
%     ... accuracy to determine successful return      
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set parameters/options here
%
% Print Level: 0,...,3
if maxrepeat==1
    iprint = 3;         
else
    iprint = 0;
end
% Maxim number iterations
maxit = 100000000;    
% Maximum number of consecutive iterations without improvement
maxun = 100000000;
% Maximum function evaluations
maxfun= 1000000;
% Restriction tolerance and termination criterion for local solver
acc   = 1e-7;
% Maximum time for solver run (in seconds)
maxtime = 60*60;
% Start with local solver run (true/false)
loc_start = true;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TEST PROBLEM LOOP
%


current_dir = cd;
figs_dir=[current_dir '\results'];

while (irun <= nrun)
    
    irun 
%
%   prepare initial data
%
    [ pnam,pref,n,m,me,ncont,nint,nbin, ...
    x,xl,xu,xex,fex,g ] = init(irun); 
        
    n = ncont + nint + nbin;
    ncont_global=ncont;
    nint_global=nint;
    nbin_global=nbin;
    m_global=m;
    me_global=me;
    f = fex;
    x0=x;
    
    all_feval=[];
    all_cputime=[];
    no_success=0;  
   
    % Output folder for convergence curves
    [s, mess, messid] = mkdir(figs_dir,pnam);
    current_fig_dir=[figs_dir '\' pnam '\'];
                
    for repeat=1:maxrepeat
        % random start point
        if maxrepeat>1
            clc
            fprintf(1,'run: %d of %d -> problem: %s\n',repeat,maxrepeat,pnam);
            rand('state',repeat)
            [ x ] = random_point( xl,xu,ncont,nint,nbin,n );
        end
        x0=x;

        if irun>=84 & irun<=90
            x0=x0_scp;
            x=x0;
        end

%         if irun>=93 & irun<=95
%             x0=x0_aa;
%             x=x0;
%         end
        
        if (fex == 0.0)
            [f,g]=mi_probs(xex);
            fex = f;
        end
        
        if fex==0
            fex_mits=epssucc;
        else
            fex_mits=fex+epssucc*abs(fex);
        end
%
% ----------------------------------------------------------------------
%   optimization block: call of misqp with reverse communication
%
% Start TABU SEARCH
%       
        if n == 2 & plot_fig
            dim = 2;
            plot_result( dim );  
        end

        % set MITS options
        options.acc=acc;
        options.maxit=maxit;
        options.maxun=maxun;
        options.maxfun=maxfun;
        options.maxtime=maxtime;
        options.startloc=loc_start;
        options.iprint=iprint;
        options.iout=iout3;
        options.fex=fex_mits;
        options.x0=x;
        options.convergence_curve=plot_conv;
        if maxrepeat>1
            options.pnam=['(' int2str(repeat) '_' int2str(maxrepeat) ') ' pnam];
        else
            options.pnam=pnam;
        end
        options.plot2D=plot_figin;
        % If not empty result is saved in this directory
        options.save_directory=current_fig_dir;
%         options.save_directory=[];
        
        initial=cputime; 
        
        [ solution,nfeval_ts,ifail,LM,nLM ] =...
            mits( @mi_probs,xl,xu,nint,nbin,m,me,options );

        cpu_time_run=cputime-initial;
        %%%%%%%%%%%%%%%%%
%         close all
        %%%%%%%%%%%%%%%%%
        
        if ifail>0
            x = solution.x;
            f = solution.f;
            resvio = solution.resvio;
            nf = nfeval_ts;
        else
            x = x0;
            f = inf;
            resvio = inf;
            nf = 0;
        end
            
        
        if irun>=83 & irun<=90
            x0_scp=x;
        end
        
%         if irun>=92 & irun<=94
%             x0_aa=x;
%         end
        
        dfx = f - fex;
        dfx1 = dfx;  
        if (fex ~= 0.0) 
            dfx1=dfx/abs(fex);  
        end
        dgx = resvio;
        
        if (dfx1 < epssucc & dgx < epssucc) 
            all_feval=[all_feval nf];
            all_cputime=[all_cputime cpu_time_run];
        else
            no_success=no_success+1;             
        end           
    %
    %   end of optimization block
    % ----------------------------------------------------------------------
    %
        [ f0,g ] = mi_probs( x0 );
    
        if (maxrepeat==1)
            fprintf(iout1,'%-30s%4d %4d %4d %4d %4d  %4d %8d %16.8e %16.8e %16.8e %11.3e %11.3e %11.3e \n',...
              pnam,ncont,nint,nbin,me,m,ifail,nf,fex,f,f0,dfx1,dgx,cpu_time_run);

            fprintf(iout2,'%-30s & %d & %d & %d & %d & %d & %d & %d & %16.8e & %16.8e & %16.8e & %11.3e & %11.3e & %11.3e \\ \n', ...
                    pnam,ncont,nint,nbin,me,m,ifail,nf,fex,f,f0,dfx1,dgx,cpu_time_run);
        end    
    end
    
    if (maxrepeat>1)
        if isempty(all_feval)
            all_feval=-1;
            all_cputime=-1;
        end
        fprintf(iout1,'%-30s %4d %4d %4d %4d %4d %8d %8d %8d %8d %8d %11.3e %11.3e %11.3e\n',...
        pnam,ncont,nint,nbin,me,m,maxrepeat,no_success,ceil(mean(all_feval)),...
        min(all_feval),max(all_feval),mean(all_cputime),...
        min(all_cputime),max(all_cputime));
    
        fprintf(iout2,'%-30s & %4d & %4d & %4d & %4d & %4d & %8d & %8d & %8d & %8d & %8d & %11.3e & %11.3e & %11.3e\n',...
        pnam,ncont,nint,nbin,me,m,maxrepeat,no_success,ceil(mean(all_feval)),...
        min(all_feval),max(all_feval),mean(all_cputime),...
        min(all_cputime),max(all_cputime));
    end
%                                                                               
%   return to start of while loop                                                                 
%                                                                               
    irun = irun + 1;
    
    %Skip some problems
    if(irun == 53) 
        irun=54;
    end
    if(irun == 57) 
        irun=58;
    end
    if(irun == 79) % skip 79, 80, 81 (old DLL files) - JRB --  **ask Oliver**
        irun=82;
    end

   if(irun == 83) % skip from 83 to 90 - JRB -- **ask Oliver**
        irun=91;
    end
    
    
    if(irun >= 62 & irun<=64) 
        irun=65;
    end

end


if iout1~=1, fclose(iout1); end;
if iout2~=1, fclose(iout2); end;
if iout3~=1, fclose(iout3); end;
%                                                                               
%   end of testprogram                                                          
%                                                                               