! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:31 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_2HDMHiggsBasis
 
Use Control 
Use Model_Data_2HDMHiggsBasis 
Use Couplings_2HDMHiggsBasis 
Use LoopCouplings_2HDMHiggsBasis 
Use Tadpoles_2HDMHiggsBasis 
 Use TreeLevelMasses_2HDMHiggsBasis 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFuFuetIL,     & 
& cplcFuFuetIR,cplcFuFdetpL,cplcFuFdetpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),              & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdetpL = 0._dp 
cplcFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFuFdetpL(gt1,gt2)          & 
& ,cplcFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFeFeetIL,     & 
& cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,             & 
& cplcFeFvVWpR,cplcFeFvcetpL,cplcFeFvcetpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),            & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcetpL(3,3),& 
& cplcFeFvcetpR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFuVWpL,             & 
& cplcFdFuVWpR,cplcFdFucetpL,cplcFdFucetpR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucetpL(3,3),& 
& cplcFdFucetpR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)        & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFvFeetpL,     & 
& cplcFvFeetpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcFvFvVZL,cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFvFeetpL(3,3),cplcFvFeetpR(3,3),cplcFvFecVWpL(3,3),cplcFvFecVWpR(3,3),            & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFvFeetpL = 0._dp 
cplcFvFeetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeetpT(gt1,gt2,epsE,ZER,cplcFvFeetpL(gt1,gt2),cplcFvFeetpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_VZ_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cpletIhhVZ,       & 
& cpletpVWpVZ,cpletpcetpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,              & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplhhVZVZ,cplcVWpVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cpletIhhVZ(2),cpletpVWpVZ,cpletpcetpVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),             & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),  & 
& cplcFvFvVZR(3,3),cplhhVZVZ(2),cplcVWpVWpVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZ_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZT(g1,g2,TW,cpletpcetpVZ)



cpletpVWpVZ = 0._dp 
Call CouplingetpVWpVZT(g1,g2,vv,TW,cpletpVWpVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZ_decays_2B
 
Subroutine CouplingsFor_VWp_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,           & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cpletIcetpcVWp,   & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplhhcVWpVWp,cplhhcetpcVWp,    & 
& cplcVWpVWpVZ,cplcetpcVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cpletIcetpcVWp,cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFvFecVWpL(3,3),              & 
& cplcFvFecVWpR(3,3),cplhhcVWpVWp(2),cplhhcetpcVWp(2),cplcVWpVWpVZ,cplcetpcVWpVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWp_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpT(g2,cpletIcetpcVWp)



cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpT(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZT(g1,g2,vv,TW,cplcetpcVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWp_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplHiggsPP,       & 
& cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cpletIetIhh,cpletIhhhh,cpletIhhVZ,            & 
& cpletphhVWp,cpletphhcetp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,              & 
& cplcFuFuhhL,cplcFuFuhhR,cplhhhhhh,cplhhcVWpVWp,cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cpletIetIhh(2),       & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletphhVWp(2),cpletphhcetp(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplhhhhhh(2,2,2),cplhhcVWpVWp(2),cplhhVZVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Complex(dp) :: ratetp,ratFd(3),ratFe(3),ratFu(3),ratHp,ratVWp

Complex(dp) :: ratPetp,ratPFd(3),ratPFe(3),ratPFu(3),ratPHp,ratPVWp

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
v=vSM
Ye=YeSM
Yd=YdSM
Yu=YuSM
g1=g1SM
g2=g2SM
g3=g3SM
! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletphhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVWpT(gt2,g2,ZH,cpletphhVWp(gt2))

End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWpVWp/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
ratetp = 0.5_dp*cpletphhcetp(i1)*vev/Metp2 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
ratHp = 0._dp 
ratVWp = -0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratetp,ratFd,ratFe,ratFu,ratHp,ratVWp,Metp,            & 
& MHp,MFd,MFe,MFu,MVWp,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,Metp,MHp,MFd,MFe,MFu,MVWp,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha))**2 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ))**2 
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2)))**2 
End Do 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2)))**2 
End Do 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2)**2 
rHB_S_VWp(i1) = Abs(-0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2)**2 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletphhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVWpT(gt2,g2,ZH,cpletphhVWp(gt2))

