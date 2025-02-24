(* ::Package:: *)

GenerateSPheno2LPole[ReadL_]:=Block[{generate2L},Print[StyleForm["Writing SPheno two loop diagrammatic Higgs mass","Section",FontSize->12]];
Print["by Mark Goodsell (goodsell@lpthe.jussieu.fr), arxiv:1503.03098"];
(*$sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}];*)

generate2L=True;
spheno2LP=OpenWrite[ToFileName[$sarahSPhenoTwoLoopDir,"2LPole_"<>ModelName<>".f90"]];
If[FreeQ[ParticleDefinitions[CurrentStates],"Pseudo-Scalar Higgs"]==False,AddPseudos=True;,AddPseudos=False;];

Write2LPoleHeader;
$sarahStoreTwoLoopDir=ToFileName[{$sarahCurrentOutputDir,"Two-Loop"}];

If[FileExistsQ[$sarahStoreTwoLoopDir]=!=True,
generate2L=True;
CreateDirectory[$sarahStoreTwoLoopDir];
,
If[ReadL==True,
generate2L=Not[Read2LLists]
];
];




If[generate2L,
generate2LPoleFunctions;
generate2L=Read2LLists;
If[!generate2L,Print["Error generating/reading two loop functions!\n]";Return[]]];
];

Clear[tad2Ldyn,hh2Ldyn,Ah2Ldyn];

WriteString[spheno2LP,"! ----------------------------------\n"];
       WriteString[spheno2LP,"! ------- TADPOLE DIAGRAMS --------\n"]; 
       WriteString[spheno2LP,"! ----------------------------------\n"];

Write2LPoleFunction[1,tad2Ldyn,twolooptadpolediags];

If[AddPseudos==True,
 WriteString[spheno2LP,"\n! ------------------------------------\n"];
          WriteString[spheno2LP,"! ------- CP EVEN MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! ------------------------------------\n"];
,
WriteString[spheno2LP,"\n! -------------------------------\n"];
         WriteString[spheno2LP,"! ------- MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! -------------------------------\n"];
];

Write2LPoleFunction[2,hh2Ldyn,twoloophiggsmassdiags[[1]]];


If[AddPseudos==True,
 WriteString[spheno2LP,"\n! -----------------------------------\n"];
          WriteString[spheno2LP,"! ------- CP ODD MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! -----------------------------------\n"];
Write2LPoleFunction[3,Ah2Ldyn,twoloophiggsmassdiags[[2]]];
];

WriteString[spheno2LP,"End Subroutine CalculatePi2S\n"];
WriteString[spheno2LP,"End Module Pole2L_"<>ModelName<>" \n \n"];
Close[spheno2LP];
If[FileExistsQ[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]]===True,DeleteFile[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];];
If[SupersymmetricModel=!=False,CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"2LPoleFunctions.f90"],ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];,CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"2LPoleFunctionsMSbar.f90"],ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];];];


Read2LLists:=Block[{readok},
readok=True;
twolooptadpolediags={};


Check[Get[ToFileName[$sarahStoreTwoLoopDir,"tadpoles.m"]],readok=False];

If[AddPseudos==False,
twoloophiggsmassdiags={0};
,
twoloophiggsmassdiags={0,0};
Check[Get[ToFileName[$sarahStoreTwoLoopDir,"Ah.m"]],readok=False];
];

Check[Get[ToFileName[$sarahStoreTwoLoopDir,"hh.m"]],readok=False];
Return[readok];

];


