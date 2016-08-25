! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:28 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_2HDMHiggsBasis 
 
Use Control 
Use Couplings_2HDMHiggsBasis 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_2HDMHiggsBasis 
Use StandardModel 
Use Tadpoles_2HDMHiggsBasis 
 Use TreeLevelMasses_2HDMHiggsBasis 
 
Real(dp), Private :: Mhh_1L(2), Mhh2_1L(2)  
Complex(dp), Private :: ZH_1L(2,2)  
Real(dp), Private :: MHp_1L, MHp2_1L  
Real(dp), Private :: Metp_1L, Metp2_1L  
Real(dp), Private :: MAh_1L, MAh2_1L  
Real(dp), Private :: MetI_1L, MetI2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVWp_1L, MVWp2_1L  
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& ZH,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,              & 
& epsD,epsE,Yd,Ye,mH2,mEt2,M12,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Real(dp),Intent(inout) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZZ(2,2),alphaH

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(2,2)

Real(dp),Intent(inout) :: v,vv

Complex(dp) :: cplAhAhAh,cplAhAhAhAh,cplAhAhcVWpVWp,cplAhAhetI,cplAhAhetIetI,cplAhAhetpcetp,         & 
& cplAhAhhh(2),cplAhAhhhhh(2,2),cplAhAhHpcHp,cplAhAhUhh(2),cplAhAhUhhUhh(2,2),           & 
& cplAhAhVZVZ,cplAhcHpcVWp,cplAhetIetI,cplAhetIhh(2),cplAhetIUhh(2),cplAhetpcetp,        & 
& cplAhetpcHp,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHpcetp,cplAhHpcHp,cplAhHpVWp,             & 
& cplAhUhhhh(2,2),cplAhUhhVZ(2),cplcetpcVWpVP,cplcetpcVWpVZ,cplcFdFdAhL(3,3),            & 
& cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdUhhL(3,3,2),              & 
& cplcFdFdUhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucetpL(3,3),              & 
& cplcFdFucetpR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFeAhL(3,3),               & 
& cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFeUhhL(3,3,2),              & 
& cplcFeFeUhhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcetpL(3,3),              & 
& cplcFeFvcetpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),& 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),             & 
& cplcFvFecVWpL(3,3),cplcFvFecVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),               & 
& cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCAh,cplcgWCgWCetI,cplcgWCgWCUhh(2),               & 
& cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZetp,cplcgWCgZHp,cplcgWpgWpAh,cplcgWpgWpetI,        & 
& cplcgWpgWpUhh(2),cplcgWpgWpVZ,cplcgWpgZcetp,cplcgWpgZcHp,cplcgZgWCcetp,cplcgZgWCcHp,   & 
& cplcgZgWpcVWp,cplcgZgWpetp,cplcgZgWpHp,cplcgZgZUhh(2),cplcHpcVWpVP,cplcHpcVWpVZ,       & 
& cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),             & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucetpL(3,3),cplcUFdFucetpR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),             & 
& cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),         & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcetpL(3,3),cplcUFeFvcetpR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3),cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),         & 
& cplcUFuFdetpL(3,3),cplcUFuFdetpR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),             & 
& cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),             & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,              & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,             & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cpletIcetpcVWp,cpletIetIcVWpVWp,cpletIetIetI,          & 
& cpletIetIetIetI,cpletIetIetpcetp,cpletIetIhh(2),cpletIetIhhhh(2,2),cpletIetIHpcHp,     & 
& cpletIetIUhh(2),cpletIetIUhhUhh(2,2),cpletIetIVZVZ,cpletIetpcetp,cpletIetpcHp,         & 
& cpletIetpVWp,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHpcetp,cpletIHpcHp,cpletIUhhhh(2,2)

Complex(dp) :: cpletIUhhVZ(2),cpletpcetpcVWpVWp,cpletpcetpVP,cpletpcetpVPVP,cpletpcetpVZ,             & 
& cpletpcetpVZVZ,cpletpetpcetpcetp,cpletphhcetp(2),cpletphhcHp(2),cpletphhhhcetp(2,2),   & 
& cpletpHpcetpcHp,cpletpUhhcetp(2),cpletpUhhcHp(2),cpletpUhhUhhcetp(2,2),cpletpUhhVWp(2),& 
& cpletpVWpVZ,cplhhcetpcVWp(2),cplhhcHpcVWp(2),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),      & 
& cplhhhhHpcHp(2,2),cplhhhhVZVZ(2,2),cplhhHpcetp(2),cplhhHpcHp(2),cplhhVZVZ(2),          & 
& cplHpcHpcVWpVWp,cplHpcHpVP,cplHpcHpVPVP,cplHpcHpVZ,cplHpcHpVZVZ,cplHpHpcHpcHp,         & 
& cplHpVWpVZ,cplUhhcVWpVWp(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpVWp(2),           & 
& cplUhhUhhcVWpVWp(2,2),cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhVZVZ(2,2),   & 
& cplUhhVZVZ(2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Complex(dp) :: Tad1Loop(2), dmz2  
Real(dp) :: comp(2), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWp = RXi 
RXiZ = RXi 

 ! Running angles 

 
Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,GenerationMixing,kont)

M12Tree  = M12
mH2Tree  = mH2

 
 If (CalculateOneLoopMasses) Then 
 
Call CouplingsForVectorBosons(g2,ZH,g1,TW,v,vv,ZDL,ZUL,ZEL,cplAhcHpcVWp,              & 
& cplhhcHpcVWp,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,        & 
& cpletIcetpcVWp,cpletpcetpVZ,cplhhcetpcVWp,cplcetpcVWpVP,cplcetpcVWpVZ,cpletpcetpcVWpVWp,& 
& cpletpcetpVZVZ,cplAhhhVZ,cplAhHpVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIetpVWp,           & 
& cpletIhhVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,               & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ,               & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcFuFdcVWpL,cplcFuFdcVWpR,           & 
& cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,   & 
& cplhhcVWpVWp,cplcVWpVPVWp,cplhhhhcVWpVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,              & 
& cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHp,MHp2,cplAhhhVZ,cpletIhhVZ,cpletpcetpVZ,            & 
& cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,           & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -2*vv**2 
vSM=sqrt(vev2) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,(/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,             & 
& alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,epsU,epsD,epsE,             & 
& Yd,Ye,mH2,mEt2,M12,GenerationMixing,kont)

Call CouplingsForLoopMasses(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,g1,g2,              & 
& TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,Yu,epsU,ZUL,ZUR,g3,cplAhAhUhh,cplAhetIUhh,     & 
& cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,              & 
& cpletpUhhcHp,cpletpUhhVWp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,         & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,          & 
& cplUhhHpcHp,cplUhhHpVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,        & 
& cpletpUhhUhhcetp,cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,          & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,       & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFucetpL,cplcUFdFucetpR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFuVWpL,               & 
& cplcUFdFuVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,cplcUFuFdetpL,     & 
& cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcetpL,       & 
& cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,cplcUFeFvVWpR,cplAhcHpcVWp,   & 
& cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,          & 
& cplcgZgWpHp,cplhhcHpcVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,   & 
& cplAhAhHpcHp,cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,   & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,    & 
& cpletIHpcetp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL,cplcFdFucetpR,       & 
& cplcFeFvcetpL,cplcFeFvcetpR,cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,cplcgZgWpetp,     & 
& cplhhcetpcVWp,cplhhHpcetp,cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,cpletIetIetpcetp, & 
& cpletpetpcetpcetp,cpletphhhhcetp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,      & 
& cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhcVWpVWp,   & 
& cplAhAhVZVZ,cpletIetIetI,cpletIetIhh,cpletIetpVWp,cplcFdFdetIL,cplcFdFdetIR,           & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIetIetIetI,cpletIetIhhhh,cpletIetIcVWpVWp,cpletIetIVZVZ,    & 
& cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHpVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,   & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,   & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcVWpVWp,cplcVWpVPVWp,cplhhhhcVWpVWp,cplcVWpVPVPVWp1,  & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)

Call OneLoopTadpoleshh(v,vv,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhUhh,cpletIetIUhh,           & 
& cpletpUhhcetp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,        & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,           & 
& cplUhhcVWpVWp,cplUhhVZVZ,Tad1Loop(1:2))

M12Tree  = M12
mH2Tree  = mH2
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,Tad1Loop)

M121L = M12
mH21L = mH2
Call OneLoophh(mH21L,lam1,mEt2,lam2,lam4,lam3,M121L,lam7,lam5,lam6,v,vv,              & 
& MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,      & 
& cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,cpletpUhhcHp,cpletpUhhVWp,cplcFdFdUhhL,          & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,        & 
& cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpVWp,cplUhhcVWpVWp,            & 
& cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cpletpUhhUhhcetp,cplUhhUhhhhhh,               & 
& cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,0.1_dp*delta_mass,Mhh_1L,Mhh2_1L,        & 
& ZH_1L,kont)

Call OneLoopHp(g2,mH2,lam1,lam3,lam6,v,vv,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,             & 
& MHp,MHp2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MVZ,MVZ2,cplAhcHpcVWp,         & 
& cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,          & 
& cplcgZgWpHp,cplhhcHpcVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,   & 
& cplAhAhHpcHp,cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,   & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,0.1_dp*delta_mass,MHp_1L,MHp2_1L,kont)

Call OneLoopetp(g2,mEt2,lam2,lam3,lam7,v,vv,Metp,Metp2,MAh,MAh2,MHp,MHp2,             & 
& MVWp,MVWp2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFu,MFu2,MFe,MFe2,cplAhetpcetp,       & 
& cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,cpletIHpcetp,cpletphhcetp,cpletpcetpVP,       & 
& cpletpcetpVZ,cplcFdFucetpL,cplcFdFucetpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcgZgWCcetp,    & 
& cplcgWCgZetp,cplcgWpgZcetp,cplcgZgWpetp,cplhhcetpcVWp,cplhhHpcetp,cplcetpcVWpVP,       & 
& cplcetpcVWpVZ,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp,        & 
& cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,0.1_dp*delta_mass,     & 
& Metp_1L,Metp2_1L,kont)

Call OneLoopAh(g1,g2,mH2,lam1,lam4,lam3,lam5,lam6,v,vv,TW,MAh,MAh2,MetI,              & 
& MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,           & 
& MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhetpcetp,              & 
& cplAhetpcHp,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHpcHp,cplAhHpVWp,       & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,      & 
& cplAhAhVZVZ,0.1_dp*delta_mass,MAh_1L,MAh2_1L,kont)

Call OneLoopetI(g1,g2,mEt2,lam2,lam4,lam3,lam7,lam5,v,vv,TW,MAh,MAh2,MetI,            & 
& MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MVZ,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cpletIetpcetp,     & 
& cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,         & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,cpletIetIhhhh,              & 
& cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,0.1_dp*delta_mass,MetI_1L,               & 
& MetI2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MHp = MHp_1L 
MHp2 = MHp2_1L 
Metp = Metp_1L 
Metp2 = Metp2_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
MetI = MetI_1L 
MetI2 = MetI2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,ZH,              & 
& ZW,ZZ,alphaH,kont)

! Set pole masses 
MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWp = 1._dp 
RXiZ = 1._dp 
MAh=MVZ
MAh2=MVZ2
MHp=MVWp
MHp2=MVWp2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
M12  = M12Tree 
mH2  = mH2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(v,vv,MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhUhh,cpletIetIUhh,       & 
& cpletpUhhcetp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,        & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,           & 
& cplUhhcVWpVWp,cplUhhVZVZ,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),          & 
& Mhh(2),Mhh2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhUhh(2),cpletIetIUhh(2),cpletpUhhcetp(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),& 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),     & 
& cplUhhcVWpVWp(2),cplUhhVZVZ(2)

