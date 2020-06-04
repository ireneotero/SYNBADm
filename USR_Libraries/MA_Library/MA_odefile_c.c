#include <amigoRHS.h>
#include <math.h>
#include <amigoJAC.h>
#include <amigoSensRHS.h>

#define n_Transcripts 11
#define n_Promoters 4

#define Y_1_1 (amigo_model->pars[0])
#define Y_1_2 (amigo_model->pars[1])
#define Y_1_3 (amigo_model->pars[2])
#define Y_1_4 (amigo_model->pars[3])
#define Y_2_1 (amigo_model->pars[4])
#define Y_2_2 (amigo_model->pars[5])
#define Y_2_3 (amigo_model->pars[6])
#define Y_2_4 (amigo_model->pars[7])
#define Y_3_1 (amigo_model->pars[8])
#define Y_3_2 (amigo_model->pars[9])
#define Y_3_3 (amigo_model->pars[10])
#define Y_3_4 (amigo_model->pars[11])
#define Y_4_1 (amigo_model->pars[12])
#define Y_4_2 (amigo_model->pars[13])
#define Y_4_3 (amigo_model->pars[14])
#define Y_4_4 (amigo_model->pars[15])
#define Y_5_1 (amigo_model->pars[16])
#define Y_5_2 (amigo_model->pars[17])
#define Y_5_3 (amigo_model->pars[18])
#define Y_5_4 (amigo_model->pars[19])
#define Y_6_1 (amigo_model->pars[20])
#define Y_6_2 (amigo_model->pars[21])
#define Y_6_3 (amigo_model->pars[22])
#define Y_6_4 (amigo_model->pars[23])
#define Y_7_1 (amigo_model->pars[24])
#define Y_7_2 (amigo_model->pars[25])
#define Y_7_3 (amigo_model->pars[26])
#define Y_7_4 (amigo_model->pars[27])
#define Y_8_1 (amigo_model->pars[28])
#define Y_8_2 (amigo_model->pars[29])
#define Y_8_3 (amigo_model->pars[30])
#define Y_8_4 (amigo_model->pars[31])
#define Y_9_1 (amigo_model->pars[32])
#define Y_9_2 (amigo_model->pars[33])
#define Y_9_3 (amigo_model->pars[34])
#define Y_9_4 (amigo_model->pars[35])
#define Y_10_1 (amigo_model->pars[36])
#define Y_10_2 (amigo_model->pars[37])
#define Y_10_3 (amigo_model->pars[38])
#define Y_10_4 (amigo_model->pars[39])
#define Y_11_1 (amigo_model->pars[40])
#define Y_11_2 (amigo_model->pars[41])
#define Y_11_3 (amigo_model->pars[42])
#define Y_11_4 (amigo_model->pars[43])

#define K_1 (amigo_model->pars[44])
#define K_2 (amigo_model->pars[45])
#define K_3 (amigo_model->pars[46])
#define K_4 (amigo_model->pars[47])
#define K_5 (amigo_model->pars[48])
#define K_6 (amigo_model->pars[49])
#define K_7 (amigo_model->pars[50])
#define K_8 (amigo_model->pars[51])
#define K_9 (amigo_model->pars[52])
#define K_10 (amigo_model->pars[53])
#define K_11 (amigo_model->pars[54])
#define K_12 (amigo_model->pars[55])
#define K_13 (amigo_model->pars[56])
#define K_14 (amigo_model->pars[57])
#define K_15 (amigo_model->pars[58])
#define K_16 (amigo_model->pars[59])
#define K_17 (amigo_model->pars[60])
#define K_18 (amigo_model->pars[61])
#define K_19 (amigo_model->pars[62])
#define K_20 (amigo_model->pars[63])
#define K_21 (amigo_model->pars[64])
#define K_22 (amigo_model->pars[65])
#define K_23 (amigo_model->pars[66])
#define K_24 (amigo_model->pars[67])
#define K_25 (amigo_model->pars[68])
#define K_26 (amigo_model->pars[69])
#define K_27 (amigo_model->pars[70])
#define K_28 (amigo_model->pars[71])
#define K_29 (amigo_model->pars[72])
#define K_30 (amigo_model->pars[73])
#define K_31 (amigo_model->pars[74])
#define K_32 (amigo_model->pars[75])
#define K_33 (amigo_model->pars[76])
#define K_34 (amigo_model->pars[77])
#define K_35 (amigo_model->pars[78])
#define K_36 (amigo_model->pars[79])
#define K_37 (amigo_model->pars[80])
#define K_38 (amigo_model->pars[81])
#define K_39 (amigo_model->pars[82])
#define K_40 (amigo_model->pars[83])
#define K_41 (amigo_model->pars[84])
#define K_42 (amigo_model->pars[85])
#define K_43 (amigo_model->pars[86])
#define K_44 (amigo_model->pars[87])
#define K_45 (amigo_model->pars[88])
#define K_46 (amigo_model->pars[89])
#define K_47 (amigo_model->pars[90])
#define K_48 (amigo_model->pars[91])
#define K_49 (amigo_model->pars[92])
#define K_50 (amigo_model->pars[93])
#define K_51 (amigo_model->pars[94])
#define K_52 (amigo_model->pars[95])
#define K_53 (amigo_model->pars[96])


