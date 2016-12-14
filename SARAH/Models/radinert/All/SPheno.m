OnlyLowEnergySPheno = True;


MINPAR={{1,lambda1Input},
        {2,lambda2Input},
        {3,lambda3Input},
        {4,lambda4Input},
        {5,lambda5Input},
	{6,lambda6Input},
        {7,lambda7Input},
        {8,lambda8Input},
        {9,mEt2Input},
        {10,mu3Input},
        {11,muInput},
        (* Fermions *)
	{12,MSFIN},
	{13,LamSHIN},
        {14,LamSIN},
        {15,MS2Input},
	{13,LamScHIN},
        {14,LamScIN},
        {15,MSc2Input},
	{16,PiuInput},
	{17,PidInput},
	{YR3,YR3Input},
	{YR4,YR4Input}
       };


ParametersToSolveTadpoles = {mH2};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {lambda1,lambda1Input}, 
 {lambda2,lambda2Input},
 {lambda3,lambda3Input},
 {lambda4,lambda4Input},
 {lambda5,lambda5Input},
 {lambda6,lambda6Input}, 
 {lambda7,lambda7Input},
 {lambda8,lambda8Input},
 {mEt2,mEt2Input},
 {mu3,mu3Input},
 {mu,muInput},
 {MSF, MSFIN},   
 {Yn,LHInput[Yn]},
 {MTF,LHInput[MTF]},
 {MDF,LHInput[MDF]},
 {Y3,LHInput[Y3]},
 {Yf,LHInput[Yf]},
 {YR1,LHInput[YR1]},
 (*A and D must be moved from here to MINPAR and just add:
 {A,MDFInput},
 {B,MTFInput}
 In this way the could be initialized with DefaultInputValues
  *)   
 {A,LHInput[A]},
 {B,LHInput[B]},
 {Ys,LHInput[Ys]},
 {Yfr,LHInput[Yfr]},
 {Yet,LHInput[Yet]},
 {LamSH,LamSHIN},
 {LamS,LamSIN},   
 {MS2, MS2Input},
 {LamScH,LamScHIN},
 {LamSc,LamScIN},   
 {MSc2, MSc2Input},
 {Piu,PiuInput},
 {Pid,PidInput},
 {YR3,YR3Input},
 {YR4,YR4Input}  
};

ListDecayParticles = {Fu,Fd,Fe,Fv,Chi,Nv,hh,XO,etI,XP};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"},{Fe,"Fe.f90"},
		        {Nv,"Nv.f90"},{Chi,"Chi.f90"},{hh,"hh.f90"}};


DefaultInputValues ={lambda1Input -> 0.274, lambda2Input -> 0.1,  lambda3Input -> 0.,
		     lambda4Input -> 0.,    lambda5Input -> 0.01, lambda6Input -> 0.1,
		     lambda7Input -> 1*^-3,  lambda8Input -> 0.1,
		     mEt2Input -> 1*^4, mu3Input -> 3.135715*^5, muInput -> 0.0, MSFIN -> 200,
	     LamSHIN -> 0., LamSIN -> 0, MS2Input -> 200^2,
	     LamScHIN -> 0., LamScIN -> 0, MSc2Input -> 200^2, PiuInput->1*^-7, PidInput->1*^-7,
	     YR3->1*^-7,YR4->1*^-7,
		     Yf[a_] -> 1*^-8,Y3[a_] -> 1*^-8, Yn[a_] -> 1*^-7,
		    Ys[a_] -> 1*^-7,Yfr[a_] -> 1*^-7,Yet[a_] -> 1*^-7,YR1[a_]->1*^-7};
