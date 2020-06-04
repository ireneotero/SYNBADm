#include <amigoRHS.h>
#include <math.h>
#include <amigoJAC.h>
#include <amigoSensRHS.h>

#define n_Transcripts 4
#define n_Promoters 8

#define tetR Ith(z,0)
#define dtetR_dt Ith(zdot,0)
#define lacI Ith(z,1)
#define dlacI_dt Ith(zdot,1)
#define cI Ith(z,2)
#define dcI_dt Ith(zdot,2)
#define araC Ith(z,3)
#define daraC_dt Ith(zdot,3)

#define lacIIPTG Ith(z,4)
#define dlacIIPTG_dt Ith(zdot,4)
#define tetRaTc Ith(z,5)
#define dtetRaTc_dt Ith(zdot,5)

#define Y_1_1 (amigo_model->pars[0])
#define Y_1_2 (amigo_model->pars[1])
#define Y_1_3 (amigo_model->pars[2])
#define Y_1_4 (amigo_model->pars[3])
#define Y_1_5 (amigo_model->pars[4])
#define Y_1_6 (amigo_model->pars[5])
#define Y_1_7 (amigo_model->pars[6])
#define Y_1_8 (amigo_model->pars[7])
#define Y_2_1 (amigo_model->pars[8])
#define Y_2_2 (amigo_model->pars[9])
#define Y_2_3 (amigo_model->pars[10])
#define Y_2_4 (amigo_model->pars[11])
#define Y_2_5 (amigo_model->pars[12])
#define Y_2_6 (amigo_model->pars[13])
#define Y_2_7 (amigo_model->pars[14])
#define Y_2_8 (amigo_model->pars[15])
#define Y_3_1 (amigo_model->pars[16])
#define Y_3_2 (amigo_model->pars[17])
#define Y_3_3 (amigo_model->pars[18])
#define Y_3_4 (amigo_model->pars[19])
#define Y_3_5 (amigo_model->pars[20])
#define Y_3_6 (amigo_model->pars[21])
#define Y_3_7 (amigo_model->pars[22])
#define Y_3_8 (amigo_model->pars[23])
#define Y_4_1 (amigo_model->pars[24])
#define Y_4_2 (amigo_model->pars[25])
#define Y_4_3 (amigo_model->pars[26])
#define Y_4_4 (amigo_model->pars[27])
#define Y_4_5 (amigo_model->pars[28])
#define Y_4_6 (amigo_model->pars[29])
#define Y_4_7 (amigo_model->pars[30])
#define Y_4_8 (amigo_model->pars[31])
#define IPTG (amigo_model->pars[32])
#define aTc (amigo_model->pars[33])

#define K_Plac1 (amigo_model->pars[34]) 
#define K_Plac2 (amigo_model->pars[35]) 
#define K_Plac3 (amigo_model->pars[36]) 
#define K_Plac4 (amigo_model->pars[37]) 
#define K_Plambda (amigo_model->pars[38]) 
#define K_Ptet1 (amigo_model->pars[39]) 
#define K_Ptet2 (amigo_model->pars[40]) 
#define K_ParaC (amigo_model->pars[41]) 

#define alpha_tetR (amigo_model->pars[42])
#define alpha_lacI (amigo_model->pars[43])
#define alpha_cI (amigo_model->pars[44])
#define alpha_araC (amigo_model->pars[45])

#define kdeg_tetR (amigo_model->pars[46])
#define kdeg_lacI (amigo_model->pars[47])
#define kdeg_cI (amigo_model->pars[48])
#define kdeg_araC (amigo_model->pars[49])

#define kf_lacIIPTG (amigo_model->pars[50])
#define kf_tetRaTc (amigo_model->pars[51])

#define kb_lacIIPTG (amigo_model->pars[52])
#define kb_tetRaTc (amigo_model->pars[53])

#define kdeg_lacIIPTG (amigo_model->pars[54])
#define kdeg_tetRaTc (amigo_model->pars[55])