#define P1 Ith(z,0)
#define dP1_dt Ith(zdot,0)
#define P2 Ith(z,1)
#define dP2_dt Ith(zdot,1)
#define P3 Ith(z,2)
#define dP3_dt Ith(zdot,2)
#define P4 Ith(z,3)
#define dP4_dt Ith(zdot,3)

#define P1cI Ith(z,4)
#define dP1cI_dt Ith(zdot,4)
#define P2tetR Ith(z,5)
#define dP2tetR_dt Ith(zdot,5)
#define P3araC Ith(z,6)
#define dP3araC_dt Ith(zdot,6)
#define P4lacI Ith(z,7)
#define dP4lacI_dt Ith(zdot,7)

#define cI Ith(z,8)
#define dcI_dt Ith(zdot,8)
#define tetR Ith(z,9)
#define dtetR_dt Ith(zdot,9)
#define araC Ith(z,10)
#define daraC_dt Ith(zdot,10)
#define lacI Ith(z,11)
#define dlacI_dt Ith(zdot,11)
#define luxI Ith(z,12)
#define dluxI_dt Ith(zdot,12)
#define luxR Ith(z,13)
#define dluxR_dt Ith(zdot,13)
#define lasI Ith(z,14)
#define dlasI_dt Ith(zdot,14)
#define lasR Ith(z,15)
#define dlasR_dt Ith(zdot,15)
#define ccdB Ith(z,16)
#define dccdB_dt Ith(zdot,16)
#define ccdA Ith(z,17)
#define dccdA_dt Ith(zdot,17)
#define ccdA2 Ith(z,18)
#define dccdA2_dt Ith(zdot,18)

#define cIm Ith(z,19)
#define dcIm_dt Ith(zdot,19)
#define tetRm Ith(z,20)
#define dtetRm_dt Ith(zdot,20)
#define araCm Ith(z,21)
#define daraCm_dt Ith(zdot,21)
#define lacIm Ith(z,22)
#define dlacIm_dt Ith(zdot,22)
#define luxIm Ith(z,23)
#define dluxIm_dt Ith(zdot,23)
#define luxRm Ith(z,24)
#define dluxRm_dt Ith(zdot,24)
#define lasIm Ith(z,25)
#define dlasIm_dt Ith(zdot,25)
#define lasRm Ith(z,26)
#define dlasRm_dt Ith(zdot,26)
#define ccdBm Ith(z,27)
#define dccdBm_dt Ith(zdot,27)
#define ccdAm Ith(z,28)
#define dccdAm_dt Ith(zdot,28)
#define ccdA2m Ith(z,29)
#define dccdA2m_dt Ith(zdot,29)


#define kf_pt_1 K_1
#define kf_pt_2 K_2
#define kf_pt_3 K_3
#define kf_pt_4 K_4

