! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 14:09 on 25.8.2016   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_SimplifiedDMTFDM 
 
Use Control 
Use Couplings_SimplifiedDMTFDM 
Use Model_Data_SimplifiedDMTFDM 
Use LoopCouplings_SimplifiedDMTFDM 
Use Fu3Decays_SimplifiedDMTFDM 
Use Fe3Decays_SimplifiedDMTFDM 
Use Fd3Decays_SimplifiedDMTFDM 
Use Ft03Decays_SimplifiedDMTFDM 
Use Ftc3Decays_SimplifiedDMTFDM 
Use TreeLevelDecays_SimplifiedDMTFDM 


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MFd,MFd2,MFe,              & 
& MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,             & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,v,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,              & 
& Mu,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPhh,gThh,BRhh,gPFt0,gTFt0,            & 
& BRFt0,gPFtc,gTFtc,BRFtc)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(in) :: g1,g2,g3

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),MTF,Mu

Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFt0,MFt02,MFtc,MFtc2,MFu(3),MFu2(3),          & 
& MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v

Real(dp),Intent(inout) :: gPFu(3,150),gTFu(3),BRFu(3,150),gPFe(3,150),gTFe(3),BRFe(3,150),gPFd(3,150),          & 
& gTFd(3),BRFd(3,150),gPhh(1,34),gThh,BRhh(1,34),gPFt0(1,19),gTFt0,BRFt0(1,19),          & 
& gPFtc(1,20),gTFtc,BRFtc(1,20)

Complex(dp) :: cplHiggsPP,cplHiggsGG,cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt,               & 
& cplHiggsWWvirt

Real(dp) :: gTAh 
Real(dp) :: gFuFdcFtcFt0(3,3,1,1),gFuFucFdFd(3,3,3,3),gFuFdcFeFv(3,3,3,3),gFuFucFeFe(3,3,3,3),    & 
& gFuFucFuFu(3,3,3,3),gFuFucFtcFtc(3,3,1,1),gFuFucFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),     & 
& gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFecFtcFtc(3,3,1,1),gFeFecFvFv(3,3,3,3),     & 
& gFeFvcFuFd(3,3,3,3),gFeFvFtcFt0(3,3,1,1),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),      & 
& gFdFdcFuFu(3,3,3,3),gFdFdcFtcFtc(3,3,1,1),gFdFdcFvFv(3,3,3,3),gFdFucFvFe(3,3,3,3),     & 
& gFdFuFtcFt0(3,3,1,1),gFt0FtccFdFu(1,1,3,3),gFt0FtccFeFv(1,1,3,3),gFtcFt0cFuFd(1,1,3,3),& 
& gFtcFt0cFvFe(1,1,3,3)

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
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,             & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPFu(:,1:9),gTFu,              & 
& BRFu(:,1:9))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,             & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPFe(:,1:9),gTFe,              & 
& BRFe(:,1:9))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,             & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPFd(:,1:9),gTFd,              & 
& BRFd(:,1:9))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,             & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPhh,gThh,BRhh)

gPFt0 = 0._dp 
gTFt0 = 0._dp 
BRFt0 = 0._dp 
Call Ft0TwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,            & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPFt0(:,1:1),gTFt0,            & 
& BRFt0(:,1:1))

Do i1=1,1
gTFt0 =Sum(gPFt0(i1,:)) 
If (gTFt0.Gt.0._dp) BRFt0(i1,: ) =gPFt0(i1,:)/gTFt0 
End Do 
 

gPFtc = 0._dp 
gTFtc = 0._dp 
BRFtc = 0._dp 
Call FtcTwoBodyDecay(-1,DeltaM,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,            & 
& MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,              & 
& ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gPFtc(:,1:2),gTFtc,            & 
& BRFtc(:,1:2))

