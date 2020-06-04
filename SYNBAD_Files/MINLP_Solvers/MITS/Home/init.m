function [ pnam,pref,n,m,me,ncont,ninteg,nbin, ...
      x0,xl,xu,xex,fex,g ] = init( iprob )
%init startvalues for the test problems
%  Initialization of the parameters
pnam ='';    
pref ='';
fex  =0;
%
%   mitp1
%
      if (iprob==1)
         pnam='mitp1';
         ncont=2;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=1;
         me=0;
         for i=ncont+1:n
            x0(i)=0.0;
            xl(i)=.0;
            xu(i)=1.0;
         end
         x0(1)=-5.0;
         x0(2)=3.0;
         xl(1)=-100.0;
         xl(2)=-150.0;
         xu(1)=6.0;
         xu(2)=10.0;
         x0(3)=5.0;
         x0(4)=-10.0;
         x0(5)=50.0;
         for i=ncont+1:n
            xl(i)=-100.0;
            xu(i)=100.0;
         end
         xex(1) = 0.13299834d+01;
         xex(2) = 10.0;
         xex(3) = 1.0;
         xex(4) = -100.0;
         xex(5) = -1.0;
         fex = -0.10009690d+05;
     end
%
%   mitp2
%
      if (iprob==2) 
% pardalos et al.: handbook of test problems ...
         pnam='mitp2 (qip1)';
         pref='\cite{flou99}';
         ncont=0;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
            xl(i)=-1.0;
            xu(i)=1.0;
            x0(i)=0.0;
         end
         xex(1)=-1.0;
         xex(2)=-1.0;
         xex(3)=-1.0;
         xex(4)=1.0;
         fex = -20.0;
      end
%
%   mitp3
%
      if (iprob==3) 
         pnam='mitp3';
         ncont=2;
         ninteg=0;
         nbin=3;
         n=ninteg+ncont+nbin;
         m=7;
         me=0;
         for i=1:ncont
            x0(i)=0.0;
            xl(i)=-4.0;
            xu(i)=4.0;
         end
         for i=ncont+1:n
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 1.0;
         xex(2) = 1.0;
         xex(3) = 0.0;
         xex(4) = 1.0;
         xex(5) = 0.0;
         fex = 3.5;
     end
%
%   mitp4
%
      if (iprob==4) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 1)
% asaadi:"a computational comparison of some non-linear programs"
%         (function 2) 
% 
         pnam='mitp4 (asaadi 1_1)';
         pref='\cite{asa73}';
         ncont=1;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=5.0;
        end
         xex(1)=2.236;
         xex(2)=0.0;
         xex(3)=1.0;
         xex(4)=0.0;
         fex = -0.40956609d+02;
     end
%
%   mitp5
%
      if (iprob==5) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 1)
% asaadi:"a computational comparison of some non-linear programs"
%         (fun%tion 2) 
% 
         pnam='mitp5 (asaadi 1_2)';
         pref='\cite{asa73}';
         ncont=0;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=5.0;
        end
         xex(1)=0.0;
         xex(2)=1.0;
         xex(3)=2.0;
         xex(4)=0.0;
         fex = -38.0;
     end
%
%   mitp6
%
      if (iprob==6) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 2)
% asaadi:"a computational comparison of some non-linear programs"
%         (function 5) 
% 
         pnam='mitp6 (asaadi 2_1)';
         pref='\cite{asa73}';
         ncont=3;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=5.0;
            x0(i)=2.5;
         end
         for i=ncont+1:n
            x0(i)=3.0;
         end
         xex(1)=-4.64d-4;
         xex(2)=1.132;
         xex(3)=1.463;
         xex(4)=2.0;
         xex(5)=2.0;
         xex(6)=0.0;
         xex(7)=4.0;
         fex = 0.69490268d+03;
     end
%
%   mitp7
%
      if (iprob==7) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 2)
% asaadi:"a computational comparison of some non-linear programs"
%         (function 5) 
% 
         pnam='mitp7 (asaadi 2_2)';
         ncont=0;
         ninteg=7;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=5.0;
        end
         xex(1)=2.0;
         xex(2)=2.0;
         xex(3)=0.0;
         xex(4)=4.0;
         xex(5)=0.0;
         xex(6)=1.0;
         xex(7)=2.0;
         fex = 700.0;
     end
%
%   mitp8
%
      if (iprob==8) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 3)
% asaadi:"a computational comparison of some non-linear programs"
%         (function 6) 
% 
         pnam='mitp8 (asaadi 3_1)';
         pref='\cite{asa73}';
         ncont=4;
         ninteg=6;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=8;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=5.0;
         end
         xex(1)=2.6;
         xex(2)=5.0;
         xex(3)=1.387;
         xex(4)=8.6;
         xex(5)=2.0;
         xex(6)=8.0;
         xex(7)=1.0;
         xex(8)=2.0;
         xex(9)=10.0;
         xex(10)=8.0;
         fex = 0.37219540d+02; 
     end
%
%   mitp9
%
      if (iprob==9) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (asaadi 3)
% asaadi:"a computational comparison of some non-linear programs"
%         (function 6) 
% 
         pnam='mitp9 (asaadi 3_2)';
         pref='\cite{asa73}';
         ncont=0;
         ninteg=10;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=8;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=5.0;
         end
         xex(1)=2.0;
         xex(2)=2.0;
         xex(3)=8.0;
         xex(4)=5.0;
         xex(5)=1.0;
         xex(6)=2.0;
         xex(7)=2.0;
         xex(8)=10.0;
         xex(9)=8.0;
         xex(10)=8.0;
         fex = 43.0;
    end
%
%   mitp10
%
      if (iprob==10) 
        pnam='mitp10 (miqp)';
        pref='';
        ncont=12;
        ninteg=13;
        nbin=0;
        n=ninteg+ncont+nbin;
        m=10;
        me=0;

        scale=1.0d-3;
   
        xu=10*ones(1,n);
        xl=zeros(1,n);
        for i=1:n
           x0(i) = 0.5*(xu(i) + xl(i));
        end
        xex(1)= 7.95696014020093;     
        xex(2)= 4.70171242134266;     
        xex(3)=10.0000000000000;     
        xex(4)= 8.57459800119510;     
        xex(5)= 9.94802753353370;     
        xex(6)= 1.63770690472119;     
        xex(7)= 7.69399201317947;     
        xex(8)= 1.96667940081378;     
        xex(9)= 1.64679422298215;     
        xex(10)= 1.96314988834265;     
        xex(11)= 8.34764654272400;     
        xex(12)= 8.03873077450631;     
        xex(13)=4.0;
        xex(14)=3.0;
        xex(15)=10.0;
        xex(16)=8.0;
        xex(17)=2.0;
        xex(18)=4.0;
        xex(19)=10.0;
        xex(20)=7.0;
        xex(21)=8.0;
        xex(22)=3.0;
        xex(23)=9.0;
        xex(24)=7.0;
        xex(25)=8.0;
        fex =-304723942.920279*scale/1.0d+6;
      end
%
%   mitp11
%
      if (iprob==11) 
         pnam='mitp11 (van de braak 1)';
         pref='\cite{braa01}';
         ncont=4;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         for i=1:n
            xl(i)=-100.0;
            xu(i)=100.0;
            x0(i)=0.0;
         end
         xex(1)=3.0;
         xex(2)=3.0;
         xex(3)=5.0;
         xex(4)=10.0;
         xex(5)=3.0;
         xex(6)=-2.0;
         xex(7)=3.0;
         fex = 1.0;
     end
%
%   mitp12
%
    if (iprob==12) 
         pnam='mitp12 (van de braak 2)';
         pref='\cite{braa01}';
         ncont=4;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
           xl(i)=-100.0;
           xu(i)=100.0;
           xex(i) = 0.0;
         end
         x0(1)=-10.0;
         x0(2)=-20.0;
         x0(3)=35.0;
         x0(4)=50.0;
         x0(5)=-10.0;
         x0(6)=-20.0;
         x0(7)=-20.0;
         fex=-0.27182811d+01;
     end