Real(dp), Intent(in) :: v,vv

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(2)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
A0m = A0(MAh2) 
  Do gO1 = 1, 2
   coup = cplAhAhUhh(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! etI 
!------------------------ 
A0m = A0(MetI2) 
  Do gO1 = 1, 2
   coup = cpletIetIUhh(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! conj[etp] 
!------------------------ 
A0m = A0(Metp2) 
  Do gO1 = 1, 2
   coup = cpletpUhhcetp(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*A0(MFd2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*A0(MFe2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*A0(MFu2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[gWp] 
!------------------------ 
A0m = 1._dp*A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWpgWpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWpC] 
!------------------------ 
A0m = 1._dp*A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWCgWCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*A0(MVZ2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 2
 A0m = A0(Mhh2(i1)) 
  Do gO1 = 1, 2
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hp] 
!------------------------ 
A0m = A0(MHp2) 
  Do gO1 = 1, 2
   coup = cplUhhHpcHp(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWp] 
!------------------------ 
A0m = 3._dp*A0(MVWp2)+RXi*A0(MVWp2*RXi) - 2._dp*MVWp2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhcVWpVWp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*A0(MVZ2)+RXi*A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(mH2,lam1,mEt2,lam2,lam4,lam3,M12,lam7,lam5,lam6,v,               & 
& vv,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,               & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,               & 
& cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,cpletpUhhcHp,cpletpUhhVWp,          & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,cplUhhHpVWp,            & 
& cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cpletpUhhUhhcetp,               & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,           & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3)

Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,M12,lam7,lam6

Complex(dp), Intent(in) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cpletpUhhcetp(2),cpletpUhhcHp(2),cpletpUhhVWp(2),      & 
& cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),       & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),             & 
& cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpVWp(2),cplUhhcVWpVWp(2),       & 
& cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),cpletpUhhUhhcetp(2,2),           & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mH2
mat2a(1,1) = mat2a(1,1)+(3*lam1*v**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(3*lam6*v*vv)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam3*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam4*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam5*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(3*v*vv*Conjg(lam6))/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-1._dp*(M12)/2._dp
mat2a(1,2) = mat2a(1,2)+(3*lam6*v**2)/4._dp
mat2a(1,2) = mat2a(1,2)+lam3*v*vv
mat2a(1,2) = mat2a(1,2)+lam4*v*vv
mat2a(1,2) = mat2a(1,2)+lam5*v*vv
mat2a(1,2) = mat2a(1,2)+(3*lam7*vv**2)/4._dp
mat2a(1,2) = mat2a(1,2)+(3*v**2*Conjg(lam6))/4._dp
mat2a(1,2) = mat2a(1,2)+(3*vv**2*Conjg(lam7))/4._dp
mat2a(1,2) = mat2a(1,2)-Conjg(M12)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mEt2
mat2a(2,2) = mat2a(2,2)+(lam3*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam4*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam5*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*lam7*v*vv)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*lam2*vv**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*v*vv*Conjg(lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,Metp2,MHp,               & 
& MHp2,MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,          & 
& cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,cpletpUhhcHp,            & 
& cpletpUhhVWp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,         & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,           & 
& cplUhhHpVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cpletpUhhUhhcetp,   & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,Metp2,MHp,               & 
& MHp2,MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,          & 
& cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,cpletpUhhcHp,            & 
& cpletpUhhVWp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,         & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,           & 
& cplUhhHpVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cpletpUhhUhhcetp,   & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,Metp2,             & 
& MHp,MHp2,MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,      & 
& cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,cpletpUhhcHp,            & 
& cpletpUhhVWp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,         & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHpcHp,           & 
& cplUhhHpVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cpletpUhhUhhcetp,   & 
& cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,           & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cpletpUhhcetp(2),cpletpUhhcHp(2),cpletpUhhVWp(2),      & 
& cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),       & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),             & 
& cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpVWp(2),cplUhhcVWpVWp(2),       & 
& cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),cpletpUhhUhhcetp(2,2),           & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MAh2,MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(gO1)
coup2 = Conjg(cplAhAhUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhetIUhh(gO1)
coup2 = Conjg(cplAhetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhhh(gO1,i1)
coup2 = Conjg(cplAhUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(gO1)
coup2 =  Conjg(cplAhUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhh(gO1)
coup2 = Conjg(cpletIetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhhh(gO1,i1)
coup2 = Conjg(cpletIUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhVZ(gO1)
coup2 =  Conjg(cpletIUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,Metp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletpUhhcetp(gO1)
coup2 = Conjg(cpletpUhhcetp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Metp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletpUhhcHp(gO1)
coup2 = Conjg(cpletpUhhcHp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VWp, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Metp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletpUhhVWp(gO1)
coup2 =  Conjg(cpletpUhhVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUhh(gO1)
coup2 =  cplcgWpgWpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUhh(gO1)
coup2 =  cplcgWCgWCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Mhh2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpcHp(gO1)
coup2 = Conjg(cplUhhHpcHp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VWp, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHpVWp(gO1)
coup2 =  Conjg(cplUhhHpVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWp2,MVWp2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWpVWp(gO1)
coup2 =  Conjg(cplUhhcVWpVWp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZ2)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletpUhhUhhcetp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHpcHp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopFd(epsD,Yd,v,vv,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,              & 
& MVZ,MVZ2,Metp,Metp2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,            & 
& cplcUFdFdetIL,cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,       & 
& cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucetpL,cplcUFdFucetpR,     & 
& cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFuVWpL,cplcUFdFuVWpR,delta,MFd_1L,MFd2_1L,          & 
& ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MFu(3),         & 
& MFu2(3),MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucetpL(3,3),cplcUFdFucetpR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((vv*epsD(1,1))/sqrt(2._dp))
mat1a(1,1) = mat1a(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((vv*epsD(2,1))/sqrt(2._dp))
mat1a(1,2) = mat1a(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((vv*epsD(3,1))/sqrt(2._dp))
mat1a(1,3) = mat1a(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((vv*epsD(1,2))/sqrt(2._dp))
mat1a(2,1) = mat1a(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((vv*epsD(2,2))/sqrt(2._dp))
mat1a(2,2) = mat1a(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((vv*epsD(3,2))/sqrt(2._dp))
mat1a(2,3) = mat1a(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((vv*epsD(1,3))/sqrt(2._dp))
mat1a(3,1) = mat1a(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((vv*epsD(2,3))/sqrt(2._dp))
mat1a(3,2) = mat1a(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((vv*epsD(3,3))/sqrt(2._dp))
mat1a(3,3) = mat1a(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,             & 
& Metp2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,            & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucetpL,cplcUFdFucetpR,cplcUFdFucHpL,    & 
& cplcUFdFucHpR,cplcUFdFuVWpL,cplcUFdFuVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,             & 
& Metp2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,            & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucetpL,cplcUFdFucetpR,cplcUFdFucHpL,    & 
& cplcUFdFucHpR,cplcUFdFuVWpL,cplcUFdFuVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,            & 
& Metp,Metp2,MFu,MFu2,MHp,MHp2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,       & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucetpL,cplcUFdFucetpR,cplcUFdFucHpL,    & 
& cplcUFdFucHpR,cplcUFdFuVWpL,cplcUFdFuVWpR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MFu(3),         & 
& MFu2(3),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucetpL(3,3),cplcUFdFucetpR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),MAh2),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1)
coupR1 = cplcUFdFdAhR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Fd, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),MetI2),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),MetI2),dp) 
coupL1 = cplcUFdFdetIL(gO1,i1)
coupR1 = cplcUFdFdetIR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdetIL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdetIR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[etp], Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Metp2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Metp2),dp) 
coupL1 = cplcUFdFucetpL(gO1,i2)
coupR1 = cplcUFdFucetpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucetpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucetpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[Hp], Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),MHp2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),MHp2),dp) 
coupL1 = cplcUFdFucHpL(gO1,i2)
coupR1 = cplcUFdFucHpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucHpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWpL(gO1,i2)
coupR1 = cplcUFdFuVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(Yu,epsU,v,vv,MFu,MFu2,MAh,MAh2,MetI,MetI2,MFd,MFd2,              & 
& Metp,Metp2,MVWp,MVWp2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,            & 
& cplcUFuFuetIL,cplcUFuFuetIR,cplcUFuFdetpL,cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR, & 
& cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,         & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,delta,MFu_1L,MFu2_1L,              & 
& ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),Metp,Metp2,MVWp,MVWp2,              & 
& MHp,MHp2,Mhh(2),Mhh2(2),MVZ,MVZ2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: Yu(3,3),epsU(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdetpL(3,3),cplcUFuFdetpR(3,3),cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),         & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),           & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(v*epsU(1,1))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vv*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*epsU(2,1))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vv*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*epsU(3,1))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vv*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*epsU(1,2))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vv*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*epsU(2,2))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vv*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*epsU(3,2))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vv*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*epsU(1,3))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vv*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*epsU(2,3))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vv*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*epsU(3,3))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vv*Yu(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MFd,MFd2,Metp,Metp2,MVWp,           & 
& MVWp2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,              & 
& cplcUFuFuetIR,cplcUFuFdetpL,cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,               & 
& cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,         & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MFd,MFd2,Metp,Metp2,MVWp,           & 
& MVWp2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,              & 
& cplcUFuFuetIR,cplcUFuFdetpL,cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,               & 
& cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,         & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MFd,MFd2,Metp,Metp2,          & 
& MVWp,MVWp2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,         & 
& cplcUFuFuetIR,cplcUFuFdetpL,cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,               & 
& cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,         & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),Metp,Metp2,MVWp,MVWp2,              & 
& MHp,MHp2,Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdetpL(3,3),cplcUFuFdetpR(3,3),cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),         & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),           & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(B0(p2,MFu2(i1),MAh2),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1)
coupR1 = cplcUFuFuAhR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Fu, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i1),MetI2),dp) 
B0m2 = MFu(i1)*Real(B0(p2,MFu2(i1),MetI2),dp) 
coupL1 = cplcUFuFuetIL(gO1,i1)
coupR1 = cplcUFuFuetIR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuetIL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuetIR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Fd, etp 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),Metp2),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),Metp2),dp) 
coupL1 = cplcUFuFdetpL(gO1,i1)
coupR1 = cplcUFuFdetpR(gO1,i1)
coupL2 =  Conjg(cplcUFuFdetpL(gO2,i1))
coupR2 =  Conjg(cplcUFuFdetpR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! conj[VWp], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWpL(gO1,i2)
coupR1 = cplcUFuFdcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! Hp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),MHp2),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),MHp2),dp) 
coupL1 = cplcUFuFdHpL(gO1,i2)
coupR1 = cplcUFuFdHpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdHpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(epsE,Ye,v,vv,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,              & 
& MVZ,MVZ2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,       & 
& cplcUFeFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,        & 
& cplcUFeFeVZR,cplcUFeFvcetpL,cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,  & 
& cplcUFeFvVWpR,delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MHp,            & 
& MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcetpL(3,3),cplcUFeFvcetpR(3,3),           & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((vv*epsE(1,1))/sqrt(2._dp))
mat1a(1,1) = mat1a(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((vv*epsE(2,1))/sqrt(2._dp))
mat1a(1,2) = mat1a(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((vv*epsE(3,1))/sqrt(2._dp))
mat1a(1,3) = mat1a(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((vv*epsE(1,2))/sqrt(2._dp))
mat1a(2,1) = mat1a(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((vv*epsE(2,2))/sqrt(2._dp))
mat1a(2,2) = mat1a(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((vv*epsE(3,2))/sqrt(2._dp))
mat1a(2,3) = mat1a(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((vv*epsE(1,3))/sqrt(2._dp))
mat1a(3,1) = mat1a(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((vv*epsE(2,3))/sqrt(2._dp))
mat1a(3,2) = mat1a(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((vv*epsE(3,3))/sqrt(2._dp))
mat1a(3,3) = mat1a(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,             & 
& Metp2,MHp,MHp2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcetpL,cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,               & 
& cplcUFeFvVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,Metp,             & 
& Metp2,MHp,MHp2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcetpL,cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,               & 
& cplcUFeFvVWpR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,            & 
& Metp,Metp2,MHp,MHp2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,  & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcetpL,cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,               & 
& cplcUFeFvVWpR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,Metp,Metp2,MHp,            & 
& MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcetpL(3,3),cplcUFeFvcetpR(3,3),           & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MAh2),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1)
coupR1 = cplcUFeFeAhR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! Fe, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MetI2),dp) 
coupL1 = cplcUFeFeetIL(gO1,i1)
coupR1 = cplcUFeFeetIR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeetIL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeetIR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[etp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,0._dp,Metp2),dp) 
B0m2 = 0.*Real(B0(p2,0._dp,Metp2),dp) 
coupL1 = cplcUFeFvcetpL(gO1,i2)
coupR1 = cplcUFeFvcetpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcetpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcetpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[Hp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,0._dp,MHp2),dp) 
B0m2 = 0.*Real(B0(p2,0._dp,MHp2),dp) 
coupL1 = cplcUFeFvcHpL(gO1,i2)
coupR1 = cplcUFeFvcHpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcHpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcHpR(gO2,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWp, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,0._dp,MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*0.*Real(B0(p2,0._dp,MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWpL(gO1,i2)
coupR1 = cplcUFeFvVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWpR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopHp(g2,mH2,lam1,lam3,lam6,v,vv,MVWp,MVWp2,MAh,MAh2,Metp,             & 
& Metp2,MHp,MHp2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MVZ,MVZ2,cplAhcHpcVWp,   & 
& cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,              & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,          & 
& cplcgZgWpHp,cplhhcHpcVWp,cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,   & 
& cplAhAhHpcHp,cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,   & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MHp,MHp2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),             & 
& MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MVZ,MVZ2

Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(in) :: mH2,lam1,lam3,lam6

Complex(dp), Intent(in) :: cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp(2),          & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),               & 
& cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp(2),cplhhHpcHp(2),       & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,           & 
& cpletpHpcetpcHp,cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,          & 
& cplHpcHpVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHp'
 
mi2 = (2*(2._dp*(mH2) + lam1*v**2 + lam6*v*vv + lam3*vv**2) + 2*v*vv*Conjg(lam6) + g2**2*v**2*RXiWp)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MHp,MHp2,MetI,MetI2,Mhh,             & 
& Mhh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MVZ,MVZ2,cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,          & 
& cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp,           & 
& cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,               & 
& cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MHp,MHp2,MetI,MetI2,Mhh,             & 
& Mhh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MVZ,MVZ2,cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,          & 
& cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp,           & 
& cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,               & 
& cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHp
 
 
Subroutine Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MHp,MHp2,MetI,MetI2,           & 
& Mhh,Mhh2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MVZ,MVZ2,cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,      & 
& cpletIetpcHp,cpletIHpcHp,cpletphhcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,           & 
& cplcFeFvcHpR,cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp,           & 
& cplhhHpcHp,cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,               & 
& cpletIetIHpcHp,cpletpHpcetpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,& 
& cplHpcHpVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,Metp,Metp2,MHp,MHp2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),             & 
& MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp(2),          & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),               & 
& cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp(2),cplhhHpcHp(2),       & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,           & 
& cpletpHpcetpcHp,cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,          & 
& cplHpcHpVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[VWp], Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVWp2) 
coup1 = cplAhcHpcVWp
coup2 =  Conjg(cplAhcHpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! etp, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,MAh2) 
coup1 = cplAhetpcHp
coup2 = Conjg(cplAhetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MAh2) 
coup1 = cplAhHpcHp
coup2 = Conjg(cplAhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! etp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,MetI2) 
coup1 = cpletIetpcHp
coup2 = Conjg(cpletIetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MetI2) 
coup1 = cpletIHpcHp
coup2 = Conjg(cpletIHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, etp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Metp2) 
coup1 = cpletphhcHp(i1)
coup2 = Conjg(cpletphhcHp(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucHpL(i1,i2)
coupR1 = cplcFdFucHpR(i1,i2)
coupL2 =  Conjg(cplcFdFucHpL(i1,i2))
coupR2 =  Conjg(cplcFdFucHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),0._dp) 
B0m2 = -2._dp*MFe(i1)*0.*B0(p2,MFe2(i1),0._dp) 
coupL1 = cplcFeFvcHpL(i1,i2)
coupR1 = cplcFeFvcHpR(i1,i2)
coupL2 =  Conjg(cplcFeFvcHpL(i1,i2))
coupR2 =  Conjg(cplcFeFvcHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWCcHp
coup2 =  cplcgWCgZHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgZcHp
coup2 =  cplcgZgWpHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWp2) 
coup1 = cplhhcHpcVWp(i2)
coup2 =  Conjg(cplhhcHpcVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = B0(p2,MHp2,Mhh2(i2)) 
coup1 = cplhhHpcHp(i2)
coup2 = Conjg(cplhhHpcHp(i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,0._dp) 
coup1 = cplHpcHpVP
coup2 =  Conjg(cplHpcHpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,MVZ2) 
coup1 = cplHpcHpVZ
coup2 =  Conjg(cplHpcHpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWp2) 
coup1 = cplcHpcVWpVP
coup2 =  Conjg(cplcHpcVWpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVWp2) 
coup1 = cplcHpcVWpVZ
coup2 =  Conjg(cplcHpcVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletpHpcetpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
coup1 = cplhhhhHpcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplHpHpcHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(0._dp) + 0.25_dp*RXi*A0(0._dp*RXi) - 0.5_dp*0._dp*rMS 
coup1 = cplHpcHpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cplHpcHpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplHpcHpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopHp 
 
Subroutine OneLoopetp(g2,mEt2,lam2,lam3,lam7,v,vv,Metp,Metp2,MAh,MAh2,MHp,            & 
& MHp2,MVWp,MVWp2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFu,MFu2,MFe,MFe2,               & 
& cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,cpletIHpcetp,cpletphhcetp,       & 
& cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL,cplcFdFucetpR,cplcFeFvcetpL,cplcFeFvcetpR,     & 
& cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,cplcgZgWpetp,cplhhcetpcVWp,cplhhHpcetp,       & 
& cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,         & 
& cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,cpletpcetpcVWpVWp,cpletpcetpVZVZ,        & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: Metp,Metp2,MAh,MAh2,MHp,MHp2,MVWp,MVWp2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,           & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3)

Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(in) :: mEt2,lam2,lam3,lam7

Complex(dp), Intent(in) :: cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,cpletIHpcetp,cpletphhcetp(2),   & 
& cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),cplcFeFvcetpL(3,3),    & 
& cplcFeFvcetpR(3,3),cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,cplcgZgWpetp,              & 
& cplhhcetpcVWp(2),cplhhHpcetp(2),cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,            & 
& cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp(2,2),cpletpHpcetpcHp,cpletpcetpVPVP, & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetp'
 
mi2 = (2*(2._dp*(mEt2) + lam3*v**2 + lam7*v*vv + lam2*vv**2) + 2*v*vv*Conjg(lam7) + g2**2*vv**2*RXiWp)/4._dp 

 
p2 = Metp2
PiSf = ZeroC 
Call Pi1Loopetp(p2,Metp,Metp2,MAh,MAh2,MHp,MHp2,MVWp,MVWp2,MetI,MetI2,Mhh,            & 
& Mhh2,MVZ,MVZ2,MFd,MFd2,MFu,MFu2,MFe,MFe2,cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,      & 
& cpletIetpcetp,cpletIHpcetp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL,       & 
& cplcFdFucetpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,    & 
& cplcgZgWpetp,cplhhcetpcVWp,cplhhHpcetp,cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,     & 
& cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1Loopetp(p2,Metp,Metp2,MAh,MAh2,MHp,MHp2,MVWp,MVWp2,MetI,MetI2,Mhh,            & 
& Mhh2,MVZ,MVZ2,MFd,MFd2,MFu,MFu2,MFe,MFe2,cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,      & 
& cpletIetpcetp,cpletIHpcetp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL,       & 
& cplcFdFucetpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,    & 
& cplcgZgWpetp,cplhhcetpcVWp,cplhhHpcetp,cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,     & 
& cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetp
 
 
Subroutine Pi1Loopetp(p2,Metp,Metp2,MAh,MAh2,MHp,MHp2,MVWp,MVWp2,MetI,MetI2,          & 
& Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFu,MFu2,MFe,MFe2,cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,  & 
& cpletIetpcetp,cpletIHpcetp,cpletphhcetp,cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL,       & 
& cplcFdFucetpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,    & 
& cplcgZgWpetp,cplhhcetpcVWp,cplhhHpcetp,cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,     & 
& cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp,cpletpHpcetpcHp,cpletpcetpVPVP,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: Metp,Metp2,MAh,MAh2,MHp,MHp2,MVWp,MVWp2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,           & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3)

Complex(dp), Intent(in) :: cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,cpletIHpcetp,cpletphhcetp(2),   & 
& cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),cplcFeFvcetpL(3,3),    & 
& cplcFeFvcetpR(3,3),cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,cplcgZgWpetp,              & 
& cplhhcetpcVWp(2),cplhhHpcetp(2),cplcetpcVWpVP,cplcetpcVWpVZ,cplAhAhetpcetp,            & 
& cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp(2,2),cpletpHpcetpcHp,cpletpcetpVPVP, & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! etp, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,MAh2) 
coup1 = cplAhetpcetp
coup2 = Conjg(cplAhetpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MAh2) 
coup1 = cplAhHpcetp
coup2 = Conjg(cplAhHpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVWp2) 
coup1 = cpletIcetpcVWp
coup2 =  Conjg(cpletIcetpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! etp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,MetI2) 
coup1 = cpletIetpcetp
coup2 = Conjg(cpletIetpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MetI2) 
coup1 = cpletIHpcetp
coup2 = Conjg(cpletIHpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, etp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Metp2) 
coup1 = cpletphhcetp(i1)
coup2 = Conjg(cpletphhcetp(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Metp2,0._dp) 
coup1 = cpletpcetpVP
coup2 =  Conjg(cpletpcetpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Metp2,MVZ2) 
coup1 = cpletpcetpVZ
coup2 =  Conjg(cpletpcetpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucetpL(i1,i2)
coupR1 = cplcFdFucetpR(i1,i2)
coupL2 =  Conjg(cplcFdFucetpL(i1,i2))
coupR2 =  Conjg(cplcFdFucetpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),0._dp) 
B0m2 = -2._dp*MFe(i1)*0.*B0(p2,MFe2(i1),0._dp) 
coupL1 = cplcFeFvcetpL(i1,i2)
coupR1 = cplcFeFvcetpR(i1,i2)
coupL2 =  Conjg(cplcFeFvcetpL(i1,i2))
coupR2 =  Conjg(cplcFeFvcetpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWCcetp
coup2 =  cplcgWCgZetp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgZcetp
coup2 =  cplcgZgWpetp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWp2) 
coup1 = cplhhcetpcVWp(i2)
coup2 =  Conjg(cplhhcetpcVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = B0(p2,MHp2,Mhh2(i2)) 
coup1 = cplhhHpcetp(i2)
coup2 = Conjg(cplhhHpcetp(i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWp2) 
coup1 = cplcetpcVWpVP
coup2 =  Conjg(cplcetpcVWpVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVWp2) 
coup1 = cplcetpcVWpVZ
coup2 =  Conjg(cplcetpcVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletpetpcetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
coup1 = cpletphhhhcetp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cpletpHpcetpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(0._dp) + 0.25_dp*RXi*A0(0._dp*RXi) - 0.5_dp*0._dp*rMS 
coup1 = cpletpcetpVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cpletpcetpcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cpletpcetpVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1Loopetp 
 
Subroutine OneLoopAh(g1,g2,mH2,lam1,lam4,lam3,lam5,lam6,v,vv,TW,MAh,MAh2,             & 
& MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,           & 
& MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhetpcetp,         & 
& cplAhetpcHp,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHpcHp,cplAhHpVWp,       & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,      & 
& cplAhAhVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),Metp,Metp2,MHp,MHp2,MFd(3),MFd2(3),MFe(3),         & 
& MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,lam5,v,vv,TW

Complex(dp), Intent(in) :: mH2,lam1,lam4,lam3,lam6

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhetpcetp,             & 
& cplAhetpcHp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),       & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),            & 
& cplAhhhVZ(2),cplAhHpcHp,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,           & 
& cplAhAhhhhh(2,2),cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mi2 = (2*(2._dp*(mH2) + lam1*v**2 + vv*(lam6*v + (lam3 + lam4 - lam5)*vv)) + 2*v*vv*Conjg(lam6) + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,             & 
& cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpcHp,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,    & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,             & 
& cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpcHp,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,    & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,         & 
& cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHpcHp,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,    & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),Metp,Metp2,MHp,MHp2,MFd(3),MFd2(3),MFe(3),         & 
& MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhetpcetp,             & 
& cplAhetpcHp,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),       & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),            & 
& cplAhhhVZ(2),cplAhHpcHp,cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,           & 
& cplAhAhhhhh(2,2),cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MAh2,MAh2) 
coup1 = cplAhAhAh
coup2 = Conjg(cplAhAhAh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MAh2) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MAh2) 
coup1 = cplAhAhhh(i1)
coup2 = Conjg(cplAhAhhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MetI2) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MetI2) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,Metp2) 
coup1 = cplAhetpcetp
coup2 = Conjg(cplAhetpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Metp2) 
coup1 = cplAhetpcHp
coup2 = Conjg(cplAhetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdAhL(i1,i2)
coupR1 = cplcFdFdAhR(i1,i2)
coupL2 =  Conjg(cplcFdFdAhL(i1,i2))
coupR2 =  Conjg(cplcFdFdAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeAhL(i1,i2)
coupR1 = cplcFeFeAhR(i1,i2)
coupL2 =  Conjg(cplcFeFeAhL(i1,i2))
coupR2 =  Conjg(cplcFeFeAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuAhL(i1,i2)
coupR1 = cplcFuFuAhR(i1,i2)
coupL2 =  Conjg(cplcFuFuAhL(i1,i2))
coupR2 =  Conjg(cplcFuFuAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpAh
coup2 =  cplcgWpgWpAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCAh
coup2 =  cplcgWCgWCAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Mhh2(i2)) 
coup1 = cplAhhhhh(i1,i2)
coup2 = Conjg(cplAhhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
coup1 = cplAhhhVZ(i2)
coup2 =  Conjg(cplAhhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MHp2) 
coup1 = cplAhHpcHp
coup2 = Conjg(cplAhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
coup1 = cplAhHpVWp
coup2 =  Conjg(cplAhHpVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhAhAh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cplAhAhetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
coup1 = cplAhAhhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplAhAhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cplAhAhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplAhAhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoopetI(g1,g2,mEt2,lam2,lam4,lam3,lam7,lam5,v,vv,TW,MAh,MAh2,           & 
& MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MVZ,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,              & 
& cpletIetpcetp,cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,        & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIetpcetp,cpletIetIhhhh,   & 
& cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),Metp,Metp2,MHp,MHp2,MVWp,MVWp2,MFd(3),             & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2

Real(dp), Intent(in) :: g1,g2,lam5,v,vv,TW

Complex(dp), Intent(in) :: mEt2,lam2,lam4,lam3,lam7

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cpletIetpcetp,       & 
& cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),       & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,               & 
& cpletIetIetpcetp,cpletIetIhhhh(2,2),cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetI'
 
mi2 = (2*(2._dp*(mEt2) + lam3*v**2 + lam4*v**2 - lam5*v**2 + lam7*v*vv + lam2*vv**2) + 2*v*vv*Conjg(lam7) + vv**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 

 
p2 = MetI2
PiSf = ZeroC 
Call Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MVWp,             & 
& MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,           & 
& cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL,         & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,         & 
& cpletIetIetpcetp,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,          & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,MVWp,             & 
& MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,           & 
& cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL,         & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,         & 
& cpletIetIetpcetp,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,          & 
& kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetI
 
 
Subroutine Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,Metp,Metp2,MHp,MHp2,            & 
& MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,      & 
& cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL,         & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,         & 
& cpletIetIetpcetp,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),Metp,Metp2,MHp,MHp2,MVWp,MVWp2,MFd(3),             & 
& MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cpletIetpcetp,       & 
& cpletIetpcHp,cpletIetpVWp,cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),       & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHpcHp,cplAhAhetIetI,cpletIetIetIetI,               & 
& cpletIetIetpcetp,cpletIetIhhhh(2,2),cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MAh2,MAh2) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MAh2) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MAh2) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MetI2) 
coup1 = cpletIetIetI
coup2 = Conjg(cpletIetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),MetI2) 
coup1 = cpletIetIhh(i1)
coup2 = Conjg(cpletIetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Metp2,Metp2) 
coup1 = cpletIetpcetp
coup2 = Conjg(cpletIetpcetp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Metp2) 
coup1 = cpletIetpcHp
coup2 = Conjg(cpletIetpcHp)
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! VWp, etp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Metp2,MVWp2) 
coup1 = cpletIetpVWp
coup2 =  Conjg(cpletIetpVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdetIL(i1,i2)
coupR1 = cplcFdFdetIR(i1,i2)
coupL2 =  Conjg(cplcFdFdetIL(i1,i2))
coupR2 =  Conjg(cplcFdFdetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeetIL(i1,i2)
coupR1 = cplcFeFeetIR(i1,i2)
coupL2 =  Conjg(cplcFeFeetIL(i1,i2))
coupR2 =  Conjg(cplcFeFeetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuetIL(i1,i2)
coupR1 = cplcFuFuetIR(i1,i2)
coupL2 =  Conjg(cplcFuFuetIL(i1,i2))
coupR2 =  Conjg(cplcFuFuetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpetI
coup2 =  cplcgWpgWpetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCetI
coup2 =  cplcgWCgWCetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,Mhh2(i1),Mhh2(i2)) 
coup1 = cpletIhhhh(i1,i2)
coup2 = Conjg(cpletIhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
coup1 = cpletIhhVZ(i2)
coup2 =  Conjg(cpletIhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MHp2) 
coup1 = cpletIHpcHp
coup2 = Conjg(cpletIHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Metp2) 
coup1 = cpletIetIetpcetp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(Mhh2(i1)) 
coup1 = cpletIetIhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cpletIetIHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cpletIetIcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cpletIetIVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopetI 
 
Subroutine OneLoopVZ(g1,g2,v,vv,TW,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,Metp,Metp2,           & 
& MVWp,MVWp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHp,MHp2,cplAhhhVZ,cpletIhhVZ,          & 
& cpletpcetpVZ,cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,              & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHpcHpVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ, & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,MFd(3),MFd2(3),              & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MHp,MHp2

Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(in) :: cplAhhhVZ(2),cpletIhhVZ(2),cpletpcetpVZ,cpletpVWpVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),  & 
& cplcFvFvVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHpcHpVZ,cplHpVWpVZ,         & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cplhhhhVZVZ(2,2),cplHpcHpVZVZ,   & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHp,MHp2,cplAhhhVZ,cpletIhhVZ,cpletpcetpVZ,            & 
& cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,           & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,MFd,             & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHp,MHp2,cplAhhhVZ,cpletIhhVZ,cpletpcetpVZ,            & 
& cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,           & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,           & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHp,MHp2,cplAhhhVZ,cpletIhhVZ,cpletpcetpVZ,        & 
& cpletpVWpVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcFvFvVZL,cplcFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHpcHpVZ,cplHpVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,           & 
& cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh,MAh2,MetI,MetI2,Metp,Metp2,MVWp,MVWp2,MFd(3),MFd2(3),              & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MHp,MHp2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cpletIhhVZ(2),cpletpcetpVZ,cpletpVWpVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),& 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),  & 
& cplcFvFvVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHpcHpVZ,cplHpVWpVZ,         & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cpletpcetpVZVZ,cplhhhhVZVZ(2,2),cplHpcHpVZVZ,   & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = VSSloop(p2,MAh2,Mhh2(i1))  
coup1 = cplAhhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = VSSloop(p2,MetI2,Mhh2(i1))  
coup1 = cpletIhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[etp], etp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,Metp2,Metp2)  
coup1 = cpletpcetpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, etp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWp2,Metp2) 
coup1 = cpletpVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fv], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,0._dp,0._dp) 
B0m2 = 4._dp*0.*0.*B0(p2,0._dp,0._dp) 
coupL1 = cplcFvFvVZL(i1,i2)
coupR1 = cplcFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWp2,MVWp2)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWp2,MVWp2)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVZ2,Mhh2(i2)) 
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MHp2,MHp2)  
coup1 = cplHpcHpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWp2,MHp2) 
coup1 = cplHpVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MAh2)
 coup1 = cplAhAhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetI2)
 coup1 = cpletIetIVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Metp2)
 coup1 = cpletpcetpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHp2)
 coup1 = cplHpcHpVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWp2) +RXi/4._dp*A0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine OneLoopVWp(g2,v,vv,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu,            & 
& MFu2,MFd,MFd2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpcVWp,cpletIcetpcVWp,       & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,   & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcetpcVWp,cplhhcHpcVWp,cplhhcVWpVWp,cplcetpcVWpVP,     & 
& cplcHpcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,      & 
& cpletIetIcVWpVWp,cpletpcetpcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu(3),MFu2(3),MFd(3),MFd2(3),MFe(3),         & 
& MFe2(3),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2

Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(in) :: cplAhcHpcVWp,cpletIcetpcVWp,cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFvFecVWpL(3,3), & 
& cplcFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplhhcetpcVWp(2),cplhhcHpcVWp(2),cplhhcVWpVWp(2),cplcetpcVWpVP,cplcHpcVWpVP,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,  & 
& cpletpcetpcVWpVWp,cplhhhhcVWpVWp(2,2),cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1, & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWp'
 
mi2 = MVWp2 

 
p2 = MVWp2
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu,MFu2,MFd,              & 
& MFd2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpcVWp,cpletIcetpcVWp,cplcFuFdcVWpL,  & 
& cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgWCgZcVWp,cplhhcetpcVWp,cplhhcHpcVWp,cplhhcVWpVWp,cplcetpcVWpVP,cplcHpcVWpVP,      & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,  & 
& cpletpcetpcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu,MFu2,MFd,              & 
& MFd2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpcVWp,cpletIcetpcVWp,cplcFuFdcVWpL,  & 
& cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgWCgZcVWp,cplhhcetpcVWp,cplhhcHpcVWp,cplhhcVWpVWp,cplcetpcVWpVP,cplcHpcVWpVP,      & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,  & 
& cpletpcetpcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWp
 
 
Subroutine Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu,MFu2,            & 
& MFd,MFd2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHpcVWp,cpletIcetpcVWp,            & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFvFecVWpL,cplcFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,   & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcetpcVWp,cplhhcHpcVWp,cplhhcVWpVWp,cplcetpcVWpVP,     & 
& cplcHpcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,      & 
& cpletIetIcVWpVWp,cpletpcetpcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,     & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,Metp,Metp2,MetI,MetI2,MFu(3),MFu2(3),MFd(3),MFd2(3),MFe(3),         & 
& MFe2(3),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHpcVWp,cpletIcetpcVWp,cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFvFecVWpL(3,3), & 
& cplcFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplhhcetpcVWp(2),cplhhcHpcVWp(2),cplhhcVWpVWp(2),cplcetpcVWpVP,cplcHpcVWpVP,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,  & 
& cpletpcetpcVWpVWp,cplhhhhcVWpVWp(2,2),cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1, & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hp], Ah 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MAh2,MHp2)  
coup1 = cplAhcHpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], etI 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MetI2,Metp2)  
coup1 = cpletIcetpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
coupL1 = cplcFuFdcVWpL(i1,i2)
coupR1 = cplcFuFdcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fv], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,0._dp,MFe2(i2)) 
B0m2 = 4._dp*0.*MFe(i2)*B0(p2,0._dp,MFe2(i2)) 
coupL1 = cplcFvFecVWpL(i1,i2)
coupR1 = cplcFvFecVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWpC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWp2)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWp2,0._dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWp2,MVZ2)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWp2)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = VSSloop(p2,Mhh2(i2),Metp2)  
coup1 = cplhhcetpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B22m2 = VSSloop(p2,Mhh2(i2),MHp2)  
coup1 = cplhhcHpcVWp(i2)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = VVSloop(p2,MVWp2,Mhh2(i2)) 
coup1 = cplhhcVWpVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[etp], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,0._dp,Metp2) 
coup1 = cplcetpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], VP 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,0._dp,MHp2) 
coup1 = cplcHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[etp], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZ2,Metp2) 
coup1 = cplcetpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], VZ 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZ2,MHp2) 
coup1 = cplcHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MAh2)
 coup1 = cplAhAhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MetI2)
 coup1 = cpletIetIcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[etp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Metp2)
 coup1 = cpletpcetpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MHp2)
 coup1 = cplHpcHpcVWpVWp
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(0._dp) +RXi/4._dp*A0(0._dp*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWp2) +RXi/4._dp*A0(MVWp2*RXi) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZ2) +RXi/4._dp*A0(MVZ2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWp 
 

  Complex(dp) Function FloopRXi(p2,m12,m22) 
   Implicit None 
   Real(dp),Intent(in)::p2,m12,m22 
    
   
    If (RXi.eq.1._dp) Then
       FloopRXi=Floop(p2,m12,m22)
    Else
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
          FloopRXi=A0(m12)-A0(m22)+((m12-p2)*A0(m22))/m22-&
               & ((m12-p2+m22*RXi)*A0(m22*RXi))/m22+(-m12+m22+p2)*b0(p2,m12,m22)-&
               & (m12-(m12-p2)**2/m22+3._dp*p2)*b0(p2,m12,m22)-((m12-p2)**2*b0(p2,m12,m22*RXi))/m22
       Else
          If (m12.gt.1.0E-10_dp) Then
              FloopRXi=A0(m12)-2._dp*(m12+p2)*B0(p2,0._dp,m12)
          Else If (m22.gt.1.0E-10_dp) Then
              FloopRXi=(-((m22+p2)*A0(m22))+(p2-m22*RXi)*A0(m22*RXi)+(m22-p2)**2*B0(p2,0._dp,m22)-p2**2*B0(p2,0._dp,m22*RXi))/m22
          Else
              FloopRXi=0._dp
          End if
       End if
    End if
     If (Real(FloopRXi,dp).ne.Real(FloopRXi,dp)) Write(*,*) "NaN in FloopRXi", p2,m12,m22
  End Function FloopRXi


  
  Complex(dp) Function SVVloop(p2,m12,m22)
    Implicit None

    Real(dp),Intent(in)::p2,m12,m22
    

    If (RXi.eq.1._dp) Then
	   
        SVVloop = 4._dp*Real(B0(p2,m12,m22)-0.5_dp*rMS,dp)
    Else If (RXi.lt.0.1_dp) Then
	If (m12.gt.1.0E-10_dp) Then
	    If (p2.gt.0.1_dp) Then
		SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
	    Else
	     If (m12.eq.m22) Then 
	        SVVloop = 0._dp
	     Else 
		SVVloop = (2._dp*rMS*(-m12+m22)+3._dp*A0(m12)-3._dp*A0(m22))/(m12-m22)
             End if
	    End if
        Else
	     If (p2.gt.0.1) Then
		SVVloop = (-8._dp*rMS*m22+A0(m22)+2._dp*p2*B0(p2,0._dp,0._dp)+2._dp*(5._dp*m22-p2)*B0(p2,0._dp,m22))/(4._dp*m22)
	    Else
		SVVloop = -2._dp*rMS + 3._dp*B0(0._dp,0._dp,m22)
	    End if
	End if
    Else
    
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-2._dp*rMS*m12+2._dp*rMS*m22+3._dp*A0(m12)-3._dp*A0(m22)+RXi*A0(m12*RXi)-RXi*A0(m22*RXi))/(m12-m22)
	  Else
	  
	   If (m12-m22.lt.1_dp) Then 
	     SVVloop=  (p2**2*(B0(p2,m12,m12) - 2*B0(p2,m12,m12*RXi) + B0(p2,m12*RXi,m12*RXi)) + &
     &  4*m12*p2*(-B0(p2,m12,m12) + (1 + RXi)*B0(p2,m12,m12*RXi) - RXi*B0(p2,m12*RXi,m12*RXi)) + &
     &  2*m12*((1 - RXi)*A0(m12) + (-1 + RXi)*A0(m12*RXi) - m12*(4*rMS - 6*B0(p2,m12,m12) + (-1 + RXi)**2*B0(p2,m12,m12*RXi) - 2*RXi**2*B0(p2,m12*RXi,m12*RXi))))/(4*m12**2)
	   Else 
	      SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
          End if
          End if 
       Else If ((m12.gt.1.0E-10_dp).and.(m22.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-8._dp*rMS*m22+(11._dp+RXi)*A0(m22)+(1._dp+3._dp*RXi)*A0(m22*RXi))/(4._dp*m22)
	  Else
	      SVVloop =  -2._dp*rMS+A0(m12)/(4._dp*m12)-(RXi*A0(m12))/(4._dp*m12)-A0(m12*RXi)/(4._dp*m12)+(RXi*A0(m12*RXi))/(4._dp*m12)&
              &+(5._dp*B0(p2,0._dp,m12))/2._dp-(p2*B0(p2,0._dp,m12))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12))/2._dp+(p2*RXi*B0(p2,0._dp,m12))/(2._dp*m12)& 
              &+(p2*B0(p2,0._dp,m12*RXi))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m12*RXi))/(2._dp*m12) + (RXi**2*B0(p2,0._dp,m12*RXi))/2._dp
          End if 
          
       Else If ((m22.gt.1.0E-10_dp).and.(m12.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = -2._dp*rMS + (1.0_dp*RXi)*B0(0._dp,0._dp,m22*RXi) + (3._dp)*B0(0._dp,0._dp,m22) !+ A0(m22)/m22
	  Else
	       SVVloop =  -2._dp*rMS+A0(m22)/(4._dp*m22)-(RXi*A0(m22))/(4._dp*m22)-A0(m22*RXi)/(4._dp*m22)+(RXi*A0(m22*RXi))/(4._dp*m22)&
              &+(5._dp*B0(p2,0._dp,m22))/2._dp-(p2*B0(p2,0._dp,m22))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22))/2._dp+(p2*RXi*B0(p2,0._dp,m22))/(2._dp*m22)& 
              &+(p2*B0(p2,0._dp,m22*RXi))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m22*RXi))/(2._dp*m22) + (RXi**2*B0(p2,0._dp,m22*RXi))/2._dp
          End if 
          
       End if
    End if
         If (Real(SVVloop,dp).ne.Real(SVVloop,dp)) Write(*,*) "NaN in SVVloop", p2,m12,m22
  End Function SVVloop