Write2LPoleHeader:=Block[{},WriteString[spheno2LP,"Module Pole2L_"<>ModelName<>" \n \n"];
WriteString[spheno2LP,"Use Control \n"];
WriteString[spheno2LP,"Use Couplings_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use LoopFunctions \n"];
WriteString[spheno2LP,"Use Mathematics \n"];
WriteString[spheno2LP,"Use MathematicsQP \n"];
WriteString[spheno2LP,"Use Model_Data_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use StandardModel \n"];
WriteString[spheno2LP,"Use TreeLevelMasses_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use Pole2LFunctions\n"];
WriteString[spheno2LP,"Contains \n \n"];

MakeSubroutineTitle["CalculatePi2S",Join[listVEVs,listAllParameters],{"p2"},{"kont","tad2L","Pi2S","Pi2P"},spheno2LP];



dimMatrix=ToString[getGenSPheno[HiggsBoson]];

WriteString[spheno2LP,"Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",spheno2LP];
MakeVariableList[listVEVs,",Intent(in)",spheno2LP];
MakeVariableList[NewMassParameters,"",spheno2LP];


MakeVariableList[namesAll3P,"",spheno2LP];
MakeVariableList[namesAll4Pole,"",spheno2LP];


WriteString[spheno2LP,"Real(dp), Intent(in) :: p2\n"];
WriteString[spheno2LP,"Integer, Intent(inout):: kont\n"];
WriteString[spheno2LP,"Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 \n"];
WriteString[spheno2LP,"Real(dp) :: Qscale,prefactor,funcvalue\n"];
WriteString[spheno2LP,"complex(dp) :: cplxprefactor\n"];
WriteString[spheno2LP,"Real(dp)  :: temptad("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcont("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: runningval("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: tad2l("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2S("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2P("<>dimMatrix<>","<>dimMatrix<>")\n"];

WriteString[spheno2LP,"complex(dp) :: coup1,coup2,coup3,coup4\n"];
WriteString[spheno2LP,"complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r\n"];

(*parameter for when to tree fermions in the loop as massless*)
WriteString[spheno2LP,"real(dp) :: epsFmass\n"];
WriteString[spheno2LP,"real(dp) :: epscouplings\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingvector("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingmatrix("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"logical :: nonzerocoupling\n"];

(*Vector IncludeOnlyInternals restricts to only specific fields in the loop,e.g.IncludeOnlyInternals={Su,VG,Fu,Glu};
This can also be set in the SPheno.m file.If this is set,then we also restrict to third generation only.*)
If[Length[IncludeOnlyInternals]!=0,WriteString[spheno2LP,"Complex(dp) :: Ydtemp(3,3),Yetemp(3,3),Yutemp(3,3)\n"];
WriteString[spheno2LP,"real(dp) :: topyukawa,sbe,pietromt,vv\n"];
WriteString[spheno2LP,"write(*,*) \"Setting Yukawas diagonal and Yd to zero \"\n"];
WriteString[spheno2LP,"Ydtemp = (0._dp,0._dp)\nYdtemp(3,3)=real(Yd(3,3))\nYetemp = (0._dp,0._dp)\nYetemp(3,3)=real(Ye(3,3))\ntopyukawa = real(Yu(3,3))\nYutemp = (0._dp,0._dp)\nYutemp(3,3) = topyukawa\n"];
subcoupnames={Yu->Yutemp,Yd->Ydtemp,Ye->Yetemp,T[x_]->T[x]};,(*otherwise we don't do anything*)subcoupnames={};];

WriteString[spheno2LP,"\n\n"];

WriteString[spheno2LP,"tad2l(:)=0\n"];
WriteString[spheno2LP,"Pi2S(:,:)=0\n"];
WriteString[spheno2LP,"Pi2P(:,:)=0\n"];
WriteString[spheno2LP,"Qscale=getrenormalizationscale()\n"];
WriteString[spheno2LP,"epsfmass=0._dp\n"];
WriteString[spheno2LP,"epscouplings=1.0E-6_dp\n"];


(*Call tree level masses*)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters/.subcoupnames]],{},{".True.","kont"},spheno2LP];
(*Call 3-point couplings*)
MakeCall["CouplingsFor2LPole3",Join[parametersAll3P/.subcoupnames,namesAll3P],{},{},spheno2LP];
(*Call 4-point couplings taking proper care of colour factors*)
MakeCall["CouplingsFor2LPole4",Join[parametersAll4Pole/.subcoupnames,namesAll4Pole],{},{},spheno2LP];






];



generate2LPoleFunctions:=Block[{},dimhh=getGenSPheno[HiggsBoson];
(*************************************************************************)(*********************TADPOLE DIAGRAMS**********************************)(*************************************************************************)

Print["Generating tadpole diagrams"];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"tadpoles.m"]];
(*Print[$sarahStoreTwoLoopDir," tadpoles\n"];*)
WriteString[FH2LP,"twolooptadpolediags={"];
total2Ldiagramswritten=0;
all2LPddata=Classify2LTadpoleDiagrams[HiggsBoson];
all2LPdiagrams=all2LPddata[[1]];
POLE2Ldiagramdata=all2LPddata[[2]];
dynamictwolooptadpoletopology="";
dynamictwolooptadpolediagram="";
Print[Dynamic[dynamictwolooptadpoletopology],": ",Dynamic[dynamictwolooptadpolediagram]];
type=ToSSS;
generatePOLEfunctions[1,type,{1,1,1},{1,1,1}];
type=ToSS;
generatePOLEfunctions[1,type,{1,1,2},{1,1,2}];
type=ToSSSS;
generatePOLEfunctions[1,type,{1,1,2,2},{1,1,1,1}];
(*-----SCALAR AND VECTOR DIAGRAMS*)
(*Print["Generating Scalar-Vector diags"];*)
type=ToSV;
generatePOLEfunctions[1,type,{1},{1}];
(*-----FERMION AND SCALAR DIAGRAMS*)
(*Print["Generating Scalar-Fermion diags"];*)
type=ToSSFF;
generatePOLEfunctions[1,type,{1,1,2,2},{1,1,1,1,1,0}];
type=ToFFFS;
generatePOLEfunctions[1,type,{1,1,2,3},{1,1,1,1,1,0}];
(*-----FERMION AND VECTOR DIAGRAMS*)
(*Print["Generating Fermion-Vector diags"];*)
type=ToFV;
generatePOLEfunctions[1,type,{1},{1,1,1,1,1,0}];

dynamictwolooptadpoletopology="Tadpole diagrams complete";
dynamictwolooptadpolediagram=ToString[total2Ldiagramswritten]<>" diagrams written to file.";
WriteString[FH2LP,"\n}\n"];
Close[FH2LP];

(*************************************************************************)(*********************MASS DIAGRAMS*************************************)(*************************************************************************)

If[FreeQ[ParticleDefinitions[CurrentStates],"Pseudo-Scalar Higgs"],
iScalarEnd=1;
twoloophiggsmassdiags={0};
,
twoloophiggsmassdiags={0,0};
iScalarEnd=2;];
    
For[iScalar=1,iScalar<=iScalarEnd,iScalar++,
total2Ldiagramswritten=0;
Clear[all2LPddata,all2LPdiagrams,POLE2Ldiagramdata,topdata];
If[iScalar===1,
Print["Generating mass diagrams for " <>ToString[HiggsBoson]<>" states"];
          all2LPddata=Classify2LPdiagrams[HiggsBoson];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"hh.m"]];

WriteString[FH2LP,"twoloophiggsmassdiags[[1]]={"];
(*Print[$sarahStoreTwoLoopDir," hh\n"];*)
,
Print["Generating mass diagrams for "<>ToString[PseudoScalar]<>" states"];
          all2LPddata=Classify2LPdiagrams[PseudoScalar];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"Ah.m"]];
WriteString[FH2LP,"twoloophiggsmassdiags[[2]]={"];
(*Print[$sarahStoreTwoLoopDir," Ah\n"];*)
          ];