%
%   mitp13
%
      if (iprob==13) 
         pnam='mitp13 (van de braak 3)';
         pref='\cite{braa01}';
         ncont=4;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
           xl(i)=-100.0;
           xu(i)=100.0;
           xex(i) = 0.0;
         end
         x0(1)=-10.0;
         x0(2)=-20.0;
         x0(3)=35.0;
         x0(4)=50.0;
         x0(5)=-10.0;
         x0(6)=-20.0;
         x0(7)=-20.0;
         xex=[9.999754383217E+000 	-8.001318678556E+001 ...
             -2.456167850809E-003 	-2.038173915352E-003 ...
              0.000000000000E+000 	 1.000000000000E+002 ...
             -1.000000000000E+002];
         fex = -8.98000272E+001;
     end
%
%   mitp14
%
      if (iprob==14) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (2dex)
% cha, mayne(1989):"optimization with discrete variables via recursive
%     quadratic programming: part 2 - algorithms and results"
%     transactions of the asme, journal of mechanisms, transmissions, 
%     and automation in design, vol. 111, 130-136
% 
         pnam='mitp14 (2dex)';
         pref='\cite{%m89}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         x0(1)=10.0;
         xl(1)=0.0;
         xu(1)=20.0;
         x0(2)=12.0;
         xl(2)=12.0;
         xu(2)=20.0;
         xex(1)=16.0;
         xex(2)=19.0;
         fex = -56.9375;
     end
%
%   mitp15
%
     if (iprob==15) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (gtd)
% sandgren, e. (1990):" nonlinear integer and discrete programming in
%          mechanical design optimization. transaction of the asme, 
%          journal of mechanical design, vol. 112, 223-229
%
% mitplib: gear
% macmitp: geartrain 
%
         pnam='mitp15 (gtd)';
         pref='\cite{san90}';
         ncont=0;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=1:n
            x0(i)=60.0;
            xl(i)=12.0;
            xu(i)=60.0;
         end
         xex(1)=43.0;
         xex(2)=19.0;
         xex(3)=16.0;
         xex(4)=49.0;
	     fex = 2.7295e-012 + 1.0;
     end
%
%   mitp16
%
     if (iprob==16) 
%             
%      w. hock, k. schittkowski, 'test examples for nonlinear                    
%      programming codes', lecture notes in economics and mathematical         
%      systems, springer, no, 187, 1981                                           
%      
%      tp83 x1 -> y2, x5 -> x1, x4 -> y1
%
         pnam='mitp16 (tp83)';
         pref='\cite{hs83}';
         ncont=3;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=6;
         me=0;
         x0(1)=27.0;
         x0(2)=33.0;
         x0(3)=27.0;
         x0(4)=27.0;
         x0(5)=78.0;
         xl(5)=78.0;
         xl(2)=33.0;
         xl(3)=27.0;
         xl(4)=27.0;
         xl(1)=27.0;
         xu(5)=102.0;
         xu(2)=45.0;
         xu(3)=45.0;
         xu(4)=45.0;
         xu(1)=45.0;
         xex(1)=36.7758129081;
         xex(2)=33.0;
         xex(3)=30.0;
         xex(4)=45.0;
         xex(5)=78.0;
         fex=-0.306655386717d+05;
    end
%
%   mitp17
%
      if (iprob==17) 
%             
%      westerlund, pörn: "solving pseudo-convex mixed integer
%	 optimization problems by cutting plane techniques"
%	 optimization and engineering, 3, 253-280, 2002
%
         pnam='mitp17 (wp02)';
         pref='\cite{wp02}';
         ncont=1;
         ninteg=1;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         x0(1)=1.0;
         xl(1)=1.0;
         xu(1)=8.0;
         x0(2)=1.0;
         xl(2)=1.0;
         xu(2)=8.0;
         xex(1) = 4.3338;
         xex(2) = 3.0;
         fex = -2.4444;
     end
%
%   mitp18
%  
%	tawarmalani, m, and sahinidis, n, exact algorithms for global optimization
%	of mixed-integer nonlinear programs. in pardalos, p m, and romeijn, e, eds,
%	handbook of global optimization - volume 2: heuristic approaches. 
%   kluwer academic publishers, 2001. 
%
%	gupta, o k, and ravindran, a, branch and bound experiments in convex
%   nonlinear integer programming. management science 13 (1985), 1533-1546.          
%
% mitplib: nvs..
%
      if (iprob==18) 
         pnam='mitp18 (nvs01)';
         pref='\cite{gr85}';
         ncont=1;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=1;
         x0(1)=100.0;
         xl(1)=0.0;
         xu(1)=100.0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1) = 98.6539900000;
         xex(2) =23.0;
         xex(3) = 7.0;
         fex = 12.4696700000;
     end
%
%   mitp19
%
      if (iprob==19) 
	   pnam='mitp19 (nvs02)';
         pref='\cite{gr85}';
         ncont=3;
         ninteg=5;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=3;
         xl(1)=0.0;
         xu(1)=92.0;
         x0(1)=0.0;
         xl(2)=90.0;
         xu(2)=110.0;
         x0(2)=90.0;
         xl(3)=20.0;
         xu(3)=25.0;
         x0(3)=20.0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1) = 91.5993100000;
         xex(2) = 93.5262400000;
         xex(3) = 20.0000000000;
         xex(4) = 0.0;
         xex(5) = 9.0;
         xex(6) = 9.0;
         xex(7) = 130.0;
         xex(8) = 200.0;
         fex = 5.96418500000;
     end
%
%   mitp20
%
      if (iprob==20) 
	   pnam='mitp20 (nvs03)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1) = 4.0;
         xex(2) =2.0;
         fex = 16.0;
     end
%
%   mitp21
%
      if (iprob==21) 
         pnam='mitp21 (nvs04)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=ncont+1:n
            xl(i)=1.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1) = 1.0;
         xex(2) = 2.0;
         fex = 0.72; 
     end
%
%   mitp22
%
      if (iprob==22) 
%
% o.a. gupta, a. ravindran: branch and bound experiments in convex nonlinear
% integer programming, management science, 1533-1546, 31, 1985.
%
         pnam='mitp22 (nvs05)';
         pref='\cite{gr85}';
         ncont=6;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=9;
         me=4;
         for i=1:n
            x0(i) = 1.0;
            xl(i) = 0.0;
            xu(i) = 20000.0;
         end
         xu(1) = 200.0;
         xu(2) = 200.0;
         xu(7) = 200.0;
         xu(8) = 200.0;
         xl(1) = 0.1;
         xl(2) = 0.1;
         xl(7) = 1.0;
         xl(8) = 1.0; 
         x0(5) = 2.0;

         xl(5) = 0.000001;
         
         xex(1) = 0.680952;
         xex(2) = 2.793885;
         xex(3) = 2230.37;
         xex(4) = 12467.63;
         xex(5) = 3.165399;
         xex(6) = 0.4413163;
         xex(7) = 5.0;
         xex(8) = 1.0;
         fex = 5.470934;
     end
%
%   mitp23
%
      if (iprob==23) 
         pnam='mitp23 (nvs06)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=ncont+1:n
            xl(i)=1.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1) = 2.0;
         xex(2) = 2.0;
         fex = 1.770312;
     end
%
%   mitp24
%
      if (iprob==24) 
         pnam='mitp24 (nvs07)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         x0(1)=1.0;
         x0(2)=1.0;
         x0(3)=1.0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
         end
         xex(1) =4.0;
         xex(2) =0.0;
         xex(3) =0.0;
         fex = 4.0;
     end
%
%   mitp25
%
      if (iprob==25) 
         pnam='mitp25 (nvs08)';
         pref='\cite{gr85}';
         ncont=1;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         xl(1)=0.001;
	     xu(1)=200.0;
         x0(1)=1.0;
         x0(2)=1.0;
         x0(3)=1.0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
         end
         xex(1) = 0.6313850;
         xex(2) =4.0;
         xex(3) =3.0;
         fex = 23.4497300000; 
     end
%
%   mitp26
%
      if (iprob==26) 
         pnam='mitp26 (nvs09)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=10;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=1:n
            xl(i)=3.0;
            xu(i)=9.0;
            x0(i)=5.0;
	        xex(i)=9.0;
         end
         fex = -43.1343400000; 
     end
%
%   mitp27
%
     if (iprob==27) 
         pnam='mitp27 (nvs10)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1)=2.0;
         xex(2)=7.0;
         fex = -310.800000000;
     end
%
%   mitp28
%
      if (iprob==28) 
         pnam='mitp28 (nvs11)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=7.0;
         xex(3)=3.0;
         fex = -431.000000000;
     end