Complex(dp) Function VSSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

VSSloop=  -4._dp*B00(p2,m12,m22) 

! If (RXi.eq.1._dp) Then 
!   VSSloop=  -4._dp*B00(p2,m12,m22) 
! Else
!   If (p2.gt.0) Then 
!         VSSloop=   -(6*(m12 + m22)*(-1 + RXi) + (2*p2*(-p2 + 3*(m12 + m22)*RXi) + &
!       & 3*(p2 + (m12 - m22)*RXi)*A0(m12) + 3*(p2 - m12*RXi + m22*RXi)*A0(m22) - &
!       & 3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12,m22))/p2)/9._dp  &
!       &  + rMS*(2._dp/3._dp)*(m12 + m22)*(-1._dp + RXi)
!   Else ! to be added
!      VSSloop= 0._dp
!    End if
! End if
End Function VSSloop

Complex(dp) Function VVSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

If (RXi.eq.1._dp) Then 
  VVSloop=  B0(p2,m12,m22) 
Else
  ! VVSloop = B0(p2,m12,m22) - 0.25_dp*(B00(p2,m12,m22) + B00(p2,rxi*m12,m22))/m12  !! Mark
   VVSloop = B0(p2,m12,m22) + (-B00(p2,m12,m22) + B00(p2,m22,rxi*m12))/m12 !! FeynArts
