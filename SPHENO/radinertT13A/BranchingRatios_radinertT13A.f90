! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:51 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_radinertT13A 
 
Use Control 
Use Couplings_radinertT13A 
Use Model_Data_radinertT13A 
Use LoopCouplings_radinertT13A 
Use Fu3Decays_radinertT13A 
Use Ss3Decays_radinertT13A 
Use Nv03Decays_radinertT13A 
Use Fre3Decays_radinertT13A 
Use SUSYDecays_radinertT13A 
 
Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFre,MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,v,g1,g2,               & 
& g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,gPFu,gTFu,BRFu,gPhh,gThh,               & 
& BRhh,gPSs,gTSs,BRSs,gPNv0,gTNv0,BRNv0,gPFre,gTFre,BRFre)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3)

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),MSs(3),MSs2(3),MVWp,MVWp2,MVZ,              & 
& MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),               & 
& ZvN(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,183),gTFu(3),BRFu(3,183),gPhh(1,46),gThh,BRhh(1,46),gPSs(3,189),               & 
& gTSs(3),BRSs(3,189),gPNv0(3,172),gTNv0(3),BRNv0(3,172),gPFre(1,67),gTFre,              & 
& BRFre(1,67)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFdcFreNv0(3,3,1,3),gFuFucFeFe(3,3,3,3),    & 
& gFuFucFuFu(3,3,3,3),gFuFuNv0Nv0(3,3,3,3),gFuFucFreFre(3,3,1,1),gFuFuFvFv(3,3,3,3),     & 
& gSsFeHpNv0(3,3,1,3),gSsSsFecFe(3,3,3,3),gSsFreAhcFe(3,1,1,3),gSsFreFvHp(3,1,3,1),      & 
& gSshhFrecFe(3,1,1,3),gSsFreSscFre(3,1,3,1),gSsFvAhNv0(3,3,1,3),gSsFvFvSs(3,3,3,3),     & 
& gSshhFvNv0(3,1,3,3),gSsSsNv0Nv0(3,3,3,3),gSsSsFdcFd(3,3,3,3),gSsSsFucFu(3,3,3,3),      & 
& gNv0FrecFdFu(3,1,3,3),gNv0FrecFeFv(3,1,3,3),gNv0Nv0cFreFre(3,3,1,1),gNv0Nv0FvFv(3,3,3,3),& 
& gNv0Nv0cFdFd(3,3,3,3),gNv0Nv0cFeFe(3,3,3,3),gNv0Nv0cFuFu(3,3,3,3),gNv0Nv0Nv0Nv0(3,3,3,3),& 
& gFreNv0FvFe(1,3,3,3),gFreNv0cFuFd(1,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWp

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPhh,gThh,BRhh)

gPSs = 0._dp 
gTSs = 0._dp 
BRSs = 0._dp 
Call SsTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPSs(:,1:15),gTSs,BRSs(:,1:15))

Do i1=1,3
gTSs(i1) =Sum(gPSs(i1,:)) 
If (gTSs(i1).Gt.0._dp) BRSs(i1,: ) =gPSs(i1,:)/gTSs(i1) 
End Do 
 

gPNv0 = 0._dp 
gTNv0 = 0._dp 
BRNv0 = 0._dp 
Call Nv0TwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPNv0(:,1:16),gTNv0,BRNv0(:,1:16))

Do i1=1,3
gTNv0(i1) =Sum(gPNv0(i1,:)) 
If (gTNv0(i1).Gt.0._dp) BRNv0(i1,: ) =gPNv0(i1,:)/gTNv0(i1) 
End Do 
 

gPFre = 0._dp 
gTFre = 0._dp 
BRFre = 0._dp 
Call FreTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,               & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gPFre(:,1:13),gTFre,BRFre(:,1:13))

Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFdcFreNv0,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFuNv0Nv0,gFuFucFreFre,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:183)  & 
& ,BRFu(:,10:183))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFdcFreNv0,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFuNv0Nv0,gFuFucFreFre,gFuFuFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,10:183)   & 
& ,BRFu(:,10:183))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFdcFeFv,gFuFdcFreNv0,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFuNv0Nv0,gFuFucFreFre,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:183)  & 
& ,BRFu(:,10:183))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysS) Then 
If (MaxVal(gTSs).Lt.MaxVal(fac3*Abs(MSs))) Then 
Call SsThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gSsFeHpNv0,gSsSsFecFe,gSsFreAhcFe,gSsFreFvHp,gSshhFrecFe,             & 
& gSsFreSscFre,gSsFvAhNv0,gSsFvFvSs,gSshhFvNv0,gSsSsNv0Nv0,gSsSsFdcFd,gSsSsFucFu,        & 
& epsI,deltaM,.False.,gTSs,gPSs(:,16:189),BRSs(:,16:189))