%
%   mitp29
%
      if (iprob==29) 
         pnam='mitp29 (nvs12)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=7.0;
         xex(3)=3.0;
         xex(4)=2.0;
         fex = -481.2;
     end
%
%   mitp30
%
      if (iprob==30) 
         pnam='mitp30 (nvs13)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=5;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=5;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=6.0;
         xex(3)=3.0;
         xex(4)=2.0;
         xex(5)=8.0;
         fex = -585.20;
     end
%
%   mitp31
%
%  multiple solutions
%
      if (iprob==31) 
         pnam='mitp31 (nvs14)';
         pref='\cite{gr85}';
         ncont=3;
         ninteg=5;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=3;
         xl(1)=0.0;
         xu(1)=92.0;
         x0(1)=46.0;
         xl(2)=90.0;
         xu(2)=110.0;
         x0(2)=100.0;
         xl(3)=20.0;
         xu(3)=25.0;
         x0(3)=23.0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1)=91.59931;
         xex(2)=93.52624;
         xex(3)=20.0;
         xex(4)=0.0;
         xex(5)=9.0;
         xex(6)=9.0;
         xex(7)=130.0;
         xex(8)=200.0;
         fex = -40358.15;
     end
%
%   mitp32
%
      if (iprob==32) 
         pnam='mitp32 (nvs15)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=1;
         me=0;
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1)=2.0;
         xex(2)=0.0;
         xex(3)=0.0;  
         fex = 1.0;
     end
%
%   mitp33
%
      if (iprob==33) 
         pnam='mitp33 (nvs16)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end        
         xex(1)=2.0;
         xex(2)=0.0;
         fex = 0.703125000000;    
     end
%
%   mitp34
%
      if (iprob==34) 
         pnam='mitp34 (nvs17)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=7;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=7;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=6.0;
         xex(3)=3.0;
         xex(4)=2.0;
         xex(5)=8.0;
         xex(6)=6.0;
         xex(7)=7.0;
         fex = -1100.4;
     end
%
%   mitp35
%
      if (iprob==35) 
         pnam='mitp35 (nvs18)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=6;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=6;
         me=0;
         for i=1:n
            xl(i)=1.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=6.0;
         xex(3)=3.0;
         xex(4)=2.0;
         xex(5)=8.0;
         xex(6)=6.0;
         fex = -778.4;
     end
%
%   mitp36
%
      if (iprob==36) 
         pnam='mitp36 (nvs19)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=8;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=8;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=2.0;
         xex(2)=6.0;
         xex(3)=3.0;
         xex(4)=2.0;
         xex(5)=8.0;
         xex(6)=5.0;
         xex(7)=7.0;
         xex(8)=1.0;
         fex = -1098.4;
     end
%
%   mitp37
%
      if (iprob==37) 
         pnam='mitp37 (nvs20)';
         pref='\cite{gr85}';
         ncont=11;
         ninteg=5;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=8;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xex(1)=0.8184511;
         xex(2)=0.9514563;
         xex(3)=18.612250;
         xex(4)=1.6757960;
         xex(5)=1.128835;
         xex(6)=11.01262;
         xex(7)=0.0;
         xex(8)=1.0510940;
         xex(9)=0.0;
         xex(10)=0.4076554;
         xex(11)=0.0;
         xex(12)=1.0;
         xex(13)=0.0;
         xex(14)=0.0;
         xex(15)=1.0;
         xex(16)=1.0;
         fex = 230.9222;
         
         % better solution
        xex(1)=8.885596818528E-001;
  	    xex(2)=6.789360153732E-001;
	    xex(3)=0.0;
	    xex(4)=1.850786113151E+000;
	    xex(5)=1.968511877010E-001; 
	    xex(6)=0.0;
	    xex(7)=0.0;
	    xex(8)=0.0;
	    xex(9)=8.556094312741E-001;
	    xex(10)=7.758746635154E-001;
	    xex(11)=2.993040958337E-001;
	    xex(12)=1.0;
	    xex(13)=0.0;
	    xex(14)=0.0;
	    xex(15)=1.0;
	    xex(16)=0.0;                    
        fex = 1.95310251e+002;  %  resvio von 1E-7!!!
     end    
%           
%   mitp38  
%           
      if (iprob==38) 
         pnam='mitp38 (nvs21)';
         pref='\cite{gr85}';
         ncont=1;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=2;
         me=0;
         for i=1:n
            xl(i)=1.0;
            xu(i)=200.0;
            x0(i)=1.0;
         end
         xl(1)=0.0;
         xu(1)=0.2;
         x0(1)=0.1;
         xex(1)=0.13646330;
         xex(2)=15.0;
         xex(3)=3.0;
         fex = -5.684783;
     end
%
%   mitp39
%
      if (iprob==39)
         pnam='mitp39 (nvs22)';
         pref='\cite{gr85}';
         ncont=4;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=9;
         me=4;
         for i=1:n
            xl(i)=0.0;
            xu(i)=20000.0;
            x0(i)=1.0;
         end
         
         xl(3)=0.1d-12;    % oterwise division by zero possible
                
         xl(5) = 1.0;
         xl(6) = 1.0;
         xl(7) = 1.0;
         xl(8) = 1.0;
         x0(5) = 2.0;
         x0(6) = 2.0;
         x0(7) = 2.0;
         x0(8) = 2.0;
         xu(5) = 200.0;
         xu(6) = 200.0;
         xu(7) = 20.0;
         xu(8) = 20.0;
         xex(1)=2121.6410;
         xex(2)=10782.670;
         xex(3)=3.162278;
         xex(4)=0.31615290;
         xex(5)=5.0;
         xex(6)=1.0;
         xex(7)=4.0;
         xex(8)=2.0;
         fex = 6.05822;
     end
%
%   mitp40
%
      if (iprob==40) 
         pnam='mitp40 (nvs23)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=9;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=9;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1)=2.0;
         xex(2)=6.0;
         xex(3)=3.0;
         xex(4)=2.0;
         xex(5)=8.0;
         xex(6)=5.0;
         xex(7)=7.0;
         xex(8)=1.0;
         xex(9)=2.0;
         fex = -1125.20;
     end
%
%   mitp41
%
      if (iprob==41) 
         pnam='mitp41 (nvs24)';
         pref='\cite{gr85}';
         ncont=0;
         ninteg=10;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=10;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=200.0;
            x0(i)=100.0;
         end
         xex(1)=2.0;
         xex(2)=5.0;
         xex(3)=4.0;
         xex(4)=2.0;
         xex(5)=8.0;
         xex(6)=6.0;
         xex(7)=6.0;
         xex(8)=1.0;
         xex(9)=2.0;
         xex(10)=2.0;
         fex = -1033.2;
     end
%
%   mitp42
%
      if (iprob==42) 
         pnam='mitp42 (gear)';
         pref='';
         ncont=4;
         ninteg=4;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=4;
         for i=1:n
            xl(i)=12.0;
            xu(i)=60.0;
            x0(i)=36.0;
         end
         xex(1)=16.0;
         xex(2)=19.0;
         xex(3)=43.0;
         xex(4)=49.0;
         xex(5)=16.0;
         xex(6)=19.0;
         xex(7)=43.0;
         xex(8)=49.0;
         fex = 1.0;
      end
%
%   mitp43
%
      if (iprob==43) 
         pnam='mitp43 (windfac)';
         ncont=11;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=13;
         me=13;
         for i=1:n
            xl(i)=-100.0;
            xu(i)=100.0;
            x0(i)=1.0;
         end
         x0(1) = 1.5;
         x0(2) = 1.0;
         x0(12) = 1.0;  
         x0(13) = 15.0;  
         x0(14) = 3.0; 
         xl(12)=1.0;
         xl(13)=1.0;
         xl(14)=1.0;
         xu(12)=10.0;
         xu(13)=100.0;
         xu(14)=100.0;
         
         xl(11)=0.8;
         xex(1)=0.52359880;
         xex(2)=6.0;
         xex(3)=0.96592580;
         xex(4)=0.70710680;
         xex(5)=0.2588190;
         xex(6)=0.96592580;
         xex(7)=-0.70710680;
         xex(8)= 0.2588190;
         xex(9)= -0.5;
         xex(10)= 0.669873e-01;
         xex(11)= 0.9330127;
         xex(12)= 2.0;
         xex(13)= 24.0;
         xex(14)= 5.0;
         fex = 0.2544873;
     end
