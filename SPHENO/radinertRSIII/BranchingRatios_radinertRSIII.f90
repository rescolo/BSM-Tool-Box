! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 19:38 on 18.10.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_radinertRSIII 
 
Use Control 
Use Couplings_radinertRSIII 
Use Model_Data_radinertRSIII 
Use LoopCouplings_radinertRSIII 
Use Fu3Decays_radinertRSIII 
Use Fe3Decays_radinertRSIII 
Use Fd3Decays_radinertRSIII 
Use Ft03Decays_radinertRSIII 
Use Ftc3Decays_radinertRSIII 
Use TreeLevelDecays_radinertRSIII 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MetI,MetI2,Metp,           & 
& Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,             & 
& v,g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,gPFu,gTFu,BRFu,           & 
& gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,               & 
& BRVWp,gPhh,gThh,BRhh,gPetR,gTetR,BRetR,gPetI,gTetI,BRetI,gPetp,gTetp,BRetp,            & 
& gPFt0,gTFt0,BRFt0,gPFtc,gTFtc,BRFtc)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yu(3,3),Yd(3,3),Ye(3,3),Yn(3,3),MTF(3,3),mH2,mEt2

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),MFe2(3),              & 
& MFt0(3),MFt02(3),MFtc(3),MFtc2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,198),gTFu(3),BRFu(3,198),gPFe(3,261),gTFe(3),BRFe(3,261),gPFd(3,198),          & 
& gTFd(3),BRFd(3,198),gPFv(3,15),gTFv(3),BRFv(3,15),gPVZ(1,46),gTVZ,BRVZ(1,46),          & 
& gPVWp(1,31),gTVWp,BRVWp(1,31),gPhh(1,37),gThh,BRhh(1,37),gPetR(1,21),gTetR,            & 
& BRetR(1,21),gPetI(1,21),gTetI,BRetI(1,21),gPetp(1,22),gTetp,BRetp(1,22),               & 
& gPFt0(3,147),gTFt0(3),BRFt0(3,147),gPFtc(3,258),gTFtc(3),BRFtc(3,258)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFdcFtcFt0(3,3,3,3),gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),    & 
& gFuFucFuFu(3,3,3,3),gFuFucFtcFtc(3,3,3,3),gFuFuFvFv(3,3,3,3),gFeFecFtcFtc(3,3,3,3),    & 
& gFeFvFtcFt0(3,3,3,3),gFeFtccFeFtc(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),    & 
& gFeFecFuFu(3,3,3,3),gFeFeFvFv(3,3,3,3),gFeFt0Ft0Fe(3,3,3,3),gFeFvcFuFd(3,3,3,3),       & 
& gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdcFtcFtc(3,3,3,3),     & 
& gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3),gFdFuFtcFt0(3,3,3,3),gFt0cFtcFvFe(3,3,3,3),      & 
& gFt0FvFvFt0(3,3,3,3),gFt0FecFeFt0(3,3,3,3),gFt0FtccFtcFt0(3,3,3,3),gFt0FtccFdFu(3,3,3,3),& 
& gFtcFecFtcFe(3,3,3,3),gFtcFt0FvFe(3,3,3,3),gFtcFtccFeFe(3,3,3,3),gFtcFt0cFuFd(3,3,3,3),& 
& gFtcFt0FtcFt0(3,3,3,3),gFtcFtccFdFd(3,3,3,3),gFtcFtccFtcFtc(3,3,3,3),gFtcFtccFuFu(3,3,3,3),& 
& gFtcFtcFvFv(3,3,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFe(:,1:18),gTFe,BRFe(:,1:18))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFd(:,1:9),gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFv,gTFv,BRFv)

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPVZ,gTVZ,BRVZ)

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPVWp,gTVWp,BRVWp)

! Set Goldstone Widhts 


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,              & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPhh,gThh,BRhh)

gPetR = 0._dp 
gTetR = 0._dp 
BRetR = 0._dp 
Call etRTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPetR,gTetR,BRetR)

gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPetI,gTetI,BRetI)

gPetp = 0._dp 
gTetp = 0._dp 
BRetp = 0._dp 
Call etpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPetp,gTetp,BRetp)

gPFt0 = 0._dp 
gTFt0 = 0._dp 
BRFt0 = 0._dp 
Call Ft0TwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFt0(:,1:12),gTFt0,BRFt0(:,1:12))

Do i1=1,3
gTFt0(i1) =Sum(gPFt0(i1,:)) 
If (gTFt0(i1).Gt.0._dp) BRFt0(i1,: ) =gPFt0(i1,:)/gTFt0(i1) 
End Do 
 

gPFtc = 0._dp 
gTFtc = 0._dp 
BRFtc = 0._dp 
Call FtcTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,             & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gPFtc(:,1:15),gTFtc,BRFtc(:,1:15))

