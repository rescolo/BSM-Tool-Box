OnlyLowEnergySPheno = True;


MINPAR={
        {1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {6,TanBeta} };


ParametersToSolveTadpoles = {MHD,MHU};
RealParameters = {TanBeta};

BoundaryLowScaleInput={
(* {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}, *)
 {Lambda1,Lambda1IN},
 {Lambda2,Lambda2IN},
 {Lambda3,Lambda3IN},
 {Lambda5,Lambda5IN} 
};

ListDecayParticles = {Fu,Fe,Fd,hh,H0,A0,Hpm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