%
%   mitp44
%
      if (iprob==44)
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (tp1)
% duran,grossmann:"an outer-approximation algorithm for a class of
%         mixed-integer nonlinear programs" (tp1)  
%
% mitplib: synthes1 
% macmitp: synthes1
%
         pnam='mitp44 (duran_grossmann 1)';
         pref='\cite{dg86}';
         ncont=3;
         ninteg=0;
         nbin=3;
         n=ninteg+ncont+nbin;
         m=6;
         me=0;
         for i=1:ncont
            x0(i)=0.5;
            xl(i)=0.0;
            xu(i)=2.0;
         end
         xu(3)=1.0;
         for i=ncont+1:n
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.13009659d+01;
         xex(2) = 0.0;
         xex(3) = 1.0;
         xex(4) = 0.0;
         xex(5) = 1.0;
         xex(6) = 0.0;
         fex = 6.00974173126459;
%          x0=[8.078398E-001   2.560668E-001   8.992559E-001   1   0   0];

    end
%
%   mitp45
%
      if (iprob==45) 
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (tp2)
% duran,grossmann:"an outer-approximation algorithm for a %lass of
%         mixed-integer nonlinear programs" (tp2)  
%
% mitplib: synthes2 
% macmitp: synthes2
%
         pnam='mitp45 (duran_grossmann 2)';
         pref='\cite{dg86}';
         ncont=6;
         ninteg=0;
         nbin=5;
         n=ninteg+ncont+nbin;
         m=14;
         me=1;
         for i=1:ncont
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=2.0;
         end
         xu(4) = 1.0d+1;
         xu(5) = 1.0d+1;
         xu(6) = 3.0;
         for i=ncont+1:n
            x0(i)=0.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.0;
         xex(2) = 2.0;
         xex(3) = 1.07839;
         xex(4) = 0.652;
         xex(5) = 0.326;
         xex(6) = 1.07839; 
         xex(7) = 0.0;
         xex(8) = 1.0;
         xex(9) = 1.0;
         xex(10) = 1.0;
         xex(11) = 0.0;
         fex = 0.73035665d+02;
     end
%
%   mitp46
%
      if (iprob==46)
%
% leyffer:"deterministic methods for mixed integer nonlinear programming" 
%         (tp3)
% duran,grossmann:"an outer-approximation algorithm for a %lass of
%         mixed-integer nonlinear programs" (tp3)  
% 
% mitplib: synthes3 
% macmitp: synthes3
%
         pnam='mitp46 (duran_grossmann 3)';
         pref='\cite{dg86}';
         ncont=9;
         ninteg=0;
         nbin=8;
         n=ninteg+ncont+nbin;
         m=23;
         me=2;
         for i=1:ncont
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=2.0;
         end
         xu(3) = 1.0;
         xu(8) = 1.0;
         xu(9) = 3.0;
         for i=ncont+1:n
            x0(i)=0.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.0;
         xex(2) = 2.0;
         xex(3) = 0.468;
         xex(4) = 0.585;
         xex(5) = 2.0;
         xex(6) = 0.0;
         xex(7) = 0.0;
         xex(8) = 0.267;
         xex(9) = 0.585;
         xex(10) = 0.0;
         xex(11) = 1.0;
         xex(12) = 0.0;
         xex(13) = 1.0;
         xex(14) = 0.0;
         xex(15) = 1.0;
         xex(16) = 0.0;
         xex(17) = 1.0;
         fex = 68.01;
     end
%
%   mitp47
%
      if (iprob==47) 
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp1)
% kocis,grossmann:"global optimization of nonconves mixed-integer nonlinear 
%     programming (mitp) problems in process synthesis"
%
% mitplib: ex1221 
%
         pnam='mitp47 (floudas 1)';
         pref='\cite{flou99}';
         ncont=2;
         ninteg=0;
         nbin=3;
         n=ninteg+ncont+nbin;
         m=5;
         me=2;
         for i=1:ncont
            x0(i)=1.0;
            xl(i)=0.0001;
            xu(i)=1.0d+7;
         end
         for i=ncont+1:n
            x0(i)=0.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.11180340d+01;
         xex(2) = 0.13103707d+01;
         xex(3) = 0.0;
         xex(4) = 1.0;
         xex(5) = 1.0;
         fex = 0.76671801d+01;
     end
%
%   mitp48
%
    if (iprob==48) 
%
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp2)
% floudas:"nonlinear and mixed-intger optimization" s.172
%
% mitplib: ex1222 
%
         pnam='mitp48 (floudas 2)';
         pref='\cite{flou99}';
         ncont=2;
         ninteg=0;
         nbin=1;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         x0(1)=0.2;
         xl(1)=0.2;
         xu(1)=1.0;
         x0(2)=-1.5;
         xl(2)=-2.22554;
         xu(2)=-1.0;
         for i=ncont+1:n
            x0(i)=0.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.94194;
         xex(2) = -2.1;
         xex(3) = 1.0;
         fex = 0.107654d+01;
     end
%
%   mitp49
%
      if (iprob==49) 
%
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp3)
% yuan:"a mixed-integer nonlinear-programming method for process design."
%
% mitplib: ex1223 
%
         pnam='mitp49 (floudas 3)';
         pref='\cite{flou99}';
         ncont=3;
         ninteg=0;
         nbin=4;
         n=ninteg+ncont+nbin;
         m=9;
         me=0;
         for i=1:ncont
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0d+7;
         end
         for i=ncont+1:n
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         xex(1) = 0.2;
         xex(2) = 0.8;
         xex(3) = 0.19078784d+01;
         xex(4) = 1.0;
         xex(5) = 1.0;
         xex(6) = 0.0;
         xex(7) = 1.0;
         fex = 0.45795825d+01;
     end
%
%   mitp50
%
      if (iprob==50) 
%
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp4)
% berman,ashrafi: "optimization models for reliability of modular software systems."
%
% mitplib: ex1224 und st_e29
%
         pnam='mitp50 (floudas 4)';
         pref='\cite{flou99}';
         ncont=3;
%          ncont=0;
         ninteg=0;
         nbin=8;
         n=ninteg+ncont+nbin;
         m=7;
         me=3;
         for i=1:ncont
            x0(i)=0.5;
            xl(i)=0.0;
            xu(i)=0.999;
         end
         for i=ncont+1:n
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
        
         xex(1) = 0.97;
         xex(2) = 0.9925;
         xex(3) = 0.9988;
         xex(4) = 0.0;
         xex(5) = 1.0;
         xex(6) = 1.0;
         xex(7) = 1.0;
         xex(8) = 0.0;
         xex(9) = 1.0;
         xex(10) = 1.0;
         xex(11) = 0.0;         
         fex = -0.96156973;         
     end
%
%   mitp51
%
      if (iprob==51) 
%
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp5)
% 
% poern,westerlund:"convexification of different classes of non-convex mitp problems."
% computers and chemical engineering 23 (1999), 439-448.
%
% mitplib: ex1225 aehnlich
%
         pnam='mitp51 (floudas 5)';
         pref='\cite{flou99}';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         for i=1:n
            x0(i)=3.0;
            xl(i)=1.0;
            xu(i)=5.0;
         end
         xex(1) = 3.0;
         xex(2) = 1.0;
         fex = 31.0;
     end
%
%   mitp52
%
      if (iprob==52) 
%
% adjiman,floudas:"global optimization of mixed-integer nonlinear problems"
%                 (tp6)
% poern,westerlund:"convexification of different classes of non-convex mitp problems."
% computers and chemical engineering 23 (1999), 439-448.
%
% mitplib: ex1226 aehnlich
%
         pnam='mitp52 (floudas 6)';
         pref='\cite{flou99}';
         ncont=1;
         ninteg=1;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=3;
         me=0;
         x0(1)=5.0;
         xl(1)=1.0;
         xu(1)=10.0;
         x0(2)=3.0;
         xl(2)=1.0;
         xu(2)=6.0;
         xex(1) = 4.0;
         xex(2) = 1.0;
         fex = -17.0;
     end
%
%   mitp53
%
      if (iprob==53) 
