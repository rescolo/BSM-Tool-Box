Off[General::spell]

Model`Name = "radinertDTFDTSDM";
Model`NameLaTeX ="Doublet Triplet Model";
Model`Authors = "R. Longas, based in Scotogenic model by A. Vicente";
Model`Date = "2016-04-10";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[2], Z2};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Matter Fields *)
(* normalization fermion triplets based in 1506.04149 *) 

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};
(*FermionFields[[6]] = {n, 3, conj[nR],       0, 1,  1,-1};*)
(*FermionFields[[6]] = {n, 1, {{T0, Sqrt[2] Tp},{Sqrt[2] Tm, -T0}},0, 3,  1,-1};*)
FermionFields[[6]] = {T, 1, {{T0/Sqrt[2],  Tp},{Tm, -T0/Sqrt[2]}},  0, 3,  1,-1};
FermionFields[[7]] = {rd, 1, {vd,ed},   -1/2, 2,  1,-1};
FermionFields[[8]] = {ru, 1, {eu,vu},     1/2, 2,  1,-1};
FermionFields[[9]] = {rsd, 1, esd,  -1, 1,  1, -1};
FermionFields[[10]] = {rsu, 1, esu,  1, 1,  1, -1};



ScalarFields[[1]] =  {H,  1,  {Hp, HO},    1/2, 2,  1,  1};
ScalarFields[[2]] =  {Et, 1,  {etp, etO},  1/2, 2,  1, -1};
ScalarFields[[3]] =  {S3, 1, {{SO/2, Sp/Sqrt[2]},{conj[Sp]/Sqrt[2] , -SO/2}}, 0,  3,  1,-1};
ScalarFields[[4]] =  {S, 1, ss,     0, 1,  1, -1};
RealScalars = {S3,S};



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)
		  
DEFINITION[GaugeES][Additional]= {
	{LagFer,   {AddHC->True}},
        {LagNV,    {AddHC->False}},
	{LagIFD2,  {AddHC->True}},
        {LagH,     {AddHC->False}},
        {LagEt,    {AddHC->False}},
        {LagHEt,   {AddHC->False}},
    	{LagSinFer,{AddHC->True}},
	{VT,{AddHC->False}},
        {VTSM,{AddHC->False}},
        {VTEt,{AddHC->False}},
        {VTSMEt, {AddHC->True}},
        {LagHEtHC, {AddHC->True}},
	{LagNoHCS,  {AddHC->False}}

};

(* Yn is eta, Yf is f, Y3 is rho, A is pi1 and B is pi2 *)

LagFer   = Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q ;
LagSinFer =  -( MSF rsd.rsu + Ys S.e.conj[rsu] );
LagNV    = - MTF/2 T.T + MDF rd.ru;
(*LagIFD2 = - A/Sqrt[2] n.H.rd  -  B/Sqrt[2] n.ru.conj[H] + Y3 conj[Et].rd.e + Yf S3.ru.l + Yn Et.n.l;*)   
LagIFD2 = - A T.H.rd  -  B T.ru.conj[H] + Y3 conj[Et].rd.e + Yf S3.ru.l + Yn Et.T.l;
LagH     = -(- mH2 conj[H].H + lambda1/2  conj[H].H.conj[H].H );
LagEt    = -( + mEt2 conj[Et].Et + lambda2/2 conj[Et].Et.conj[Et].Et);
LagHEt   = -( + lambda3 conj[Et].Et.conj[H].H + lambda4 conj[H].Et.conj[Et].H);
LagHEtHC = -( + lambda5/2 conj[H].Et.conj[H].Et);
VT     = -( mu3 S3.S3 + lambda6/2 S3.S3.S3.S3 );
VTSM   = -( + lambda7 S3.S3.conj[H].H );
VTEt   = -( + lambda8 S3.S3.conj[Et].Et);
VTSMEt = -( + mu conj[H].S3.Et);
LagNoHCS = -(+ MS2/2 S.S + LamSH S.S.conj[H].H + LamS/2 S.S.S.S);


DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};    
        
        
(* ----- VEVs ---- *)


DEFINITION[EWSB][VEVs]= 
{    {HO, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}},
     {SO, {0, 0}, {0, 0},{S0, 1}},
     {etO, {0, 0}, {etI, \[ImaginaryI]/Sqrt[2]},{etR, 1/Sqrt[2]}}     };

 

(* ---- Mixings ---- *)


DEFINITION[EWSB][MatterSector]= 
  {  {{vL},{VL,Vv}},
     { {T0,vd,vu}, {s1,Q1} },
     { {{Tp,eu,esu}, {Tm,ed,esd}}, {{ch1,Q2},{ch2,Q3}} },
     { {etp,Sp},{XP,ZXP}},
     { {etR,S0,ss},{XO,ZX0}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
           
 }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VL]},
 Nv ->{  s1, conj[s1]},
 Chi->{  ch1, conj[ch2]}
                   };

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};
