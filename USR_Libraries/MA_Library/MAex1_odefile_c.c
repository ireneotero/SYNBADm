#include <amigoRHS.h>
#include <math.h>
#include <amigoJAC.h>
#include <amigoSensRHS.h>

#define n_Transcripts 4
#define n_Promoters 3

#define Y_1_1 (amigo_model->pars[0])
#define Y_1_2 (amigo_model->pars[1])
#define Y_1_3 (amigo_model->pars[2])
#define Y_2_1 (amigo_model->pars[3])
#define Y_2_2 (amigo_model->pars[4])
#define Y_2_3 (amigo_model->pars[5])
#define Y_3_1 (amigo_model->pars[6])
#define Y_3_2 (amigo_model->pars[7])
#define Y_3_3 (amigo_model->pars[8])
#define Y_4_1 (amigo_model->pars[9])
#define Y_4_2 (amigo_model->pars[10])
#define Y_4_3 (amigo_model->pars[11])

#define K_1 (amigo_model->pars[12])
#define K_2 (amigo_model->pars[13])
#define K_3 (amigo_model->pars[14])
#define K_4 (amigo_model->pars[15])
#define K_5 (amigo_model->pars[16])
#define K_6 (amigo_model->pars[17])
#define K_7 (amigo_model->pars[18])
#define K_8 (amigo_model->pars[19])
#define K_9 (amigo_model->pars[20])
#define K_10 (amigo_model->pars[21])
#define K_11 (amigo_model->pars[22])
#define K_12 (amigo_model->pars[23])
#define K_13 (amigo_model->pars[24])
#define K_14 (amigo_model->pars[25])
#define K_15 (amigo_model->pars[26])
#define K_16 (amigo_model->pars[27])
#define K_17 (amigo_model->pars[28])
#define K_18 (amigo_model->pars[29])
#define K_19 (amigo_model->pars[30])
#define K_20 (amigo_model->pars[31])
#define K_21 (amigo_model->pars[32])
#define K_22 (amigo_model->pars[33])
#define K_23 (amigo_model->pars[34])
#define K_24 (amigo_model->pars[35])
#define K_25 (amigo_model->pars[36])
#define K_26 (amigo_model->pars[37])
#define K_27 (amigo_model->pars[38])


#define P1 Ith(z,0)
#define dP1_dt Ith(zdot,0)
#define P2 Ith(z,1)
#define dP2_dt Ith(zdot,1)
#define P3 Ith(z,2)
#define dP3_dt Ith(zdot,2)

#define P1cI Ith(z,3)
#define dP1cI_dt Ith(zdot,3)
#define P2tetR Ith(z,4)
#define dP2tetR_dt Ith(zdot,4)
#define P3lacI Ith(z,5)
#define dP3lacI_dt Ith(zdot,5)

#define cI Ith(z,6)
#define dcI_dt Ith(zdot,6)
#define tetR Ith(z,7)
#define dtetR_dt Ith(zdot,7)
#define lacI Ith(z,8)
#define dlacI_dt Ith(zdot,8)
#define luxI Ith(z,9)
#define dluxI_dt Ith(zdot,9)

#define cIm Ith(z,10)
#define dcIm_dt Ith(zdot,10)
#define tetRm Ith(z,11)
#define dtetRm_dt Ith(zdot,11)
#define lacIm Ith(z,12)
#define dlacIm_dt Ith(zdot,12)
#define luxIm Ith(z,13)
#define dluxIm_dt Ith(zdot,13)


#define kf_pt_1 K_1
#define kf_pt_2 K_2
#define kf_pt_3 K_3

#define kb_pt_1 K_4
#define kb_pt_2 K_5
#define kb_pt_3 K_6

#define kdeg_pt_1 K_7 
#define kdeg_pt_2 K_8 
#define kdeg_pt_3 K_9 

#define ktransc_1 K_10
#define ktransc_2 K_11
#define ktransc_3 K_12

#define kleak_1 K_13
#define kleak_2 K_14
#define kleak_3 K_15

#define ktransl_1 K_16
#define ktransl_2 K_17
#define ktransl_3 K_18
#define ktransl_4 K_19

#define kdeg_m_1 K_20
#define kdeg_m_2 K_21
#define kdeg_m_3 K_22
#define kdeg_m_4 K_23

#define kdeg_1 K_24
#define kdeg_2 K_25
#define kdeg_3 K_26
#define kdeg_4 K_27