int amigoRHS(realtype t, N_Vector z, N_Vector zdot, void *data){

AMIGO_model* amigo_model=(AMIGO_model*)data;

dtetR_dt= Y_1_1*alpha_lacI/(1+K_Plac1*pow(lacI,4)) 
			+Y_1_2*alpha_lacI/(1+K_Plac2*pow(lacI,4)) 
			+Y_1_3*alpha_lacI/(1+K_Plac3*pow(lacI,4)) 
			+Y_1_4*alpha_lacI/(1+K_Plac4*pow(lacI,4)) 
			+Y_1_5*alpha_cI/(1+K_Plambda*pow(cI,2)) 
			+Y_1_6*alpha_tetR/(1+K_Ptet1*pow(tetR,2)) 
			+Y_1_7*alpha_tetR/(1+K_Ptet2*pow(tetR,2)) 
			+Y_1_8*alpha_araC/(1+K_ParaC*pow(araC,2)) 
			-kf_tetRaTc*tetR*aTc 
			+kb_tetRaTc*tetRaTc 
			-kdeg_tetR*tetR;
dlacI_dt= Y_2_1*alpha_lacI/(1+K_Plac1*pow(lacI,4)) 
			+Y_2_2*alpha_lacI/(1+K_Plac2*pow(lacI,4)) 
			+Y_2_3*alpha_lacI/(1+K_Plac3*pow(lacI,4)) 
			+Y_2_4*alpha_lacI/(1+K_Plac4*pow(lacI,4)) 
			+Y_2_5*alpha_cI/(1+K_Plambda*pow(cI,2)) 
			+Y_2_6*alpha_tetR/(1+K_Ptet1*pow(tetR,2)) 
			+Y_2_7*alpha_tetR/(1+K_Ptet2*pow(tetR,2)) 
			+Y_2_8*alpha_araC/(1+K_ParaC*pow(araC,2)) 
			-kf_lacIIPTG*lacI*IPTG 
			+kb_lacIIPTG*lacIIPTG 
			-kdeg_lacI*lacI;
dcI_dt= Y_3_1*alpha_lacI/(1+K_Plac1*pow(lacI,4)) 
			+Y_3_2*alpha_lacI/(1+K_Plac2*pow(lacI,4)) 
			+Y_3_3*alpha_lacI/(1+K_Plac3*pow(lacI,4)) 
			+Y_3_4*alpha_lacI/(1+K_Plac4*pow(lacI,4)) 
			+Y_3_5*alpha_cI/(1+K_Plambda*pow(cI,2)) 
			+Y_3_6*alpha_tetR/(1+K_Ptet1*pow(tetR,2)) 
			+Y_3_7*alpha_tetR/(1+K_Ptet2*pow(tetR,2)) 
			+Y_3_8*alpha_araC/(1+K_ParaC*pow(araC,2)) 
			-kdeg_cI*cI;
daraC_dt= Y_4_1*alpha_lacI/(1+K_Plac1*pow(lacI,4)) 
			+Y_4_2*alpha_lacI/(1+K_Plac2*pow(lacI,4)) 
			+Y_4_3*alpha_lacI/(1+K_Plac3*pow(lacI,4)) 
			+Y_4_4*alpha_lacI/(1+K_Plac4*pow(lacI,4)) 
			+Y_4_5*alpha_cI/(1+K_Plambda*pow(cI,2)) 
			+Y_4_6*alpha_tetR/(1+K_Ptet1*pow(tetR,2)) 
			+Y_4_7*alpha_tetR/(1+K_Ptet2*pow(tetR,2)) 
			+Y_4_8*alpha_araC/(1+K_ParaC*pow(araC,2)) 
			-kdeg_araC*araC;
dlacIIPTG_dt= kf_lacIIPTG*lacI*IPTG 
			 -kb_lacIIPTG*lacIIPTG 
			 -kdeg_lacIIPTG*lacIIPTG;
dtetRaTc_dt= kf_tetRaTc*tetR*aTc 
			 -kb_tetRaTc*tetRaTc 
			 -kdeg_tetRaTc*tetRaTc;
return(0);
}

void amigoRHS_get_OBS(void* data){

}

void amigoRHS_get_sens_OBS(void* data){

}

void amigo_Y_at_tcon(void* data, realtype t, N_Vector y){

}


