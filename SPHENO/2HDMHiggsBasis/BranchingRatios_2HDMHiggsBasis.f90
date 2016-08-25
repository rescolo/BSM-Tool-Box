! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:28 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_2HDMHiggsBasis 
 
Use Control 
Use Couplings_2HDMHiggsBasis 
Use Model_Data_2HDMHiggsBasis 
Use LoopCouplings_2HDMHiggsBasis 
Use Fu3Decays_2HDMHiggsBasis 
Use Fe3Decays_2HDMHiggsBasis 
Use Fd3Decays_2HDMHiggsBasis 
Use TreeLevelDecays_2HDMHiggsBasis 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MetI,MetI2,Metp,           & 
& Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,             & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,             & 
& lam7,lam5,lam6,Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,gPFu,gTFu,BRFu,gPFe,               & 
& gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,BRVWp,              & 
& gPhh,gThh,BRhh,gPetp,gTetp,BRetp,gPetI,gTetI,BRetI)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,vv

Real(dp),Intent(inout) :: gPFu(3,153),gTFu(3),BRFu(3,153),gPFe(3,153),gTFe(3),BRFe(3,153),gPFd(3,153),          & 
& gTFd(3),BRFd(3,153),gPFv(3,9),gTFv(3),BRFv(3,9),gPVZ(1,43),gTVZ,BRVZ(1,43),            & 
& gPVWp(1,25),gTVWp,BRVWp(1,25),gPhh(2,42),gThh(2),BRhh(2,42),gPetp(1,26),               & 
& gTetp,BRetp(1,26),gPetI(1,37),gTetI,BRetI(1,37)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt(2),      & 
& cplHiggsWWvirt(2)

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFdcFeFv(3,3,3,3),      & 
& gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),       & 
& gFeFecFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),       & 
& gFdFdcFuFu(3,3,3,3),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPFu(:,1:18),gTFu,BRFu(:,1:18))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPFe(:,1:18),gTFe,BRFe(:,1:18))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPFd(:,1:18),gTFd,BRFd(:,1:18))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,           & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,               & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPhh,gThh,BRhh)

gPetp = 0._dp 
gTetp = 0._dp 
BRetp = 0._dp 
Call etpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,           & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPetp,gTetp,BRetp)

gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,           & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gPetI,gTetI,BRetI)

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,19:153)               & 
& ,BRFu(:,19:153))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,19:153),               & 
& BRFu(:,19:153))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,        & 
& gFuFucFuFu,gFuFdcFeFv,gFuFucFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,19:153)               & 
& ,BRFu(:,19:153))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,        & 
& gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:153)               & 
& ,BRFe(:,19:153))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,        & 
& gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,epsI,deltaM,.True.,gTFe,gPFe(:,19:153),               & 
& BRFe(:,19:153))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,        & 
& gFeFecFuFu,gFeFecFvFv,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:153)               & 
& ,BRFe(:,19:153))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,        & 
& gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,19:153)               & 
& ,BRFd(:,19:153))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,        & 
& gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.True.,gTFd,gPFd(:,19:153),               & 
& BRFd(:,19:153))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,              & 
& epsE,Yd,Ye,mH2,mEt2,M12,v,vv,gTetI,gTetp,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,        & 
& gFdFdcFuFu,gFdFdcFvFv,gFdFucFvFe,epsI,deltaM,.False.,gTFd,gPFd(:,19:153)               & 
& ,BRFd(:,19:153))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for VZ  
! No 3-body decays for VWp  
! No 3-body decays for hh  
! No 3-body decays for etp  
! No 3-body decays for etI  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_2HDMHiggsBasis 
 