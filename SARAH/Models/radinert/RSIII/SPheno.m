OnlyLowEnergySPheno = True;

MINPAR={
    {1,lambda1Input},
    {2,lambda2Input},
    {3,lambda3Input},
    {4,lambda4Input},
    {5,lambda5Input},
    {6,mEt2Input}(*,
    {7, MTFINPUT}*)
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
 {mEt2,mEt2Input},
 {MTF, LHInput[MTF]},
 {Yn, LHInput[Yn]}
};

ListDecayParticles = {Fu,Fe,Fd,Fv,VZ,VWp,hh,etR,etI,etp,Ft0,Ftc};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}, {Ft0,"Ft0.f90"}, {Ftc,"Ftc.f90"}};

DefaultInputValues ={
    lambda1Input -> 0.13,
    lambda2Input -> 0.,
    lambda3Input -> 0.,
    lambda4Input -> 0.,
    lambda5Input -> -1*^-5,
    mEt2Input -> 1*^4,
    MTF[a_,a_] -> 1000,
    Yn[a_,a_] -> 1*^-5
    };
