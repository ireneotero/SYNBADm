function dzdt = MA_odefile(t,z,parstr)

y=parstr.y;
k=parstr.k;
u=parstr.u;

n_Transcripts=11;
n_Promoters=4;

Y=reshape(y,n_Promoters,n_Transcripts);
Y=Y';


P1=z(1);
P2=z(2);
P3=z(3);
P4=z(4);
P1cI=z(5);
P2tetR=z(6);
P3araC=z(7);
P4lacI=z(8);
cI=z(9);
tetR=z(10);
araC=z(11);
lacI=z(12);
luxI=z(13);
luxR=z(14);
lasI=z(15);
lasR=z(16);
ccdB=z(17);
ccdA=z(18);
ccdA2=z(19);
cIm=z(20);
tetRm=z(21);
araCm=z(22);
lacIm=z(23);
luxIm=z(24);
luxRm=z(25);
lasIm=z(26);
lasRm=z(27);
ccdBm=z(28);
ccdAm=z(29);
ccdA2m=z(30);

kf_pt_1=k(1);
kf_pt_2=k(2);
kf_pt_3=k(3);
kf_pt_4=k(4);
kb_pt_1=k(5);
kb_pt_2=k(6);
kb_pt_3=k(7);
kb_pt_4=k(8);
kdeg_pt_1=k(9);
kdeg_pt_2=k(10);
kdeg_pt_3=k(11);
kdeg_pt_4=k(12);
ktransc_1=k(13);
ktransc_2=k(14);
ktransc_3=k(15);
ktransc_4=k(16);
kleak_1=k(17);
kleak_2=k(18);
kleak_3=k(19);
kleak_4=k(20);
ktransl_1=k(21);
ktransl_2=k(22);
ktransl_3=k(23);
ktransl_4=k(24);
ktransl_5=k(25);
ktransl_6=k(26);
ktransl_7=k(27);
ktransl_8=k(28);
ktransl_9=k(29);
ktransl_10=k(30);
ktransl_11=k(31);
kdeg_m_1=k(32);
kdeg_m_2=k(33);
kdeg_m_3=k(34);
kdeg_m_4=k(35);
kdeg_m_5=k(36);
kdeg_m_6=k(37);
kdeg_m_7=k(38);
kdeg_m_8=k(39);
kdeg_m_9=k(40);
kdeg_m_10=k(41);
kdeg_m_11=k(42);
kdeg_1=k(43);
kdeg_2=k(44);
kdeg_3=k(45);
kdeg_4=k(46);
kdeg_5=k(47);
kdeg_6=k(48);
kdeg_7=k(49);
kdeg_8=k(50);
kdeg_9=k(51);
kdeg_10=k(52);
kdeg_11=k(53);

rf_pt(1)=kf_pt_1*P1*cI;
rb_pt(1)=kb_pt_1*P1cI;
rdeg_pt(1)=kdeg_pt_1*P1cI;
rf_pt(2)=kf_pt_2*P2*tetR;
rb_pt(2)=kb_pt_2*P2tetR;
rdeg_pt(2)=kdeg_pt_2*P2tetR;
rf_pt(3)=kf_pt_3*P3*araC;
rb_pt(3)=kb_pt_3*P3araC;
rdeg_pt(3)=kdeg_pt_3*P3araC;
rf_pt(4)=kf_pt_4*P4*lacI;
rb_pt(4)=kb_pt_4*P4lacI;
rdeg_pt(4)=kdeg_pt_4*P4lacI;
rtransc(1)=ktransc_1*P1cI;
rleak(1)=kleak_1*P1;
rtransc(2)=ktransc_2*P2tetR;
rleak(2)=kleak_2*P2;
rtransc(3)=ktransc_3*P3araC;
rleak(3)=kleak_3*P3;
rtransc(4)=ktransc_4*P4lacI;
rleak(4)=kleak_4*P4;
rtransl(1)=ktransl_1*cIm;
rdeg_m(1)=kdeg_m_1*cIm;
rdeg(1)=kdeg_1*cI;
rtransl(2)=ktransl_2*tetRm;
rdeg_m(2)=kdeg_m_2*tetRm;
rdeg(2)=kdeg_2*tetR;
rtransl(3)=ktransl_3*araCm;
rdeg_m(3)=kdeg_m_3*araCm;
rdeg(3)=kdeg_3*araC;
rtransl(4)=ktransl_4*lacIm;
rdeg_m(4)=kdeg_m_4*lacIm;
rdeg(4)=kdeg_4*lacI;
rtransl(5)=ktransl_5*luxIm;
rdeg_m(5)=kdeg_m_5*luxIm;
rdeg(5)=kdeg_5*luxI;
rtransl(6)=ktransl_6*luxRm;
rdeg_m(6)=kdeg_m_6*luxRm;
rdeg(6)=kdeg_6*luxR;
rtransl(7)=ktransl_7*lasIm;
rdeg_m(7)=kdeg_m_7*lasIm;
rdeg(7)=kdeg_7*lasI;
rtransl(8)=ktransl_8*lasRm;
rdeg_m(8)=kdeg_m_8*lasRm;
rdeg(8)=kdeg_8*lasR;
rtransl(9)=ktransl_9*ccdBm;
rdeg_m(9)=kdeg_m_9*ccdBm;
rdeg(9)=kdeg_9*ccdB;
rtransl(10)=ktransl_10*ccdAm;
rdeg_m(10)=kdeg_m_10*ccdAm;
rdeg(10)=kdeg_10*ccdA;
rtransl(11)=ktransl_11*ccdA2m;
rdeg_m(11)=kdeg_m_11*ccdA2m;
rdeg(11)=kdeg_11*ccdA2;

