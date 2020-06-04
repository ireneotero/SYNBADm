function Z = Maranas_ex1_OF_1(vy)

% lacI = x(1);
% lacI_IPTG = x(2);
% tetR = x(3);
% tetR_aTc = x(4);
% cI = x(5);
% araC = x(6);


%        Promoter  Repressor
%---------------------------------
% Y(1,1)  Plac1     tetR    y(1)
% Y(1,2)  Plac1     lacI    y(2)
% Y(1,3)  Plac1     cI      y(3)
% Y(1,4)  Plac1     araC    y(4)

% Y(2,1)  Plac2     tetR    y(5)
% Y(2,2)  Plac2     lacI    y(6);
% Y(2,3)  Plac2     cI
% Y(3,3)  Plac2     araC

% Y(3,1)  Plac3     tetR
% Y(3,2)  Plac3     lacI
% Y(3,3)  Plac3     cI
% Y(3,4)  Plac3     araC

% Y(4,1)  Plac4     tetR
% Y(4,2)  Plac4     lacI
% Y(4,3)  Plac4     cI
% Y(4,4)  Plac4     araC

% Y(5,1) Plambda    tetR
% Y(5,2) Plambda    lacI
% Y(5,3) Plambda    cI
% Y(5,4) Plambda    araC

% Y(6,1) Ptet1      tetR
% Y(6,2) Ptet1      lacI
% Y(6,3) Ptet1      cI
% Y(6,4) Ptet1      araC

% Y(7,1) Ptet2      tetR
% Y(7,2) Ptet2      lacI
% Y(7,3) Ptet2      cI
% Y(7,4) Ptet2      araC

% Y(8,1) Para       tetR
% Y(8,2) Para       lacI
% Y(8,3) Para       cI
% Y(8,4) Para       araC

alphalac = 1.215;
alphatet = 1.215;
alphalambda = 2.92;
alphaara = 1.215;
Klambda = 0.33;
Ktet1 = 0.014;
Ktet2 = 1.4;
Klac1 = 10;
Klac2 = 0.01;
Klac3 = 0.001;
Klac4 = 0.00001;
KaraC = 2.5;
KdeglacI = 0.0346; 
KdegtetR = 0.0346; 
KdegcI = 0.0693;
KdegaraC = 0.0115;
Kdegcpx = 0.0693;
Kf = 0.05;
Kb = 0.1;

parstr.alphalac = alphalac;
parstr.alphatet = alphatet;
parstr.alphalambda = alphalambda;
parstr.alphaara = alphaara;
parstr.Klambda = Klambda;
parstr.Ktet1 = Ktet1;
parstr.Ktet2 = Ktet2;
parstr.Klac1 = Klac1;
parstr.Klac2 = Klac2;
parstr.Klac3 = Klac3;
parstr.Klac4 = Klac4;
parstr.KaraC = KaraC;
parstr.KdeglacI = KdeglacI;
parstr.KdegtetR = KdegtetR;
parstr.KdegcI = KdegcI;
parstr.KdegaraC = KdegaraC;
parstr.Kdegcpx = Kdegcpx;
parstr.Kf = Kf;
parstr.Kb = Kb;


Y = reshape(vy,4,8)';
x0 = [1 0 1 0 1 1];
parstr.Y=Y;
   
tstep = 0.1;
tspan = 0:tstep:1000;  % seg
parstr.IPTG = 40;
parstr.aTc = 0;

opt = odeset('RelTol',1e-6,'AbsTol',1e-12);

[t,x_IPTG] = ode45(@Maranas_ex1_odefile,tspan,x0, opt,parstr);
lacI_IPTG=x_IPTG(end,1);
tetR_IPTG=x_IPTG(end,3);

parstr.IPTG = 0;
parstr.aTc = 40;
[t,x_aTc] = ode45(@Maranas_ex1_odefile, tspan, x0, opt, parstr);
lacI_aTc=x_aTc(end,1);
tetR_aTc=x_aTc(end,3);



Z=-((lacI_aTc - lacI_IPTG)/lacI_aTc + (tetR_IPTG - tetR_aTc)/tetR_IPTG)/2;


       