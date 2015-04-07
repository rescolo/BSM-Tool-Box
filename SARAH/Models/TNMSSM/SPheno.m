MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
       {65,vSInput},
       {71, XiDinput},
       {72, XiUinput},
       {73, LamTinput},
       {78, vTinput},
       {79, vTbinput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2,mt2,mtb2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;


BoundarySUSYScale = {
{vS, vSInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{XiD, XiDinput},
{XiU, XiUinput},
{LamT, LamTinput}
};

BoundaryHighScale={
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
{T[XiD], Azero* XiD},
{T[XiU], Azero* XiU},
{T[LamT], Azero* LamT},
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

ConditionForMassOrdering={
{Ah,
"If ((Abs(ZA(1,3)).gt.Abs(ZA(1,2))).And.(MAh2(1).lt.1._dp).And.(MAh2(2).lt.1._dp)) Then \n
   MAh2temp = MAh2 \n
   ZAtemp = ZA \n
   ZA(1,:) = ZAtemp(2,:) \n
   ZA(2,:) = ZAtemp(1,:) \n
   MAh2(1) = MAh2temp(2) \n
   MAh2(2) = MAh2temp(1) \n
End If \n \n"}
};