%
% mitplib: 4stufen
%
         pnam='mitp53 (4 stufen)';
         ncont=102;
         ninteg=0;
         nbin=48;
         n=ninteg+ncont+nbin;
         m=98;
         me=94;
         for i=1:ncont
            x0(i)=10.0;
            xl(i)=-1.0d+15;
            xu(i)=1.0d+15;
         end
         for i=ncont+1:n
            x0(i)=1.0;
            xl(i)=0.0;
            xu(i)=1.0;
         end
         for i=1:n
            xex(i)=0.0;
         end
         xl(2)=0.0;
         xl(8)=0.0;
         xl(9)=0.0;
         xl(10)=0.0;
         xl(11)=0.0;
         xl(20)=0.0;
         xl(21)=0.0;
         xl(22)=0.0;
         xl(23)=0.0;
         xl(24)=0.0;
         xl(25)=0.0;
         xl(26)=0.0;
         xl(27)=0.0;
         xl(76)=0.0;
         xl(77)=0.0;
         xl(78)=0.0;
         xl(79)=0.0;
         xl(80)=0.0;
         xl(81)=0.0;
         xl(82)=0.0;
         xl(83)=0.0;
         xl(84)=0.0;
         xl(85)=0.0;
         xl(86)=0.0;
         xl(87)=0.0;
         xl(88)=0.0;
         xl(89)=0.0;
         xl(90)=0.0;
         xl(91)=0.0;
         xl(92)=0.0;
         xl(93)=0.0;
         xl(94)=0.0;
         xl(95)=0.0;
         xl(97)=0.0;
         xl(98)=0.0;
         xl(99)=0.0;
         xl(100)=0.0;
         xl(101)=0.0;
         xl(102)=0.0;
         
         xl(1)= 10.0; 
         xl(3)= 1.0;  
         xl(4) = 1.0;  
         xl(5)= 2.0;  
         xl(6) = 1.0;  
         xl(7) = 0.1675; 
         xl(12) = 5.0;  
         xl(13) = 5.0;  
         xl(14) = 5.0;  
         xl(15) = 5.0;  
         xl(16) = 1.0;  
         xl(17) = 1.0;  
         xl(18) = 1.0;  
         xl(19) = 1.0;  
         xl(28) = 0.001; 
         xl(29) = 0.001; 
         xl(30) = 0.001; 
         xl(31) = 0.001; 
         xl(32) = 1.0;  
         xl(33) = 1.0;  
         xl(34) = 1.0;  
         xl(35) = 1.0;  
         xl(36) = 1.0;  
         xl(37) = 1.0;  
         xl(38) = 1.0;  
         xl(39) = 1.0;  
         xl(40) = 1.0;  
         xl(41) = 1.0;  
         xl(42) = 1.0;  
         xl(43) = 1.0;  
         xl(44) = 0.01; 
         xl(45) = 0.01; 
         xl(46) = 0.01; 
         xl(47) = 0.01; 
         xl(48) = 2.0; 
         xu(48) = 6.0;  
         xl(49) = 2.0; 
         xu(49) = 6.0;  
         xl(50) = 2.0; 
         xu(50) = 6.0;  
         xl(51) = 2.0; 
         xu(51) = 6.0;  
         xl(52) = 1.26;
         xu(52) = 6.0;  
         xl(53) = 1.26;
         xu(53) = 6.0;  
         xl(54) = 1.26;
         xu(54) = 6.0;  
         xl(55) = 1.26;
         xu(55) = 6.0;  
         xl(56) = 1.13e-5; 
         xl(57) = 1.13e-5; 
         xl(58) = 1.13e-5; 
         xl(59) = 1.13e-5; 
         xl(60) = 2.9e-7; 
         xl(61) = 2.9e-7; 
         xl(62) = 2.9e-7; 
         xl(63) = 2.9e-7; 
         xl(64) = 3.0e-7; 
         xl(65) = 3.0e-7; 
         xl(66) = 3.0e-7; 
         xl(67) = 3.0e-7; 
         xl(68) = 3.0e-7; 
         xl(69) = 3.0e-7; 
         xl(70) = 3.0e-7; 
         xl(71) = 3.0e-7; 
         xl(72) = 0.05; 
         xl(73) = 0.05; 
         xl(74) = 0.05; 
         xl(75) = 0.05; 
  
         x0(1) = 36.344; 
         x0(2) = 1763.656; 
         x0(3) = 3.042; 
         x0(4) = 10.808; 
         x0(5) = 216.161; 
         x0(6) = 1.225; 
         x0(7) = 2.542; 
         x0(8) = 1800.0; 
         x0(9) = 241.731; 
         x0(10) = 158.011; 
         x0(11) = 88.847;
         x0(12) = 10.0; 
         x0(13) = 18.176; 
         x0(14) = 26.048; 
         x0(15) = 43.416; 
         x0(16) = 241.731; 
         x0(17) = 158.011; 
         x0(18) = 88.847; 
         x0(19) = 36.344; 
         x0(20) = 18.176; 
         x0(21) = 26.048; 
         x0(22) = 43.416; 
         x0(23) = 100.0; 
         x0(24) = 1558.269; 
         x0(25) = 83.72; 
         x0(26) = 69.163; 
         x0(27) = 52.503; 
         x0(28) = 2.956; 
         x0(29) = 3.317; 
         x0(30) = 3.737; 
         x0(31) = 4.248; 
         x0(32) = 176.503; 
         x0(33) = 10.861; 
         x0(34) = 11.542; 
         x0(35) = 17.256; 
         x0(36) = 17.256; 
         x0(37) = 17.256; 
         x0(38) = 17.256; 
         x0(39) = 17.256; 
         x0(40) = 176.572; 
         x0(41) = 154.169; 
         x0(42) = 119.85; 
         x0(43) = 60.852; 
         x0(44) = 147.804; 
         x0(45) = 165.863; 
         x0(46) = 186.858; 
         x0(47) = 212.397; 
         x0(48) = 4.0; 
         x0(49) = 4.0; 
         x0(50) = 4.0;  
         x0(51) = 4.0;  
         x0(52) = 3.0; 
         x0(53) = 3.0; 
         x0(54) = 3.0; 
         x0(55) = 3.0; 
         x0(56) = 2.1769d-5; 
         x0(57) = 2.1769d-5; 
         x0(58) = 2.1769d-5; 
         x0(59) = 2.1769d-5; 
         x0(60) = 1.299; 
         x0(61) = 1.642; 
         x0(62) = 2.167; 
         x0(63) = 3.069; 
         x0(64) = 1.3; 
         x0(65) = 1.643; 
         x0(66) = 2.169; 
         x0(67) = 3.072; 
         x0(68) = 0.001; 
         x0(69) = 0.001; 
         x0(70) = 0.002; 
         x0(71) = 0.002; 
         x0(72) = 8.825; 
         x0(73) = 0.543; 
         x0(74) = 0.577; 
         x0(75) = 0.863; 
         x0(76) = 1121.796; 
         x0(77) = 1121.796; 
         x0(78) = 1121.796; 
         x0(79) = 1121.796; 
         x0(80) = 198000.0; 
         x0(81) = 12183.696; 
         x0(82) = 12947.373; 
         x0(83) = 19357.594; 
         x0(84) = 0.2; 
         x0(85) = 0.027; 
         x0(86) = 0.018; 
         x0(87) = 0.01; 
         x0(88) = 1.1; 
         x0(89) = 0.068; 
         x0(90) = 0.072; 
         x0(91) = 0.108; 
         x0(92) = 2.063; 
         x0(93) = 0.15; 
         x0(94) = 0.142; 
         x0(95) = 0.186; 
         
         x0(97) = 5047.03634123606;
         x0(98) = 292.07386234005*x0(6); 
         x0(99) = 2103.94993266178*x0(7); 
         x0(100) = 45.7380420143865*x0(2); 
         x0(101) = 4.57380420143865*x0(2)*x0(3); 
         x0(102) = 764.973851088085*x0(4); 

         fex = 116329.70 *1.0d-6;
     end
%
% mitp54
%
      if (iprob==54) 
%
%	battiti, tecchiolli: "the reactive tabu search"
%
         pnam='mitp54 (f6)';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=-1.0;
         xl(1)=-1;
         xu(1)=1;
         x0(2)=-1.0;
         xl(2)=-1;
         xu(2)=1; 
         x0=xl;      
         xex(1) = 0.0;
         xex(2) = 0.0;
         fex = -1.0;
     end
%
% mitp55
%
	if (iprob==55) 
