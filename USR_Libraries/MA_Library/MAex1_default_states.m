function z=MAex1_default_states(Y)

NA = 6.0221415e23;  % Avogadro (molecules in a mol)
V = 1e-14;  % Cell volume
NAV = NA*V/1e9;  % For concentration in nM

z.z0 = zeros(14,1);
z.z0(1) = max(Y(1,:))/NAV;
z.z0(2) = max(Y(2,:))/NAV;
z.z0(3) = max(Y(3,:))/NAV;

z.name{1}='P1';
z.name{2}='P2';
z.name{3}='P3';
z.name{4}='P1cI';
z.name{5}='P2tetR';
z.name{6}='P3lacI';
z.name{7}='cI';
z.name{8}='tetR';
z.name{9}='lacI';
z.name{10}='luxI';
z.name{11}='cIm';
z.name{12}='tetRm';
z.name{13}='lacIm';
z.name{14}='luxIm';