Else 
Call SsThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gSsFeHpNv0,gSsSsFecFe,gSsFreAhcFe,gSsFreFvHp,gSshhFrecFe,             & 
& gSsFreSscFre,gSsFvAhNv0,gSsFvFvSs,gSshhFvNv0,gSsSsNv0Nv0,gSsSsFdcFd,gSsSsFucFu,        & 
& epsI,deltaM,.True.,gTSs,gPSs(:,16:189),BRSs(:,16:189))

End If 
 
End If 
Else 
Call SsThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gSsFeHpNv0,gSsSsFecFe,gSsFreAhcFe,gSsFreFvHp,gSshhFrecFe,             & 
& gSsFreSscFre,gSsFvAhNv0,gSsFvFvSs,gSshhFvNv0,gSsSsNv0Nv0,gSsSsFdcFd,gSsSsFucFu,        & 
& epsI,deltaM,.False.,gTSs,gPSs(:,16:189),BRSs(:,16:189))

End If 
Do i1=1,3
gTSs(i1) =Sum(gPSs(i1,:)) 
If (gTSs(i1).Gt.0._dp) BRSs(i1,: ) =gPSs(i1,:)/gTSs(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTNv0).Lt.MaxVal(fac3*Abs(MNv0))) Then 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTSs,gTVWp,gTVZ,gNv0FrecFdFu,gNv0FrecFeFv,gNv0Nv0cFreFre,        & 
& gNv0Nv0FvFv,gNv0Nv0cFdFd,gNv0Nv0cFeFe,gNv0Nv0cFuFu,gNv0Nv0Nv0Nv0,epsI,deltaM,          & 
& .False.,gTNv0,gPNv0(:,17:172),BRNv0(:,17:172))

Else 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTSs,gTVWp,gTVZ,gNv0FrecFdFu,gNv0FrecFeFv,gNv0Nv0cFreFre,        & 
& gNv0Nv0FvFv,gNv0Nv0cFdFd,gNv0Nv0cFeFe,gNv0Nv0cFuFu,gNv0Nv0Nv0Nv0,epsI,deltaM,          & 
& .True.,gTNv0,gPNv0(:,17:172),BRNv0(:,17:172))

End If 
 
End If 
Else 
Call Nv0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gThh,gTSs,gTVWp,gTVZ,gNv0FrecFdFu,gNv0FrecFeFv,gNv0Nv0cFreFre,        & 
& gNv0Nv0FvFv,gNv0Nv0cFdFd,gNv0Nv0cFeFe,gNv0Nv0cFuFu,gNv0Nv0Nv0Nv0,epsI,deltaM,          & 
& .False.,gTNv0,gPNv0(:,17:172),BRNv0(:,17:172))

End If 
Do i1=1,3
gTNv0(i1) =Sum(gPNv0(i1,:)) 
If (gTNv0(i1).Gt.0._dp) BRNv0(i1,: ) =gPNv0(i1,:)/gTNv0(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFre.Lt.fac3*Abs(MFre)) Then 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gTSs,gTVWp,gFreNv0FvFe,gFreNv0cFuFd,epsI,deltaM,.False.,              & 
& gTFre,gPFre(:,14:67),BRFre(:,14:67))

Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gTSs,gTVWp,gFreNv0FvFe,gFreNv0cFuFd,epsI,deltaM,.True.,               & 
& gTFre,gPFre(:,14:67),BRFre(:,14:67))

End If 
 
End If 
Else 
Call FreThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,            & 
& Mn,MDF,mu2,MS2,v,gTSs,gTVWp,gFreNv0FvFe,gFreNv0cFuFd,epsI,deltaM,.False.,              & 
& gTFre,gPFre(:,14:67),BRFre(:,14:67))

End If 
Do i1=1,1
gTFre =Sum(gPFre(i1,:)) 
If (gTFre.Gt.0._dp) BRFre(i1,: ) =gPFre(i1,:)/gTFre 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_radinertT13A 
 