%
%	shekel function 2-dimensional
%
         pnam='mitp55 (shekel)';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=1.0;
         xl(1)=0.0;
         xu(1)=10.0;
         x0(2)=1.0;
         xl(2)=0.0;
         xu(2)=10.0;
         xex = [7 	7];
         fex = -2.57810691e+000;
     end
%
% mitp56
%
     if (iprob==56) 
%
%	x^2
%
         pnam='mitp56 (x^2)';
         ncont=1;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=150.0;
         x0=    7.742418408036940E+001;
         xl(1)=0.0;
         xu(1)=150.0;
         xex(1) = 0.0;
         fex = 0.0;
     end
%
% mitp57
%
     if (iprob==57) 
%
%	benchmark problem: waste water treatment plant
%
         pnam='mitp57 wwt';
         ncont=12;
         ninteg=1;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         xl=[100 7e-4 1e-4 100 1e-2 1e-4 0 0 0 0 0 0 1];
         xu=[1000 7e-1 7e-1 50000 1 7e-2 360 360 360 360 36892 1844.6 10];
         fex = -3000000.0; %unknown!!!!
         xex=[500 0.001 0.0002 15000 0.05 0.03 0 0 240 240 18446 385 5];
         x0=[500 0.001 0.0002 15000 0.05 0.03 0 0 240 240 18446 385 5];
      end
%
% mitp58
%
     if (iprob==58) 
%
%	cos sin
%
         pnam='mitp58 cos sin';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=5.0;
         xl(1)=-5.0;
         xu(1)=5.0;
         x0(2)=5.0;
         xl(2)=-5.0;
         xu(2)=5.0;
         xex = [2.181471849629E+000 	-3.580319030981E+000];
         fex = -1.99013171E+000;
     end
%
% mitp59
%
     if (iprob==59) 
%
%	Branin RCOS
%
         pnam='mitp59 RCOS';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=-5.0;
         xl(1)=-5.0;
         xu(1)=10.0;
         x0(2)=0.0;
         xl(2)=0.0;
         xu(2)=15.0;
         xex(1) = pi;
         xex(2) = 2.275;
         fex = .397887;
     end
%
% mitp60
%
     if (iprob==60) 
%
%	Easom
%
         pnam='mitp60 Easom';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=0.0;
         xl(1)=-100.0;
         xu(1)=100.0;
         x0(2)=0.0;
         xl(2)=-100.0;
         xu(2)=100.0;
         xex(1) = pi;
         xex(2) = pi;
         fex = -1.0;
         
         x0=xl;
     end
%
% mitp61
%
     if (iprob==61) 
%
%	Goldstein and Price
%
         pnam='mitp61 GP';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         x0(1)=0.0;
         xl(1)=-2.0;
         xu(1)=2.0;
         x0(2)=0.0;
         xl(2)=-2.0;
         xu(2)=2.0;
         xex(1) = 0;
         xex(2) = -1.0;
         fex = 3.0;
     end
%
% mitp62
%
     if (iprob==62) 
%
%	The MGA Global optimisation problem 
%
         pnam='MGA problem';
         ncont=6;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=4;
         me=0;
         
         xl=[-1000 30 100 30 400 1000];
         xu=[0 400 470 400 2000 6000];
         x0=[-1000 30 100 30 400 1000];

%          fex=5.01427;
%          xex=[-789.936 160.99 449.386 53.1756 1042.15 4577.26];
         fex=4.97148281E+000; 
         xex = [-7.895068132591E+002 	1.610121697256E+002 ...
                 4.493861980002E+002 	5.270535778403E+001 ...
                 1.041696480928E+003 	4.576654240725E+003];
     end
%
% mitp63
%
     if (iprob==63) 
%
%	Tomlab: 'Floudas-Pardalos 3.3'
%
         pnam='Tomlab';
         ncont=3;
         ninteg=3;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=6;
         me=0;
               
         xl   = [0 0 1 0 1 0]; 
         xu   = [6 6 5 6 5 10];    % Upper bounds on x(1), x(2) added from lin.eq.3
         x0   = (xl+xu)/2;        % Set as mid point, used if running local solver

         fex = -310;
         xex = [5 1 5 0 5 10]; 
     end
%
% mitp64
%
     if (iprob==64) 
%
%	Tennesse Eastman
%
         addpath('d:/Tennesse Eastman') %benchmark files / folder
         pnam='Tennesse Eastman_300h';
         ncont=36;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=8;
         me=0;
                        
         x0   = [0.01 1.6e-6 1.8e-6 0.004 0.01 4e-4 4e-4 3.2 -2e-4...
                 -1e-3 0.8 -1e-4 -0.032 0.0009 0.00125 -8 -4 32 46 ...
                 0.001/60 0.001/60 0.001/60 0.001/60 0.001/60 0.001/60 ...
                 0.001/60 120/60 200/60 200/60 60/60 20/60 100/60 562/60 ...
                 120/60 7.5/60 15/60];


        %Opt_fmincom
        x_fmincom = [0.0084 0 0 0.0067 0.019 0.0008 0.0007 0.329 -0.0004 -0.0001...
                1.52 0 -0.061 0.0017 0.0008 -15.2 -7.6 44.2109 67.0866 1.e-5 1.e-5 ...
                1.e-5 1.e-5 1.e-5 1.e-5 1.e-5 2.831 4.5887 6.3333 1.9 0.0333 0.1667 0.9397 3.8 ...
                0.2375 0.475];
    
        % Opt_NOMADm
        x_nomadm = [0.0077 0 0 0.0029 0.0177 0.0006 0.0006 6.5191 -0.0003 -0.0019 ...
                0.1543 0 -0.0524 0.0015 0.0013 -1.9243 -0.6373 34.8427 18.0823...
                1.e-5 1.e-5 1.e-5 1.e-5 1.e-5 1.e-5 1.e-5 0.5981 0.9306 5.6665 1.8401 0.1414 0.6886 2.3923...
                1.6763 0.2034 0.4707];
%     
        for i=1:n
            xl(i)=min(min(x0(i),x_fmincom(i)),x_nomadm(i));
            xu(i)=max(max(x0(i),x_fmincom(i)),x_nomadm(i));
        end
        xl = xl - 0.1*abs(xl);
        xu = xu + 0.1*abs(xu);
        

         fex = -3100000; %unknown
        
         xex = x0; % unknown
     end
%
% mitp65
%
     if (iprob==65) 
%
%	Zakharov Function
%
         pnam='mitp65 Zakharov 10';
         ncont=10;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;              
         xl   = -5*ones(1,10); 
         xu   = 10*ones(1,10);    
         x0   = xl;        
         x0=xu;         
         fex = 0;
         xex = zeros(1,10); 
     end
%
% mitp66
%
     if (iprob==66) 
%
%	Zakharov Function
%
         pnam='mitp66 Zakharov 5';
         ncont=5;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;             
         xl   = -5*ones(1,5); 
         xu   = 10*ones(1,5);    
         x0   = xl;        
         x0=xu;       
         fex = 0;
         xex = zeros(1,5); 
     end
%
% mitp67
%
     if (iprob==67) 
%
%	Zakharov Function
%
         pnam='mitp67 Zakharov 2';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = -5*ones(1,2); 
         xu   = 10*ones(1,2);    
         x0   = xl;        

         fex = 0;
         xex = zeros(1,2); 
     end
%
% mitp68
%
     if (iprob==68) 
%
%	Shubert Function
%
         pnam='mitp68 Shubert';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = -10*ones(1,2); 
         xu   = 10*ones(1,2);    
         x0   = xl;        

         fex = -186.7309;
         xex = zeros(1,2); 
     end
%
% mitp69
%
     if (iprob==69) 
%
%	Hartmann Function
%
         pnam='mitp69 H(3,4)';
         ncont=3;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = zeros(1,3); 
         xu   = ones(1,3);    
         x0   = xl;        

         fex = -3.86278;
         xex = [0.114614 0.555649 0.852547]; 
     end
%
% mitp70
%
     if (iprob==70) 
%
%	Hartmann Function
%
         pnam='mitp70 H(6,4)';
         ncont=6;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = zeros(1,6); 
         xu   = ones(1,6);    
         x0   = xl;        

         fex = -3.32237;
         fex=0;
         xex = [0.201690 0.150011 0.476874 0.275332 0.311652 0.657300]; 
     end
%
% mitp71
%
     if (iprob==71) 