End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_etp_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,           & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cpletIetpcetp,    & 
& cpletIcetpcVWp,cpletphhcetp,cpletpcetpVZ,cplcFdFucetpL,cplcFdFucetpR,cplcFeFvcetpL,    & 
& cplcFeFvcetpR,cplhhcetpcVWp,cplcetpcVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cpletIetpcetp,cpletIcetpcVWp,cpletphhcetp(2),cpletpcetpVZ,cplcFdFucetpL(3,3),         & 
& cplcFdFucetpR(3,3),cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),cplhhcetpcVWp(2),             & 
& cplcetpcVWpVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_etp_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIetpcetp = 0._dp 
Call CouplingetIetpcetpT(lam7,v,cpletIetpcetp)



cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpT(g2,cpletIcetpcVWp)



cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZT(g1,g2,TW,cpletpcetpVZ)



cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpT(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZT(g1,g2,vv,TW,cplcetpcVWpVZ)



cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)        & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_etp_decays_2B
 
Subroutine CouplingsFor_etI_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,           & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cpletIetIetI,     & 
& cpletIetIhh,cpletIetpVWp,cpletIetpcetp,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,         & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cpletIetIetI,cpletIetIhh(2),cpletIetpVWp,cpletIetpcetp,cplcFdFdetIL(3,3),             & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_etI_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIetpcetp = 0._dp 
Call CouplingetIetpcetpT(lam7,v,cpletIetpcetp)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIetpVWp = 0._dp 
Call CouplingetIetpVWpT(g2,cpletIetpVWp)



cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_etI_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucetpL,            & 
& cplcFdFucetpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcetpL,cplcFeFvcetpR,cplcFeFvVWpL,          & 
& cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdetpL,cplcFuFdetpR,cplcFuFuetIL,       & 
& cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,              & 
& cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),             & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),             & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdetpL = 0._dp 
cplcFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFuFdetpL(gt1,gt2)          & 
& ,cplcFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)        & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcetpL,            & 
& cplcFeFvcetpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdetpL,      & 
& cplcFuFdetpR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFvFecVWpL,cplcFvFecVWpR,cplcFvFeetpL,cplcFvFeetpR,cplcFvFvVZL,         & 
& cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcetpL(3,3),               & 
& cplcFeFvcetpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),cplcFuFuetIL(3,3),              & 
& cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),              & 
& cplcFuFuVZR(3,3),cplcFvFecVWpL(3,3),cplcFvFecVWpR(3,3),cplcFvFeetpL(3,3),              & 
& cplcFvFeetpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdetpL = 0._dp 
cplcFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFuFdetpL(gt1,gt2)          & 
& ,cplcFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcFvFeetpL = 0._dp 
cplcFvFeetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeetpT(gt1,gt2,epsE,ZER,cplcFvFeetpL(gt1,gt2),cplcFvFeetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,Metpinput,Metp2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,        & 
& MFu2input,Mhhinput,Mhh2input,MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& ZHinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,lam1input,lam2input,       & 
& lam4input,lam3input,lam7input,lam5input,lam6input,Yuinput,epsUinput,epsDinput,         & 
& epsEinput,Ydinput,Yeinput,mH2input,mEt2input,M12input,vinput,vvinput,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucetpL,            & 
& cplcFdFucetpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdetpL,          & 
& cplcFuFdetpR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcFvFecVWpL,cplcFvFecVWpR,cplcFvFeetpL,cplcFvFeetpR,cplcFvFvVZL,         & 
& cplcFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,Yuinput(3,3),             & 
& epsUinput(3,3),epsDinput(3,3),epsEinput(3,3),Ydinput(3,3),Yeinput(3,3),mH2input,       & 
& mEt2input,M12input

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,Metpinput,Metp2input,MFdinput(3),             & 
& MFd2input(3),MFeinput(3),MFe2input(3),MFuinput(3),MFu2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHpinput,MHp2input,MVWpinput,MVWp2input,MVZinput,MVZ2input,               & 
& TWinput,ZHinput(2,2),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),             & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFecVWpL(3,3),cplcFvFecVWpR(3,3),               & 
& cplcFvFeetpL(3,3),cplcFvFeetpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
Yu = Yuinput 
epsU = epsUinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
mH2 = mH2input 
mEt2 = mEt2input 
M12 = M12input 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,.True.,kont)

! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
ZH = ZHinput 
ZW = ZWinput 
ZZ = ZZinput 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
Metp = Metpinput 
Metp2 = Metp2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHp = MHpinput 
MHp2 = MHp2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdetpL = 0._dp 
cplcFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFuFdetpL(gt1,gt2)          & 
& ,cplcFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcFvFeetpL = 0._dp 
cplcFvFeetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeetpT(gt1,gt2,epsE,ZER,cplcFvFeetpL(gt1,gt2),cplcFvFeetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)        & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_2HDMHiggsBasis
