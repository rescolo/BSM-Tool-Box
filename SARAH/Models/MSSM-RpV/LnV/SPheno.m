MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,Bzero},
        {7,Muinput}};

EXTPAR = {
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input}
   };
   
RealParameters = {TanBeta,m0};

(* ParametersToSolveTadpoles ={mlHd2,\[Mu], B[\[Mu]]}; *)
ParametersToSolveTadpoles ={B[\[Epsilon]],mHd2,mHu2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{B[\[Mu]],BZero*\[Mu]},
{L1,LHInput[L1]},
{L2,LHInput[L2]},
{T[L1],Azero*L1},
{T[L2],Azero*L2},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mlHd2,0},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundarySUSYScale = {
{\[Epsilon], LHInput[\[Epsilon]]},
{\[Mu],Muinput},
{vL[1], vL1Input},  
{vL[2], vL2Input},  
{vL[3], vL3Input}
};

InitializationValues = {
 {B[\[Epsilon]],0},
 {\[Mu],0},
 {B[\[Mu]],0},
 {mlHd2,0}
};

QuadruplePrecision = {Chi};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

SetOptions[ModelOutput,TwoLoopRGEs->False];