int amigoRHS(realtype t, N_Vector z, N_Vector zdot, void *data){

AMIGO_model* amigo_model=(AMIGO_model*)data;

	double MAXROW, MAXCOL;

	double rf_pt_1=kf_pt_1*P1*cI;
	double rb_pt_1=kb_pt_1*P1cI;
	double rdeg_pt_1=kdeg_pt_1*P1cI;
	double rf_pt_2=kf_pt_2*P2*tetR;
	double rb_pt_2=kb_pt_2*P2tetR;
	double rdeg_pt_2=kdeg_pt_2*P2tetR;
	double rf_pt_3=kf_pt_3*P3*lacI;
	double rb_pt_3=kb_pt_3*P3lacI;
	double rdeg_pt_3=kdeg_pt_3*P3lacI;

	double rtransc_1=ktransc_1*P1cI;
	double rleak_1=kleak_1*P1;
	double rtransc_2=ktransc_2*P2tetR;
	double rleak_2=kleak_2*P2;
	double rtransc_3=ktransc_3*P3lacI;
	double rleak_3=kleak_3*P3;

	double rtransl_1=ktransl_1*cIm;
	double rdeg_m_1=kdeg_m_1*cIm;
	double rdeg_1=kdeg_1*cI;
	double rtransl_2=ktransl_2*tetRm;
	double rdeg_m_2=kdeg_m_2*tetRm;
	double rdeg_2=kdeg_2*tetR;
	double rtransl_3=ktransl_3*lacIm;
	double rdeg_m_3=kdeg_m_3*lacIm;
	double rdeg_3=kdeg_3*lacI;
	double rtransl_4=ktransl_4*luxIm;
	double rdeg_m_4=kdeg_m_4*luxIm;
	double rdeg_4=kdeg_4*luxI;


	MAXROW=max(0,max(Y_1_1,max(Y_2_1,max(Y_3_1,max(Y_4_1,0)))));
	dP1_dt  = - MAXROW * rf_pt_1  + MAXROW * rb_pt_1 + MAXROW * rdeg_pt_1;
	dP1cI_dt= + MAXROW * rf_pt_1  - MAXROW * rb_pt_1 - MAXROW * rdeg_pt_1;

	MAXROW=max(0,max(Y_1_2,max(Y_2_2,max(Y_3_2,max(Y_4_2,0)))));
	dP2_dt  = - MAXROW * rf_pt_2  + MAXROW * rb_pt_2 + MAXROW * rdeg_pt_2;
	dP2tetR_dt= + MAXROW * rf_pt_2  - MAXROW * rb_pt_2 - MAXROW * rdeg_pt_2;

	MAXROW=max(0,max(Y_1_3,max(Y_2_3,max(Y_3_3,max(Y_4_3,0)))));
	dP3_dt  = - MAXROW * rf_pt_3  + MAXROW * rb_pt_3 + MAXROW * rdeg_pt_3;
	dP3lacI_dt= + MAXROW * rf_pt_3  - MAXROW * rb_pt_3 - MAXROW * rdeg_pt_3;



	MAXROW=max(0,max(Y_1_1,max(Y_2_1,max(Y_3_1,max(Y_4_1,0)))));
	MAXCOL=max(0,max(Y_1_1,max(Y_1_2,max(Y_1_3,0))));
	dcI_dt= - MAXROW * rf_pt_1 + MAXROW * rb_pt_1+ MAXCOL * rtransl_1 - MAXCOL * rdeg_1;

	dcIm_dt=- MAXCOL * rdeg_m_1 
		 + Y_1_1 * rtransc_1 + Y_1_1 * rleak_1
		 + Y_1_2 * rtransc_2 + Y_1_2 * rleak_2
		 + Y_1_3 * rtransc_3 + Y_1_3 * rleak_3
;


	MAXROW=max(0,max(Y_1_2,max(Y_2_2,max(Y_3_2,max(Y_4_2,0)))));
	MAXCOL=max(0,max(Y_2_1,max(Y_2_2,max(Y_2_3,0))));
	dtetR_dt= - MAXROW * rf_pt_2 + MAXROW * rb_pt_2+ MAXCOL * rtransl_2 - MAXCOL * rdeg_2;

	dtetRm_dt=- MAXCOL * rdeg_m_2 
		 + Y_2_1 * rtransc_1 + Y_2_1 * rleak_1
		 + Y_2_2 * rtransc_2 + Y_2_2 * rleak_2
		 + Y_2_3 * rtransc_3 + Y_2_3 * rleak_3
;


	MAXROW=max(0,max(Y_1_3,max(Y_2_3,max(Y_3_3,max(Y_4_3,0)))));
	MAXCOL=max(0,max(Y_3_1,max(Y_3_2,max(Y_3_3,0))));
	dlacI_dt= - MAXROW * rf_pt_3 + MAXROW * rb_pt_3+ MAXCOL * rtransl_3 - MAXCOL * rdeg_3;

	dlacIm_dt=- MAXCOL * rdeg_m_3 
		 + Y_3_1 * rtransc_1 + Y_3_1 * rleak_1
		 + Y_3_2 * rtransc_2 + Y_3_2 * rleak_2
		 + Y_3_3 * rtransc_3 + Y_3_3 * rleak_3
;


	MAXCOL=max(0,max(Y_4_1,max(Y_4_2,max(Y_4_3,0))));
	dluxI_dt=MAXCOL * rtransl_4 - MAXCOL * rdeg_4;

	dluxIm_dt=- MAXCOL * rdeg_m_4 
		 + Y_4_1 * rtransc_1 + Y_4_1 * rleak_1
		 + Y_4_2 * rtransc_2 + Y_4_2 * rleak_2
		 + Y_4_3 * rtransc_3 + Y_4_3 * rleak_3
;


return(0);
}

void amigoRHS_get_OBS(void* data){

}

void amigoRHS_get_sens_OBS(void* data){

}

void amigo_Y_at_tcon(void* data, realtype t, N_Vector y){

}