Do i1=1,1
gTFtc =Sum(gPFtc(i1,:)) 
If (gTFtc.Gt.0._dp) BRFtc(i1,: ) =gPFtc(i1,:)/gTFtc 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,          & 
& gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFucFvFv,epsI,              & 
& deltaM,.False.,gTFu,gPFu(:,10:150),BRFu(:,10:150))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,          & 
& gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFucFvFv,epsI,              & 
& deltaM,.True.,gTFu,gPFu(:,10:150),BRFu(:,10:150))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFuFdcFtcFt0,          & 
& gFuFucFdFd,gFuFdcFeFv,gFuFucFeFe,gFuFucFuFu,gFuFucFtcFtc,gFuFucFvFv,epsI,              & 
& deltaM,.False.,gTFu,gPFu(:,10:150),BRFu(:,10:150))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFeFecFdFd,            & 
& gFeFecFeFe,gFeFecFuFu,gFeFecFtcFtc,gFeFecFvFv,gFeFvcFuFd,gFeFvFtcFt0,epsI,             & 
& deltaM,.False.,gTFe,gPFe(:,10:150),BRFe(:,10:150))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFeFecFdFd,            & 
& gFeFecFeFe,gFeFecFuFu,gFeFecFtcFtc,gFeFecFvFv,gFeFvcFuFd,gFeFvFtcFt0,epsI,             & 
& deltaM,.True.,gTFe,gPFe(:,10:150),BRFe(:,10:150))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFeFecFdFd,            & 
& gFeFecFeFe,gFeFecFuFu,gFeFecFtcFtc,gFeFecFvFv,gFeFvcFuFd,gFeFvFtcFt0,epsI,             & 
& deltaM,.False.,gTFe,gPFe(:,10:150),BRFe(:,10:150))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,            & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFtcFtc,gFdFdcFvFv,gFdFucFvFe,gFdFuFtcFt0,epsI,             & 
& deltaM,.False.,gTFd,gPFd(:,10:150),BRFd(:,10:150))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,            & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFtcFtc,gFdFdcFvFv,gFdFucFvFe,gFdFuFtcFt0,epsI,             & 
& deltaM,.True.,gTFd,gPFd(:,10:150),BRFd(:,10:150))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gThh,gTVWp,gTVZ,gFdFdcFdFd,            & 
& gFdFdcFeFe,gFdFdcFuFu,gFdFdcFtcFtc,gFdFdcFvFv,gFdFucFvFe,gFdFuFtcFt0,epsI,             & 
& deltaM,.False.,gTFd,gPFd(:,10:150),BRFd(:,10:150))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for hh  
If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFt0.Lt.fac3*Abs(MFt0)) Then 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFt0FtccFdFu,gFt0FtccFeFv,       & 
& epsI,deltaM,.False.,gTFt0,gPFt0(:,2:19),BRFt0(:,2:19))

Else 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFt0FtccFdFu,gFt0FtccFeFv,       & 
& epsI,deltaM,.True.,gTFt0,gPFt0(:,2:19),BRFt0(:,2:19))

End If 
 
End If 
Else 
Call Ft0ThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFt0FtccFdFu,gFt0FtccFeFv,       & 
& epsI,deltaM,.False.,gTFt0,gPFt0(:,2:19),BRFt0(:,2:19))

End If 
Do i1=1,1
gTFt0 =Sum(gPFt0(i1,:)) 
If (gTFt0.Gt.0._dp) BRFt0(i1,: ) =gPFt0(i1,:)/gTFt0 
End Do 
 

If (.Not.CTBD) Then 
If (Enable3BDecaysF) Then 
If (gTFtc.Lt.fac3*Abs(MFtc)) Then 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFtcFt0cFuFd,gFtcFt0cFvFe,       & 
& epsI,deltaM,.False.,gTFtc,gPFtc(:,3:20),BRFtc(:,3:20))

Else 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFtcFt0cFuFd,gFtcFt0cFvFe,       & 
& epsI,deltaM,.True.,gTFtc,gPFtc(:,3:20),BRFtc(:,3:20))

End If 
 
End If 
Else 
Call FtcThreeBodyDecay(-1,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFtcFt0cFuFd,gFtcFt0cFvFe,       & 
& epsI,deltaM,.False.,gTFtc,gPFtc(:,3:20),BRFtc(:,3:20))

End If 
Do i1=1,1
gTFtc =Sum(gPFtc(i1,:)) 
If (gTFtc.Gt.0._dp) BRFtc(i1,: ) =gPFtc(i1,:)/gTFtc 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_SimplifiedDMTFDM 
 