%
%	Shekel Function
%
         pnam='mitp71 S(4,5)';
         ncont=4;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = zeros(1,n); 
         xu   = 10*ones(1,n);    
         x0   = xl;        

         fex = -10.1532;
         fex=0;
         xex = [4 4 4 4]; 
     end
%
% mitp72
%
     if (iprob==72) 
%
%	Shekel Function
%
         pnam='mitp72 S(4,7)';
         ncont=4;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = zeros(1,n); 
         xu   = 10*ones(1,n);    
         x0   = xl;        

         fex = -10.4029;
         fex=0;
         xex = [4 4 4 4]; 
     end
%
% mitp73
%
     if (iprob==73) 
%
%	Shekel Function
%
         pnam='mitp73 S(4,10)';
         ncont=4;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = zeros(1,n); 
         xu   = 10*ones(1,n);    
         x0   = xl;        

         fex = -10.5364;
         fex=0;
         xex = [4 4 4 4]; 
     end
%
% mitp74
%
     if (iprob==74) 
%
%	De Joung Function
%
         pnam='mitp74 De Joung';
         ncont=3;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = -2.56*ones(1,n); 
         xu   = 5.12*ones(1,n);    
         x0   = xl;        

         fex=0;
         xex = [0 0 0]; 
     end
%
% mitp75 - mitp77
%
     if (iprob>=75 & iprob<=77) 
%
%	Rosenbrock 2 - 5 - 10
%
         if iprob==75
             pnam='mitp75 Rosenbrock 2';
             ncont=2;
         elseif iprob==76
             pnam='mitp76 Rosenbrock 5';
             ncont=5;
         elseif iprob==77
             pnam='mitp77 Rosenbrock 10';
             ncont=10;
         end             
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = -5*ones(1,n); 
         xu   = 10*ones(1,n);    
         x0   = xl;        

         fex=0;
         xex = ones(1,n); 
     end
%
% mitp78
%
     if (iprob==78) 
%
%	Bohachevsky Function
%
         pnam='mitp78 Bohachevsky B2';
         ncont=2;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = -100*ones(1,n); 
         xu   = 100*ones(1,n);    
         x0   = xl;        

         x0=[1.502626E+001  -9.993461E+001];
         
         fex=0;
         xex = [0 0]; 
     end
%
% mitp79
%
     if (iprob==79) 
%
%	Mendes Function
%
         pnam='mitp79 Mendes';
         ncont=36;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
               
         xl   = [1.e-12 1.e-12 0.1 1.e-12 0.1 1.e-12 ...
             1.e-12 1.e-12 0.1 1.e-12 0.1 1.e-12 1.e-12 ...
             1.e-12 0.1 1.e-12 0.1 1.e-12 1.e-12 ...
             1.e-12 1.e-12 1.e-12 1.e-12 1.e-12 1.e-12 ...
             1.e-12 1.e-12 1.e-12 1.e-12 1.e-12 1e-12 ...
             1.e-12 1.e-12 1.e-12 1.e-12 1.e-12];

         xu   = [1.e3 1.e3 10. 1.e3 10. 1.e3 1.e3 1.e3 ...
                10. 1.e3 10. 1.e3 1.e3 1.e3 10. 1.e3 10. 1.e3 ...
                1.e3 1.e3 1.e3 1.e3 1.e3 1.e3 ...
                1.e3 1.e3 1.e3 1.e3 1.e3 1.e3 1.e3 1.e3 ...
                1.e3 1.e3 1.e3 1.e3];  
            
         x0   = [615.61	158.25	3.1948	315.31	4.4485	637.7 ...
                 874.02	575.29	1.6965	302.23	7.0975	233.67	824.01 ...
                 73.718	4.533	969.8	2.5977	364.33	151.51	767.2 ...
                 831.21	304.45	245.01	79.805	617.7	804.04	373.11	...
                 723.44	178.26	232.59	550.44	414.98	487.26	615.07	...
                 365.95	652.58];        

         % additional global variables!!!!
         % Mendes
         global yexp1 yexp2 yexp3 yexp4 yexp5 yexp6 yexp7 yexp8 ...
            yexp9 yexp10 yexp11 yexp12 yexp13 yexp14 yexp15 yexp16;

         global maxy1 maxy2 maxy3 maxy4 maxy5 maxy6 maxy7 maxy8 ...
            maxy9 maxy10 maxy11 maxy12 maxy13 maxy14 maxy15 maxy16; 

         % LOAD EXPERIMENTAL DATA:
         load experimentaldata2;
         load maxyexp;
    
%          x0=xl;
         
         xex=[1.0000    1.0000    2.0000    1.0000... 
               2.0000    1.0000    1.0000    1.0000...
               2.0000    1.0000    2.0000    1.0000...
               1.0000    1.0000    2.0000    1.0000...
               2.0000    1.0000    0.1000    1.0000...
               0.1000    0.1000    1.0000    0.1000...
               0.1000    1.0000    0.1000    1.0000...
               1.0000    1.0000    1.0000    1.0000...
               1.0000    1.0000    1.0000    1.0000];

         xl=log10(xl);
         xu=log10(xu);
         x0=log10(x0);
         fex = 0.000000001;
     end
%
% mitp80
%
     if (iprob==80) 
%
%	Pineno Function
%
         pnam='mitp80 Pinen0';
         ncont=5;
         ninteg=0;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
                        
         xl   = [0 0 0 0 0];

         xu   = [1 1 1 1 1]; 
         
         x0   = [0.46137084895052   0.05575481329001 ...
             0.02051734561410   0.01590317511081   0.49441207046167];        

         
         global yexp;
         % LOAD EXPERIMENTAL DATA:
         pinenodata;
    
         fex = 19.87;
         xex = [ 5.925849E-005   2.963398E-005   2.047224E-005 ...
                 2.744655E-004   3.997927E-005 ]; 
     end
%
% mitp81
%
     if (iprob==81) 
%
%	Tennesse Eastman (MINLP 2)
%
         pnam='Tennesse Eastman MINLP 4 bin - 10h';
         ncont=36;
         ninteg=0;
         nbin=4;
         n=ninteg+ncont+nbin;
         m=10;
         me=1;               
                  
         x0=0.5*ones(1,40);
         xl = zeros(1,40);
         xu = ones(1,40);
         x0(37)=1;
         x0(38)=0;
         x0(39)=1;
         x0(40)=0;
         
%     x0=[9.029361482506E-001 	8.478397146731E-001 	3.823593036924E-002 ...
%         9.999959272112E-001     9.122609065172E-001 	6.431828801537E-001 ...
%         5.606166891943E-001 	9.999959272112E-001     4.068011050894E-001 ...
%         5.324788348627E-001 	3.502359194803E-001 	1.000000000000E+000 ...
%         6.215591548986E-001 	1.295989916735E-001 	5.168755716973E-001 ...
%         4.798403634671E-001     4.021922948960E-001 	1.800714240773E-001 ...
%         1.715395553208E-001 	4.503171792280E-001     3.720659899024E-001 ...
%         2.503851665351E-001 	4.072788783702E-006 	1.221836635110E-005 ...
%         3.526767854175E-001 	2.811779148788E-001 	1.497617715956E-001 ...
%         7.640487937051E-002     1.112406165316E-003 	2.124305426780E-001 ...
%         4.426356002607E-002 	1.555940356028E-001     5.979021054207E-001 ...
%         7.135084852592E-001 	1.800015843637E-002 	2.764071040495E-001 ...
%         0.000000000000E+000 	1.000000000000E+000 	0.000000000000E+000 ...
%         1.000000000000E+000];
         
%          x0=[3.929115764792E-001 	1.793428345907E-001 	2.928567338006E-001 	5.927464717076E-001 	6.358150064029E-001 	5.763641236268E-001 	4.073312171137E-001 	2.483811432397E-002 	6.917750617441E-002 	6.294612622270E-001 	6.030417860337E-001 	3.109362499619E-002 	2.383423733241E-001 	4.892231997004E-001 	9.764045551752E-001 	2.504199400179E-001 	2.999330040931E-001 	4.404307730724E-001 	4.849263887050E-003 	1.435160938665E-001 	5.991397562568E-001 	8.323506125232E-001 	7.018663372606E-001 	1.192270523869E-001 	3.669997616715E-001 	8.670528473038E-001 	8.268793094812E-001 	5.808271060272E-001 	4.283541960948E-001 	4.585172989509E-001 	3.544236970524E-001 	1.151221922109E-001 	5.055389568405E-001 	5.689296549350E-001 	6.818078421388E-001 	4.150246846379E-001 	1.000000000000E+000 	1.000000000000E+000 	0.000000000000E+000 	0.000000000000E+000 ];
%          x0=0.5*ones(1,36);
         