#define kb_pt_1 K_5
#define kb_pt_2 K_6
#define kb_pt_3 K_7
#define kb_pt_4 K_8

#define kdeg_pt_1 K_9 
#define kdeg_pt_2 K_10 
#define kdeg_pt_3 K_11 
#define kdeg_pt_4 K_12 

#define ktransc_1 K_13
#define ktransc_2 K_14
#define ktransc_3 K_15
#define ktransc_4 K_16

#define kleak_1 K_17
#define kleak_2 K_18
#define kleak_3 K_19
#define kleak_4 K_20

#define ktransl_1 K_21
#define ktransl_2 K_22
#define ktransl_3 K_23
#define ktransl_4 K_24
#define ktransl_5 K_25
#define ktransl_6 K_26
#define ktransl_7 K_27
#define ktransl_8 K_28
#define ktransl_9 K_29
#define ktransl_10 K_30
#define ktransl_11 K_31

#define kdeg_m_1 K_32
#define kdeg_m_2 K_33
#define kdeg_m_3 K_34
#define kdeg_m_4 K_35
#define kdeg_m_5 K_36
#define kdeg_m_6 K_37
#define kdeg_m_7 K_38
#define kdeg_m_8 K_39
#define kdeg_m_9 K_40
#define kdeg_m_10 K_41
#define kdeg_m_11 K_42

#define kdeg_1 K_43
#define kdeg_2 K_44
#define kdeg_3 K_45
#define kdeg_4 K_46
#define kdeg_5 K_47
#define kdeg_6 K_48
#define kdeg_7 K_49
#define kdeg_8 K_50
#define kdeg_9 K_51
#define kdeg_10 K_52
#define kdeg_11 K_53



