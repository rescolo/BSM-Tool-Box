Off[General::spell]

Model`Name = "Inert";
Model`NameLaTeX ="Inert doublet Model";
Model`Authors = "B.Herrmann, F.Staub";
Model`Date = "2013-09-01";

(* 2013-09-01: changing to new conventions for FermionFields/MatterFields *)
(* 2014-04-24: removed mixing between neutral Higgs fields *)



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

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

ScalarFields[[1]] =  {Hd, 1, {Hd0, Hdm},    -1/2, 2,  1,  1};
ScalarFields[[2]] =  {Hu, 1, {Hup, Hu0},     1/2, 2,  1, -1};




(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


  		  
DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};



LagNoHC = -(MHD conj[Hd].Hd + MHU conj[Hu].Hu + Lambda1 conj[Hd].Hd.conj[Hd].Hd + \
		Lambda2 conj[Hu].Hu.conj[Hu].Hu + Lambda3 conj[Hu].Hu.conj[Hd].Hd);


LagHC = -(Lambda5/2 Hu.Hd.Hu.Hd - Yd Hd.q.d - Ye Hd.l.e - Yu conj[Hd].q.u);



(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};   
        
        
          	

(* ----- VEVs ---- *)

(*
DEFINITION[EWSB][VEVs]= 
{    {Hd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, 1/Sqrt[2]}},
     {Hu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}}     };
*)

DEFINITION[EWSB][VEVs]= 
{    {Hd0, {v, 1/Sqrt[2]}, {G0, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}},
     {Hu0, {0, 1/Sqrt[2]}, {A0, \[ImaginaryI]/Sqrt[2]},{H0, 1/Sqrt[2]}}     };

 

(* ---- Mixings ---- *)


DEFINITION[EWSB][MatterSector]= 
{  (*  {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}}, *)
     {{conj[Hup],Hdm},{Hpm,ZP}},
     {{{dL}, {conj[dR]}}, {{DL,ZDL}, {DR,ZDR}}},
     {{{uL}, {conj[uR]}}, {{UL,ZUL}, {UR,ZUR}}},
     {{{eL}, {conj[eR]}}, {{EL,ZEL}, {ER,ZER}}}
           
 }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