%          load('initial point')
         
         xl = zeros(1,40);
         xu = ones(1,40);
        
         fex = -3100000;
        
         xex = x0; % keine Ahnung
     end  
%
%   mitp82
%
      if (iprob==82) 
         pnam='mitp82';
         pref='';
         ncont=0;
         ninteg=2;
         nbin=0;
         n=ninteg+ncont+nbin;
         m=1;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=10.0;
            x0(i)=10.0;
         end
         xex(1)=4.0;
         xex(2)=4.0;
         fex = 0.02;
      end  
%
%   mitp83
%
      if (iprob>=83 & iprob<=90) 
         pnam='mitp scp';
         pref='';
         ncont=8;
         ninteg=0;
         nbin=8;
         n=ninteg+ncont+nbin;
         m=21;  % m=23;
         me=0;

% bounds:   lb(1:8) = 1;  lb(9:16) = 0;
%           ub(1:8) = 10; ub(9:16) = 1;
%
% initial point (for mne = 1)
%           x0(1:8) = 1;
%           x0(9:16) = 0; 
%           x0(13) = 1;
%
% initial point for mne = 2 ==> the solution for mne = 1
% initial point for mne = 3 ==> the solution for mne = 2
%
         for i=1:ncont
            xl(i)=1.0;
            xu(i)=10.0;
            x0(i)=1.0;
         end
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=1.0;
            x0(i)=0.0;
         end
         x0(13)=1.0;
         if iprob==83
             pnam=[pnam '1'];
         elseif iprob==84
             pnam=[pnam '2'];
             x0=[1.141427441110E+000   1.000000000000E+000   1.000000000000E+000   1.000000000000E+000...
             1.000000000000E+000   1.000000000000E+000   1.000000000000E+000   1.000000000000E+000...
             1.000000000000E+000   0.000000000000E+000   0.000000000000E+000   0.000000000000E+000...
             0.000000000000E+000   0.000000000000E+000   0.000000000000E+000   0.000000000000E+000];
%              x0=[1.078207E+000   1.000000E+000   1.000000E+000   1.000000E+000 ...
%                  1.000000E+000   1.000000E+000   1.000000E+000   1.000000E+000 ...
%                  1   0   0   0   0   0   0   0];
         elseif iprob==85
             pnam=[pnam '3'];
             x0=[1.110011E+000   1.000000E+000   1.048696E+000 ...
                 1.000000E+000   1.000000E+000   1.000000E+000 ...
                 1.000000E+000   1.000000E+000   1   0   1   0 ...
                 0   0   0   0];
         elseif iprob==86
             pnam=[pnam '4'];
             x0=[1.161303920666E+000 1.000000000000E+000 1.603671306948E+000...
                 1.000000000000E+000 1.405591854598E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 0.000000000000E+000 1.000000000000E+000 0.000000000000E+000...
                 1.000000000000E+000 0.000000000000E+000 0.000000000000E+000...
                 0.000000000000E+000];            
         elseif iprob==87
             pnam=[pnam '5'];
             x0=[1.262517002395E+000 1.000000000000E+000 1.451862989432E+000...
                 1.075107920832E+000 1.274971376912E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 0.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 1.000000000000E+000 0.000000000000E+000 0.000000000000E+000...
                 0.000000000000E+000];
         elseif iprob==88
             pnam=[pnam '6'];
             x0=[1.246480669834E+000 1.000000000000E+000 1.790074075841E+000...
                 1.115228245734E+000 1.550659939663E+000 1.155590821036E+000...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 0.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 0.000000000000E+000...
                 0.000000000000E+000];
         elseif iprob==89
             pnam=[pnam '7'];
             x0=[7.028417623146E+000 6.015506718112E+000 9.102299345480E+000...
                 1.000000000000E+001 8.883532277252E+000 1.000000000000E+001...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 0.000000000000E+000...
                 0.000000000000E+000];
         elseif iprob==90
             pnam=[pnam '8'];
             x0=[7.039900344257E+000 6.015506828425E+000 9.117574215029E+000...
                 1.000000000000E+001 8.891208800069E+000 1.000000000000E+001...
                 1.000000000000E+000 1.044697433548E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 1.000000000000E+000...
                 1.000000000000E+000 1.000000000000E+000 0.000000000000E+000...
                 1.000000000000E+000];
         end

         xex=x0;
         fex = -10.0;
      end  
%
%   mitp91
%
      if (iprob==91) 
         pnam='mitp91';
         pref='';
         ncont=1;
         ninteg=0;
         nbin=1;
         n=ninteg+ncont+nbin;
         m=0;
         me=0;
         for i=1:n
            xl(i)=0.0;
            xu(i)=1.0;
            x0(i)=1.0;
         end
         xex(1)=1.0;
         xex(2)=0.0;
         fex = -5.0;
      end  
%
%   mitp92-96
%
%   aa-biosynthesis
%
      if (iprob>=92 & iprob<=96) 
         pnam='mitp aa';
         pref='';
         ncont=6;
         ninteg=0;
         nbin=8;
         n=ninteg+ncont+nbin;
         m=14;  
         me=0;

% bounds 
%
% lowb = [ones(6,1); zeros(8,1)]
% uppb = [2*ones(6,1); ones(8,1)]
%
% initial point for all the problems : x0 = ones(14,1);
%
% initial point for mne = 2 ==> the solution for mne = 1
% initial point for mne = 3 ==> the solution for mne = 2
%
         for i=1:ncont
            xl(i)=1.0;
            xu(i)=2.0;
            x0(i)=1.0;
         end
         for i=ncont+1:n
            xl(i)=0.0;
            xu(i)=1.0;
            x0(i)=1.0;
         end
%          if iprob==92
%              pnam=[pnam '1'];
%          elseif iprob==93
%              pnam=[pnam '2'];
%          elseif iprob==94
%              pnam=[pnam '3'];
%          elseif iprob==95
%              pnam=[pnam '4'];
         if iprob==92
             pnam=[pnam '4_initial'];
         elseif iprob==93
             pnam=[pnam '4_best_1'];
             
             % best prob1
             x0=[1.048399046522E+000   1.603028965940E+000   1.994900752325E+000 ...
             1.313633035286E+000   1.601973371515E+000   1.983307099580E+000 ...
             1.000000000000E+000   0.000000000000E+000   0.000000000000E+000 ...
             1.000000000000E+000   1.000000000000E+000   1.000000000000E+000 ...
             0.000000000000E+000   1.000000000000E+000 ];
         
         elseif iprob==94
             pnam=[pnam '4_best_2'];
         
             % best prob2
             x0=[1.307178808488E+000   1.246936651440E+000   2.000000000000E+000 ...
             1.000000000000E+000   2.000000000000E+000   1.000000000000E+000 ...
             1.000000000000E+000   1.000000000000E+000   0.000000000000E+000 ...
             1.000000000000E+000   1.000000000000E+000   1.000000000000E+000 ...
             1.000000000000E+000   1.000000000000E+000];
         
         elseif iprob==95
             pnam=[pnam '4_best_3'];
         
             % best prob3
             x0=[1.985458134753E+000   1.993788484902E+000   1.991004639837E+000 ...
             1.447116631314E+000   1.988727865446E+000   1.059665119797E+000 ...
             1.000000000000E+000   1.000000000000E+000   0.000000000000E+000 ...
             1.000000000000E+000   1.000000000000E+000   1.000000000000E+000 ...
             0.000000000000E+000   0.000000000000E+000 ];
         
         elseif iprob==96
             pnam=[pnam 'extended'];
             % e
%              x0=[exp(0.17594) exp(0) exp(0.31102) exp(0.69314718055995) exp(0) exp(0) 1 1 0 0 1 0 0 1];
             % a
             x0=[exp(0.13926) 1 exp(0.36149) 2 1 1 1 1 0 0 1 0 0 0];
%              x0=[exp(0.13926) 1 exp(0.36149) 2 1 1];
             
         end

         xex=x0;
         fex = -10.0;
      end  
%
% end of problem dates
%

%
% Allocate Array 'g'
%
g=zeros(1,m);
%
% end of FUNCTION init()
%
      
      
