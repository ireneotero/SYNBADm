function z=MA_default_states(Y)

NA = 6.0221415e23;  % Avogadro (molecules in a mol)
V = 1e-14;  % Cell volume
NAV = NA*V/1e9;  % For concentration in nM

z.z0 = zeros(30,1);
z.z0(1) = max(Y(1,:))/NAV;
z.z0(2) = max(Y(2,:))/NAV;
z.z0(3) = max(Y(3,:))/NAV;
z.z0(4) = max(Y(4,:))/NAV;

z.name{1}='P1';
z.name{2}='P2';
z.name{3}='P3';
z.name{4}='P4';
z.name{5}='P1cI';
z.name{6}='P2tetR';
z.name{7}='P3araC';
z.name{8}='P4lacI';
z.name{9}='cI';
z.name{10}='tetR';
z.name{11}='araC';
z.name{12}='lacI';
z.name{13}='luxI';
z.name{14}='luxR';
z.name{15}='lasI';
z.name{16}='lasR';
z.name{17}='ccdB';
z.name{18}='ccdA';
z.name{19}='ccdA2';
z.name{20}='cIm';
z.name{21}='tetRm';
z.name{22}='araCm';
z.name{23}='lacIm';
z.name{24}='luxIm';
z.name{25}='luxRm';
z.name{26}='lasIm';
z.name{27}='lasRm';
z.name{28}='ccdBm';
z.name{29}='ccdAm';
z.name{30}='ccdA2m';