all2LPdiagrams=all2LPddata[[1]];
	POLE2Ldiagramdata=all2LPddata[[2]];

If[iScalar==1,
dynamictwolooppoletopology="";
              dynamictwolooppolediagram="";
	      Print[Dynamic[dynamictwolooppoletopology],": ",Dynamic[dynamictwolooppolediagram]];
,
dynamictwolooppoleAhtopology="";
              dynamictwolooppoleAhdiagram="";
	      Print[Dynamic[dynamictwolooppoleAhtopology],": ",Dynamic[dynamictwolooppoleAhdiagram]];

];

(*********************SCALAR ONLY DIAGRAMS**********************************)

(* ----- SCALAR ONLY DIAGRAMS *)

        type=WoSSSS;
        generatePOLEfunctions[2,type,{1,1,2,2},{1,1,1,1}];
type=XoSSS;
 generatePOLEfunctions[2,type,{1,1,2},{1,1,2}];
type=YoSSSS;
 generatePOLEfunctions[2,type,{1,2,2,3},{1,1,1,2}];
type=ZoSSSS;
 generatePOLEfunctions[2,type,{1,1,2,2},{1,1,2,2},{1,1}];
type=SoSSS;
 generatePOLEfunctions[2,type,{1,1,1},{1,1,1}];
type=UoSSSS;
 generatePOLEfunctions[2,type,{1,2,3,3},{1,1,1,1}];
type=VoSSSSS;
 generatePOLEfunctions[2,type,{1,2,2,3,3},{1,1,1,1,1}];
type=MoSSSSS;
 generatePOLEfunctions[2,type,{1,2,1,2,3},{1,1,1,1,1},{1,1,3}];
(*********************SCALAR AND VECTOR DIAGRAMS**********************************)
type=WoSSSV;
 generatePOLEfunctions[2,type,{1},{1}];
type=VoSSSSV;
 generatePOLEfunctions[2,type,{1,1},{1,1}];
type=MoSSSSV;
 generatePOLEfunctions[2,type,{1,1},{1,1}];
(*-------------------------------------FERMIONS AND SCALARS---------------------------------*)
type=WoSSFF;
 generatePOLEfunctions[2,type,{1,1,2,2},{1,1,1,1,1,0}];
type=MoFFFFS;
 generatePOLEfunctions[2,type,{1,2,1,2,3},{1,1,1,1,1,0}];
type=MoSFSFF;
 generatePOLEfunctions[2,type,{1,2,3,2,4},{1,1,1,1,1,0}];
type=VoSSSFF;
 generatePOLEfunctions[2,type,{1,2,2,3,3},{1,1,1,1,1,0}];
type=VoFFFFS;
 generatePOLEfunctions[2,type,{1,2,2,3,4},{1,1,1,1,1,0}];
(*-------------------------------------FERMIONS AND VECTORS---------------------------------*)
type=GoFFFFV;
 generatePOLEfunctions[2,type,{1,1},{1,1,1,1,1,0}];

WriteString[FH2LP,"\n}\n"];
Close[FH2LP];

If[iScalar==1,
dynamictwolooppoletopology="Complete";
dynamictwolooppolediagram=ToString[total2Ldiagramswritten]<>" diagrams written to file.";
,
dynamictwolooppoleAhtopology="Complete";
dynamictwolooppoleAhdiagram=ToString[total2Ldiagramswritten]<>" diagrams written to file.";

];



];



](*end generate2LPoleFunctions*)



(******************************************************END OF Write2LPoleFunction********************************)(******************************************************DEFINE HELPER FUNCTIONS********************************)getSPhenoCouplingPole[x_,couplings_]:=Module[{func,cList,pList,pos},(*Returns the spheno coupling name and the ordered list of particles given a coupling of the form C[p1,....]*)func=x/.Cp[a__]->C[a]/.A_[{a__}]->A;
If[FreeQ[couplings,func]==False,pos=Position[couplings,func];
cList=Extract[couplings,pos[[1,1]]][[2]];
pList=Last[Extract[couplings,pos[[1,1]]]];
Return[{Delete[cList,1],pList}],If[FreeQ[couplings,ConjCoupling[func]]==False,pos=Position[couplings,ConjCoupling[func]];
cList=Extract[couplings,pos[[1,1]]][[2]];
pList=Map[AntiField,Last[Extract[couplings,pos[[1,1]]]]];
Return[{Delete[cList,1],pList}];,Return[0]]];
Return[0]];

twoloopgetSPhenoCouplingName[x_]:=Module[{func,cList,pList,pos,parts,nparts,ctype,couplings},(*Returns the spheno coupling name and the ordered list of particles given a coupling of the form C[p1,....]*)
func=x/.Cp[a__]->C[a];
parts=func/.{C[a__]->{a}};
nparts=Length[parts];
If[nparts==3,couplings=SPhenoCouplings3P,couplings=SPhenoCouplings4Pole];
If[FreeQ[couplings,func]==False,
pos=Position[couplings,func];
cList=Extract[couplings,pos[[1,1]]][[2]];
Return[{Delete[cList,1]}],
If[FreeQ[couplings,ConjCoupling[func]]==False,
pos=Position[couplings,ConjCoupling[func]];
cList=Extract[couplings,pos[[1,1]]][[2]];
Return[{Delete[cList,1]}];
,
Return[0]]];
Return[0]];

