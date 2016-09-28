! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:27 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_radinertDTFDTSDM 
 
Use Control 
Use Couplings_radinertDTFDTSDM 
Use Model_Data_radinertDTFDTSDM 
Use LoopCouplings_radinertDTFDTSDM 
Use Fu3Decays_radinertDTFDTSDM 
Use Fd3Decays_radinertDTFDTSDM 
Use Fe3Decays_radinertDTFDTSDM 
Use TreeLevelDecays_radinertDTFDTSDM 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MChi,MChi2,MetI,           & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,             & 
& MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,             & 
& ZX0,ZXP,ZZ,v,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,            & 
& A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,gPFu,gTFu,BRFu,gPFd,gTFd,BRFd,gPFe,gTFe,             & 
& BRFe,gPFv,gTFv,BRFv,gPChi,gTChi,BRChi,gPNv,gTNv,BRNv,gPhh,gThh,BRhh,gPXO,              & 
& gTXO,BRXO,gPetI,gTetI,BRetI,gPXP,gTXP,BRXP)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(in) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(in) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,201),gTFu(3),BRFu(3,201),gPFd(3,201),gTFd(3),BRFd(3,201),gPFe(3,225),          & 
& gTFe(3),BRFe(3,225),gPFv(3,19),gTFv(3),BRFv(3,19),gPChi(2,22),gTChi(2),BRChi(2,22),    & 
& gPNv(3,23),gTNv(3),BRNv(3,23),gPhh(1,52),gThh,BRhh(1,52),gPXO(2,20),gTXO(2),           & 
& BRXO(2,20),gPetI(1,20),gTetI,BRetI(1,20),gPXP(2,22),gTXP(2),BRXP(2,22)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFdNvChi(3,3,3,2),gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucChiChi(3,3,2,2),    & 
& gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFuNvNv(3,3,3,3),gFuFuFvFv(3,3,3,3),         & 
& gFdFdcChiChi(3,3,2,2),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),     & 
& gFdFdNvNv(3,3,3,3),gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3),gFdFucChiNv(3,3,2,3),         & 
& gFeFecChiChi(3,3,2,2),gFeFvcChiNv(3,3,2,3),gFecChicFecChi(3,2,3,2),gFeFecFdFd(3,3,3,3),& 
& gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFeNvNv(3,3,3,3),gFeFeFvFv(3,3,3,3),         & 
& gFeFvcFuFd(3,3,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPFu(:,1:9),gTFu,BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPFd(:,1:9),gTFd,BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPFe(:,1:21),gTFe,BRFe(:,1:21))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPFv,gTFv,BRFv)

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,              & 
& g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,              & 
& MDF,mu,mH2,mEt2,mu3,v,gPChi,gTChi,BRChi)

gPNv = 0._dp 
gTNv = 0._dp 
BRNv = 0._dp 
Call NvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPNv,gTNv,BRNv)

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPhh,gThh,BRhh)

gPXO = 0._dp 
gTXO = 0._dp 
BRXO = 0._dp 
Call XOTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPXO,gTXO,BRXO)

gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,              & 
& g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,              & 
& MDF,mu,mH2,mEt2,mu3,v,gPetI,gTetI,BRetI)

gPXP = 0._dp 
gTXP = 0._dp 
BRXP = 0._dp 
Call XPTwoBodyDecay(-1,DeltaM,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,             & 
& MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,               & 
& g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,             & 
& mu,mH2,mEt2,mu3,v,gPXP,gTXP,BRXP)

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFuFdNvChi,gFuFucFdFd,gFuFdcFeFv,gFuFucChiChi,              & 
& gFuFucFeFe,gFuFucFuFu,gFuFuNvNv,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:201)      & 
& ,BRFu(:,10:201))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFuFdNvChi,gFuFucFdFd,gFuFdcFeFv,gFuFucChiChi,              & 
& gFuFucFeFe,gFuFucFuFu,gFuFuNvNv,gFuFuFvFv,epsI,deltaM,.True.,gTFu,gPFu(:,10:201)       & 
& ,BRFu(:,10:201))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFuFdNvChi,gFuFucFdFd,gFuFdcFeFv,gFuFucChiChi,              & 
& gFuFucFeFe,gFuFucFuFu,gFuFuNvNv,gFuFuFvFv,epsI,deltaM,.False.,gTFu,gPFu(:,10:201)      & 
& ,BRFu(:,10:201))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFdFdcChiChi,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,              & 
& gFdFdNvNv,gFdFdFvFv,gFdFuFvFe,gFdFucChiNv,epsI,deltaM,.False.,gTFd,gPFd(:,10:201)      & 
& ,BRFd(:,10:201))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFdFdcChiChi,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,              & 
& gFdFdNvNv,gFdFdFvFv,gFdFuFvFe,gFdFucChiNv,epsI,deltaM,.True.,gTFd,gPFd(:,10:201)       & 
& ,BRFd(:,10:201))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gThh,gTVWp,gTVZ,gFdFdcChiChi,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,              & 
& gFdFdNvNv,gFdFdFvFv,gFdFuFvFe,gFdFucChiNv,epsI,deltaM,.False.,gTFd,gPFd(:,10:201)      & 
& ,BRFd(:,10:201))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gTetI,gThh,gTVWp,gTVZ,gTXO,gTXP,gFeFecChiChi,gFeFvcChiNv,gFecChicFecChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeNvNv,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,           & 
& .False.,gTFe,gPFe(:,22:225),BRFe(:,22:225))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gTetI,gThh,gTVWp,gTVZ,gTXO,gTXP,gFeFecChiChi,gFeFvcChiNv,gFecChicFecChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeNvNv,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,           & 
& .True.,gTFe,gPFe(:,22:225),BRFe(:,22:225))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,g2,g3,lam1,            & 
& lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,              & 
& mEt2,mu3,v,gTetI,gThh,gTVWp,gTVZ,gTXO,gTXP,gFeFecChiChi,gFeFvcChiNv,gFecChicFecChi,    & 
& gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeNvNv,gFeFeFvFv,gFeFvcFuFd,epsI,deltaM,           & 
& .False.,gTFe,gPFe(:,22:225),BRFe(:,22:225))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for Chi  
! No 3-body decays for Nv  
! No 3-body decays for hh  
! No 3-body decays for XO  
! No 3-body decays for etI  
! No 3-body decays for XP  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_radinertDTFDTSDM 
 