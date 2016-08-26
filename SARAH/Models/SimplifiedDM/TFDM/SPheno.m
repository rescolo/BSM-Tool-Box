OnlyLowEnergySPheno = True;

MINPAR={{1,LambdaIN},
        {2, MTFINPUT}};


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {\[Lambda],LambdaIN},
 {MTF, MTFInput}
 (*{MTF,LHInput[MTF]}*)
};

ListDecayParticles = {Fu,Fe,Fd,hh, Ft0, Ftc};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}, {Ft0,"Ft0.f90"}, {Ftc,"Ftc.f90"}};

DefaultInputValues ={LambdaIN -> 0.255};