TwoLMakeIndices[setofindices_,Coupling_]:=Block[{tps,ps,indextemp,pos,pp,outindices,plisttemp,ilisttemp,sphenoc,couplings},
(*Order the particles as in the spheno coupling *)
tps=Coupling/.{C[x__]->{x}};
Switch[Length[tps],
3,
couplings=SPhenoCouplings3P;
,
4,
couplings=SPhenoCouplings4Pole;
,
_,
Print["Problem with length of coupling in two loop routines\n"];
Abort[];
];
pos=Position[couplings,Coupling];
If[pos=={},Print["Problem with couplings in two loop routines\n"];
Abort[];];

ps=(Last[couplings[[pos[[1,1]]]]])/.{A_[{b__}]->A};

plisttemp=Transpose[setofindices][[1]];
ilisttemp=Transpose[setofindices][[2]];
outindices={};
For[pp=1,pp<=Length[ps],pp++,
pos=Position[plisttemp,ps[[pp]],1];
If[pos=!={},
If[getGenSPheno[ps[[pp]]]>1,AppendTo[outindices,{ps[[pp]],ilisttemp[[pos[[1,1]]]]}]];
plisttemp=Delete[plisttemp,pos[[1,1]]];
ilisttemp=Delete[ilisttemp,pos[[1,1]]];
,
Print["Error in ordering vertex ",Coupling," in two loop routines\n"];
Abort[];
];
];
Return[{outindices,Coupling}]

];

(******************************************************SYMMETRY FACTORS********************************)

SetAttributes[{POLEdiagsymmetries},{HoldAll}];
POLEdiagsymmetries[listinternals_,ps_,equivalencesets_,chains_,metaequivalencesets_:{1,2,3,4,5}]:=Module[{i,j,nsets,tempsets,ctempsets,tempset,tempset2,equivalentset,cequivalentset,equivalentsetno,nid,lenset,symfac,ncomplex,nchains,tempchains,tempchain,lenchain},nsets=Last[equivalencesets];
nchains=Last[chains];
tempsets=Table[{},{i,1,nsets}];
ctempsets=Table[{},{i,1,nsets}];
tempchains=Table[{},{i,1,nchains}];
symfac=1;
If[nchains>0,(*added for fermion bits,which have no chains...*)For[i=1,i<=Length[equivalencesets],i++,AppendTo[tempsets[[equivalencesets[[i]]]],ps[[i]]];
AppendTo[ctempsets[[equivalencesets[[i]]]],myconj[{ps[[i]]}]/.{{x_}->x}];
AppendTo[tempchains[[chains[[i]]]],ps[[i]]];];,For[i=1,i<=Length[equivalencesets],i++,AppendTo[tempsets[[equivalencesets[[i]]]],ps[[i]]];
AppendTo[ctempsets[[equivalencesets[[i]]]],myconj[{ps[[i]]}]/.{{x_}->x}];];];
For[i=1,i<=nsets,i++,tempsets[[i]]=Sort[tempsets[[i]]];
ctempsets[[i]]=Sort[ctempsets[[i]]];
equivalentsetno=metaequivalencesets[[i]];
If[equivalentsetno<i,tempset=tempsets[[i]];
equivalentset=tempsets[[equivalentsetno]];(*Already sorted on the first pass...*)ctempset=ctempsets[[i]];
cequivalentset=ctempsets[[equivalentsetno]];
If[tempset=!=equivalentset,symfac=symfac*2;];
If[OrderedQ[{equivalentset,tempset}]==False,(*If not correctly ordered then swap them round*)tempsets[[equivalentsetno]]=tempset;
tempsets[[i]]=equivalentset;];
If[OrderedQ[{cequivalentset,ctempset}]==False,(*If not correctly ordered then swap them round*)ctempsets[[equivalentsetno]]=ctempset;
ctempsets[[i]]=cequivalentset;];];];
If[FreeQ[listinternals,tempsets]=!=True,(*old diagram!*)Return[0]];
If[FreeQ[listinternals,ctempsets]=!=True,(*old diagram!*)Return[0]];
(*Otherwise we have a new diagram:compute the symmetry factor*)AppendTo[listinternals,tempsets];
ncomplex=0;
For[i=1,i<=nchains,i++,tempchain=tempchains[[i]];
lenchain=Length[tempchain];
For[j=1,j<=lenchain,j++,If[conj[tempchain[[j]]]=!=tempchain[[j]],ncomplex++;
Break[];];];];
For[i=1,i<=nsets,i++,tempset=tempsets[[i]];
lenset=Length[tempset];
tempset=tempset//.{conj[a_]->a,bar[a_]->a};
symfac=symfac*Factorial[lenset];
While[lenset>0,tempset=DeleteCases[tempset,tempset[[1]]];
nid=0;
nid=lenset-Length[tempset];
symfac=symfac/Factorial[nid];
lenset=Length[tempset]];];
symfac=symfac*Power[2,ncomplex];
Return[symfac];];



