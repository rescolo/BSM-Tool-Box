OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {6,TanBeta} };

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {MHD2,MHU2};

BoundaryLowScaleInput={
 {Lambda1,Lambda1IN},
 {Lambda2,Lambda2IN},
 {Lambda3,Lambda3IN},
 {Lambda4,Lambda4IN},
 {Lambda5,Lambda5IN}
};




ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hpm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};




