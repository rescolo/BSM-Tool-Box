MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,Muinput}};


EXTPAR = {
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input}
   };
   
RealParameters = {TanBeta,m0,vL1input,vL2input,vL3input};

ParametersToSolveTadpoles ={mlHd2,\[Mu], B[\[Mu]]};  
(* ParametersToSolveTadpoles ={B[\[Epsilon]],mHd2,mHu2};  *)

(* ParametersToSolveTadpoles ={B[\[Epsilon]], \[Mu], B[\[Mu]] }; *)

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
(* {mlHd2,0}, *)
{mHd2,m0^2},
{mHu2,m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundarySUSYScale = {
{\[Epsilon], LHInput[\[Epsilon]]},
{B[\[Epsilon]], LHInput[B[\[Epsilon]]]},
(* {\[Mu],Muinput},
{B[\[Mu]],BmuInput},  *)
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