dP1=-max(Y(:,1))*rf_pt(1) + max(Y(:,1))*rb_pt(1) + max(Y(:,1))*rdeg_pt(1);
dP1cI=max(Y(:,1))*rf_pt(1) - max(Y(:,1))*rb_pt(1) -  max(Y(:,1))*rdeg_pt(1);
dP2=-max(Y(:,2))*rf_pt(2) + max(Y(:,2))*rb_pt(2) + max(Y(:,2))*rdeg_pt(2);
dP2tetR=max(Y(:,2))*rf_pt(2) - max(Y(:,2))*rb_pt(2) -  max(Y(:,2))*rdeg_pt(2);
dP3=-max(Y(:,3))*rf_pt(3) + max(Y(:,3))*rb_pt(3) + max(Y(:,3))*rdeg_pt(3);
dP3araC=max(Y(:,3))*rf_pt(3) - max(Y(:,3))*rb_pt(3) -  max(Y(:,3))*rdeg_pt(3);
dP4=-max(Y(:,4))*rf_pt(4) + max(Y(:,4))*rb_pt(4) + max(Y(:,4))*rdeg_pt(4);
dP4lacI=max(Y(:,4))*rf_pt(4) - max(Y(:,4))*rb_pt(4) -  max(Y(:,4))*rdeg_pt(4);
dcI=-max(Y(:,1))*rf_pt(1) + max(Y(:,1))*rb_pt(1)+ max(Y(1,:))*rtransl(1) - max(Y(1,:))*rdeg(1);
dcIm=-max(Y(1,:))*rdeg_m(1) ...
			+ Y(1,1)*rtransc(1) + Y(1,1)*rleak(1)...
			+ Y(1,2)*rtransc(2) + Y(1,2)*rleak(2)...
			+ Y(1,3)*rtransc(3) + Y(1,3)*rleak(3)...
			+ Y(1,4)*rtransc(4) + Y(1,4)*rleak(4);
dtetR=-max(Y(:,2))*rf_pt(2) + max(Y(:,2))*rb_pt(2)+ max(Y(2,:))*rtransl(2) - max(Y(2,:))*rdeg(2);
dtetRm=-max(Y(2,:))*rdeg_m(2) ...
			+ Y(2,1)*rtransc(1) + Y(2,1)*rleak(1)...
			+ Y(2,2)*rtransc(2) + Y(2,2)*rleak(2)...
			+ Y(2,3)*rtransc(3) + Y(2,3)*rleak(3)...
			+ Y(2,4)*rtransc(4) + Y(2,4)*rleak(4);
daraC=-max(Y(:,3))*rf_pt(3) + max(Y(:,3))*rb_pt(3)+ max(Y(3,:))*rtransl(3) - max(Y(3,:))*rdeg(3);
daraCm=-max(Y(3,:))*rdeg_m(3) ...
			+ Y(3,1)*rtransc(1) + Y(3,1)*rleak(1)...
			+ Y(3,2)*rtransc(2) + Y(3,2)*rleak(2)...
			+ Y(3,3)*rtransc(3) + Y(3,3)*rleak(3)...
			+ Y(3,4)*rtransc(4) + Y(3,4)*rleak(4);
dlacI=-max(Y(:,4))*rf_pt(4) + max(Y(:,4))*rb_pt(4)+ max(Y(4,:))*rtransl(4) - max(Y(4,:))*rdeg(4);
dlacIm=-max(Y(4,:))*rdeg_m(4) ...
			+ Y(4,1)*rtransc(1) + Y(4,1)*rleak(1)...
			+ Y(4,2)*rtransc(2) + Y(4,2)*rleak(2)...
			+ Y(4,3)*rtransc(3) + Y(4,3)*rleak(3)...
			+ Y(4,4)*rtransc(4) + Y(4,4)*rleak(4);
