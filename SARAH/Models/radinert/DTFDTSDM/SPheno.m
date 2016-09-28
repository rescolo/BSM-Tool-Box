OnlyLowEnergySPheno = True;


MINPAR={
        {1,lambda1Input},
        {2,lambda2Input},
        {3,lambda3Input},
        {4,lambda4Input},
        {5,lambda5Input},
	{6,lambda6Input},
        {7,lambda7Input},
        {8,lambda8Input},
        {9,mEt2Input},
        {10,mu3Input},
        {11,muInput}
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
 {Yn,LHInput[Yn]},
 {MTF,LHInput[MTF]},
 {MDF,LHInput[MDF]},
 {Y3,LHInput[Y3]},
 {Yf,LHInput[Yf]},
 {A,LHInput[A]},
 {B,LHInput[B]}
};

ListDecayParticles = {Fu,Fd,Fe,Fv,Chi,Nv,hh,XO,etI,XP};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"},{Fe,"Fe.f90"}};