int amigoRHS(realtype t, N_Vector z, N_Vector zdot, void *data){

AMIGO_model* amigo_model=(AMIGO_model*)data;

	double MAXROW, MAXCOL;

	double rf_pt_1=kf_pt_1*P1*cI;
	double rb_pt_1=kb_pt_1*P1cI;
	double rdeg_pt_1=kdeg_pt_1*P1cI;
	double rf_pt_2=kf_pt_2*P2*tetR;
	double rb_pt_2=kb_pt_2*P2tetR;
	double rdeg_pt_2=kdeg_pt_2*P2tetR;
	double rf_pt_3=kf_pt_3*P3*araC;
	double rb_pt_3=kb_pt_3*P3araC;
	double rdeg_pt_3=kdeg_pt_3*P3araC;
	double rf_pt_4=kf_pt_4*P4*lacI;
	double rb_pt_4=kb_pt_4*P4lacI;
	double rdeg_pt_4=kdeg_pt_4*P4lacI;

	double rtransc_1=ktransc_1*P1cI;
	double rleak_1=kleak_1*P1;
	double rtransc_2=ktransc_2*P2tetR;
	double rleak_2=kleak_2*P2;
	double rtransc_3=ktransc_3*P3araC;
	double rleak_3=kleak_3*P3;
	double rtransc_4=ktransc_4*P4lacI;
	double rleak_4=kleak_4*P4;

	double rtransl_1=ktransl_1*cIm;
	double rdeg_m_1=kdeg_m_1*cIm;
	double rdeg_1=kdeg_1*cI;
	double rtransl_2=ktransl_2*tetRm;
	double rdeg_m_2=kdeg_m_2*tetRm;
	double rdeg_2=kdeg_2*tetR;
	double rtransl_3=ktransl_3*araCm;
	double rdeg_m_3=kdeg_m_3*araCm;
	double rdeg_3=kdeg_3*araC;
	double rtransl_4=ktransl_4*lacIm;
	double rdeg_m_4=kdeg_m_4*lacIm;
	double rdeg_4=kdeg_4*lacI;
	double rtransl_5=ktransl_5*luxIm;
	double rdeg_m_5=kdeg_m_5*luxIm;
	double rdeg_5=kdeg_5*luxI;
	double rtransl_6=ktransl_6*luxRm;
	double rdeg_m_6=kdeg_m_6*luxRm;
	double rdeg_6=kdeg_6*luxR;
	double rtransl_7=ktransl_7*lasIm;
	double rdeg_m_7=kdeg_m_7*lasIm;
	double rdeg_7=kdeg_7*lasI;
	double rtransl_8=ktransl_8*lasRm;
	double rdeg_m_8=kdeg_m_8*lasRm;
	double rdeg_8=kdeg_8*lasR;
	double rtransl_9=ktransl_9*ccdBm;
	double rdeg_m_9=kdeg_m_9*ccdBm;
	double rdeg_9=kdeg_9*ccdB;
	double rtransl_10=ktransl_10*ccdAm;
	double rdeg_m_10=kdeg_m_10*ccdAm;
	double rdeg_10=kdeg_10*ccdA;
	double rtransl_11=ktransl_11*ccdA2m;
	double rdeg_m_11=kdeg_m_11*ccdA2m;
	double rdeg_11=kdeg_11*ccdA2;


	MAXROW=max(0,max(Y_1_1,max(Y_2_1,max(Y_3_1,max(Y_4_1,max(Y_5_1,max(Y_6_1,max(Y_7_1,max(Y_8_1,max(Y_9_1,max(Y_10_1,max(Y_11_1,0))))))))))));
	dP1_dt  = - MAXROW * rf_pt_1  + MAXROW * rb_pt_1 + MAXROW * rdeg_pt_1;
	dP1cI_dt= + MAXROW * rf_pt_1  - MAXROW * rb_pt_1 - MAXROW * rdeg_pt_1;

	MAXROW=max(0,max(Y_1_2,max(Y_2_2,max(Y_3_2,max(Y_4_2,max(Y_5_2,max(Y_6_2,max(Y_7_2,max(Y_8_2,max(Y_9_2,max(Y_10_2,max(Y_11_2,0))))))))))));
	dP2_dt  = - MAXROW * rf_pt_2  + MAXROW * rb_pt_2 + MAXROW * rdeg_pt_2;
	dP2tetR_dt= + MAXROW * rf_pt_2  - MAXROW * rb_pt_2 - MAXROW * rdeg_pt_2;

	MAXROW=max(0,max(Y_1_3,max(Y_2_3,max(Y_3_3,max(Y_4_3,max(Y_5_3,max(Y_6_3,max(Y_7_3,max(Y_8_3,max(Y_9_3,max(Y_10_3,max(Y_11_3,0))))))))))));
	dP3_dt  = - MAXROW * rf_pt_3  + MAXROW * rb_pt_3 + MAXROW * rdeg_pt_3;
	dP3araC_dt= + MAXROW * rf_pt_3  - MAXROW * rb_pt_3 - MAXROW * rdeg_pt_3;

	MAXROW=max(0,max(Y_1_4,max(Y_2_4,max(Y_3_4,max(Y_4_4,max(Y_5_4,max(Y_6_4,max(Y_7_4,max(Y_8_4,max(Y_9_4,max(Y_10_4,max(Y_11_4,0))))))))))));
	dP4_dt  = - MAXROW * rf_pt_4  + MAXROW * rb_pt_4 + MAXROW * rdeg_pt_4;
	dP4lacI_dt= + MAXROW * rf_pt_4  - MAXROW * rb_pt_4 - MAXROW * rdeg_pt_4;



	MAXROW=max(0,max(Y_1_1,max(Y_2_1,max(Y_3_1,max(Y_4_1,max(Y_5_1,max(Y_6_1,max(Y_7_1,max(Y_8_1,max(Y_9_1,max(Y_10_1,max(Y_11_1,0))))))))))));
	MAXCOL=max(0,max(Y_1_1,max(Y_1_2,max(Y_1_3,max(Y_1_4,0)))));
	dcI_dt= - MAXROW * rf_pt_1 + MAXROW * rb_pt_1+ MAXCOL * rtransl_1 - MAXCOL * rdeg_1;

	dcIm_dt=- MAXCOL * rdeg_m_1 
		 + Y_1_1 * rtransc_1 + Y_1_1 * rleak_1
		 + Y_1_2 * rtransc_2 + Y_1_2 * rleak_2
		 + Y_1_3 * rtransc_3 + Y_1_3 * rleak_3
		 + Y_1_4 * rtransc_4 + Y_1_4 * rleak_4
;


	MAXROW=max(0,max(Y_1_2,max(Y_2_2,max(Y_3_2,max(Y_4_2,max(Y_5_2,max(Y_6_2,max(Y_7_2,max(Y_8_2,max(Y_9_2,max(Y_10_2,max(Y_11_2,0))))))))))));
	MAXCOL=max(0,max(Y_2_1,max(Y_2_2,max(Y_2_3,max(Y_2_4,0)))));
	dtetR_dt= - MAXROW * rf_pt_2 + MAXROW * rb_pt_2+ MAXCOL * rtransl_2 - MAXCOL * rdeg_2;

	dtetRm_dt=- MAXCOL * rdeg_m_2 
		 + Y_2_1 * rtransc_1 + Y_2_1 * rleak_1
		 + Y_2_2 * rtransc_2 + Y_2_2 * rleak_2
		 + Y_2_3 * rtransc_3 + Y_2_3 * rleak_3
		 + Y_2_4 * rtransc_4 + Y_2_4 * rleak_4
;


	MAXROW=max(0,max(Y_1_3,max(Y_2_3,max(Y_3_3,max(Y_4_3,max(Y_5_3,max(Y_6_3,max(Y_7_3,max(Y_8_3,max(Y_9_3,max(Y_10_3,max(Y_11_3,0))))))))))));
	MAXCOL=max(0,max(Y_3_1,max(Y_3_2,max(Y_3_3,max(Y_3_4,0)))));
	daraC_dt= - MAXROW * rf_pt_3 + MAXROW * rb_pt_3+ MAXCOL * rtransl_3 - MAXCOL * rdeg_3;

	daraCm_dt=- MAXCOL * rdeg_m_3 
		 + Y_3_1 * rtransc_1 + Y_3_1 * rleak_1
		 + Y_3_2 * rtransc_2 + Y_3_2 * rleak_2
		 + Y_3_3 * rtransc_3 + Y_3_3 * rleak_3
		 + Y_3_4 * rtransc_4 + Y_3_4 * rleak_4
;


	MAXROW=max(0,max(Y_1_4,max(Y_2_4,max(Y_3_4,max(Y_4_4,max(Y_5_4,max(Y_6_4,max(Y_7_4,max(Y_8_4,max(Y_9_4,max(Y_10_4,max(Y_11_4,0))))))))))));
	MAXCOL=max(0,max(Y_4_1,max(Y_4_2,max(Y_4_3,max(Y_4_4,0)))));
	dlacI_dt= - MAXROW * rf_pt_4 + MAXROW * rb_pt_4+ MAXCOL * rtransl_4 - MAXCOL * rdeg_4;

	dlacIm_dt=- MAXCOL * rdeg_m_4 
		 + Y_4_1 * rtransc_1 + Y_4_1 * rleak_1
		 + Y_4_2 * rtransc_2 + Y_4_2 * rleak_2
		 + Y_4_3 * rtransc_3 + Y_4_3 * rleak_3
		 + Y_4_4 * rtransc_4 + Y_4_4 * rleak_4
;


	MAXCOL=max(0,max(Y_5_1,max(Y_5_2,max(Y_5_3,max(Y_5_4,0)))));
	dluxI_dt=MAXCOL * rtransl_5 - MAXCOL * rdeg_5;

	dluxIm_dt=- MAXCOL * rdeg_m_5 
		 + Y_5_1 * rtransc_1 + Y_5_1 * rleak_1
		 + Y_5_2 * rtransc_2 + Y_5_2 * rleak_2
		 + Y_5_3 * rtransc_3 + Y_5_3 * rleak_3
		 + Y_5_4 * rtransc_4 + Y_5_4 * rleak_4
;


	MAXCOL=max(0,max(Y_6_1,max(Y_6_2,max(Y_6_3,max(Y_6_4,0)))));
	dluxR_dt=MAXCOL * rtransl_6 - MAXCOL * rdeg_6;

	dluxRm_dt=- MAXCOL * rdeg_m_6 
		 + Y_6_1 * rtransc_1 + Y_6_1 * rleak_1
		 + Y_6_2 * rtransc_2 + Y_6_2 * rleak_2
		 + Y_6_3 * rtransc_3 + Y_6_3 * rleak_3
		 + Y_6_4 * rtransc_4 + Y_6_4 * rleak_4
;


	MAXCOL=max(0,max(Y_7_1,max(Y_7_2,max(Y_7_3,max(Y_7_4,0)))));
	dlasI_dt=MAXCOL * rtransl_7 - MAXCOL * rdeg_7;

	dlasIm_dt=- MAXCOL * rdeg_m_7 
		 + Y_7_1 * rtransc_1 + Y_7_1 * rleak_1
		 + Y_7_2 * rtransc_2 + Y_7_2 * rleak_2
		 + Y_7_3 * rtransc_3 + Y_7_3 * rleak_3
		 + Y_7_4 * rtransc_4 + Y_7_4 * rleak_4
;


	MAXCOL=max(0,max(Y_8_1,max(Y_8_2,max(Y_8_3,max(Y_8_4,0)))));
	dlasR_dt=MAXCOL * rtransl_8 - MAXCOL * rdeg_8;

	dlasRm_dt=- MAXCOL * rdeg_m_8 
		 + Y_8_1 * rtransc_1 + Y_8_1 * rleak_1
		 + Y_8_2 * rtransc_2 + Y_8_2 * rleak_2
		 + Y_8_3 * rtransc_3 + Y_8_3 * rleak_3
		 + Y_8_4 * rtransc_4 + Y_8_4 * rleak_4
;


	MAXCOL=max(0,max(Y_9_1,max(Y_9_2,max(Y_9_3,max(Y_9_4,0)))));
	dccdB_dt=MAXCOL * rtransl_9 - MAXCOL * rdeg_9;

	dccdBm_dt=- MAXCOL * rdeg_m_9 
		 + Y_9_1 * rtransc_1 + Y_9_1 * rleak_1
		 + Y_9_2 * rtransc_2 + Y_9_2 * rleak_2
		 + Y_9_3 * rtransc_3 + Y_9_3 * rleak_3
		 + Y_9_4 * rtransc_4 + Y_9_4 * rleak_4
;


	MAXCOL=max(0,max(Y_10_1,max(Y_10_2,max(Y_10_3,max(Y_10_4,0)))));
	dccdA_dt=MAXCOL * rtransl_10 - MAXCOL * rdeg_10;

	dccdAm_dt=- MAXCOL * rdeg_m_10 
		 + Y_10_1 * rtransc_1 + Y_10_1 * rleak_1
		 + Y_10_2 * rtransc_2 + Y_10_2 * rleak_2
		 + Y_10_3 * rtransc_3 + Y_10_3 * rleak_3
		 + Y_10_4 * rtransc_4 + Y_10_4 * rleak_4
;


	MAXCOL=max(0,max(Y_11_1,max(Y_11_2,max(Y_11_3,max(Y_11_4,0)))));
	dccdA2_dt=MAXCOL * rtransl_11 - MAXCOL * rdeg_11;

	dccdA2m_dt=- MAXCOL * rdeg_m_11 
		 + Y_11_1 * rtransc_1 + Y_11_1 * rleak_1
		 + Y_11_2 * rtransc_2 + Y_11_2 * rleak_2
		 + Y_11_3 * rtransc_3 + Y_11_3 * rleak_3
		 + Y_11_4 * rtransc_4 + Y_11_4 * rleak_4
;


return(0);
}

void amigoRHS_get_OBS(void* data){

}

void amigoRHS_get_sens_OBS(void* data){

}

void amigo_Y_at_tcon(void* data, realtype t, N_Vector y){

}