dluxI=max(Y(5,:))*rtransl(5) - max(Y(5,:))*rdeg(5);
dluxIm=-max(Y(5,:))*rdeg_m(5) ...
			+ Y(5,1)*rtransc(1) + Y(5,1)*rleak(1)...
			+ Y(5,2)*rtransc(2) + Y(5,2)*rleak(2)...
			+ Y(5,3)*rtransc(3) + Y(5,3)*rleak(3)...
			+ Y(5,4)*rtransc(4) + Y(5,4)*rleak(4);
dluxR=max(Y(6,:))*rtransl(6) - max(Y(6,:))*rdeg(6);
dluxRm=-max(Y(6,:))*rdeg_m(6) ...
			+ Y(6,1)*rtransc(1) + Y(6,1)*rleak(1)...
			+ Y(6,2)*rtransc(2) + Y(6,2)*rleak(2)...
			+ Y(6,3)*rtransc(3) + Y(6,3)*rleak(3)...
			+ Y(6,4)*rtransc(4) + Y(6,4)*rleak(4);
dlasI=max(Y(7,:))*rtransl(7) - max(Y(7,:))*rdeg(7);
dlasIm=-max(Y(7,:))*rdeg_m(7) ...
			+ Y(7,1)*rtransc(1) + Y(7,1)*rleak(1)...
			+ Y(7,2)*rtransc(2) + Y(7,2)*rleak(2)...
			+ Y(7,3)*rtransc(3) + Y(7,3)*rleak(3)...
			+ Y(7,4)*rtransc(4) + Y(7,4)*rleak(4);
dlasR=max(Y(8,:))*rtransl(8) - max(Y(8,:))*rdeg(8);
dlasRm=-max(Y(8,:))*rdeg_m(8) ...
			+ Y(8,1)*rtransc(1) + Y(8,1)*rleak(1)...
			+ Y(8,2)*rtransc(2) + Y(8,2)*rleak(2)...
			+ Y(8,3)*rtransc(3) + Y(8,3)*rleak(3)...
			+ Y(8,4)*rtransc(4) + Y(8,4)*rleak(4);
dccdB=max(Y(9,:))*rtransl(9) - max(Y(9,:))*rdeg(9);
dccdBm=-max(Y(9,:))*rdeg_m(9) ...
			+ Y(9,1)*rtransc(1) + Y(9,1)*rleak(1)...
			+ Y(9,2)*rtransc(2) + Y(9,2)*rleak(2)...
			+ Y(9,3)*rtransc(3) + Y(9,3)*rleak(3)...
			+ Y(9,4)*rtransc(4) + Y(9,4)*rleak(4);
dccdA=max(Y(10,:))*rtransl(10) - max(Y(10,:))*rdeg(10);
dccdAm=-max(Y(10,:))*rdeg_m(10) ...
			+ Y(10,1)*rtransc(1) + Y(10,1)*rleak(1)...
			+ Y(10,2)*rtransc(2) + Y(10,2)*rleak(2)...
			+ Y(10,3)*rtransc(3) + Y(10,3)*rleak(3)...
			+ Y(10,4)*rtransc(4) + Y(10,4)*rleak(4);
dccdA2=max(Y(11,:))*rtransl(11) - max(Y(11,:))*rdeg(11);
dccdA2m=-max(Y(11,:))*rdeg_m(11) ...
			+ Y(11,1)*rtransc(1) + Y(11,1)*rleak(1)...
			+ Y(11,2)*rtransc(2) + Y(11,2)*rleak(2)...
			+ Y(11,3)*rtransc(3) + Y(11,3)*rleak(3)...
			+ Y(11,4)*rtransc(4) + Y(11,4)*rleak(4);

dzdt=zeros(30,1);
dzdt(1)=dP1;
dzdt(2)=dP2;
dzdt(3)=dP3;
dzdt(4)=dP4;
dzdt(5)=dP1cI;
dzdt(6)=dP2tetR;
dzdt(7)=dP3araC;
dzdt(8)=dP4lacI;
dzdt(9)=dcI;
dzdt(10)=dtetR;
dzdt(11)=daraC;
dzdt(12)=dlacI;
dzdt(13)=dluxI;
dzdt(14)=dluxR;
dzdt(15)=dlasI;
dzdt(16)=dlasR;
dzdt(17)=dccdB;
dzdt(18)=dccdA;
dzdt(19)=dccdA2;
dzdt(20)=dcIm;
dzdt(21)=dtetRm;
dzdt(22)=daraCm;
dzdt(23)=dlacIm;
dzdt(24)=dluxIm;
dzdt(25)=dluxRm;
dzdt(26)=dlasIm;
dzdt(27)=dlasRm;
dzdt(28)=dccdBm;
dzdt(29)=dccdAm;
dzdt(30)=dccdA2m;
