Off[General::spell]

Model`Name = "THDM";
Model`NameLaTeX ="Two Higgs Doublet Model";
Model`Authors = "F.Staub";
Model`Date = "2013-09-03";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL,dL},     1/6, 2, 3};  
FermionFields[[2]] = {l, 3, {vL,eL},    -1/2, 2, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1};

ScalarFields[[1]] =  {Hd, 1, {Hd0, Hdm},    -1/2, 2,  1};
ScalarFields[[2]] =  {Hu, 1, {Hup, Hu0},     1/2, 2,  1};


     


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};


LagNoHC = -(MHD2 conj[Hd].Hd + MHU2 conj[Hu].Hu + Lambda1 conj[Hd].Hd.conj[Hd].Hd + \
		Lambda2 conj[Hu].Hu.conj[Hu].Hu + Lambda3 conj[Hu].Hu.conj[Hd].Hd + Lambda4 conj[Hu].Hd.conj[Hd].Hu );


LagHC = -(Lambda5/2 Hu.Hd.Hu.Hd - Yd Hd.d.q - Ye Hd.e.l - Yu conj[Hd].u.q);

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {Hd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, 1/Sqrt[2]}},
     {Hu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    { {{phid, phiu}, {hh, ZH}},
      {{sigmad, sigmau}, {Ah, ZA}},
      {{Hdm,conj[Hup]},{Hpm,ZP}},
      {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
      {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
      {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}       };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



