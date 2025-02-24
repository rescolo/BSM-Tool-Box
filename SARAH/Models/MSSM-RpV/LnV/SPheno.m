MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMue},
        {5,Azero} };


RealParameters = {TanBeta,m0,vL1input,vL2input,vL3input};

ParametersToSolveTadpoles ={mlHd2,\[Mu], B[\[Mu]]};  

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{L1,LHInput[L1]},
{L2,LHInput[L2]},
{T[L1],Azero*L1},
{T[L2],Azero*L2},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundarySUSYScale = {
{\[Epsilon], LHInput[\[Epsilon]]},
{B[\[Epsilon]], LHInput[B[\[Epsilon]]]},
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

(*----------------------------------*)
(* Information for SUSY scale input *)
(*----------------------------------*)


EXTPAR={{1,M1input},
        {2,M2input},
        {3,M3input},
        {23,Muinput},
        {25,TanBeta},
        {26,MAinput},
        {200, vL1Input},
        {201, vL2Input},
        {202, vL3Input}};


ParametersToSolveTadpolesLowScaleInput = {mHd2,mHu2,mlHd2};

BoundaryLowScaleInput={
 {MassB, M1input},
 {MassWB, M2input},
 {MassG, M3input},
 {\[Mu], Muinput},
 {B[\[Mu]], MAinput^2/(TanBeta + 1/TanBeta)},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
{vL[1], vL1Input},  
{vL[2], vL2Input},  
{vL[3], vL3Input}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

(* SetOptions[ModelOutput,TwoLoopRGEs->False]; *)

DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta -> 10, SignumMu -> 1, Azero->-2000, vL[_]->0.01 };
