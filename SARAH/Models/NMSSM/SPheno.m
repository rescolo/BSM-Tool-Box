MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
           {65,vSInput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

(* 

Three different sets of boundary conditions are used:
1) Kappa, Lambda defined at SUSY scale, AKappa, ALambda at GUT scale
2) Kappa, Lambda, AKappa, ALambda defined at GUT scale
3) Kappa, Lambda, AKappa, ALambda defined at SUSY scale 


Switch in SPheno happens by flag 2 in MODSEL 
*)

ConditionGUTscale = g1 == g2;


BoundaryEWSBScale = Table[{},{3}];
BoundarySUSYScale = Table[{},{3}];
BoundaryHighScale = Table[{},{3}];


BoundarySUSYScale[[1]] = {
{vS, vSInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};


BoundarySUSYScale[[2]] = {
{vS, vSInput}
};

BoundarySUSYScale[[3]] = {
{vS, vSInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput}
};

BoundaryHighScale[[1]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryHighScale[[2]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryHighScale[[3]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(* For kappa = 0 two massles pseudo scalar appear. 
The Goldstone is the one which is not singlet-like! *)

UseHiggs2LoopMSSM = False;

ConditionForMassOrdering={
{Ah,
"If ((Abs(ZA(1,3)).gt.Abs(ZA(2,3))).And.(MAh2(1).lt.1._dp).And.(MAh2(2).lt.1._dp)) Then \n
   MAh2temp = MAh2 \n
   ZAtemp = ZA \n
   ZA(1,:) = ZAtemp(2,:) \n
   ZA(2,:) = ZAtemp(1,:) \n
   MAh2(1) = MAh2temp(2) \n
   MAh2(2) = MAh2temp(1) \n
End If \n \n"}
};

(* --------- Examples for input values ---------- *)

(* Boundary condition type 1 *)
DefaultInputValues[1] = {m0 -> 500, m12 -> 500, TanBeta -> 10, Azero ->-1500, LambdaInput -> 0.1, KappaInput -> 0.11,  ALambdaInput -> -1500,  AKappaInput -> -36,  vSInput -> 13689};

(* Boundary condition type 2 *)
DefaultInputValues[2] = {};


(* Boundary condition type 3 *)
DefaultInputValues[3] = {};



