(* ::Package:: *)

GenerateSPhenoCouplingList:=Block[{i,currentRegime,readRegime,tt2},
(*
Print["--------------------------------------"];
Print["Writing Couplings-File for SPheno "];
Print["--------------------------------------"];
*)

Print[StyleForm["Write Couplings","Section",FontSize->12]];

(* $sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}]; *)
sphenoCoup=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"Couplings_"<>ModelName<>".f90"]];

SubNonAbelianNonSelf={};
SubNonAbelianSelf={};

 For[i=1,i<=Length[Gauge],
If[Gauge[[i,2]]=!=U[1] && FreeQ[BrokenSymmetries,i],
SubNonAbelianNonSelf=Join[SubNonAbelianNonSelf,{Gauge[[i,4]]->0}];
SubNonAbelianSelf=Join[SubNonAbelianSelf,{Gauge[[i,4]]->Sqrt[4/3]}];
];
i++;]; 

If[IntermediateScale =!=True,
WriteCouplingHeader;


(* Print["Writing Subroutine for All Coupling"]; *)
Print["Creating couplings for tree-level calculations"]; 
DynamicCouplings["AllCouplingsReallyAll"]="";
Print["  Processing couplings for all calculations: ",Dynamic[DynamicCouplingsTreeAll]," ",Dynamic[DynamicCouplings["AllCouplingsReallyAll"]]];

DynamicCouplingsTreeAll="building couplings";
temp=SPhenoCouplingList[Select[VertexListNonCC,FreeQ[#,ASS]&]  (*//. RXi[_]\[Rule]1*)];
SPhenoCouplingsAllreallyAll=temp[[1]];
parametersAllreallyAll=temp[[2]];
namesAllreallyAll=temp[[3]];
DynamicCouplingsTreeAll="writing couplings";
WriteSPhenoAllCouplings[SPhenoCouplingsAllreallyAll,parametersAllreallyAll,namesAllreallyAll,"AllCouplingsReallyAll","T"]; 

DynamicCouplings["AllCouplings"]="";
Print["  Processing couplings for tree-level calculations: ",Dynamic[DynamicCouplingsTree]," ",Dynamic[DynamicCouplings["AllCouplings"]]];
DynamicCouplingsTree="building couplings";
AllRelevant=getAllRelevantCouplings[VertexListNonCC];
temp=SPhenoCouplingList[AllRelevant];
SPhenoCouplingsAll=temp[[1]];
parametersAll=temp[[2]];
namesAll=temp[[3]];
DynamicCouplingsTree="writing couplings";
WriteSPhenoAllCouplings[SPhenoCouplingsAll,parametersAll,namesAll,"AllCouplings","T"]; 



(* ]; *)

AllRelevant=getAllRelevantCouplings[VertexListNonCC];
temp=SPhenoCouplingList[AllRelevant];
SPhenoCouplingsAll=temp[[1]];
parametersAll=temp[[2]];
namesAll=temp[[3]];


(* WriteSPhenoCouplings[SPhenoCouplingsAll,False,"T"];  *)

WriteSPhenoCouplings[SPhenoCouplingsAllreallyAll,False,"T"];

(* If[SA`Include2LoopEffPot===True, *)

(* If[SA`Include2LoopEffPot===True, *)
Print["Creating couplings for 2-loop effective Potential"]; 
DynamicCouplingsEffpot="";
Print["  Processing couplings for 2-loop effective potential: ",Dynamic[DynamicCouplingsEffpot]];
DynamicCouplingsEffpot="4 point vertices";
temp=Select[VertexListNonCC,(#[[-1]]===SSSS || #[[-1]]===SSVV)&]; (* extract all 4-vertices with scalars *)
temp=Select[temp,((Length[Intersection[RE/@(#[[1,1]]/. A_[{b__}]->A)]]<3) && (Mod[Count[RE/@(#[[1,1]]/. A_[{b__}]->A),RE[(#[[1,1,1]]/. A_[{b__}]->A)]],2] =!=1) )&];  (*take only those vertices which have 2 pairs of identical fields *)
CouplingUsedForEffPot=True; (* in order to apply the correct color sum *)

(*Remove the couplings which are zero in gaugeless limit *)
(* listBrokenGaugeCouplings=DeleteCases[Transpose[BetaGauge][[1]],strongCoupling]; *)

(* listBrokenGaugeCouplings=Extract[Gauge,Join[#,{4}]&/@(Position[SGauge /. A_[{b__}]\[Rule]A,#][[1]]&/@Select[SGauge /. A_[{b__}]\[Rule]A,FreeQ[Particles[SA`CurrentStates],#]&])]; *)
(*subZeroGaugeLess=Table[listBrokenGaugeCouplings[[i]]\[Rule]0,{i,1,Length[listBrokenGaugeCouplings]}];*)

dataUnBrokenGaugeGroups={#,Gauge[[#,3]],Gauge[[#,4]],SGauge[[#]]/.A_[{b__}]->A,getDimFundamental[Gauge[[#,2]]],getDimAdjoint[Gauge[[#,2]]]}&/@(Position[SGauge/.A_[{b__}]->A,#][[1,1]]&/@Select[SGauge/.A_[{b__}]->A,FreeQ[Particles[SA`CurrentStates],#]==False&]);

subfourpoint={};
           For[ii=1,ii<=Length[dataUnBrokenGaugeGroups],ii++,namestub=StringTake[ToString[dataUnBrokenGaugeGroups[[ii,2]]],1];
AppendTo[subfourpoint,ToExpression[namestub<>"t"<>"3"]->ToExpression[namestub<>"t"<>"1"]];
AppendTo[subfourpoint,ToExpression[namestub<>"t"<>"4"]->ToExpression[namestub<>"t"<>"2"]];];

listBrokenGaugeCouplings=Transpose[BetaGauge][[1]];
          For[i=1,i<=Length[dataUnBrokenGaugeGroups],i++,listBrokenGaugeCouplings=DeleteCases[listBrokenGaugeCouplings,dataUnBrokenGaugeGroups[[i,3]]]];

subZeroGaugeLess=Table[listBrokenGaugeCouplings[[i]]->0,{i,1,Length[listBrokenGaugeCouplings]}];


temp = Select[temp /. subZeroGaugeLess,#[[1,2,1]]=!=0&];

temp=SPhenoCouplingList[temp];
CouplingUsedForEffPot=False;
SPhenoCouplings4P=temp[[1]];
parametersAll4P=temp[[2]];
namesAll4P=temp[[3]];
WriteSPhenoAllCouplings[SPhenoCouplings4P,parametersAll4P,namesAll4P,"CouplingsForEffPot4","2L"]; 

DynamicCouplingsEffpot="3 point vertices";
AllRelevant=getAllRelevantCouplings[VertexListNonCC];
AllRelevant =  Select[AllRelevant /. subZeroGaugeLess,If[Length[#[[1]]]===3,(#[[1,2,1]]=!=0) ||( #[[1,3,1]]=!=0),#[[1,2,1]]=!=0]&];
temp=SPhenoCouplingList[AllRelevant];
SPhenoCouplings3P=temp[[1]];
parametersAll3P=temp[[2]];
namesAll3P=temp[[3]];
WriteSPhenoAllCouplings[SPhenoCouplings3P,parametersAll3P,namesAll3P,"CouplingsForEffPot3","2L"]; 

WriteSPhenoCouplings[SPhenoCouplings4P,False,"2L"];
WriteSPhenoCouplings[SPhenoCouplings3P,False,"2L"];
(* ]; *)
];

(*-----------------------------------*)
(*------TWO LOOP POLE COUPLINGS------*)
(* by M.D. Goodsell *)
(*-----------------------------------*)
If[Include2LoopCorrections=!=False,
DynamicCouplings2LPole="";
Print["Creating couplings for 2-loop pole mass: ",Dynamic[DynamicCouplings2LPole]];

DynamicCouplings2LPole="3 point vertices";

(*These are the same as for the effective potential...*)
WriteSPhenoAllCouplings[SPhenoCouplings3P,parametersAll3P,namesAll3P,"CouplingsFor2LPole3","2LP"];
WriteSPhenoCouplings[SPhenoCouplings3P,False,"2LP"];

DynamicCouplings2LPole="4 point vertices";

temp=Select[VertexListNonCC,(#[[-1]]===SSSS)&];
(*extract all 4-vertices with scalars only,drop the ones with vectors*)
temp=Select[temp/.subZeroGaugeLess,#[[1,2,1]]=!=0&];

specialPOLEvertices={};

Block[{tt,mi,mj,mk,tttt2,tttt3,POLEstructures,inner,outer},
specialPOLEvertices=Reap[
For[mi=1,mi<=Length[temp],mi++,
Sow[Reap[
Sow[{temp[[mi,1,1]]}]; (* entries start with the particles in the coupling, then a list of group structures*)
For[mj=1,mj<=Length[dataUnBrokenGaugeGroups],mj++,
tt=ExtractStructure[temp[[mi,1,2,1]],dataUnBrokenGaugeGroups[[mj,2]]];
tttt2=Select[tt,#[[2,1]]=!=0&];
POLEstructures=Table[tttt2[[mk,1]],{mk,1,Length[tttt2]}];
Sow[POLEstructures]
(*AppendTo[specialPOLEvertices,{{temp[[i,1,1]],POLEstructures}}];*)
];][[2,1]](* end inner reap*)
];
] (* end for ...*)
][[2,1]];(* end outer Reap*)


specialPOLEverticesorg=Table[C@@specialPOLEvertices[[mi,1,1]]/.{A_[{___}]->A},{mi,1,Length[specialPOLEvertices]}];
];

CouplingsFor2LPole=True;

temp2=SPhenoCouplingList4ptPOLE[temp];

CouplingUsedFor2LPole=False;
SPhenoCouplings4Pole=temp2[[1]];
parametersAll4Pole=temp2[[2]];
namesAll4Pole=temp2[[3]];
WriteSPhenoAllCouplings[SPhenoCouplings4Pole,parametersAll4Pole,namesAll4Pole,"CouplingsFor2LPole4","2LP"];
WriteSPhenoCouplings[SPhenoCouplings4Pole,False,"2LP"];
];
(*--------END TWO LOOP POLE COUPLINGS-------------*)
(*------------------------------------------------*)

(*
Print["Writing Couplings for Loop Calculations"];
*)
Print["Creating couplings for loop calculations"];
DynamicCouplings["CouplingsForLoopMasses"]="";
Print["  Processing couplings for loop calculations: ",Dynamic[DynamicCouplingsLoop]," ",Dynamic[DynamicCouplings["CouplingsForLoopMasses"]]];

sum[a_,b_,c_,d_]:=Block[{res,j},
deltas=Cases[d,x:(Delta[a+s_,y_]),10];
res=d*ThetaStep[a,c];
summand = Cases[deltas,x_?NumberQ,3][[1]];
res =res /. Flatten[Table[{deltas[[j,2]]-summand->deltas[[j,1]]-summand},{j,1,Length[deltas]}]];
Return[res];
] /; (FreeQ[d,Delta[a+s_,_]]==False && FreeQ[d,StillCalcSum]==True);

DynamicCouplingsLoop="building couplings";
CouplingsForLoops=True;
temp=SPhenoCouplingList[VerticesGaugeMassES];
SPhenoCouplingsLoop=temp[[1]];
parametersLoop=temp[[2]];
namesLoop=temp[[3]];
DynamicCouplingsLoop="writing couplings";
If[IntermediateScale ===True,
WriteSPhenoAllCouplings[SPhenoCouplingsLoop,parametersLoop,namesLoop,"CouplingsForLoopMassesRegime"<>ToString[RegimeNr],"L"];,
WriteSPhenoAllCouplings[SPhenoCouplingsLoop,parametersLoop,namesLoop,"CouplingsForLoopMasses","L"]; 
];
 

WriteSPhenoCouplings[SPhenoCouplingsLoop,False,"L"];
CouplingsForLoops=False;

If[IntermediateScale =!=True,

(* Print["Writing Couplings Loop Corrections of W and Z"]; *)

DynamicCouplings["CouplingsForVectorBosons"]="";
Print["  Processing couplings for W/Z calculations: ",Dynamic[DynamicCouplingsWZ]," ",Dynamic[DynamicCouplings["CouplingsForVectorBosons"]]];

DynamicCouplingsWZ="building couplings";
temp = SPhenoCouplingList[Cases[VerticesGaugeMassES,x_?FreeQZW]]; 
SPhenoCouplingsZW=temp[[1]];
parametersZW=temp[[2]];
namesZW=temp[[3]];
DynamicCouplingsWZ="writing couplings";
WriteSPhenoAllCouplings[SPhenoCouplingsZW,parametersZW,namesZW,"CouplingsForVectorBosons","L"]; 


(* Print["Writing Couplings for Loop Corrections of SM Fermions"]; *)

DynamicCouplings["CouplingsForSMfermions"]="";
Print["  Processing couplings for SM-loop calculations: ",Dynamic[DynamicCouplingsSM]," ",Dynamic[DynamicCouplings["CouplingsForSMfermions"]]];
DynamicCouplingsSM="building couplings";
temp = SPhenoCouplingList[Cases[VerticesGaugeMassES,x_?FreeQebt]]; 
SPhenoCouplingsEBT=temp[[1]];
parametersEBT=temp[[2]];
namesEBT=temp[[3]];
DynamicCouplingsSM="writing couplings";
WriteSPhenoAllCouplings[SPhenoCouplingsEBT,parametersEBT,namesEBT,"CouplingsForSMfermions","L"]; 

(* Print["Writing Couplings for effective Higgs Interactions"]; *)

DynamicCouplings["CouplingsForTadpoles"]="";
Print["  Processing couplings for one-loop tadpoles: ",Dynamic[DynamicCouplingsTad]," ",Dynamic[DynamicCouplings["CouplingsForTadpoles"]]];
DynamicCouplingsTad="building couplings";
temp =SPhenoCouplingList[Cases[VerticesGaugeMassES,x_?FreeQUHiggs]];
SPhenoCouplingsTadpoles=temp[[1]];
parametersTadpoles=temp[[2]];
namesTadpoles=temp[[3]];
DynamicCouplingsTad="writing couplings";
WriteSPhenoAllCouplings[SPhenoCouplingsTadpoles,parametersTadpoles,namesTadpoles,"CouplingsForTadpoles","L"];  

(*
WriteThetaDelta;
*)
];

If[IntermediateScale =!= True,
WriteString[sphenoCoup,"End Module Couplings_"<>ModelName<>" \n"];
];

Close[sphenoCoup];
];

FreeQZW[x_]:=Block[{i,temp},
If[FreeQ[x,VectorZ]==False || FreeQ[x,VectorW]==False,
temp=True;
For[i=1,i<=Length[GaugeMassES],
If[FreeQ[x,GaugeMassES[[i]]]==False,
temp=False;
];
i++;];
Return[temp];,
Return[False]];
];


FreeQHB[x_]:=Block[{i,temp},
If[FreeQ[x,VectorZ]==False && FreeQ[x,HiggsBoson]==False && FreeQ[x,PseudoScalar]==False,
Return[True];,
Return[False]];
];

FreeQebt[x_]:=Block[{i,temp},
If[FreeQ[x,UElectron]==False || FreeQ[x,UTop]==False || FreeQ[x,UBottom]==False,
Return[True];,
Return[False]];
];

(*
FreeQUHiggs[x_]:=Block[{i,temp},
If[FreeQ[x,UnmixedHiggs]\[Equal]False,
Return[True];,
Return[False]];
];
*)

FreeQUHiggs[x_]:=Block[{i,temp},
temp=Select[UnrotatedFieldsTadpoles,(FreeQ[x,#]==False)&];
If[temp=!={},
Return[True];,
Return[False]];
];




getAllRelevantCouplings[list_]:=Block[{i,temp},
temp={};
For[i=1,i<=Length[list],
If[list[[i,2]]===SSS || list[[i,2]]===SSV || list[[i,2]]===SVV || list[[i,2]]===FFS || list[[i,2]]===FFV || list[[i,2]]===VVV,
temp = Join[temp,{list[[i]]}];
];
i++;];
Return[temp];
];

getNeededParametersForCouplings[list_]:=Block[{parameters,pos},
parameters={};
For[i=1,i<=Length[list],
pos=Position[SPhenoCouplingsAll,list[[i]]];
If[pos==={},
pos=Position[SPhenoCouplingsAll,AntiField/@list[[i]]];
];
parameters=Join[parameters,Extract[SPhenoCouplingsAll,pos[[1,1]]][[4]]];
i++;];
Return[Intersection[parameters]];
];


SPhenoCouplingList[listCouplings_]:=Block[{n1,i2,i,SPhenoCouplings, parameterNames,couplingNames, factor},

(* Print["Building Coupling List"]; *)

coupNr=1;

couplingNames = {};
parameterNames ={};

subCouplingsSPheno={Lam[a__]->2,Sig[a__]->2, fSU3[a__]->1, fSU2[a__]->1, epsTensor[a__]->1,CG[SU[n_],a__][b__]->1,Generator[SU[3],___][b___]->2};

For[i2=1,i2<=4,
subCouplingsSPheno=Join[subCouplingsSPheno,(subValue[i2,1] /. subIndFinal[i2,i2])];
i2++;];


SPhenoCouplings={};
For[n1=1,n1<=Length[listCouplings],
(* If[Length[listCouplings[[n1,1]]]\[Equal]2, *)
Switch[Length[listCouplings[[n1,1]]],
2, (* Lorentz scalar *)
If[CouplingUsedForEffPot=!=True,
If[listCouplings[[n1,2]]===SSSS,
value=sumOverNonAbelianIndizes[listCouplings[[n1]]];,
value=listCouplings[[n1,1,2,1]] ;
];,
If[listCouplings[[n1,2]]===SSSS || listCouplings[[n1,2]]===SSVV || listCouplings[[n1,2]]===VVVV,
value=sumOverNonAbelianIndizesEffPot[listCouplings[[n1]]];,
value=listCouplings[[n1,1,2,1]] ;
];
value=value/. Delta[a_,conj[b_]]->Delta[a,b]/. Delta[conj[a_],b_]->Delta[a,b];
];

If[listCouplings[[n1,2]]===SSV,factor=-1;,factor=1;];
SPhenoCouplings= Join[SPhenoCouplings,{{{Apply[C,listCouplings[[n1,1,1]] /. A_[{a__}]-> A]},{CouplingName[listCouplings[[n1,1,1]]], SPhenoCoupling[listCouplings[[n1,1,1]]]},{},{},factor*value /. subCouplingsSPheno,listCouplings[[n1,1,1]]}}];
couplingNames = Join[couplingNames,{ SPhenoCoupling[listCouplings[[n1,1,1]]]}];,

3, (* Chiral couplings *)
 SPhenoCouplings=Join[SPhenoCouplings,{{{Apply[C,listCouplings[[n1,1,1]] /. A_[{a__}]-> A]},{CouplingName[listCouplings[[n1,1,1]]],SPhenoCouplingLeft[listCouplings[[n1,1,1]]],SPhenoCouplingRight[listCouplings[[n1,1,1]]]},{},{},listCouplings[[n1,1,2,1]]/.subCouplingsSPheno,listCouplings[[n1,1,3,1]] /. subCouplingsSPheno,listCouplings[[n1,1,1]]}}];
couplingNames = Join[couplingNames,{ SPhenoCouplingLeft[listCouplings[[n1,1,1]]],SPhenoCouplingRight[listCouplings[[n1,1,1]]]}];,

4, (* Four-Vector couplings *)
 SPhenoCouplings=Join[SPhenoCouplings,{{{Apply[C,listCouplings[[n1,1,1]] /. A_[{a__}]-> A]},{CouplingName[listCouplings[[n1,1,1]]],SPhenoCouplingV1[listCouplings[[n1,1,1]]],SPhenoCouplingV2[listCouplings[[n1,1,1]]],SPhenoCouplingV3[listCouplings[[n1,1,1]]]},{},{},listCouplings[[n1,1,2,1]]/.subCouplingsSPheno,listCouplings[[n1,1,3,1]] /. subCouplingsSPheno,listCouplings[[n1,1,4,1]] /. subCouplingsSPheno,listCouplings[[n1,1,1]]}}];
couplingNames = Join[couplingNames,{ SPhenoCouplingV1[listCouplings[[n1,1,1]]],SPhenoCouplingV2[listCouplings[[n1,1,1]]],SPhenoCouplingV3[listCouplings[[n1,1,1]]]}];
];




NewParameters={};
NewParametersSplit={};
For[i2=1,i2<=Length[listCouplings[[n1,1,1]]],
If[getGenSPheno[listCouplings[[n1,1,1,i2]]]==1,
indRange={};,
indRange = {{generation,getGenSPheno[listCouplings[[n1,1,1,i2]]]}} /. subGC[i2] /. subIndFinal[i2,i2];
];
If[indRange =!={},
SPhenoCouplings[[coupNr,3]]=Join[SPhenoCouplings[[coupNr,3]],Transpose[indRange][[1]]];
];
NewParameters = Join[NewParameters,indRange];
NewParametersSplit = Join[NewParametersSplit,indRange];
i2++;];




If[NewParameters==={},
NewP1 = {};
NewP2 ={};,
NewP1 =Transpose[NewParameters][[1]];
NewP2 =Transpose[NewParameters][[2]];
];




(* If[Length[listCouplings[[n1,1]]]\[Equal]2, *)
Switch[Length[listCouplings[[n1,1]]],
2, SPhenoParameters = Join[SPhenoParameters,{{SPhenoCoupling[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];,
3, SPhenoParameters = Join[SPhenoParameters,{{SPhenoCouplingLeft[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];
       SPhenoParameters = Join[SPhenoParameters,{{SPhenoCouplingRight[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];,
4, SPhenoParameters = Join[SPhenoParameters,{{SPhenoCouplingV1[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];
       SPhenoParameters = Join[SPhenoParameters,{{SPhenoCouplingV2[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];
       SPhenoParameters = Join[SPhenoParameters,{{SPhenoCouplingV3[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit }}];
];




For[i2=1,i2<=Length[parameters],
If[FreeQ[listCouplings[[n1]],parameters[[i2,1]]]==False && FreeQ[UnfixedCharges,parameters[[i2,1]]]==True && Head[parameters[[i2,1]]]=!=Mass && NumericQ[parameters[[i2,1]]]==False && parameters[[i2,1]]=!=0.,
SPhenoCouplings[[coupNr,4]]=Join[SPhenoCouplings[[coupNr,4]],{parameters[[i2,1]]}];
If[FreeQ[parameterNames,parameters[[i2,1]]]==True && FreeQ[UnfixedCharges,parameters[[i2,1]]]==True,
parameterNames = Join[parameterNames,{parameters[[i2,1]]}]];
];
i2++;];



For[i2=1,i2<=Length[PART[V]],
If[FreeQ[listCouplings[[n1]],Mass[PART[V][[i2,1]]]]==False && NumericQ[SPhenoMass[PART[V][[i2,1]]]]==False && SPhenoMass[PART[V][[i2,1]]]=!=0.,
SPhenoCouplings[[coupNr,4]]=Join[SPhenoCouplings[[coupNr,4]],{SPhenoMass[PART[V][[i2,1]]]}];
If[FreeQ[parameterNames,SPhenoMass[PART[V][[i2,1]]]]==True,
parameterNames = Join[parameterNames,{SPhenoMass[PART[V][[i2,1]]]}]];
];
i2++];

coupNr++;


n1++;];


Return[{SPhenoCouplings //. Mass[x_]:>SPhenoMass[x] (*//. RXi[_]\[Rule]1*),parameterNames,couplingNames}];

];





WriteSPhenoCouplings[SPhenoCouplings_, Check_,end_]:=Block[{i,i2,InvPart},

Print["  writing routine for each coupling: ",Dynamic[DynamicCurrentCouplingNr[end]],"/",Length[SPhenoCouplings]," (",Dynamic[DynamicCurrentCouplingName[end]],")"];
(* Print["   Write Routine for each Coupling"]; *)


For[i=1,i<=Length[SPhenoCouplings],
DynamicCurrentCouplingNr[end]=i;
DynamicCurrentCouplingName[end]=SPhenoCouplings[[i,2,1]];
If[Check==True,
If[FreeQ[SPhenoCouplingsAll,SPhenoCouplings[[i,2,1]]]==False,
WriteCouplings=False;,
WriteCouplings=True;
];,
WriteCouplings=True;
];


If[WriteCouplings==True,

(* If[Length[SPhenoCouplings[[i,2]]]\[Equal]2, *)
Switch[Length[SPhenoCouplings[[i,2]]],
2, MakeSubroutineTitle[SPhenoCouplings[[i,2,1]]<>end, Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{"res"},sphenoCoup];,
3, MakeSubroutineTitle[SPhenoCouplings[[i,2,1]]<>end, Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{"resL","resR"},sphenoCoup]; ,
4, MakeSubroutineTitle[SPhenoCouplings[[i,2,1]]<>end, Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{"res1","res2","res3"},sphenoCoup]; 
];

WriteString[sphenoCoup, "Implicit None \n\n"];

If[Length[SPhenoCouplings[[i,3]]]>0,
WriteString[sphenoCoup,"Integer, Intent(in) :: "];
For[i2=1,i2<= Length[SPhenoCouplings[[i,3]]],
WriteString[sphenoCoup,ToString[SPhenoCouplings[[i,3,i2]]]];
If[i2!= Length[SPhenoCouplings[[i,3]]],
WriteString[sphenoCoup,","];,
WriteString[sphenoCoup,"\n"];
];
i2++;];
];


MakeVariableList[SPhenoCouplings[[i,4]],", Intent(in)",sphenoCoup];

(* If[Length[SPhenoCouplings[[i,2]]]\[Equal]2, *)
Switch[Length[SPhenoCouplings[[i,2]]],
2, WriteString[sphenoCoup, "Complex(dp), Intent(out) :: res \n \n"];,
3, WriteString[sphenoCoup, "Complex(dp), Intent(out) :: resL, resR \n \n"];,
4, WriteString[sphenoCoup, "Complex(dp), Intent(out) :: res1, res2, res3 \n \n"];
];
WriteString[sphenoCoup,"Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 \n"];


WriteString[sphenoCoup, "Iname = Iname +1 \n"];
WriteString[sphenoCoup, "NameOfUnit(Iname) = '"<>SPhenoCouplings[[i,2,1]] <>"' \n \n"];

InvPart = Last[SPhenoCouplings[[i]]];


 For[i2 =1, i2<= Length[InvPart],
gens=getGenSPheno[InvPart[[i2]]];
If[gens>1,
WriteString[sphenoCoup, "If (("<>ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]] <>".Lt.1).Or.("<>ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]]<>".Gt."<>ToString[gens] <>")) Then \n"];
WriteString[sphenoCoup, "  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) \n"];
WriteString[sphenoCoup, "  Write (ErrCan,*) 'index "<> ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]] <>" out of range', "<> ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]]<>" \n"];
WriteString[sphenoCoup, "  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) \n"];
WriteString[sphenoCoup, "  Write (*,*) 'index "<> ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]] <>" out of range', "<> 
ToString[generation /. subGC[i2]/. subIndFinal[i2,i2]]<>" \n"];
WriteString[sphenoCoup, "  Call TerminateProgram \n"];
WriteString[sphenoCoup, "End If \n\n"];
];
i2++;]; 



(* If[Length[SPhenoCouplings[[i,2]]]\[Equal]2, *)
Switch[Length[SPhenoCouplings[[i,2]]],

2, 
If[FreeQ[SPhenoCouplings[[i,5]],Complex]==False, 
valueCurrent=SPhenoCouplings[[i,5]]/I;
complexVertex=True;,
valueCurrent=SPhenoCouplings[[i,5]];
complexVertex=False;
];
MakeSPhenoCoupling[valueCurrent,"res",sphenoCoup];
If[complexVertex==False,
WriteString[sphenoCoup,"res = -(0.,1.)*res \n \n"];
];,

3, 
If[FreeQ[SPhenoCouplings[[i,5]],Complex]==False || FreeQ[SPhenoCouplings[[i,6]],Complex]==False, 
valueCurrentA=SPhenoCouplings[[i,5]]/I;
valueCurrentB=SPhenoCouplings[[i,6]]/I;
complexVertex=True;,
valueCurrentA=SPhenoCouplings[[i,5]];
valueCurrentB=SPhenoCouplings[[i,6]];
complexVertex=False;
];
MakeSPhenoCoupling[valueCurrentA,"resL",sphenoCoup];
MakeSPhenoCoupling[valueCurrentB,"resR",sphenoCoup];
If[complexVertex==False,
WriteString[sphenoCoup,"resL = -(0.,1.)*resL \n \n"];
WriteString[sphenoCoup,"resR = -(0.,1.)*resR \n \n"];
];,

4, 
If[FreeQ[SPhenoCouplings[[i,5]],Complex]==False || FreeQ[SPhenoCouplings[[i,6]],Complex]==False  || FreeQ[SPhenoCouplings[[i,7]],Complex]==False, 
valueCurrentA=SPhenoCouplings[[i,5]]/I;
valueCurrentB=SPhenoCouplings[[i,6]]/I;
valueCurrentC=SPhenoCouplings[[i,7]]/I;
complexVertex=True;,
valueCurrentA=SPhenoCouplings[[i,5]];
valueCurrentB=SPhenoCouplings[[i,6]];
valueCurrentC=SPhenoCouplings[[i,7]];
complexVertex=False;
];
MakeSPhenoCoupling[valueCurrentA,"res1",sphenoCoup];
MakeSPhenoCoupling[valueCurrentB,"res2",sphenoCoup];
MakeSPhenoCoupling[valueCurrentB,"res3",sphenoCoup];
If[complexVertex==False,
WriteString[sphenoCoup,"res1 = -(0.,1.)*res1 \n \n"];
WriteString[sphenoCoup,"res2 = -(0.,1.)*res2 \n \n"];
WriteString[sphenoCoup,"res3 = -(0.,1.)*res3 \n \n"];
];
];

(* If[Length[SPhenoCouplings[[i,2]]]\[Equal]2, *)
Switch[Length[SPhenoCouplings[[i,2]]],
2,
WriteString[sphenoCoup,"If (Real(res,dp).ne.Real(res,dp)) Then \n"];,
3,
WriteString[sphenoCoup,"If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then \n"];,
4,
WriteString[sphenoCoup,"If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then \n"];
];

WriteString[sphenoCoup," Write(*,*) \"NaN appearing in \",NameOfUnit(Iname) \n"];
WriteString[sphenoCoup," Call TerminateProgram \n"];
WriteString[sphenoCoup,"End If \n"];

WriteString[sphenoCoup,"\n\n"];

WriteString[sphenoCoup, "Iname = Iname - 1 \n \n"];
WriteString[sphenoCoup, "End Subroutine "<>SPhenoCouplings[[i,2,1]] <>end<>"  \n \n \n"];

];

i++;];
DynamicCurrentCouplingName[end]="All Done";
];




MakeSPhenoCoupling[x_,name_]:=Block[{temp,i,i2},
temp = Expand[x];

While[FreeQ[temp,sum]==False,
temp = temp /. sum -> sumSPheno;
];

WriteString[sphenoCoup, name <>" = 0._dp \n"];

If[Head[temp]==Plus,
For[i=1,i<=Length[temp],
openDo=0;
WriteSPhenoTerm[temp[[i]],name];
For[i2=1,i2<=openDo,
WriteString[sphenoCoup,"End Do \n"];
i2++;];
i++;];,
openDo=0;
WriteSPhenoTerm[temp,name];
For[i2=1,i2<=openDo,
WriteString[sphenoCoup,"End Do \n"];
i2++;];
];


];

WriteSPhenoTerm[x_,name_]:=Block[{},
If[Head[x]===sumSPheno,
WriteString[sphenoCoup,"Do " <> ToString[x[[1]]] <> " = " <> ToString[x[[2]]] <>"," <>ToString[x[[3]]] <>"\n"];
openDo++;
WriteSPhenoTerm[x[[4]],name];,
WriteString[sphenoCoup, name<> " = "<>name <>"+"<> ToString[FortranForm[ToExpression[SPhenoForm[x]]]] <>"\n"];
];
];



WriteCouplingHeader:=Block[{i},

Print["Writing Module Header"];

WriteCopyRight[sphenoCoup];

WriteString[sphenoCoup,"Module Couplings_"<>ModelName<>"\n \n"];
WriteString[sphenoCoup, "Use Control \n"];
WriteString[sphenoCoup, "Use Model_Data_"<>ModelName<>" \n"];
WriteString[sphenoCoup, "Use Mathematics, Only: CompareMatrices, Adjungate \n \n"];

WriteString[sphenoCoup, "Contains \n \n "];

];

WriteSPhenoAllCouplings[SPhenoCouplings_,parameterNames_,couplingNames_,RoutineName_,end_] :=Block[{i1,i2,i},

(* Print["   Writing Function for all Couplings"]; *)

MakeSubroutineTitle[RoutineName, Join[parameterNames,couplingNames],{},{},sphenoCoup];

WriteString[sphenoCoup, "Implicit None \n"];


MakeVariableList[parameterNames,", Intent(in)",sphenoCoup];
MakeVariableList[couplingNames,", Intent(out)",sphenoCoup];
WriteString[sphenoCoup, "Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4"];

WriteString[sphenoCoup, "\n\n"];
WriteString[sphenoCoup, "Iname = Iname + 1 \n"];
WriteString[sphenoCoup, "NameOfUnit(Iname) = '"<>RoutineName<>"'\n \n"];


For[i=1,i<=Length[SPhenoCouplings],
DynamicCouplings[RoutineName]="("<>ToString[i]<>"/"<>ToString[Length[SPhenoCouplings]]<>")";
(* If[Length[SPhenoCouplings[[i,2]]]\[Equal]2, *)
Switch[Length[SPhenoCouplings[[i,2]]],
2, WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];,
3, WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];
       WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,3]]] <> " = 0._dp \n"];,
4, WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,2]]] <> " = 0._dp \n"];
       WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,3]]] <> " = 0._dp \n"];
       WriteString[sphenoCoup, ToString[SPhenoCouplings[[i,2,4]]] <> " = 0._dp \n"];
];

OpenDoes[{getIndexRangeSPheno[SPhenoCouplings[[i,2,2]]]},sphenoCoup];

cNames="";
For[i1=2,i1<=Length[SPhenoCouplings[[i,2]]],
cNames = cNames <> ToString[SPhenoCouplings[[i,2,i1]]] <> AddDimNames2[SPhenoCouplings[[i,2,i1]]]<>","; 
i1++;];

cNames = StringDrop[cNames,-1];

MakeCall[SPhenoCouplings[[i,2,1]]<>end,Join[SPhenoCouplings[[i,3]],SPhenoCouplings[[i,4]]],{},{cNames},sphenoCoup];

CloseDoes[sphenoCoup];

WriteString[sphenoCoup,"\n\n"];

i++;];


WriteString[sphenoCoup,"Iname = Iname - 1 \n"];
WriteString[sphenoCoup, "End Subroutine "<>RoutineName<>"\n\n"];

];







sumOverNonAbelianIndizesEffPot[coup_]:=Block[{i, p1, p2, ind, temp, index1, index2, index1b, index2b, p1b, p2b,tosum,subind,delta},
tosum=Flatten[Table[DeleteCases[DeleteCases[getIndizesWI[coup[[1,1,i]]] ,{generation,_}],{lorentz,4}]/. subGC[i] /. subIndFinal[i,i],{i,1,4}],1];
delta=1;
If[(coup[[1,1,1]] /. A_[{b__}]->A)===conj[(coup[[1,1,2]] /. A_[{b__}]->A)] (*|| (coup[[1,1,1]] /. A_[{b__}]\[Rule]A)===(coup[[1,1,2]] /. A_[{b__}]\[Rule]A)*),
If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*((coup[[1,1,1]] /. A_[{b__}]->{b}).(RE[coup[[1,1,2]]]/. A_[{b__}]->{b}) /. Times->Delta);];
If[FreeQ[coup[[1,1,3]],List]===False,delta=delta*((coup[[1,1,3]]/. A_[{b__}]->{b}).(RE[coup[[1,1,4]]]/. A_[{b__}]->{b}) /. Times->Delta);];,
If[(coup[[1,1,1]] /. A_[{b__}]->A)===conj[(coup[[1,1,3]] /. A_[{b__}]->A)],
If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*((RE[coup[[1,1,1]]] /. A_[{b__}]->{b}).(RE[coup[[1,1,3]]]/. A_[{b__}]->{b}) /. Times->Delta);];
If[FreeQ[coup[[1,1,2]],List]===False,delta=delta*((RE[coup[[1,1,2]] ]/. A_[{b__}]->{b}).(RE[coup[[1,1,4]]]/. A_[{b__}]->{b}) /. Times->Delta);];,
If[(coup[[1,1,1]] /. A_[{b__}]->A)===(coup[[1,1,2]] /. A_[{b__}]->A),
If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*((coup[[1,1,1]] /. A_[{b__}]->{b}).(RE[coup[[1,1,2]]]/. A_[{b__}]->{b}) /. Times->Delta);];
If[FreeQ[coup[[1,1,3]],List]===False,delta=delta*((coup[[1,1,3]]/. A_[{b__}]->{b}).(RE[coup[[1,1,4]]]/. A_[{b__}]->{b}) /. Times->Delta);];,
If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*((RE[coup[[1,1,1]] ]/. A_[{b__}]->{b}).(RE[coup[[1,1,4]]]/. A_[{b__}]->{b}) /. Times->Delta);];
If[FreeQ[coup[[1,1,2]],List]===False,delta=delta*((RE[coup[[1,1,2]]] /. A_[{b__}]->{b}).(RE[coup[[1,1,3]]]/. A_[{b__}]->{b}) /. Times->Delta);];
];
];
];
delta=delta/. Plus->Times /. {Delta[lt1,__]->1,Delta[lt2,__]->1,Delta[lt3,__]->1,Delta[lt4,__]->1} ;
(* Print[delta,coup[[1,1]]]; *)


temp=delta*coup[[1,2,1]];

For[i=1,i<=Length[tosum],
temp=ReleaseHold[Hold[Sum[temp,IND]] /. IND->{tosum[[i,1]],1,tosum[[i,2]]}];
i++;];

If[FreeQ[temp,fSU3]==False|| FreeQ[temp,Lam]==False,
temp=temp //. sum[a_,b_,c_,d___ fSU3[e___] ]:>Sum[d fSU3[e],{a,b,c}]//. sum[a_,b_,c_,fSU3[e___]^d_ ]:>Sum[fSU3[e]^d,{a,b,c}];
temp=temp //. sum[a_,b_,c_,d___ Lam[e___] ]:>Sum[d Lam[e],{a,b,c}]//. sum[a_,b_,c_, Lam[e___]^d_ ]:>Sum[Lam[e]^d,{a,b,c}];
];

Return[temp];

];

sumOverNonAbelianIndizes[coup_]:=Block[{i, p1, p2, ind, temp, index1, index2, index1b, index2b, p1b, p2b},

posToSum={};
posNotToSum={};
ind={};

For[i=1,i<=4,
If[getBlank[getRotatedField[coup[[1,1,i]]]]===getBlank[coup[[1,1,i]]],
posToSum=Join[posToSum,{i}];,
posNotToSum=Join[posNotToSum,{i}];
];
i++;];


If[Length[posToSum]===4 && CouplingsForLoops===True,
If[Length[Intersection[RE/@(coup[[1,1]] /. A_[{b__}]->A)]]===1,
posNotToSum={posToSum[[1]],posToSum[[3]]};
posToSum={posToSum[[2]],posToSum[[4]]};,
If[getGen[coup[[1,1,1]]]>1,
posNotToSum={posToSum[[2]],posToSum[[4]]};
posToSum={posToSum[[1]],posToSum[[3]]};,
posNotToSum={posToSum[[1]],posToSum[[3]]};
posToSum={posToSum[[2]],posToSum[[4]]};
];
];
];

If[Length[posToSum]==2 && Length[posNotToSum]==2 ,
p1=posToSum[[1]];
p2=posToSum[[2]];

p1b=posNotToSum[[1]];
p2b=posNotToSum[[2]];

(* ind=getIndexRange[getBlank[coup[[1,1,posToSum[[1]]]]]]; *)
ind=getIndizesWI[getBlank[coup[[1,1,posToSum[[1]]]]]];

temp=coup[[1,2,1]];

For[i=1,i<=Length[ind],
If[ind[[i,1]]=!=generation,
index1=ind[[i,1]]/.subGC[p1]/.subIndFinal[p1,p1];
index2=ind[[i,1]]/.subGC[p2]/.subIndFinal[p2,p2];
index1b=ind[[i,1]]/.subGC[p1b]/.subIndFinal[p1b,p1b];
index2b=ind[[i,1]]/.subGC[p2b]/.subIndFinal[p2b,p2b];
temp = temp /. index2->iter /. index1->iter /. {index1b->1, index2b->1}  /. {index1b->1, index2b->1};
temp2 = Sum[temp,{iter,1,ind[[i,2]]}];
temp = temp2;
];
i++;];,
temp=coup[[1,2,1]];
];

If[FreeQ[temp,fSU3]==False|| FreeQ[temp,Lam]==False,
temp=temp //. sum[a_,b_,c_,d___ fSU3[e___] ]:>Sum[d fSU3[e],{a,b,c}]//. sum[a_,b_,c_,fSU3[e___]^d_ ]:>Sum[fSU3[e]^d,{a,b,c}];
temp=temp //. sum[a_,b_,c_,d___ Lam[e___] ]:>Sum[d Lam[e],{a,b,c}]//. sum[a_,b_,c_, Lam[e___]^d_ ]:>Sum[Lam[e]^d,{a,b,c}];
];

Return[temp];

];


WriteThetaDelta[file_] :=Block[{},
WriteString[file, "Real(dp) Function Kronecker(t1,t2) Result(d) \n"];
WriteString[file, "Implicit None \n"];
WriteString[file, "Integer,Intent(in)::t1,t2 \n"];
WriteString[file, "If(t1.eq.t2) Then \n"];
WriteString[file, "d=1. \n"];
WriteString[file, "Else \n"];
WriteString[file, "d=0. \n"];
WriteString[file, "End If \n"];
WriteString[file, "End Function Kronecker \n\n"];

WriteString[file, "Real(dp) Function ThetaStep(t1,t2) Result(d) \n"];
WriteString[file, "Implicit None \n"];
WriteString[file, "Integer,Intent(in)::t1,t2 \n"];
WriteString[file, "If(t1.le.t2) Then \n"];
WriteString[file, "d=1. \n"];
WriteString[file, "Else \n"];
WriteString[file, "d=0. \n"];
WriteString[file, "End If \n"];
WriteString[file, "End Function ThetaStep \n\n"];


WriteString[file, "Real(dp) Function epsTensor(t1,t2,t3) Result(e)\n"];
WriteString[file, "Implicit None\n"];
WriteString[file, "Integer,Intent(in)::t1,t2,t3\n"];
WriteString[file, "If ((t1.eq.1).and.(t2.eq.2).and.(t3.eq.3)) Then\n"];
WriteString[file, "  e=1.\n"];
WriteString[file, "Else If ((t1.eq.2).and.(t2.eq.3).and.(t3.eq.1)) Then\n"];
WriteString[file, "  e=1.\n"];
WriteString[file, "Else If ((t1.eq.3).and.(t2.eq.1).and.(t3.eq.2)) Then\n"];
WriteString[file, "  e=1.\n"];
WriteString[file, "Else If ((t1.eq.3).and.(t2.eq.2).and.(t3.eq.1)) Then\n"];
WriteString[file, "  e=-1.\n"];
WriteString[file, "Else If ((t1.eq.2).and.(t2.eq.1).and.(t3.eq.3)) Then\n"];
WriteString[file, "  e=-1.\n"];
WriteString[file, "Else If ((t1.eq.1).and.(t2.eq.3).and.(t3.eq.2)) Then\n"];
WriteString[file, "  e=-1.\n"];
WriteString[file, "Else\n"];
WriteString[file, "  e=0.\n"];
WriteString[file, "End If\n"];
WriteString[file, "End Function epsTensor\n"];
];


(*-----------------------------------*)
(*-----TWO LOOP POLE COUPLINGS-------*)
(* Code provided by M.D. Goodsell    *)
(*-----------------------------------*)

SPhenoCouplingList4ptPOLE[listCouplings_]:=Block[{n1,i2,i,mj,SPhenoCouplings,parameterNames,couplingNames,factor,tempname1,tempname2,mytempstringname1,mytempstringname2,POLEstructures,manycolourstructures,numberofcouplings,colourflag,multiflag,summableflag,repartsincoup,tempval},
fourptcouplingstatus="";
Print["Building Coupling List 4pt pole: ",Dynamic[fourptcouplingstatus]];
coupNr=1;
couplingNames={};
parameterNames={};
numberofcouplings=Length[listCouplings];
SPhenoCouplings={};

For[n1=1,n1<=numberofcouplings,n1++,
manycolourstructures=0;
fourptcouplingstatus=CouplingName[listCouplings[[n1,1,1]]]<>" ("<>ToString[n1]<>"/"<>ToString[numberofcouplings]<>")";
vertexval=listCouplings[[n1,1,2,1]];


colourflag=False;
multiflag=False;
repartsincoup=RE/@(listCouplings[[n1,1,1]]/.A_[{b__}]->A);
If[Length[Intersection[repartsincoup>=3]]||(Mod[Count[repartsincoup,repartsincoup[[1]]],2]==1),
summableflag=False;,(* see whether there are two pairs of particles or all four are equal to sum over *)
summableflag=True;
];
tempval=vertexval;
For[mj=1,mj<=Length[dataUnBrokenGaugeGroups],mj++,
tempcolourfunc=ExtractStructure[tempval,dataUnBrokenGaugeGroups[[mj,2]]];
If[tempcolourfunc[[1,1]]=!=1,
colourflag=True;
newcolourfuncs=Select[tempcolourfunc,#[[2,1]]=!=0&];(*select the bits with nonzero colour structure*)
If[summableflag,
If[Length[newcolourfuncs]>1,multiflag=True];
(* If we have several structures then we will sum over repeated indices in the end*)
,
tempval=newcolourfuncs[[1,2]];(* assume that if it is not summable then there is only one structure *)
];
];
];

If[colourflag==False,
value=vertexval;
,
If[multiflag,
value=sumOverNonAbelianIndicesPOLE[listCouplings[[n1]]];
,
value=tempval;
];

];
SPhenoCouplings=Join[SPhenoCouplings,{{{Apply[C,listCouplings[[n1,1,1]]/.A_[{a__}]->A]},{CouplingName[listCouplings[[n1,1,1]]],SPhenoCoupling[listCouplings[[n1,1,1]]]},{},{},value/.subCouplingsSPheno,listCouplings[[n1,1,1]]}}];
couplingNames=Join[couplingNames,{SPhenoCoupling[listCouplings[[n1,1,1]]]}];




NewParameters={};
NewParametersSplit={};
For[i2=1,i2<=Length[listCouplings[[n1,1,1]]],
If[getGenSPheno[listCouplings[[n1,1,1,i2]]]==1,
indRange={};,
indRange={{generation,getGenSPheno[listCouplings[[n1,1,1,i2]]]}}/.subGC[i2]/.subIndFinal[i2,i2];
];
If[indRange=!={},
SPhenoCouplings[[coupNr,3]]=Join[SPhenoCouplings[[coupNr,3]],Transpose[indRange][[1]]];
];
NewParameters=Join[NewParameters,indRange];
NewParametersSplit=Join[NewParametersSplit,indRange];
i2++;];
If[NewParameters==={},
NewP1={};
NewP2={};,
NewP1=Transpose[NewParameters][[1]];
NewP2=Transpose[NewParameters][[2]];
];
SPhenoParameters=Join[SPhenoParameters,{{SPhenoCoupling[listCouplings[[n1,1,1]]],NewP1,NewP2,NewParametersSplit}}];
(*Add couplings to the list of parameters*)
For[i2=1,i2<=Length[parameters],
If[FreeQ[listCouplings[[n1]],
parameters[[i2,1]]]==False&&FreeQ[UnfixedCharges,parameters[[i2,1]]]==True&&Head[parameters[[i2,1]]]=!=Mass&&NumericQ[parameters[[i2,1]]]==False&&parameters[[i2,1]]=!=0.,SPhenoCouplings[[coupNr,4]]=Join[SPhenoCouplings[[coupNr,4]],{parameters[[i2,1]]}];
If[FreeQ[parameterNames,parameters[[i2,1]]]==True&&FreeQ[UnfixedCharges,parameters[[i2,1]]]==True,parameterNames=Join[parameterNames,{parameters[[i2,1]]}]];];
i2++;];
(*Add gauge couplings to the list of parameters*)
For[i2=1,i2<=Length[PART[V]],
If[FreeQ[listCouplings[[n1]],
Mass[PART[V][[i2,1]]]]==False&&NumericQ[SPhenoMass[PART[V][[i2,1]]]]==False&&SPhenoMass[PART[V][[i2,1]]]=!=0.,SPhenoCouplings[[coupNr,4]]=Join[SPhenoCouplings[[coupNr,4]],{SPhenoMass[PART[V][[i2,1]]]}];
If[FreeQ[parameterNames,SPhenoMass[PART[V][[i2,1]]]]==True,
parameterNames=Join[parameterNames,{SPhenoMass[PART[V][[i2,1]]]}]];
];
i2++;];
coupNr++;];
fourptcouplingstatus="Complete ("<>ToString[numberofcouplings]<>"/"<>ToString[numberofcouplings]<>") processed, "<>ToString[coupNr-1]<>" unique couplings found";
Return[{SPhenoCouplings//.Mass[x_]:>SPhenoMass[x](*//.RXi[_]\[Rule]1*),parameterNames,couplingNames}];
];



sumOverNonAbelianIndicesPOLE[coup_]:=Block[{i,p1,p2,ind,temp,index1,index2,index1b,index2b,p1b,p2b,tosum,subind,delta},tosum=Flatten[Table[DeleteCases[DeleteCases[getIndizesWI[coup[[1,1,i]]],{generation,_}],{lorentz,4}]/.subGC[i]/.subIndFinal[i,i],{i,1,4}],1];
setsofindices={{},{},{},{}};
For[i=1,i<=4,i++,ind=getIndizesWI[getBlank[coup[[1,1,i]]]];
For[j=1,j<=Length[ind],j++,
If[ind[[j,1]]=!=generation,AppendTo[setsofindices[[i]],ind[[j,1]]/.subGC[i]/.subIndFinal[i,i]];];
];
];
delta=1;
If[(coup[[1,1,1]]/.A_[{b__}]->A)===conj[(coup[[1,1,2]]/.A_[{b__}]->A)],If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*(setsofindices[[1]].setsofindices[[2]]/.Times->Delta);];
If[FreeQ[coup[[1,1,3]],List]===False,delta=delta*(setsofindices[[3]].setsofindices[[4]]/.Times->Delta);];,If[(coup[[1,1,1]]/.A_[{b__}]->A)===conj[(coup[[1,1,3]]/.A_[{b__}]->A)],If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*(setsofindices[[1]].setsofindices[[3]]/.Times->Delta);];
If[FreeQ[coup[[1,1,2]],List]===False,delta=delta*(setsofindices[[2]].setsofindices[[4]]/.Times->Delta);];,If[FreeQ[coup[[1,1,1]],List]===False,delta=delta*(setsofindices[[1]].setsofindices[[4]]/.Times->Delta);];
If[FreeQ[coup[[1,1,2]],List]===False,delta=delta*(setsofindices[[2]].setsofindices[[3]]/.Times->Delta);];];];
delta=delta/.Plus->Times/.{Delta[lt1,__]->1,Delta[lt2,__]->1,Delta[lt3,__]->1,Delta[lt4,__]->1};
temp=delta*coup[[1,2,1]];
For[i=1,i<=Length[tosum],temp=ReleaseHold[Hold[Sum[temp,IND]]/.IND->{tosum[[i,1]],1,tosum[[i,2]]}];
i++;];
If[FreeQ[temp,fSU3]==False||FreeQ[temp,Lam]==False,temp=temp//.sum[a_,b_,c_,d___ fSU3[e___]]:>Sum[d fSU3[e],{a,b,c}]//.sum[a_,b_,c_,fSU3[e___]^d_]:>Sum[fSU3[e]^d,{a,b,c}];
temp=temp//.sum[a_,b_,c_,d___ Lam[e___]]:>Sum[d Lam[e],{a,b,c}]//.sum[a_,b_,c_,Lam[e___]^d_]:>Sum[Lam[e]^d,{a,b,c}];];
Return[temp];
];