Do i1=1,3
gTFtc(i1) =Sum(gPFtc(i1,:)) 
If (gTFtc(i1).Gt.0._dp) BRFtc(i1,: ) =gPFtc(i1,:)/gTFtc(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,gFuFucFdFd,     & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFuFvFv,epsI,deltaM,.False.,           & 
& gTFu,gPFu(:,10:198),BRFu(:,10:198))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,gFuFucFdFd,     & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFuFvFv,epsI,deltaM,.True.,            & 
& gTFu,gPFu(:,10:198),BRFu(:,10:198))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,gFuFucFdFd,     & 
& gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFuFvFv,epsI,deltaM,.False.,           & 
& gTFu,gPFu(:,10:198),BRFu(:,10:198))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gThh,gTVWp,gTVZ,           & 
& gFeFecFtcFtc,gFeFvFtcFt0,gFeFtccFeFtc,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,      & 
& gFeFt0Ft0Fe,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gThh,gTVWp,gTVZ,           & 
& gFeFecFtcFtc,gFeFvFtcFt0,gFeFtccFeFtc,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,      & 
& gFeFt0Ft0Fe,gFeFvcFuFd,epsI,deltaM,.True.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gThh,gTVWp,gTVZ,           & 
& gFeFecFtcFtc,gFeFvFtcFt0,gFeFtccFeFtc,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,      & 
& gFeFt0Ft0Fe,gFeFvcFuFd,epsI,deltaM,.False.,gTFe,gPFe(:,19:261),BRFe(:,19:261))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,       & 
& gFdFdcFuFu,gFdFdcFtcFtc,gFdFdFvFv,gFdFuFvFe,gFdFuFtcFt0,epsI,deltaM,.False.,           & 
& gTFd,gPFd(:,10:198),BRFd(:,10:198))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,       & 
& gFdFdcFuFu,gFdFdcFtcFtc,gFdFdFvFv,gFdFuFvFe,gFdFuFtcFt0,epsI,deltaM,.True.,            & 
& gTFd,gPFd(:,10:198),BRFd(:,10:198))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,               & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,       & 
& gFdFdcFuFu,gFdFdcFtcFtc,gFdFdFvFv,gFdFuFvFe,gFdFuFtcFt0,epsI,deltaM,.False.,           & 
& gTFd,gPFd(:,10:198),BRFd(:,10:198))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for VZ  
! No 3-body decays for VWp  
! No 3-body decays for hh  
! No 3-body decays for etR  
! No 3-body decays for etI  
! No 3-body decays for etp  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFt0).Lt.MaxVal(fac3*Abs(MFt0))) Then 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gFt0cFtcFvFe,        & 
& gFt0FvFvFt0,gFt0FecFeFt0,gFt0FtccFtcFt0,gFt0FtccFdFu,epsI,deltaM,.False.,              & 
& gTFt0,gPFt0(:,13:147),BRFt0(:,13:147))

Else 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gFt0cFtcFvFe,        & 
& gFt0FvFvFt0,gFt0FecFeFt0,gFt0FtccFtcFt0,gFt0FtccFdFu,epsI,deltaM,.True.,               & 
& gTFt0,gPFt0(:,13:147),BRFt0(:,13:147))

End If 
 
End If 
Else 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gFt0cFtcFvFe,        & 
& gFt0FvFvFt0,gFt0FecFeFt0,gFt0FtccFtcFt0,gFt0FtccFdFu,epsI,deltaM,.False.,              & 
& gTFt0,gPFt0(:,13:147),BRFt0(:,13:147))

End If 
Do i1=1,3
gTFt0(i1) =Sum(gPFt0(i1,:)) 
If (gTFt0(i1).Gt.0._dp) BRFt0(i1,: ) =gPFt0(i1,:)/gTFt0(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFtc).Lt.MaxVal(fac3*Abs(MFtc))) Then 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gTVZ,gFtcFecFtcFe,   & 
& gFtcFt0FvFe,gFtcFtccFeFe,gFtcFt0cFuFd,gFtcFt0FtcFt0,gFtcFtccFdFd,gFtcFtccFtcFtc,       & 
& gFtcFtccFuFu,gFtcFtcFvFv,epsI,deltaM,.False.,gTFtc,gPFtc(:,16:258),BRFtc(:,16:258))

Else 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gTVZ,gFtcFecFtcFe,   & 
& gFtcFt0FvFe,gFtcFtccFeFe,gFtcFt0cFuFd,gFtcFt0FtcFt0,gFtcFtccFdFd,gFtcFtccFtcFtc,       & 
& gFtcFtccFuFu,gFtcFtcFvFv,epsI,deltaM,.True.,gTFtc,gPFtc(:,16:258),BRFtc(:,16:258))

End If 
 
End If 
Else 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd,              & 
& MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,               & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gTVZ,gFtcFecFtcFe,   & 
& gFtcFt0FvFe,gFtcFtccFeFe,gFtcFt0cFuFd,gFtcFt0FtcFt0,gFtcFtccFdFd,gFtcFtccFtcFtc,       & 
& gFtcFtccFuFu,gFtcFtcFvFv,epsI,deltaM,.False.,gTFtc,gPFtc(:,16:258),BRFtc(:,16:258))

End If 
Do i1=1,3
gTFtc(i1) =Sum(gPFtc(i1,:)) 
If (gTFtc(i1).Gt.0._dp) BRFtc(i1,: ) =gPFtc(i1,:)/gTFtc(i1) 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_radinertRSIII 
 