(************************************************************************************************************************)(******************************************************GENERATOR FUNCTION**********************************)(************************************************************************************************************************)generatePOLEfunctions[nh_,type_,equivalences_,chains_,metasets_:{1,2,3,4,5}]:=Module[{ps,finalnumberofdiags,ninternalparticles,numberofcouplings,i,j,iic,iii,k,x,diag,NrDiags,diagrams,diagselection,diagdata,BreakFlag,tempcoup,coups,prefactor,constantprefactor,string,funcstring,finalstring,symfactor,Scalarcouplingnumber,myparts,nmyparts,setofindices,findpart,target,descriptioninternalprops,allindicesstrings,mylistinternals,indstring,indicestowrite,partsgens,gaugebosonsincoup,gbgaugegroup,topodata,generalddata,specificddata,fermionflag,SPOLEprefactor,POLEprefactor,FPOLEprefactor},
Clear[topdata,topodata,diagdata];
If[nh==1,
dynamictwolooptadpoletopology="Topology "<>ToString[type];,
If[iScalar>1,
dynamictwolooppoleAhtopology="Topology "<>ToString[type];
,
dynamictwolooppoletopology="Topology "<>ToString[type];
];
];
ninternalparticles=Length[equivalences];
finalnumberofdiags=0;
mylistinternals={};
diagselection=Select[all2LPdiagrams,#[[1]]===type&];
If[Length[diagselection]>0,diagrams=diagselection[[1,2]];
NrDiags=Length[diagrams],NrDiags=0];
If[NrDiags>0,

(*Print[NrDiags," of type ",type];*)

If[total2Ldiagramswritten=!=0,WriteString[FH2LP,","]];
WriteString[FH2LP,"\n{"<>ToString[type]<>",{\n"];
finalnumberofdiags=0;
diagdata=(Select[POLE2Ldiagramdata,#[[1]]===type&])[[1,2]];

If[Length[diagdata]>2,
(* Bosonic processes *)
topodata=topdata/.diagdata;
generalddata={};
specificddata={};
SPOLEprefactor=pprefactor/.diagdata;
funcstring=pfuncstring/.diagdata;
fermionflag=False;
,

(* Fermionic processes *)
SPOLEprefactor=1;
generalddata=diagdata[[1]];
         specificddata=diagdata[[2]];
        topodata=topdata/.generalddata;
fermionflag=True;
];




For[i=1,i<=NrDiags,i++,diag=diagrams[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];

BreakFlag=False;
If[Length[IncludeOnlyInternals]!=0,For[j=1,j<=Length[ps],j++,If[FreeQ[IncludeOnlyInternals,ps[[j]]/.{conj[x_]->x}]==True,BreakFlag=True;
Continue[];];];];
If[BreakFlag==True,Continue[]];
numberofcouplings=Length[diag[[1]]];
coups={};
BreakFlag=False;
For[j=1,j<=numberofcouplings,j++,tempcoup=diag[[1,j]];
If[Length[tempcoup/.{C[x__]->{x}}]==4,tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings4Pole],tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings3P]];
If[tempcoup===0,BreakFlag=True,AppendTo[coups,tempcoup]];];
If[BreakFlag==True,Continue[]];
symfactor=POLEdiagsymmetries[mylistinternals,ps,equivalences,chains,metasets];
If[symfactor==0,Continue[];];
finalnumberofdiags++;


descriptioninternalprops=StringJoin@Riffle[ToString/@ps,","];
If[nh==1,
dynamictwolooptadpolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";,
If[iScalar>1,
dynamictwolooppoleAhdiagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
,
dynamictwolooppolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
];
];
allindicesstrings={};
adjoint=False;
indexmaps={};
setofindices={};
myparts={};
internalparticlelist={};
GaugeBosonFlag=False;
Scalarcouplingnumber=0;
numberofcouplings=Length[diag[[1]]];
colourfactor=0;
(*WTF ARE WE DOING THIS AGAIN FOR?*)
(*ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];*)

setofindices=topodata/.diag[[2]];
nmyparts=Count[Flatten[topodata],Internal[_]];
internalparticlelist=Table[{ps[[iii]],ToExpression["i"<>ToString[iii]]},{iii,1,nmyparts}];
myparts=Take[ps,nmyparts];
(*If[FreeQ[ps,VG]\[Equal]False,GaugeBosonFlag=True;
indicesoffirstinternal=getIndizesWI[myparts[[1]]];
dimoffirstinternal=(Select[indicesoffirstinternal,FreeQ[#,color]\[Equal]False&])[[1]]/.{color,a_Integer}\[Rule]a;
numberingaugegroupofcolor=(Position[Gauge,color])[[1,1]];
colourfactor=8*(CalculateDynkinAndCasimir[numberingaugegroupofcolor,dimoffirstinternal])[[2]]];*)
gaugebosonsincoup=Select[ps,getType[#]==V&];
If[gaugebosonsincoup=!={},(*Should only be one gauge boson present for now!*)
gbgaugegroup=Position[Transpose[dataUnBrokenGaugeGroups][[4]],gaugebosonsincoup[[1]]];
If[gbgaugegroup=!={},
GaugeBosonFlag=True;
gbgaugegroup=gbgaugegroup[[1,1]];(*This should now have all the info about the group necessary*)
(* Now want colour factor \[Rule] dimension of gauge group * dynkin index for first particle *)
colourfactor=dataUnBrokenGaugeGroups[[gbgaugegroup,6]]*SA`Dynkin[RE[myparts[[1]]],dataUnBrokenGaugeGroups[[gbgaugegroup,1]]];
];
];

indextonumber={i1->1,i2->2,i3->3,i4->4,i5->5};


For[j=1,j<=numberofcouplings,j++,
particlesincouplingj=diag[[1,j]]/.{C[x__]->{x}};
nparticlesincouplingj=Length[particlesincouplingj];
(*If[FreeQ[particlesincouplingj,VG]\[Equal]False,*)
If[GaugeBosonFlag,
If[FreeQ[particlesincouplingj,dataUnBrokenGaugeGroups[[gbgaugegroup,4]]]==False,
coups[[j]]={{dataUnBrokenGaugeGroups[[gbgaugegroup,3]]},False};
AppendTo[allindicesstrings,{"{}",dataUnBrokenGaugeGroups[[gbgaugegroup,3]]}];
Continue[]
];
]; (* end gaugebosonflag*)
Scalarcouplingnumber++;

If[nparticlesincouplingj==4,(*First check whether four identical particles up to conjugation;in that case have to be careful with order if coloured*)
	If[Length[Intersection[RE/@particlesincouplingj]]==1&&Length[Intersection[particlesincouplingj]]==2,
	particlesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[1]];
	indicesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[2]];
	setofpairs={{},{}};
	orderedfieldsincoupling=diag[[1,j]]/.{C[x__]->{x}};
	For[k=1,k<=4,k++,
		AppendTo[setofpairs[[chains[[indicesincoupling[[k]]/.indextonumber]]]],{particlesincoupling[[k]],indicesincoupling[[k]]}];
		];
	(*sets of pairs should be sets of conjugates...*)
	newcouplingindices={{},{},{},{}};
	pp1=Position[orderedfieldsincoupling,setofpairs[[1,1,1]],1][[1,1]];
	pp2=Position[orderedfieldsincoupling,setofpairs[[1,2,1]],1][[1,1]];
	pp3=Position[orderedfieldsincoupling,setofpairs[[2,1,1]],1][[2,1]];
	pp4=Position[orderedfieldsincoupling,setofpairs[[2,2,1]],1][[2,1]];
	newcouplingindices[[pp1]]=setofpairs[[1,1]];
	newcouplingindices[[pp2]]=setofpairs[[1,2]];
	newcouplingindices[[pp3]]=setofpairs[[2,1]];
	newcouplingindices[[pp4]]=setofpairs[[2,2]];
(*Have already ordered the couplings so let's do our own makeindicescoupling4 rather than calling the other function*)
	indicestowrite={};
	For[k=1,k<=4,k++,AppendTo[indicestowrite,{orderedfieldsincoupling[[k]],newcouplingindices[[k,2]]}]
	];
	AppendTo[allindicesstrings,{indicestowrite,diag[[1,j]]/.a_[{x__}]->a}];
,
(*Otherwise just a regular 4pt coupling*)
(*AppendTo[allindicesstrings,MakeIndicesCoupling4[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]*)


(*AppendTo[allindicesstrings,{setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]\[Rule]a}];*)
AppendTo[allindicesstrings,TwoLMakeIndices[setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]->a]];

]; (* *)
,
(* three particles in coupling *)
(*AppendTo[allindicesstrings,MakeIndicesCoupling[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]*)

(*AppendTo[allindicesstrings,{setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]\[Rule]a}];*)

AppendTo[allindicesstrings,TwoLMakeIndices[setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]->a]];

];
];
(*For[j=1,j\[LessEqual]Length[internalparticlelist],j++,If[getGen[internalparticlelist[[j,1]]]>1,WriteString[spheno2LP,"Do "<>ToString[internalparticlelist[[j,2]]]<>"=1,"<>ToString[getGen[internalparticlelist[[j,1]]]]<>"\n"];]];*)


Clear[ci1,ci2,ci3,icc];
If[GaugeBosonFlag==False,colourfactor=mhpolegetcolour[setofindices];];


POLEprefactor=((-1)^numberofcouplings)*SPOLEprefactor*symfactor*colourfactor;


If[finalnumberofdiags>1,WriteString[FH2LP,",\n"];];

partsgens={#[[1]],#[[2]],getGenSPheno[#[[1]]]}&/@internalparticlelist;
WriteString[FH2LP,"{"<>ToString[partsgens]<>","];

If[fermionflag==False,
(* bosonic diagrams *) 
WriteString[FH2LP,"{{"<>ToString[POLEprefactor,InputForm]<>","<>funcstring<>","<>ToString[Array[0&,{numberofcouplings}]]<>"}},"];
,
(* fermionic diagrams *)
WriteString[FH2LP,"{"];

isdirac=Or@@PDiracQ/@ps;
            If[isdirac==False,POLEprefactor=POLEprefactor*1/2];


For[ii=1,ii<=Length[specificddata],ii++,
fermionmassesarray=(pfermionmasses/.specificddata[[ii]])/.diag[[2]];
                couplingtypesarray=pcouplingtypes/.specificddata[[ii]];
              funcstring=pfuncstring/.specificddata[[ii]];
              FPOLEprefactor=pprefactor/.specificddata[[ii]];
fermionmassstring="";

For[k=1,k<=Length[fermionmassesarray],k++,
tempmassstring="Mass["<>ToString[fermionmassesarray[[k,1]]];
If[getGenSPheno[fermionmassesarray[[k,1]]]>1,tempmassstring=tempmassstring<>","<>ToString[fermionmassesarray[[k,2]]]];
tempmassstring=tempmassstring<>"]";
fermionmassstring=fermionmassstring<>"*"<>tempmassstring;
];
If[ii>1,
WriteString[FH2LP,","];
];

WriteString[FH2LP,"{"<>ToString[FPOLEprefactor*POLEprefactor,InputForm]<>fermionmassstring<>","<>funcstring<>","<>ToString[couplingtypesarray]<>"}"];


]; (* end For[ii=1,... *)
WriteString[FH2LP,"},"];


]; (* end if fermionflag \[Equal] False*)


WriteString[FH2LP,ToString[allindicesstrings]<>"}"];




];(*End For[count over diagrams*)

WriteString[FH2LP,"\n}}"];(* to end the type*)

If[nh==1,
dynamictwolooptadpolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
,
If[iScalar>1,
dynamictwolooppoleAhdiagram=ToString[finalnumberofdiags]<>" diagrams written to file";
,
dynamictwolooppolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
];
];

total2Ldiagramswritten+=finalnumberofdiags;
](*end if[NrDiags>0,*)
];(*End generate*)(************************************************************************************************************************)(******************************************************END GENERATOR FUNCTION***********************************)(************************************************************************************************************************)








(************************************************************************************************************************)
(******************************************************WRITER FUNCTION**********************************)
(************************************************************************************************************************)



Clear[Write2LPoleFunction];
Write2LPoleFunction[nh_,dynamic_,setofdiags_]:=Block[{types,ntypes,dcount,diag,ndiags,ps,ddata,pdesc,funcdesc,coupdescs,i,j,k,ii,argstring,string,string1,string2,prefactorstring,numberofcouplings,fcouptypes,fcount,indstring,prefactorlist,prefactormasslist,fermionmassstring,fermionandstring,tempmassstring,numericalprefactors,fermionmassstrings,fermionandstrings,labelstrings},
ntypes=Length[setofdiags];
dynamic="";

If[nh==1,
WriteString[spheno2LP,"temptad(:)=0._dp\n"];
	WriteString[spheno2LP,"tempcouplingvector(:)=0._dp\n"];
,

WriteString[spheno2LP,"tempcont(:,:)=0._dp\n"];
	WriteString[spheno2LP,"tempcouplingmatrix(:,:)=0._dp\n"];

];

If[AddPseudos,
labelstrings={"Tadpoles: ","CP-even masses: ","CP-odd masses: "};,
labelstrings={"Tadpoles: ","Masses: "};
];
Print["Writing "<>labelstrings[[nh]],Dynamic[dynamic]];
For[types=1,types<=ntypes,types++,
(*writerdynamics[[writerdynamic]]=ToString[setofdiags[[types,1]]]<>", ("<>ToString[types]<>" of "<>ToString[ntypes];*)

dynamic=ToString[setofdiags[[types,1]]]<>" ("<>ToString[types]<>" of "<>ToString[ntypes]<>") topologies";
WriteString[spheno2LP,"! ---- Topology "<>ToString[setofdiags[[types,1]]]<>"\n"];


ndiags=Length[setofdiags[[types,2]]];

For[dcount=1,dcount<=ndiags,dcount++,
ddata=setofdiags[[types,2,dcount]];
pdesc=ddata[[1]];
funcdesc=ddata[[2]];
coupdescs=ddata[[3]];
(*Print[coupdescs];*)
ps=Transpose[pdesc][[1]];

WriteString[spheno2LP,"! ---- "<>StringJoin@Riffle[ToString/@ps,","]<>" ----\n"];

For[j=1,j<=Length[pdesc],j++,
If[pdesc[[j,3]]>1,
WriteString[spheno2LP,"Do "<>ToString[pdesc[[j,2]]]<>"=1,"<>ToString[pdesc[[j,3]]]<>"\n"];]];

If[nh==1,argstring="(";,argstring="(p2,";];
	argstring=argstring<>StringJoin@@Riffle[(ToString@SPhenoMassSq[#[[1]],#[[2]]])/.{"0."->"0._dp"}&/@pdesc,","]<>",Qscale)";



  


fcouptypes=Length[funcdesc];
numberofcouplings=Length[coupdescs];



For[fcount=1,fcount<=fcouptypes,fcount++,

(* don't really need to do this as we overwrite each entry *)
(*
If[nh\[Equal]1,
WriteString[spheno2LP,"tempcouplingvector=0._dp\n"];
,
WriteString[spheno2LP,"tempcouplingmatrix=0._dp\n"];
];
*)


prefactorlist=Flatten[{funcdesc[[fcount,1]]/.{Times->List}}];

numericalprefactors=Flatten[{DeleteCases[{DeleteCases[prefactorlist,Mass[x__]]},1]}];(*Remove leading 1s *)
prefactormasslist=Cases[prefactorlist,Mass[x__]->{x}];



fermionmassstrings=ToString[SPhenoMass[Sequence@@#]]&/@prefactormasslist;
If[FreeQ[fermionmassstrings,"0."]==False,(*One of the particles in the prefactor has its mass defined to be zero *)
Continue[];
];
(*Print["prefactors: ",prefactorlist,"-----",prefactormasslist,"-----",fermionmassstrings];*)
prefactorstring=StringJoin[Riffle[Join[ToString[FortranForm[If[Head[#]===Integer,1.0*#,#]]]&/@numericalprefactors,fermionmassstrings],"*"]];
If[prefactorstring=!="",prefactorstring=prefactorstring<>"*"];

(*Print["prefactorstring: ",prefactorstring];*)
If[Length[fermionmassstrings]>0,

fermionandstring="if(";
fermionandstrings=StringJoin["(",#," .gt. epsfmass)"]&/@fermionmassstrings;
fermionandstring=fermionandstring<>StringJoin[Riffle[fermionandstrings," .and. "]]<>") then \n";
WriteString[spheno2LP,fermionandstring];
]

WriteString[spheno2LP,"nonzerocoupling=.false.\n"];
		WriteString[spheno2LP,"  Do gE1=1,"<>dimMatrix<>"\n"];
		If[nh>1,WriteString[spheno2LP,"   Do gE2=1,"<>dimMatrix<>"\n"];];


string="prefactor=Real(";
string1="";
               string2="";

		
For[j=1,j<=numberofcouplings,j++,
   If[j!=1,
         string1=string1<>"*";
         string2=string2<>"*";
        ];

        If[Length[coupdescs[[j,1]]]==0,(* gauge boson coupling *)
      WriteString[spheno2LP,"coup"<>ToString[j]<>" = ",ToString[coupdescs[[j,2]]]<>"\n"];
     ,
       (* Otherwise regular coupling *)
	indstring="("<>StringJoin@@Riffle[ToString/@Transpose[coupdescs[[j,1]]][[2]],","]<>")";
(*If[FreeQ[ps,Glu]\[Equal]False,Print[coupdescs[[j]],indstring]];*)
	 (* Print[coupdescs[[j,2]],"---- ",indstring];*)
         WriteVertexToFile[j,twoloopgetSPhenoCouplingName[coupdescs[[j,2]]],{indstring,False},getVertexType[coupdescs[[j,2]]],spheno2LP];
     ];

Switch[funcdesc[[fcount,3,j]],
L,
string1=string1<>"coup"<>ToString[j]<>"L";
string2=string2<>"coup"<>ToString[j]<>"R";
,
R,
string1=string1<>"coup"<>ToString[j]<>"R";
string2=string2<>"coup"<>ToString[j]<>"L";
,
_,
string1=string1<>"coup"<>ToString[j];
string2=string2<>"coup"<>ToString[j];
];


]; (* end for j=1 *)
(*Print[funcdesc[[fcount,3]],FreeQ[funcdesc[[fcount,3]],L]];*)
If[FreeQ[funcdesc[[fcount,3]],L],(* bosonic coupling \[Rule] in case of one chirality only, we put L rather than R *)
string=string<>string1;
,
(* fermionic coupling*)
string=string<>string1<>"+"<>string2;
];
              string=string<>",dp)\n";

	WriteString[spheno2LP,string];


	If[nh==1,WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingvector(gE1)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingvector(gE1)= 0._dp\n end if\n"];,WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingmatrix(gE1,gE2)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingmatrix(gE1,gE2)= 0._dp\n end if\n"];];

		If[nh==1,WriteString[spheno2LP,"   End Do\n"];,WriteString[spheno2LP,"   End Do\n  End do\n"];];


	WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
			WriteString[spheno2LP," funcvalue= "<>prefactorstring<>ToString[funcdesc[[fcount,2]]]<>argstring<>"\n"];

If[nh==1,WriteString[spheno2LP," temptad=temptad+tempcouplingvector*funcvalue\n"];,WriteString[spheno2LP," tempcont=tempcont+tempcouplingmatrix*funcvalue\n"];];
WriteString[spheno2LP,"end if\n"];

If[Length[fermionmassstrings]>0,WriteString[spheno2LP,"end if\n\n"];];






];(* end for fcount=1 *)







For[j=1,j<=Length[pdesc],j++,
If[pdesc[[j,3]]>1,
WriteString[spheno2LP,"end do\n"];]
 ];

];(* end for dcount=1 *)

];(* end for types=1 *)

Switch[nh,
1,
WriteString[spheno2LP,"! ----------------------------\n"];
               WriteString[spheno2LP,"! ---- Final tadpole result --\n"];
               WriteString[spheno2LP,"temptad=temptad*oo16Pi2*oo16Pi2\n"];  
                WriteString[spheno2LP,"tad2L=matmul(temptad,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
                WriteString[spheno2LP,"! ----------------------------\n"];
,
2,
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
               WriteString[spheno2LP,"Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
               WriteString[spheno2LP,"do gE2=1,gE1-1\n"];
               WriteString[spheno2LP,"Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
               WriteString[spheno2LP,"Pi2S(gE2,gE1)=Pi2S(gE1,gE2)\n"];
               WriteString[spheno2LP,"End do\nEnd do\n"];
WriteString[spheno2LP,"Pi2S = Matmul(Pi2S,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
               WriteString[spheno2LP,"Pi2S = Matmul(Transpose("<>SPhenoForm[HiggsMixingMatrix]<>"),Pi2S)\n"];

If[Length[IncludeOnlyInternals]!=0,WriteString[spheno2LP,"write(*,*) \"Result of Pi2S: \"\n"];
WriteString[spheno2LP,"write(*,*) Pi2S\n"];];
,
3,
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
              WriteString[spheno2LP,"Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
              WriteString[spheno2LP,"do gE2=1,gE1-1\n"];

WriteString[spheno2LP,"Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
              WriteString[spheno2LP,"Pi2P(gE2,gE1)=Pi2P(gE1,gE2)\n"];
              WriteString[spheno2LP,"End do\nEnd do\n"];


(**---now to "undiagonalise"----*)

WriteString[spheno2LP,"Pi2P = Matmul(Pi2P,"<>SPhenoForm[PseudoScalarMixingMatrix]<>")\n"];
              WriteString[spheno2LP,"Pi2P = Matmul(Transpose("<>SPhenoForm[PseudoScalarMixingMatrix]<>"),Pi2P)\n"];

If[Length[IncludeOnlyInternals]!=0,WriteString[spheno2LP,"write(*,*) \"Result of Pi2P: \"\n"];
WriteString[spheno2LP,"write(*,*) Pi2P\n"];
];

];


dynamic="Completed ("<>ToString[types-1]<>" of "<>ToString[ntypes]<>") topologies";

];