End if

End Function VVSloop


Complex(dp) Function VVVloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 
Real(dp) :: b001

If (RXi.eq.1._dp) Then 
  VVVloop=   -2._dp*rMS*(m12 + m22 - p2/3._dp) + 10._dp*B00(p2,m12,m22) &
     & + (m12+m22+4._dp*p2)*B0(p2,m12,m22)+  A0(m12) + A0(m22)
Else
!   If ((m12.eq.m22).and.(m22.gt.0._dp)) Then 
!       b001 = (-A0(m22)+(p2+m12-m22)*B11(MZ2,m22,m22) + 2._dp*m22*B1(MZ2,m22,m22) - 1._dp/6._dp*(-p2 + 2._dp*m22+4._dp*m22))/8._dp
!       VVVloop =        ((m22*(96._dp*b001*MZ2 + 16._dp*m22*MZ2*rMS - 3._dp*m22**2*(-1._dp + 32._dp*rMS + RXi**2)) + 6._dp*m22*(4*MZ2 + m22*(-3._dp + 4._dp*RXi))*A0(m22) + 6._dp*m22*(-4._dp*MZ2 + m22*(4._dp + 3._dp*RXi))*A0(m22*RXi) +  &
!        &      24._dp*(7._dp*m22**2*MZ2*B0(MZ2,m22,m22) + m22**2*(m22 - 2._dp*MZ2 - 4._dp*MZ2*RXi + m22*RXi**2)*B0(MZ2,m22,m22*RXi) + 12._dp*m22**2*B00(MZ2,m22,m22) - 7._dp*m22*MZ2*B00(MZ2,m22,m22) +  &
!        &         MZ2**2*B00(MZ2,m22,m22) - m22**2*B00(MZ2,m22,m22*RXi) + 9._dp*m22*MZ2*B00(MZ2,m22,m22*RXi) - 2._dp*MZ2**2*B00(MZ2,m22,m22*RXi) - m22**2*RXi*B00(MZ2,m22,m22*RXi) +  &
!        &         MZ2**2*B00(MZ2,m22*RXi,m22*RXi) - 2._dp*m22**2*MZ2*b1(MZ2,m22,m22) - 4._dp*m22**2*MZ2*RXi*b1(MZ2,m22,m22*RXi) - 4._dp*m22*MZ2**2*b11(MZ2,m22,m22) + 4._dp*m22*MZ2**2*b11(MZ2,m22,m22*RXi))))/ &
!        &  (24._dp*m22**2)
!   Else      
    
  If ((p2.gt.0).and.(m12.gt.0_dp).and.(m22.gt.0._dp)) Then 
      VVVloop= ((m12*m22*p2*(-3*m12 - 3*m22 - 40*p2 - 12*(m12 + m22 - 4*p2)*RXi - 9*(m12 + m22)*RXi**2) +  &
     &      6*m22*(-m22**2 - 9*m22*p2 + m12*(-9*m22 + p2*(13 - 2*RXi)) + m12**2*(9 + RXi) + p2**2*(9 + RXi))*A0(m12) -  &
     &      6*m12*(m12**2 + 9*m12*(m22 + p2) - m22**2*(9 + RXi) - p2**2*(9 + RXi) + m22*p2*(-13 + 2*RXi))*A0(m22) +  &
     &      6*(m22*(m22**2 + m22*(9*p2 - m12*RXi) - p2*(-11*m12*RXi + p2*(9 + RXi)))*A0(m12*RXi) + m12*(m12**2 + 9*m12*p2 - 9*p2**2 - (m12*m22 - 11*m22*p2 + p2**2)*RXi)*A0(m22*RXi) -  &
     &         m12**4*B0(p2,m12,m22) - 8*m12**3*m22*B0(p2,m12,m22) + 18*m12**2*m22**2*B0(p2,m12,m22) - 8*m12*m22**3*B0(p2,m12,m22) - m22**4*B0(p2,m12,m22) - 8*m12**3*p2*B0(p2,m12,m22) + &  
     &         32*m12**2*m22*p2*B0(p2,m12,m22) + 32*m12*m22**2*p2*B0(p2,m12,m22) - 8*m22**3*p2*B0(p2,m12,m22) + 18*m12**2*p2**2*B0(p2,m12,m22) + 32*m12*m22*p2**2*B0(p2,m12,m22) +  &
     &         18*m22**2*p2**2*B0(p2,m12,m22) - 8*m12*p2**3*B0(p2,m12,m22) - 8*m22*p2**3*B0(p2,m12,m22) - p2**4*B0(p2,m12,m22) + m12**4*B0(p2,m12,m22*RXi) + 8*m12**3*p2*B0(p2,m12,m22*RXi) -  &
     &         18*m12**2*p2**2*B0(p2,m12,m22*RXi) + 8*m12*p2**3*B0(p2,m12,m22*RXi) + p2**4*B0(p2,m12,m22*RXi) - 2*m12**3*m22*RXi*B0(p2,m12,m22*RXi) + 2*m12**2*m22*p2*RXi*B0(p2,m12,m22*RXi) +  &
     &         2*m12*m22*p2**2*RXi*B0(p2,m12,m22*RXi) - 2*m22*p2**3*RXi*B0(p2,m12,m22*RXi) + m12**2*m22**2*RXi**2*B0(p2,m12,m22*RXi) - 2*m12*m22**2*p2*RXi**2*B0(p2,m12,m22*RXi) +  &
     &         m22**2*p2**2*RXi**2*B0(p2,m12,m22*RXi) + m22**4*B0(p2,m22,m12*RXi) + 8*m22**3*p2*B0(p2,m22,m12*RXi) - 18*m22**2*p2**2*B0(p2,m22,m12*RXi) + 8*m22*p2**3*B0(p2,m22,m12*RXi) +  &
     &         p2**4*B0(p2,m22,m12*RXi) - 2*m12*m22**3*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22**2*p2*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22*p2**2*RXi*B0(p2,m22,m12*RXi) - 2*m12*p2**3*RXi*B0(p2,m22,m12*RXi) +  &
     &         m12**2*m22**2*RXi**2*B0(p2,m22,m12*RXi) - 2*m12**2*m22*p2*RXi**2*B0(p2,m22,m12*RXi) + m12**2*p2**2*RXi**2*B0(p2,m22,m12*RXi) -  &
     &         p2**2*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi))))/(72.*m12*m22*p2) -2._dp*(rMS-1._dp)*(m12 + m22 - p2/3._dp)
  Else ! to be added
     Write(*,*) "Warning from VVVloop", p2,m12,m22
     VVVloop= 0._dp
   End if
! End if
End if
End Function VVVloop


Complex(dp) Function VGGloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 


If (RXi.eq.1._dp) Then 
  VGGloop=  B00(p2,m12,m22) 
Else
  VGGloop=  B00(p2,m12*RXi,m22*RXi) 

!   If (p2.gt.0) Then 
!       VGGloop=   -((2*p2*(p2 - 3*(m12 + m22)*RXi) - 3*(p2 + (m12 - m22)*RXi)*A0(m12*RXi)  &
!       & - 3*(p2 - m12*RXi + m22*RXi)*A0(m22*RXi) +  &
!     &       3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi)))/(36.*p2)
!   Else  ! to be added
!          Write(*,*) "Warning from VVSloop", p2,m12,m22
!      VGGloop= 0._dp
!    End if
End if
End Function VGGloop
End Module LoopMasses_2HDMHiggsBasis 
