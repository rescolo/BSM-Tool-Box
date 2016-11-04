! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:33 on 3.11.2016   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_radinertDTFDTSDM 
 
Use Control 
Use Couplings_radinertDTFDTSDM 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_radinertDTFDTSDM 
Use StandardModel 
Use Tadpoles_radinertDTFDTSDM 
 Use TreeLevelMasses_radinertDTFDTSDM 
 
Real(dp), Private :: MFv_1L(3), MFv2_1L(3)  
Complex(dp), Private :: Vv_1L(3,3)  
Real(dp), Private :: MNv_1L(3), MNv2_1L(3)  
Complex(dp), Private :: O_1L(3,3)  
Real(dp), Private :: MChi_1L(2), MChi2_1L(2)  
Complex(dp), Private :: Q2_1L(2,2),Q3_1L(2,2)
Real(dp), Private :: MXP_1L(2), MXP2_1L(2)  
Complex(dp), Private :: ZXP_1L(2,2)  
Real(dp), Private :: MXO_1L(2), MXO2_1L(2)  
Complex(dp), Private :: ZX0_1L(2,2)  
Real(dp), Private :: MHp_1L, MHp2_1L  
Real(dp), Private :: MAh_1L, MAh2_1L  
Real(dp), Private :: Mhh_1L, Mhh2_1L  
Real(dp), Private :: MetI_1L, MetI2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVWp_1L, MVWp2_1L  
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,v,g1,g2,g3,               & 
& lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,             & 
& mH2,mEt2,mu3,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(inout) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(inout) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(inout) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Real(dp),Intent(inout) :: v

Complex(dp) :: cplAhAhAhAh,cplAhAhcVWpVWp,cplAhAhetIetI,cplAhAhhh,cplAhAhhhhh,cplAhAhHpcHp,          & 
& cplAhAhUXOUXO(2,2),cplAhAhUXPcUXP(2,2),cplAhAhVZVZ,cplAhAhXOXO(2,2),cplAhAhXPcXP(2,2), & 
& cplAhcHpVWp,cplAhetIUXO(2),cplAhetIXO(2),cplAhhhVZ,cplAhHpcVWp,cplAhXPcUXP(2,2),       & 
& cplAhXPcXP(2,2),cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplcChiChihhL(2,2),              & 
& cplcChiChihhR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cplcChicUFeetIL(2,3),         & 
& cplcChicUFeetIR(2,3),cplcChicUFeXOL(2,3,2),cplcChicUFeXOR(2,3,2),cplcFdFdAhL(3,3),     & 
& cplcFdFdAhR(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),             & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFeFvcVWpL(3,3),               & 
& cplcFeFvcVWpR(3,3),cplcFeNvcUXPL(3,3,2),cplcFeNvcUXPR(3,3,2),cplcFuFuAhL(3,3),         & 
& cplcFuFuAhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWCgWCAh,cplcgWCgWChh,cplcgWCgWpVZ,cplcgWCgZcHp,cplcgWpgWpAh,cplcgWpgWphh,         & 
& cplcgWpgZHp,cplcgZgWCHp,cplcgZgWpcHp,cplcgZgZhh,cplChiFeetIL(2,3),cplChiFeetIR(2,3),   & 
& cplChiFeUXOL(2,3,2),cplChiFeUXOR(2,3,2),cplcHpVPVWp,cplcHpVWpVZ,cplcUChicFeetIL(2,3),  & 
& cplcUChicFeetIR(2,3),cplcUChicFeXOL(2,3,2),cplcUChicFeXOR(2,3,2),cplcUChiChiAhL(2,2),  & 
& cplcUChiChiAhR(2,2),cplcUChiChihhL(2,2),cplcUChiChihhR(2,2),cplcUChiChiVPL(2,2),       & 
& cplcUChiChiVPR(2,2),cplcUChiChiVZL(2,2),cplcUChiChiVZR(2,2),cplcUChiFvXPL(2,3,2),      & 
& cplcUChiFvXPR(2,3,2),cplcUChiNvHpL(2,3),cplcUChiNvHpR(2,3),cplcUChiNvVWpL(2,3),        & 
& cplcUChiNvVWpR(2,3),cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),             & 
& cplcUFdFdhhR(3,3),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),               & 
& cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),              & 
& cplcUFdFucHpR(3,3),cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFeFeAhL(3,3),          & 
& cplcUFeFeAhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),               & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),              & 
& cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFeNvcXPL(3,3,2),       & 
& cplcUFeNvcXPR(3,3,2),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),           & 
& cplcUFuFdVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuhhL(3,3),              & 
& cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),               & 
& cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcVWpcVWpVWpVWp1,              & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,             & 
& cpletIcUXPVWp(2),cpletIcXPVWp(2),cpletIetIcVWpVWp,cpletIetIetIetI,cpletIetIhh,         & 
& cpletIetIhhhh,cpletIetIHpcHp,cpletIetIUXOUXO(2,2),cpletIetIUXPcUXP(2,2),               & 
& cpletIetIVZVZ,cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2),cpletIHpcUXP(2),cpletIHpcXP(2),   & 
& cpletIUXOVZ(2),cpletIXOVZ(2),cpletIXPcHp(2),cpletIXPcVWp(2),cplFvChicUXPL(3,2,2),      & 
& cplFvChicUXPR(3,2,2),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplFvNvetIL(3,3),cplFvNvetIR(3,3)

Complex(dp) :: cplFvNvUXOL(3,3,2),cplFvNvUXOR(3,3,2),cplFvUNvetIL(3,3),cplFvUNvetIR(3,3),             & 
& cplFvUNvXOL(3,3,2),cplFvUNvXOR(3,3,2),cplhhcHpVWp,cplhhcVWpVWp,cplhhhhcVWpVWp,         & 
& cplhhhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhUXOUXO(2,2),cplhhhhUXPcUXP(2,2),             & 
& cplhhhhVZVZ,cplhhhhXOXO(2,2),cplhhhhXPcXP(2,2),cplhhHpcHp,cplhhHpcVWp,cplhhUXOXO(2,2), & 
& cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcUXP(2,2),cplhhXPcXP(2,2),cplHpcHpcVWpVWp,             & 
& cplHpcHpVP,cplHpcHpVPVP,cplHpcHpVZ,cplHpcHpVZVZ,cplHpcVWpVP,cplHpcVWpVZ,               & 
& cplHpHpcHpcHp,cplHpUXOcXP(2,2),cplHpUXOUXOcHp(2,2),cplHpUXPcHpcUXP(2,2),               & 
& cplHpXOcUXP(2,2),cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2),cplNvChicHpL(3,2),               & 
& cplNvChicHpR(3,2),cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),cplNvNvAhL(3,3),               & 
& cplNvNvAhR(3,3),cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplNvNvVZL(3,3),cplNvNvVZR(3,3),       & 
& cplUFvChicXPL(3,2,2),cplUFvChicXPR(3,2,2),cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),           & 
& cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplUFvNvetIL(3,3),& 
& cplUFvNvetIR(3,3),cplUFvNvXOL(3,3,2),cplUFvNvXOR(3,3,2),cplUNvChicHpL(3,2),            & 
& cplUNvChicHpR(3,2),cplUNvChicVWpL(3,2),cplUNvChicVWpR(3,2),cplUNvFeXPL(3,3,2),         & 
& cplUNvFeXPR(3,3,2),cplUNvNvAhL(3,3),cplUNvNvAhR(3,3),cplUNvNvhhL(3,3),cplUNvNvhhR(3,3),& 
& cplUNvNvVZL(3,3),cplUNvNvVZR(3,3),cplUXOcXPVWp(2,2),cplUXOUXOcVWpVWp(2,2),             & 
& cplUXOUXOVZVZ(2,2),cplUXOUXOXOXO(2,2,2,2),cplUXOUXOXPcXP(2,2,2,2),cplUXPcUXPcVWpVWp(2,2),& 
& cplUXPcUXPVPVP(2,2),cplUXPcUXPVZVZ(2,2),cplUXPXPcUXPcXP(2,2,2,2),cplXOcUXPVWp(2,2),    & 
& cplXOXOcVWpVWp(2,2),cplXOXOUXPcUXP(2,2,2,2),cplXOXOVZVZ(2,2),cplXOXPcHp(2,2),          & 
& cplXOXPcVWp(2,2),cplXPcUXPVP(2,2),cplXPcUXPVZ(2,2),cplXPcXPcVWpVWp(2,2),               & 
& cplXPcXPVZ(2,2),cplXPcXPVZVZ(2,2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Complex(dp) :: Tad1Loop(3), dmz2  
Real(dp) :: comp(1), tanbQ, vev2, vSM
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

 
Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,             & 
& O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,v,g1,g2,g3,lam1,lam2,              & 
& lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,              & 
& mu3,GenerationMixing,kont)

mH2Tree  = mH2

 
 If (CalculateOneLoopMasses) Then 
 
Call CouplingsForVectorBosons(g2,g1,TW,v,ZXP,ZX0,Q2,Q3,O,ZDL,ZUL,Vv,ZEL,              & 
& cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpcVWpVWp,            & 
& cplHpcHpVZVZ,cplAhhhVZ,cplAhHpcVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplhhHpcVWp,             & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cpletIcXPVWp,cpletIXOVZ,             & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cplcChiChiVZL,cplcChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,cplcVWpVWpVZVZ1,             & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,cplNvChicVWpL,cplNvChicVWpR,  & 
& cpletIXPcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplXOXPcVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,              & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplXOXOcVWpVWp,               & 
& cplXPcXPcVWpVWp)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXP,             & 
& MXP2,cplAhhhVZ,cplcChiChiVZL,cplcChiChiVZR,cpletIXOVZ,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,        & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,    & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -0 
vSM=sqrt(vev2) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,               & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,(/ ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,             & 
& O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,v,g1,g2,g3,lam1,lam2,              & 
& lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,              & 
& mu3,GenerationMixing,kont)

Call CouplingsForLoopMasses(eta,Yf,Q2,Q3,ZXP,O,Ye,ZER,g2,ZEL,g1,Vv,TW,ZX0,            & 
& A,B,Y3,mu,lam4,lam5,v,lam3,lam7,lam2,lam8,lam6,Yd,ZDL,ZDR,g3,Yu,ZUL,ZUR,               & 
& lam1,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,    & 
& cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,             & 
& cplUNvNvAhL,cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,     & 
& cplFvUNvetIL,cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,             & 
& cplUNvNvhhL,cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,cplcUChiChiAhL,cplcUChiChiAhR,         & 
& cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,cplcUChiChiVPR,cplcUChiChiVZL,            & 
& cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,cplcUChiFvXPL,cplcUChiFvXPR,            & 
& cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR,cplcUChicFeXOL,              & 
& cplcUChicFeXOR,cplAhXPcUXP,cplFvChicUXPL,cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,     & 
& cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,          & 
& cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,cplhhhhUXPcUXP,cplHpUXPcHpcUXP,            & 
& cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,cplXOXOUXPcUXP,cplUXPXPcUXPcXP,        & 
& cplAhetIUXO,cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,cplFvNvUXOR,             & 
& cplhhUXOXO,cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,cplhhhhUXOUXO,       & 
& cplHpUXOUXOcHp,cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,cplUXOUXOXPcXP,            & 
& cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,         & 
& cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,cplcUFdFucHpR,       & 
& cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,     & 
& cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,       & 
& cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,         & 
& cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,   & 
& cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,   & 
& cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,cplAhcHpVWp,cplNvChicHpL,    & 
& cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,          & 
& cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,              & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplXOXPcHp,cplAhAhHpcHp,cpletIetIHpcHp,  & 
& cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp,     & 
& cplHpXPcHpcXP,cplAhAhhh,cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,            & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,cplAhAhXPcXP,         & 
& cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO,          & 
& cplhhXPcXP,cpletIetIhhhh,cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,           & 
& cplhhhhXPcXP,cplChiFeetIL,cplChiFeetIR,cplFvNvetIL,cplFvNvetIR,cpletIHpcXP,            & 
& cpletIcXPVWp,cpletIXOVZ,cpletIetIetIetI,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,  & 
& cpletIetIXPcXP,cplcChiChiVZL,cplcChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,cplHpcVWpVZ,    & 
& cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,         & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,cplNvChicVWpL,cplNvChicVWpR,cpletIXPcVWp,     & 
& cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcVWpVP,cplcVWpVPVWp,      & 
& cplXOXPcVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplXOXOcVWpVWp,cplXPcXPcVWpVWp)

Call OneLoopTadpoleshh(v,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,             & 
& cplAhAhhh,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,cplhhVZVZ,          & 
& cplhhXOXO,cplhhXPcXP,Tad1Loop(1:1))

mH2Tree  = mH2
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,               & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,Tad1Loop)

mH21L = mH2
Call OneLoopFv(MXP,MXP2,MChi,MChi2,MNv,MNv2,MetI,MetI2,MHp,MHp2,MFe,MFe2,             & 
& MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,MXO,MXO2,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,        & 
& cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,Vv_1L,kont)

Call OneLoopNv(MTF,MDF,A,B,v,MNv,MNv2,MAh,MAh2,MHp,MHp2,MChi,MChi2,MVWp,              & 
& MVWp2,MFv,MFv2,MetI,MetI2,MXP,MXP2,MFe,MFe2,MXO,MXO2,Mhh,Mhh2,MVZ,MVZ2,cplUNvNvAhL,    & 
& cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,cplFvUNvetIL,    & 
& cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,cplUNvNvhhL,              & 
& cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,0.1_dp*delta_mass,MNv_1L,MNv2_1L,O_1L,kont)

Call OneLoopChi(MTF,MDF,A,B,v,MChi,MChi2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe,              & 
& MFe2,MetI,MetI2,MXP,MXP2,MFv,MFv2,MNv,MNv2,MHp,MHp2,MVWp,MVWp2,MXO,MXO2,               & 
& cplcUChiChiAhL,cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,            & 
& cplcUChiChiVPR,cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,          & 
& cplcUChiFvXPL,cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR, & 
& cplcUChicFeXOL,cplcUChicFeXOR,0.1_dp*delta_mass,MChi_1L,MChi2_1L,Q2_1L,Q3_1L,kont)

Call OneLoopXP(mEt2,lam3,mu3,lam7,mu,v,MXP,MXP2,MAh,MAh2,MFv,MFv2,MChi,               & 
& MChi2,MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,Mhh2,MXO,MXO2,MFe,MFe2,MNv,MNv2,              & 
& MVZ,MVZ2,cplAhXPcUXP,cplFvChicUXPL,cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,           & 
& cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,          & 
& cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,cplhhhhUXPcUXP,cplHpUXPcHpcUXP,            & 
& cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,cplXOXOUXPcUXP,cplUXPXPcUXPcXP,        & 
& 0.1_dp*delta_mass,MXP_1L,MXP2_1L,ZXP_1L,kont)

Call OneLoopXO(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,MetI,MetI2,MAh,MAh2,MFe,             & 
& MFe2,MChi,MChi2,MVZ,MVZ2,MNv,MNv2,MFv,MFv2,MXO,MXO2,Mhh,Mhh2,MXP,MXP2,MHp,             & 
& MHp2,MVWp,MVWp2,cplAhetIUXO,cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,         & 
& cplFvNvUXOR,cplhhUXOXO,cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,         & 
& cplhhhhUXOUXO,cplHpUXOUXOcHp,cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,             & 
& cplUXOUXOXPcXP,0.1_dp*delta_mass,MXO_1L,MXO2_1L,ZX0_1L,kont)

Call OneLoopHp(g2,mH2,lam1,v,MVWp,MVWp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,             & 
& MXP2,MetI,MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,             & 
& MVZ2,MXO,MXO2,cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,          & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplXOXPcHp,cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,        & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,0.1_dp*delta_mass,             & 
& MHp_1L,MHp2_1L,kont)

Call OneLoopAh(g1,g2,mH2,lam1,v,TW,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,             & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv,MNv2,           & 
& MXP,MXP2,cplAhAhhh,cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,cplcFdFdAhR,     & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,cplAhAhetIetI,      & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,cplAhAhXPcXP,          & 
& 0.1_dp*delta_mass,MAh_1L,MAh2_1L,kont)

Call OneLoophh(mH2,lam1,v,MAh,MAh2,MVZ,MVZ2,MChi,MChi2,MetI,MetI2,MFd,MFd2,           & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXO,MXO2,MXP,MXP2,             & 
& cplAhAhhh,cplAhhhVZ,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO,cplhhXPcXP,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,     & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,cplhhhhXPcXP,0.1_dp*delta_mass,    & 
& Mhh_1L,Mhh2_1L,kont)

Call OneLoopetI(mEt2,lam3,lam4,lam5,v,MXO,MXO2,MAh,MAh2,MFe,MFe2,MChi,MChi2,          & 
& Mhh,Mhh2,MetI,MetI2,MNv,MNv2,MFv,MFv2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,           & 
& cplAhetIXO,cplChiFeetIL,cplChiFeetIR,cpletIetIhh,cplFvNvetIL,cplFvNvetIR,              & 
& cpletIHpcXP,cpletIcXPVWp,cpletIXOVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,       & 
& cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,cpletIetIXPcXP,            & 
& 0.1_dp*delta_mass,MetI_1L,MetI2_1L,kont)

MFv = MFv_1L 
MFv2 = MFv2_1L 
Vv = Vv_1L 
MNv = MNv_1L 
MNv2 = MNv2_1L 
O = O_1L 
MChi = MChi_1L 
MChi2 = MChi2_1L 
Q2 = Q2_1L 
Q3 = Q3_1L 
MXP = MXP_1L 
MXP2 = MXP2_1L 
ZXP = ZXP_1L 
MXO = MXO_1L 
MXO2 = MXO2_1L 
ZX0 = ZX0_1L 
MHp = MHp_1L 
MHp2 = MHp2_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
MetI = MetI_1L 
MetI2 = MetI2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,             & 
& MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,kont)

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
mH2  = mH2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(v,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,MXO,MXO2,             & 
& MXP,MXP2,cplAhAhhh,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,cplhhVZVZ,          & 
& cplhhXOXO,cplhhXPcXP,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,MXO(2),MXO2(2),           & 
& MXP(2),MXP2(2)

Complex(dp), Intent(in) :: cplAhAhhh,cplcChiChihhL(2,2),cplcChiChihhR(2,2),cpletIetIhh,cplcFdFdhhL(3,3),         & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplNvNvhhL(3,3),             & 
& cplNvNvhhR(3,3),cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcXP(2,2)

Real(dp), Intent(in) :: v

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(1)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(1) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
A0m = A0(MAh2) 
  Do gO1 = 1, 1
   coup = cplAhAhhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! bar[Chi] 
!------------------------ 
Do i1 = 1, 2
 A0m = 2._dp*MChi(i1)*A0(MChi2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcChiChihhL(i1,i1)
   coupR = cplcChiChihhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! etI 
!------------------------ 
A0m = A0(MetI2) 
  Do gO1 = 1, 1
   coup = cpletIetIhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*A0(MFd2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFdFdhhL(i1,i1)
   coupR = cplcFdFdhhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*A0(MFe2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFeFehhL(i1,i1)
   coupR = cplcFeFehhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*A0(MFu2(i1)) 
  Do gO1 = 1, 1
   coupL = cplcFuFuhhL(i1,i1)
   coupR = cplcFuFuhhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[gWp] 
!------------------------ 
A0m = 1._dp*A0(MVWp2*RXi) 
  Do gO1 = 1, 1
    coup = cplcgWpgWphh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWpC] 
!------------------------ 
A0m = 1._dp*A0(MVWp2*RXi) 
  Do gO1 = 1, 1
    coup = cplcgWCgWChh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*A0(MVZ2*RXi) 
  Do gO1 = 1, 1
    coup = cplcgZgZhh
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
A0m = A0(Mhh2) 
  Do gO1 = 1, 1
   coup = cplhhhhhh
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! conj[Hp] 
!------------------------ 
A0m = A0(MHp2) 
  Do gO1 = 1, 1
   coup = cplhhHpcHp
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! Nv 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MNv(i1)*A0(MNv2(i1)) 
  Do gO1 = 1, 1
   coupL = cplNvNvhhL(i1,i1)
   coupR = cplNvNvhhR(i1,i1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
A0m = 3._dp*A0(MVWp2)+RXi*A0(MVWp2*RXi) - 2._dp*MVWp2*rMS 
  Do gO1 = 1, 1
    coup = cplhhcVWpVWp
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*A0(MVZ2)+RXi*A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 1
    coup = cplhhVZVZ
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! XO 
!------------------------ 
Do i1 = 1, 2
 A0m = A0(MXO2(i1)) 
  Do gO1 = 1, 1
   coup = cplhhXOXO(i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[XP] 
!------------------------ 
Do i1 = 1, 2
 A0m = A0(MXP2(i1)) 
  Do gO1 = 1, 1
   coup = cplhhXPcXP(i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 


tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoopFv(MXP,MXP2,MChi,MChi2,MNv,MNv2,MetI,MetI2,MHp,MHp2,MFe,            & 
& MFe2,MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,MXO,MXO2,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,   & 
& cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,delta,MFv_1L,MFv2_1L,Vv_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MXP(2),MXP2(2),MChi(2),MChi2(2),MNv(3),MNv2(3),MetI,MetI2,MHp,MHp2,MFe(3),            & 
& MFe2(3),MVWp,MVWp2,MVZ,MVZ2,MFv(3),MFv2(3),MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplUFvChicXPL(3,2,2),cplUFvChicXPR(3,2,2),cplUFvNvetIL(3,3),cplUFvNvetIR(3,3),        & 
& cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),& 
& cplUFvFvVZR(3,3),cplUFvNvXOL(3,3,2),cplUFvNvXOR(3,3,2)

Complex(dp) :: mat1a(3,3), mat1(3,3), mat2(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2 
Real(dp), Intent(out) :: MFv_1L(3),MFv2_1L(3) 
Complex(dp), Intent(out) ::  Vv_1L(3,3) 
Real(dp) :: MFv_t(3),MFv2_t(3) 
Complex(dp) ::  Vv_t(3,3) 
Complex(dp) ::  phaseM, E3(3), sigL(3,3), sigR(3,3), sigS(3,3) 
Real(dp) :: Vva(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MXP,MXP2,MChi,MChi2,MNv,MNv2,MetI,MetI2,MHp,MHp2,MFe,            & 
& MFe2,MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,MXO,MXO2,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,   & 
& cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    Vv_1L(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    Vv_1L(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = Vv_1L(i1,:) 
      Vv_1L(i1,:) = Vv_1L(i2,:) 
      Vv_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Vv_1L, ierr, test) 
mat2 = Matmul( Conjg(Vv_1L), Matmul( mat1, Transpose( Conjg(Vv_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv_1L(i1,:)= phaseM * Vv_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
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
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MXP,MXP2,MChi,MChi2,MNv,MNv2,MetI,MetI2,MHp,MHp2,MFe,            & 
& MFe2,MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,MXO,MXO2,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,   & 
& cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,            & 
& cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Vva,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    Vv_1L(i1,:) = (0._dp,1._dp)*Vva(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    Vv_1L(i1,:) = Vva(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = Vv_1L(i1,:) 
      Vv_1L(i1,:) = Vv_1L(i2,:) 
      Vv_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Vv_1L, ierr, test) 
mat2 = Matmul( Conjg(Vv_1L), Matmul( mat1, Transpose( Conjg(Vv_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Vv_1L(i1,:)= phaseM * Vv_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MXP,MXP2,MChi,MChi2,MNv,MNv2,MetI,MetI2,MHp,               & 
& MHp2,MFe,MFe2,MVWp,MVWp2,MVZ,MVZ2,MFv,MFv2,MXO,MXO2,cplUFvChicXPL,cplUFvChicXPR,       & 
& cplUFvNvetIL,cplUFvNvetIR,cplUFvFeHpL,cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvNvXOL,cplUFvNvXOR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MXP(2),MXP2(2),MChi(2),MChi2(2),MNv(3),MNv2(3),MetI,MetI2,MHp,MHp2,MFe(3),            & 
& MFe2(3),MVWp,MVWp2,MVZ,MVZ2,MFv(3),MFv2(3),MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplUFvChicXPL(3,2,2),cplUFvChicXPR(3,2,2),cplUFvNvetIL(3,3),cplUFvNvetIR(3,3),        & 
& cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),& 
& cplUFvFvVZR(3,3),cplUFvNvXOL(3,3,2),cplUFvNvXOR(3,3,2)

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
! conj[XP], Chi 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MChi2(i2),MXP2(i1)) 
B0m2 = 2._dp*MChi(i2)*B0(p2,MChi2(i2),MXP2(i1)) 
coupL1 = cplUFvChicXPL(gO1,i2,i1)
coupR1 = cplUFvChicXPR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvChicXPL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvChicXPR(gO2,i2,i1))
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
! Nv, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MNv2(i1),MetI2) 
B0m2 = 2._dp*MNv(i1)*B0(p2,MNv2(i1),MetI2) 
coupL1 = cplUFvNvetIL(gO1,i1)
coupR1 = cplUFvNvetIR(gO1,i1)
coupL2 =  Conjg(cplUFvNvetIL(gO2,i1))
coupR2 =  Conjg(cplUFvNvetIR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 !------------------------ 
! Hp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFe2(i2),MHp2) 
B0m2 = 2._dp*MFe(i2)*B0(p2,MFe2(i2),MHp2) 
coupL1 = cplUFvFeHpL(gO1,i2)
coupR1 = cplUFvFeHpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeHpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeHpR(gO2,i2))
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
! VWp, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*(B1(p2,MFe2(i2),MVWp2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(B0(p2,MFe2(i2),MVWp2) - 0.5_dp*rMS) 
coupL1 = cplUFvFeVWpL(gO1,i2)
coupR1 = cplUFvFeVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWpR(gO2,i2))
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
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*(B1(p2,MFv2(i2),MVZ2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZ2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! XO, Nv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MNv2(i2),MXO2(i1)) 
B0m2 = 2._dp*MNv(i2)*B0(p2,MNv2(i2),MXO2(i1)) 
coupL1 = cplUFvNvXOL(gO1,i2,i1)
coupR1 = cplUFvNvXOR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvNvXOL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvNvXOR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFv 
 
Subroutine OneLoopNv(MTF,MDF,A,B,v,MNv,MNv2,MAh,MAh2,MHp,MHp2,MChi,MChi2,             & 
& MVWp,MVWp2,MFv,MFv2,MetI,MetI2,MXP,MXP2,MFe,MFe2,MXO,MXO2,Mhh,Mhh2,MVZ,MVZ2,           & 
& cplUNvNvAhL,cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,     & 
& cplFvUNvetIL,cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,             & 
& cplUNvNvhhL,cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,delta,MNv_1L,MNv2_1L,Q1_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MNv(3),MNv2(3),MAh,MAh2,MHp,MHp2,MChi(2),MChi2(2),MVWp,MVWp2,MFv(3),MFv2(3),          & 
& MetI,MetI2,MXP(2),MXP2(2),MFe(3),MFe2(3),MXO(2),MXO2(2),Mhh,Mhh2,MVZ,MVZ2

Real(dp), Intent(in) :: MTF,MDF,A,B,v

Complex(dp), Intent(in) :: cplUNvNvAhL(3,3),cplUNvNvAhR(3,3),cplUNvChicHpL(3,2),cplUNvChicHpR(3,2),              & 
& cplUNvChicVWpL(3,2),cplUNvChicVWpR(3,2),cplFvUNvetIL(3,3),cplFvUNvetIR(3,3),           & 
& cplUNvFeXPL(3,3,2),cplUNvFeXPR(3,3,2),cplFvUNvXOL(3,3,2),cplFvUNvXOR(3,3,2),           & 
& cplUNvNvhhL(3,3),cplUNvNvhhR(3,3),cplUNvNvVZL(3,3),cplUNvNvVZR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3), mat2(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2 
Real(dp), Intent(out) :: MNv_1L(3),MNv2_1L(3) 
Complex(dp), Intent(out) ::  Q1_1L(3,3) 
Real(dp) :: MNv_t(3),MNv2_t(3) 
Complex(dp) ::  Q1_t(3,3) 
Complex(dp) ::  phaseM, E3(3), sigL(3,3), sigR(3,3), sigS(3,3) 
Real(dp) :: Q1a(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMNv'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+MTF
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(A*v)/2._dp
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-(B*v)/2._dp
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(A*v)/2._dp
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-1._dp*(MDF)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-(B*v)/2._dp
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-1._dp*(MDF)
mat1a(3,3) = 0._dp 

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MNv2(il)
Call Sigma1LoopNv(p2,MNv,MNv2,MAh,MAh2,MHp,MHp2,MChi,MChi2,MVWp,MVWp2,MFv,            & 
& MFv2,MetI,MetI2,MXP,MXP2,MFe,MFe2,MXO,MXO2,Mhh,Mhh2,MVZ,MVZ2,cplUNvNvAhL,              & 
& cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,cplFvUNvetIL,    & 
& cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,cplUNvNvhhL,              & 
& cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Q1a,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MNv_t(i1) = - Eig(i1) 
    Q1_1L(i1,:) = (0._dp,1._dp)*Q1a(i1,:) 
   Else 
    MNv_t(i1) = Eig(i1) 
    Q1_1L(i1,:) = Q1a(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MNv_t(i1)).Gt.Abs(MNv_t(i2))) Then 
      Eig(1) = MNv_t(i1) 
      MNv_t(i1) = MNv_t(i2) 
      MNv_t(i2) = Eig(1) 
      E3 = Q1_1L(i1,:) 
      Q1_1L(i1,:) = Q1_1L(i2,:) 
      Q1_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MNv_1L(iL) = MNv_t(iL) 
MNv2_1L(iL) = MNv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Q1_1L, ierr, test) 
mat2 = Matmul( Conjg(Q1_1L), Matmul( mat1, Transpose( Conjg(Q1_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Q1_1L(i1,:)= phaseM * Q1_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MNv_1L = Sqrt( Eig ) 
 
MNv2_1L = Eig 
 
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
p2 = MNv2_1L(iL)
Call Sigma1LoopNv(p2,MNv,MNv2,MAh,MAh2,MHp,MHp2,MChi,MChi2,MVWp,MVWp2,MFv,            & 
& MFv2,MetI,MetI2,MXP,MXP2,MFe,MFe2,MXO,MXO2,Mhh,Mhh2,MVZ,MVZ2,cplUNvNvAhL,              & 
& cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,cplFvUNvetIL,    & 
& cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,cplUNvNvhhL,              & 
& cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,Q1a,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MNv_t(i1) = - Eig(i1) 
    Q1_1L(i1,:) = (0._dp,1._dp)*Q1a(i1,:) 
   Else 
    MNv_t(i1) = Eig(i1) 
    Q1_1L(i1,:) = Q1a(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MNv_t(i1)).Gt.Abs(MNv_t(i2))) Then 
      Eig(1) = MNv_t(i1) 
      MNv_t(i1) = MNv_t(i2) 
      MNv_t(i2) = Eig(1) 
      E3 = Q1_1L(i1,:) 
      Q1_1L(i1,:) = Q1_1L(i2,:) 
      Q1_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MNv_1L(iL) = MNv_t(iL) 
MNv2_1L(iL) = MNv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, Q1_1L, ierr, test) 
mat2 = Matmul( Conjg(Q1_1L), Matmul( mat1, Transpose( Conjg(Q1_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  Q1_1L(i1,:)= phaseM * Q1_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MNv_1L = Sqrt( Eig ) 
 
MNv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MNv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MNv2_1L(il))
End If 
If (Abs(MNv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopNv
 
 
Subroutine Sigma1LoopNv(p2,MNv,MNv2,MAh,MAh2,MHp,MHp2,MChi,MChi2,MVWp,MVWp2,          & 
& MFv,MFv2,MetI,MetI2,MXP,MXP2,MFe,MFe2,MXO,MXO2,Mhh,Mhh2,MVZ,MVZ2,cplUNvNvAhL,          & 
& cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,cplUNvChicVWpR,cplFvUNvetIL,    & 
& cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,cplFvUNvXOR,cplUNvNvhhL,              & 
& cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MNv(3),MNv2(3),MAh,MAh2,MHp,MHp2,MChi(2),MChi2(2),MVWp,MVWp2,MFv(3),MFv2(3),          & 
& MetI,MetI2,MXP(2),MXP2(2),MFe(3),MFe2(3),MXO(2),MXO2(2),Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplUNvNvAhL(3,3),cplUNvNvAhR(3,3),cplUNvChicHpL(3,2),cplUNvChicHpR(3,2),              & 
& cplUNvChicVWpL(3,2),cplUNvChicVWpR(3,2),cplFvUNvetIL(3,3),cplFvUNvetIR(3,3),           & 
& cplUNvFeXPL(3,3,2),cplUNvFeXPR(3,3,2),cplFvUNvXOL(3,3,2),cplFvUNvXOR(3,3,2),           & 
& cplUNvNvhhL(3,3),cplUNvNvhhR(3,3),cplUNvNvVZL(3,3),cplUNvNvVZR(3,3)

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
! Nv, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MNv2(i1),MAh2) 
B0m2 = 2._dp*MNv(i1)*B0(p2,MNv2(i1),MAh2) 
coupL1 = cplUNvNvAhL(gO1,i1)
coupR1 = cplUNvNvAhR(gO1,i1)
coupL2 =  Conjg(cplUNvNvAhL(gO2,i1))
coupR2 =  Conjg(cplUNvNvAhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 !------------------------ 
! conj[Hp], Chi 
!------------------------ 
      Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MChi2(i2),MHp2) 
B0m2 = 2._dp*MChi(i2)*B0(p2,MChi2(i2),MHp2) 
coupL1 = cplUNvChicHpL(gO1,i2)
coupR1 = cplUNvChicHpR(gO1,i2)
coupL2 =  Conjg(cplUNvChicHpL(gO2,i2))
coupR2 =  Conjg(cplUNvChicHpR(gO2,i2))
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
! conj[VWp], Chi 
!------------------------ 
      Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*(B1(p2,MChi2(i2),MVWp2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MChi(i2)*(B0(p2,MChi2(i2),MVWp2) - 0.5_dp*rMS) 
coupL1 = cplUNvChicVWpL(gO1,i2)
coupR1 = cplUNvChicVWpR(gO1,i2)
coupL2 =  Conjg(cplUNvChicVWpL(gO2,i2))
coupR2 =  Conjg(cplUNvChicVWpR(gO2,i2))
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
! Fv, etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFv2(i1),MetI2) 
B0m2 = 2._dp*MFv(i1)*B0(p2,MFv2(i1),MetI2) 
coupL1 = cplFvUNvetIL(i1,gO1)
coupR1 = cplFvUNvetIR(i1,gO1)
coupL2 =  Conjg(cplFvUNvetIL(i1,gO2))
coupR2 =  Conjg(cplFvUNvetIR(i1,gO2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 !------------------------ 
! XP, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFe2(i2),MXP2(i1)) 
B0m2 = 2._dp*MFe(i2)*B0(p2,MFe2(i2),MXP2(i1)) 
coupL1 = cplUNvFeXPL(gO1,i2,i1)
coupR1 = cplUNvFeXPR(gO1,i2,i1)
coupL2 =  Conjg(cplUNvFeXPL(gO2,i2,i1))
coupR2 =  Conjg(cplUNvFeXPR(gO2,i2,i1))
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
! XO, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MFv2(i2),MXO2(i1)) 
B0m2 = 2._dp*MFv(i2)*B0(p2,MFv2(i2),MXO2(i1)) 
coupL1 = cplFvUNvXOL(i2,gO1,i1)
coupR1 = cplFvUNvXOR(i2,gO1,i1)
coupL2 =  Conjg(cplFvUNvXOL(i2,gO2,i1))
coupR2 =  Conjg(cplFvUNvXOR(i2,gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! Nv, hh 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -1._dp*B1(p2,MNv2(i1),Mhh2) 
B0m2 = 2._dp*MNv(i1)*B0(p2,MNv2(i1),Mhh2) 
coupL1 = cplUNvNvhhL(gO1,i1)
coupR1 = cplUNvNvhhR(gO1,i1)
coupL2 =  Conjg(cplUNvNvhhL(gO2,i1))
coupR2 =  Conjg(cplUNvNvhhR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
 !------------------------ 
! VZ, Nv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*(B1(p2,MNv2(i2),MVZ2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MNv(i2)*(B0(p2,MNv2(i2),MVZ2) - 0.5_dp*rMS) 
coupL1 = cplUNvNvVZL(gO1,i2)
coupR1 = cplUNvNvVZR(gO1,i2)
coupL2 =  Conjg(cplUNvNvVZL(gO2,i2))
coupR2 =  Conjg(cplUNvNvVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopNv 
 
Subroutine OneLoopChi(MTF,MDF,A,B,v,MChi,MChi2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,            & 
& MFe,MFe2,MetI,MetI2,MXP,MXP2,MFv,MFv2,MNv,MNv2,MHp,MHp2,MVWp,MVWp2,MXO,MXO2,           & 
& cplcUChiChiAhL,cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,            & 
& cplcUChiChiVPR,cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,          & 
& cplcUChiFvXPL,cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR, & 
& cplcUChicFeXOL,cplcUChicFeXOR,delta,MChi_1L,MChi2_1L,Q2_1L,Q3_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MChi(2),MChi2(2),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe(3),MFe2(3),MetI,MetI2,MXP(2),         & 
& MXP2(2),MFv(3),MFv2(3),MNv(3),MNv2(3),MHp,MHp2,MVWp,MVWp2,MXO(2),MXO2(2)

Real(dp), Intent(in) :: MTF,MDF,A,B,v

Complex(dp), Intent(in) :: cplcUChiChiAhL(2,2),cplcUChiChiAhR(2,2),cplcUChiChihhL(2,2),cplcUChiChihhR(2,2),      & 
& cplcUChiChiVPL(2,2),cplcUChiChiVPR(2,2),cplcUChiChiVZL(2,2),cplcUChiChiVZR(2,2),       & 
& cplcUChicFeetIL(2,3),cplcUChicFeetIR(2,3),cplcUChiFvXPL(2,3,2),cplcUChiFvXPR(2,3,2),   & 
& cplcUChiNvHpL(2,3),cplcUChiNvHpR(2,3),cplcUChiNvVWpL(2,3),cplcUChiNvVWpR(2,3),         & 
& cplcUChicFeXOL(2,3,2),cplcUChicFeXOR(2,3,2)

Complex(dp) :: mat1a(2,2), mat1(2,2) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2), p2 
Real(dp), Intent(out) :: MChi_1L(2),MChi2_1L(2) 
 Complex(dp), Intent(out) :: Q2_1L(2,2), Q3_1L(2,2) 
 
 Real(dp) :: MChi_t(2),MChi2_t(2) 
 Complex(dp) :: Q2_t(2,2), Q3_t(2,2), sigL(2,2), sigR(2,2), sigS(2,2) 
 
 Complex(dp) :: mat(2,2)=0._dp, mat2(2,2)=0._dp, phaseM 

Complex(dp) :: Q22(2,2), Q32(2,2) 
 
 Real(dp) :: Q21(2,2), Q31(2,2), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMChi'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+MTF
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(A*v)/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(B*v)/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+MDF

 
 Do il=2,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MChi2(il) 
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe,MFe2,MetI,            & 
& MetI2,MXP,MXP2,MFv,MFv2,MNv,MNv2,MHp,MHp2,MVWp,MVWp2,MXO,MXO2,cplcUChiChiAhL,          & 
& cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,cplcUChiChiVPR,            & 
& cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,cplcUChiFvXPL,           & 
& cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR,               & 
& cplcUChicFeXOL,cplcUChicFeXOR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MChi2_t,Q31,ierr,test) 
Q32 = Q31 
Else 
Call EigenSystem(mat2,MChi2_t,Q32,ierr,test) 
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
p2 = MChi2_t(iL)
Call Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe,MFe2,MetI,            & 
& MetI2,MXP,MXP2,MFv,MFv2,MNv,MNv2,MHp,MHp2,MVWp,MVWp2,MXO,MXO2,cplcUChiChiAhL,          & 
& cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,cplcUChiChiVPR,            & 
& cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,cplcUChiFvXPL,           & 
& cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR,               & 
& cplcUChicFeXOL,cplcUChicFeXOR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MChi2_t,Q31,ierr,test) 
Q32 = Q31 
Else 
Call EigenSystem(mat2,MChi2_t,Q32,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MChi2_1L(il) = MChi2_t(il) 
MChi_1L(il) = Sqrt(MChi2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MChi2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MChi2_1L(il))
End If 
If (Abs(MChi2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MChi2_t,Q21,ierr,test) 
 
 
Q22 = Q21 
Else 
Call EigenSystem(mat2,MChi2_t,Q22,ierr,test) 
 
 
End If 
Q22 = Conjg(Q22) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(Q22),mat1),Transpose( Conjg(Q32))) 
Do i1=1,2
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
Q32(i1,:) = phaseM *Q32(i1,:) 
 End if 
End Do 
 
Q2_1L = Q22 
 Q3_1L = Q32 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopChi
 
 
Subroutine Sigma1LoopChi(p2,MChi,MChi2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe,MFe2,           & 
& MetI,MetI2,MXP,MXP2,MFv,MFv2,MNv,MNv2,MHp,MHp2,MVWp,MVWp2,MXO,MXO2,cplcUChiChiAhL,     & 
& cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,cplcUChiChiVPR,            & 
& cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,cplcUChiFvXPL,           & 
& cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR,               & 
& cplcUChicFeXOL,cplcUChicFeXOR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MChi(2),MChi2(2),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MFe(3),MFe2(3),MetI,MetI2,MXP(2),         & 
& MXP2(2),MFv(3),MFv2(3),MNv(3),MNv2(3),MHp,MHp2,MVWp,MVWp2,MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplcUChiChiAhL(2,2),cplcUChiChiAhR(2,2),cplcUChiChihhL(2,2),cplcUChiChihhR(2,2),      & 
& cplcUChiChiVPL(2,2),cplcUChiChiVPR(2,2),cplcUChiChiVZL(2,2),cplcUChiChiVZR(2,2),       & 
& cplcUChicFeetIL(2,3),cplcUChicFeetIR(2,3),cplcUChiFvXPL(2,3,2),cplcUChiFvXPR(2,3,2),   & 
& cplcUChiNvHpL(2,3),cplcUChiNvHpR(2,3),cplcUChiNvVWpL(2,3),cplcUChiNvVWpR(2,3),         & 
& cplcUChicFeXOL(2,3,2),cplcUChicFeXOR(2,3,2)

Complex(dp), Intent(out) :: SigL(2,2),SigR(2,2), SigS(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(2,2), sumR(2,2), sumS(2,2) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Chi, Ah 
!------------------------ 
    Do i1 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MChi2(i1),MAh2),dp) 
B0m2 = MChi(i1)*Real(B0(p2,MChi2(i1),MAh2),dp) 
coupL1 = cplcUChiChiAhL(gO1,i1)
coupR1 = cplcUChiChiAhR(gO1,i1)
coupL2 =  Conjg(cplcUChiChiAhL(gO2,i1))
coupR2 =  Conjg(cplcUChiChiAhR(gO2,i1))
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
! hh, Chi 
!------------------------ 
      Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MChi2(i2),Mhh2),dp) 
B0m2 = MChi(i2)*Real(B0(p2,MChi2(i2),Mhh2),dp) 
coupL1 = cplcUChiChihhL(gO1,i2)
coupR1 = cplcUChiChihhR(gO1,i2)
coupL2 =  Conjg(cplcUChiChihhL(gO2,i2))
coupR2 =  Conjg(cplcUChiChihhR(gO2,i2))
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
! VP, Chi 
!------------------------ 
      Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = - Real(B1(p2,MChi2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(B0(p2,MChi2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUChiChiVPL(gO1,i2)
coupR1 = cplcUChiChiVPR(gO1,i2)
coupL2 =  Conjg(cplcUChiChiVPL(gO2,i2))
coupR2 =  Conjg(cplcUChiChiVPR(gO2,i2))
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
! VZ, Chi 
!------------------------ 
      Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = - Real(B1(p2,MChi2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MChi(i2)*Real(B0(p2,MChi2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChiChiVZL(gO1,i2)
coupR1 = cplcUChiChiVZR(gO1,i2)
coupL2 =  Conjg(cplcUChiChiVZL(gO2,i2))
coupR2 =  Conjg(cplcUChiChiVZR(gO2,i2))
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
! bar[Fe], etI 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MetI2),dp) 
coupL1 = cplcUChicFeetIL(gO1,i1)
coupR1 = cplcUChicFeetIR(gO1,i1)
coupL2 =  Conjg(cplcUChicFeetIL(gO2,i1))
coupR2 =  Conjg(cplcUChicFeetIR(gO2,i1))
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
! XP, Fv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MFv2(i2),MXP2(i1)),dp) 
B0m2 = MFv(i2)*Real(B0(p2,MFv2(i2),MXP2(i1)),dp) 
coupL1 = cplcUChiFvXPL(gO1,i2,i1)
coupR1 = cplcUChiFvXPR(gO1,i2,i1)
coupL2 =  Conjg(cplcUChiFvXPL(gO2,i2,i1))
coupR2 =  Conjg(cplcUChiFvXPR(gO2,i2,i1))
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
! Nv, Hp 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MNv2(i1),MHp2),dp) 
B0m2 = MNv(i1)*Real(B0(p2,MNv2(i1),MHp2),dp) 
coupL1 = cplcUChiNvHpL(gO1,i1)
coupR1 = cplcUChiNvHpR(gO1,i1)
coupL2 =  Conjg(cplcUChiNvHpL(gO2,i1))
coupR2 =  Conjg(cplcUChiNvHpR(gO2,i1))
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
! VWp, Nv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = - Real(B1(p2,MNv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MNv(i2)*Real(B0(p2,MNv2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUChiNvVWpL(gO1,i2)
coupR1 = cplcUChiNvVWpR(gO1,i2)
coupL2 =  Conjg(cplcUChiNvVWpL(gO2,i2))
coupR2 =  Conjg(cplcUChiNvVWpR(gO2,i2))
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
! bar[Fe], XO 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 2
  Do gO2 = 1, 2
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MXO2(i2)),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MXO2(i2)),dp) 
coupL1 = cplcUChicFeXOL(gO1,i1,i2)
coupR1 = cplcUChicFeXOR(gO1,i1,i2)
coupL2 =  Conjg(cplcUChicFeXOL(gO2,i1,i2))
coupR2 =  Conjg(cplcUChicFeXOR(gO2,i1,i2))
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
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopChi 
 
Subroutine OneLoopXP(mEt2,lam3,mu3,lam7,mu,v,MXP,MXP2,MAh,MAh2,MFv,MFv2,              & 
& MChi,MChi2,MHp,MHp2,MetI,MetI2,MVWp,MVWp2,Mhh,Mhh2,MXO,MXO2,MFe,MFe2,MNv,              & 
& MNv2,MVZ,MVZ2,cplAhXPcUXP,cplFvChicUXPL,cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,      & 
& cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,          & 
& cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,cplhhhhUXPcUXP,cplHpUXPcHpcUXP,            & 
& cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,cplXOXOUXPcUXP,cplUXPXPcUXPcXP,        & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MXP(2),MXP2(2),MAh,MAh2,MFv(3),MFv2(3),MChi(2),MChi2(2),MHp,MHp2,MetI,MetI2,          & 
& MVWp,MVWp2,Mhh,Mhh2,MXO(2),MXO2(2),MFe(3),MFe2(3),MNv(3),MNv2(3),MVZ,MVZ2

Real(dp), Intent(in) :: mEt2,lam3,mu3,lam7,mu,v

Complex(dp), Intent(in) :: cplAhXPcUXP(2,2),cplFvChicUXPL(3,2,2),cplFvChicUXPR(3,2,2),cpletIHpcUXP(2),           & 
& cpletIcUXPVWp(2),cplhhXPcUXP(2,2),cplHpXOcUXP(2,2),cplcFeNvcUXPL(3,3,2),               & 
& cplcFeNvcUXPR(3,3,2),cplXPcUXPVP(2,2),cplXOcUXPVWp(2,2),cplXPcUXPVZ(2,2),              & 
& cplAhAhUXPcUXP(2,2),cpletIetIUXPcUXP(2,2),cplhhhhUXPcUXP(2,2),cplHpUXPcHpcUXP(2,2),    & 
& cplUXPcUXPVPVP(2,2),cplUXPcUXPcVWpVWp(2,2),cplUXPcUXPVZVZ(2,2),cplXOXOUXPcUXP(2,2,2,2),& 
& cplUXPXPcUXPcXP(2,2,2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopXP'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mEt2
mat2a(1,1) = mat2a(1,1)+(lam3*v**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(mu*v)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mu3
mat2a(2,2) = mat2a(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MXP2(i1)
Call Pi1LoopXP(p2,MXP,MXP2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MHp,MHp2,MetI,MetI2,          & 
& MVWp,MVWp2,Mhh,Mhh2,MXO,MXO2,MFe,MFe2,MNv,MNv2,MVZ,MVZ2,cplAhXPcUXP,cplFvChicUXPL,     & 
& cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,        & 
& cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,    & 
& cplhhhhUXPcUXP,cplHpUXPcHpcUXP,cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,        & 
& cplXOXOUXPcUXP,cplUXPXPcUXPcXP,kont,PiSf(i1,:,:))

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
Call Pi1LoopXP(p2,MXP,MXP2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MHp,MHp2,MetI,MetI2,          & 
& MVWp,MVWp2,Mhh,Mhh2,MXO,MXO2,MFe,MFe2,MNv,MNv2,MVZ,MVZ2,cplAhXPcUXP,cplFvChicUXPL,     & 
& cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,        & 
& cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,    & 
& cplhhhhUXPcUXP,cplHpUXPcHpcUXP,cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,        & 
& cplXOXOUXPcUXP,cplUXPXPcUXPcXP,kont,PiSf(i1,:,:))

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
End Subroutine OneLoopXP
 
 
Subroutine Pi1LoopXP(p2,MXP,MXP2,MAh,MAh2,MFv,MFv2,MChi,MChi2,MHp,MHp2,               & 
& MetI,MetI2,MVWp,MVWp2,Mhh,Mhh2,MXO,MXO2,MFe,MFe2,MNv,MNv2,MVZ,MVZ2,cplAhXPcUXP,        & 
& cplFvChicUXPL,cplFvChicUXPR,cpletIHpcUXP,cpletIcUXPVWp,cplhhXPcUXP,cplHpXOcUXP,        & 
& cplcFeNvcUXPL,cplcFeNvcUXPR,cplXPcUXPVP,cplXOcUXPVWp,cplXPcUXPVZ,cplAhAhUXPcUXP,       & 
& cpletIetIUXPcUXP,cplhhhhUXPcUXP,cplHpUXPcHpcUXP,cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,      & 
& cplUXPcUXPVZVZ,cplXOXOUXPcUXP,cplUXPXPcUXPcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: MXP(2),MXP2(2),MAh,MAh2,MFv(3),MFv2(3),MChi(2),MChi2(2),MHp,MHp2,MetI,MetI2,          & 
& MVWp,MVWp2,Mhh,Mhh2,MXO(2),MXO2(2),MFe(3),MFe2(3),MNv(3),MNv2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhXPcUXP(2,2),cplFvChicUXPL(3,2,2),cplFvChicUXPR(3,2,2),cpletIHpcUXP(2),           & 
& cpletIcUXPVWp(2),cplhhXPcUXP(2,2),cplHpXOcUXP(2,2),cplcFeNvcUXPL(3,3,2),               & 
& cplcFeNvcUXPR(3,3,2),cplXPcUXPVP(2,2),cplXOcUXPVWp(2,2),cplXPcUXPVZ(2,2),              & 
& cplAhAhUXPcUXP(2,2),cpletIetIUXPcUXP(2,2),cplhhhhUXPcUXP(2,2),cplHpUXPcHpcUXP(2,2),    & 
& cplUXPcUXPVPVP(2,2),cplUXPcUXPcVWpVWp(2,2),cplUXPcUXPVZVZ(2,2),cplXOXOUXPcUXP(2,2,2,2),& 
& cplUXPXPcUXPcXP(2,2,2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! XP, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhXPcUXP(i1,gO1)
coup2 = Conjg(cplAhXPcUXP(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Fv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MFv2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFv(i1)*MChi(i2)*B0(p2,MFv2(i1),MChi2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvChicUXPL(i1,i2,gO1)
coupR1 = cplFvChicUXPR(i1,i2,gO1)
coupL2 =  Conjg(cplFvChicUXPL(i1,i2,gO2))
coupR2 =  Conjg(cplFvChicUXPR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hp, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIHpcUXP(gO1)
coup2 = Conjg(cpletIHpcUXP(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VWp, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIcUXPVWp(gO1)
coup2 =  Conjg(cpletIcUXPVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! XP, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXP2(i1),Mhh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhXPcUXP(i1,gO1)
coup2 = Conjg(cplhhXPcUXP(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! XO, Hp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXO2(i1),MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpXOcUXP(i1,gO1)
coup2 = Conjg(cplHpXOcUXP(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fe], Nv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MNv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MNv(i2)*B0(p2,MFe2(i1),MNv2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeNvcUXPL(i1,i2,gO1)
coupR1 = cplcFeNvcUXPR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeNvcUXPL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeNvcUXPR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XP, VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXP2(i1),0._dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplXPcUXPVP(i1,gO1)
coup2 =  Conjg(cplXPcUXPVP(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! XO, VWp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXO2(i1),MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplXOcUXPVWp(i1,gO1)
coup2 =  Conjg(cplXOcUXPVWp(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! XP, VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXP2(i1),MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplXPcUXPVZ(i1,gO1)
coup2 =  Conjg(cplXPcUXPVZ(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUXPcUXP(gO2,gO1)
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
coup1 = cpletIetIUXPcUXP(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUXPcUXP(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpUXPcHpcUXP(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUXPcUXPcVWpVWp(gO2,gO1)
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
coup1 = cplUXPcUXPVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplXOXOUXPcUXP(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUXPXPcUXPcXP(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopXP 
 
Subroutine OneLoopXO(mEt2,lam3,lam4,mu3,lam7,mu,lam5,v,MetI,MetI2,MAh,MAh2,           & 
& MFe,MFe2,MChi,MChi2,MVZ,MVZ2,MNv,MNv2,MFv,MFv2,MXO,MXO2,Mhh,Mhh2,MXP,MXP2,             & 
& MHp,MHp2,MVWp,MVWp2,cplAhetIUXO,cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,     & 
& cplFvNvUXOR,cplhhUXOXO,cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,         & 
& cplhhhhUXOUXO,cplHpUXOUXOcHp,cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,             & 
& cplUXOUXOXPcXP,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MetI,MetI2,MAh,MAh2,MFe(3),MFe2(3),MChi(2),MChi2(2),MVZ,MVZ2,MNv(3),MNv2(3),          & 
& MFv(3),MFv2(3),MXO(2),MXO2(2),Mhh,Mhh2,MXP(2),MXP2(2),MHp,MHp2,MVWp,MVWp2

Real(dp), Intent(in) :: mEt2,lam3,lam4,mu3,lam7,mu,lam5,v

Complex(dp), Intent(in) :: cplAhetIUXO(2),cplChiFeUXOL(2,3,2),cplChiFeUXOR(2,3,2),cpletIUXOVZ(2),cplFvNvUXOL(3,3,2),& 
& cplFvNvUXOR(3,3,2),cplhhUXOXO(2,2),cplHpUXOcXP(2,2),cplUXOcXPVWp(2,2),cplAhAhUXOUXO(2,2),& 
& cpletIetIUXOUXO(2,2),cplhhhhUXOUXO(2,2),cplHpUXOUXOcHp(2,2),cplUXOUXOcVWpVWp(2,2),     & 
& cplUXOUXOVZVZ(2,2),cplUXOUXOXOXO(2,2,2,2),cplUXOUXOXPcXP(2,2,2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopXO'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mEt2
mat2a(1,1) = mat2a(1,1)+(lam3*v**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam4*v**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam5*v**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-(mu*v)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mu3
mat2a(2,2) = mat2a(2,2)+(lam7*v**2)/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = MXO2(i1)
Call Pi1LoopXO(p2,MetI,MetI2,MAh,MAh2,MFe,MFe2,MChi,MChi2,MVZ,MVZ2,MNv,               & 
& MNv2,MFv,MFv2,MXO,MXO2,Mhh,Mhh2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,cplAhetIUXO,              & 
& cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,cplFvNvUXOR,cplhhUXOXO,              & 
& cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,cplhhhhUXOUXO,cplHpUXOUXOcHp,   & 
& cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,cplUXOUXOXPcXP,kont,PiSf(i1,:,:))

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
Call Pi1LoopXO(p2,MetI,MetI2,MAh,MAh2,MFe,MFe2,MChi,MChi2,MVZ,MVZ2,MNv,               & 
& MNv2,MFv,MFv2,MXO,MXO2,Mhh,Mhh2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,cplAhetIUXO,              & 
& cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,cplFvNvUXOR,cplhhUXOXO,              & 
& cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,cplhhhhUXOUXO,cplHpUXOUXOcHp,   & 
& cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,cplUXOUXOXPcXP,kont,PiSf(i1,:,:))

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
End Subroutine OneLoopXO
 
 
Subroutine Pi1LoopXO(p2,MetI,MetI2,MAh,MAh2,MFe,MFe2,MChi,MChi2,MVZ,MVZ2,             & 
& MNv,MNv2,MFv,MFv2,MXO,MXO2,Mhh,Mhh2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,cplAhetIUXO,          & 
& cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,cplFvNvUXOR,cplhhUXOXO,              & 
& cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,cplhhhhUXOUXO,cplHpUXOUXOcHp,   & 
& cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,cplUXOUXOXPcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: MetI,MetI2,MAh,MAh2,MFe(3),MFe2(3),MChi(2),MChi2(2),MVZ,MVZ2,MNv(3),MNv2(3),          & 
& MFv(3),MFv2(3),MXO(2),MXO2(2),Mhh,Mhh2,MXP(2),MXP2(2),MHp,MHp2,MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhetIUXO(2),cplChiFeUXOL(2,3,2),cplChiFeUXOR(2,3,2),cpletIUXOVZ(2),cplFvNvUXOL(3,3,2),& 
& cplFvNvUXOR(3,3,2),cplhhUXOXO(2,2),cplHpUXOcXP(2,2),cplUXOcXPVWp(2,2),cplAhAhUXOUXO(2,2),& 
& cpletIetIUXOUXO(2,2),cplhhhhUXOUXO(2,2),cplHpUXOUXOcHp(2,2),cplUXOUXOcVWpVWp(2,2),     & 
& cplUXOUXOVZVZ(2,2),cplUXOUXOXOXO(2,2,2,2),cplUXOUXOXPcXP(2,2,2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhetIUXO(gO1)
coup2 = Conjg(cplAhetIUXO(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MFe2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*B0(p2,MFe2(i1),MChi2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplChiFeUXOL(i2,i1,gO1)
coupR1 = cplChiFeUXOR(i2,i1,gO1)
coupL2 =  Conjg(cplChiFeUXOL(i2,i1,gO2))
coupR2 =  Conjg(cplChiFeUXOR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUXOVZ(gO1)
coup2 =  Conjg(cpletIUXOVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Nv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MNv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MNv(i1)*MFv(i2)*B0(p2,MNv2(i1),MFv2(i2)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplFvNvUXOL(i2,i1,gO1)
coupR1 = cplFvNvUXOR(i2,i1,gO1)
coupL2 =  Conjg(cplFvNvUXOL(i2,i1,gO2))
coupR2 =  Conjg(cplFvNvUXOR(i2,i1,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XO, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXO2(i1),Mhh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhUXOXO(gO1,i1)
coup2 = Conjg(cplhhUXOXO(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], Hp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpUXOcXP(gO1,i1)
coup2 = Conjg(cplHpUXOcXP(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], VWp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXP2(i1),MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUXOcXPVWp(gO1,i1)
coup2 =  Conjg(cplUXOcXPVWp(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
      End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUXOUXO(gO1,gO2)
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
coup1 = cpletIetIUXOUXO(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplhhhhUXOUXO(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplHpUXOUXOcHp(gO1,gO2)
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
coup1 = cplUXOUXOcVWpVWp(gO1,gO2)
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
coup1 = cplUXOUXOVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUXOUXOXOXO(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUXOUXOXPcXP(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 

Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopXO 
 
Subroutine OneLoopFd(Yd,v,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,               & 
& MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,               & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,delta,MFd_1L,MFd2_1L,        & 
& ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu(3),MFu2(3),MVWp,MVWp2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3)

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
mat1a(1,1) = mat1a(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,MFu2,           & 
& MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,           & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

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
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu,MFu2,           & 
& MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,           & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

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
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,              & 
& MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,               & 
& cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,         & 
& cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MHp,MHp2,MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3)

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
! hh, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),Mhh2),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),Mhh2),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2)
coupR1 = cplcUFdFdhhR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2))
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
! conj[VWp], Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFucVWpL(gO1,i2)
coupR1 = cplcUFdFucVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFucVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFucVWpR(gO2,i2))
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
 
Subroutine OneLoopFu(Yu,v,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,             & 
& Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,   & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MHp,MHp2,MFd(3),MFd2(3),MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),              & 
& cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),             & 
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
mat1a(1,1) = mat1a(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,       & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

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
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,Mhh,              & 
& Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,       & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

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
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHp,MHp2,MFd,MFd2,MVWp,MVWp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,   & 
& cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,        & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MHp,MHp2,MFd(3),MFd2(3),MVWp,MVWp2,Mhh,Mhh2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),              & 
& cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),             & 
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
! VWp, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdVWpL(gO1,i2)
coupR1 = cplcUFuFdVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdVWpR(gO2,i2))
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
! hh, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Mhh2),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Mhh2),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2)
coupR1 = cplcUFuFuhhR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2))
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
 
Subroutine OneLoopFe(Ye,v,MFe,MFe2,MAh,MAh2,MChi,MChi2,MetI,MetI2,Mhh,Mhh2,           & 
& MVZ,MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,MXP,MXP2,MNv,MNv2,MXO,MXO2,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,              & 
& delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHp,            & 
& MHp2,MFv(3),MFv2(3),MVWp,MVWp2,MXP(2),MXP2(2),MNv(3),MNv2(3),MXO(2),MXO2(2)

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcChicUFeetIL(2,3),cplcChicUFeetIR(2,3),        & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),               & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),             & 
& cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFeNvcXPL(3,3,2),cplcUFeNvcXPR(3,3,2),     & 
& cplcChicUFeXOL(2,3,2),cplcChicUFeXOR(2,3,2)

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
mat1a(1,1) = mat1a(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MChi,MChi2,MetI,MetI2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,MXP,MXP2,MNv,MNv2,MXO,MXO2,cplcUFeFeAhL,             & 
& cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,              & 
& sigL,sigR,sigS)

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
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MChi,MChi2,MetI,MetI2,Mhh,Mhh2,MVZ,            & 
& MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,MXP,MXP2,MNv,MNv2,MXO,MXO2,cplcUFeFeAhL,             & 
& cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,              & 
& sigL,sigR,sigS)

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
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MChi,MChi2,MetI,MetI2,Mhh,               & 
& Mhh2,MVZ,MVZ2,MHp,MHp2,MFv,MFv2,MVWp,MVWp2,MXP,MXP2,MNv,MNv2,MXO,MXO2,cplcUFeFeAhL,    & 
& cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,              & 
& sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHp,            & 
& MHp2,MFv(3),MFv2(3),MVWp,MVWp2,MXP(2),MXP2(2),MNv(3),MNv2(3),MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcChicUFeetIL(2,3),cplcChicUFeetIR(2,3),        & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),               & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),             & 
& cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFeNvcXPL(3,3,2),cplcUFeNvcXPR(3,3,2),     & 
& cplcChicUFeXOL(2,3,2),cplcChicUFeXOR(2,3,2)

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
! bar[Chi], etI 
!------------------------ 
    Do i1 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MChi2(i1),MetI2),dp) 
B0m2 = MChi(i1)*Real(B0(p2,MChi2(i1),MetI2),dp) 
coupL1 = cplcChicUFeetIL(i1,gO1)
coupR1 = cplcChicUFeetIR(i1,gO1)
coupL2 =  Conjg(cplcChicUFeetIL(i1,gO2))
coupR2 =  Conjg(cplcChicUFeetIR(i1,gO2))
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
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i2),Mhh2),dp) 
B0m2 = MFe(i2)*Real(B0(p2,MFe2(i2),Mhh2),dp) 
coupL1 = cplcUFeFehhL(gO1,i2)
coupR1 = cplcUFeFehhR(gO1,i2)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2))
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
! conj[Hp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFv2(i2),MHp2),dp) 
B0m2 = MFv(i2)*Real(B0(p2,MFv2(i2),MHp2),dp) 
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
! conj[VWp], Fv 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvcVWpL(gO1,i2)
coupR1 = cplcUFeFvcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWpR(gO2,i2))
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
! conj[XP], Nv 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MNv2(i2),MXP2(i1)),dp) 
B0m2 = MNv(i2)*Real(B0(p2,MNv2(i2),MXP2(i1)),dp) 
coupL1 = cplcUFeNvcXPL(gO1,i2,i1)
coupR1 = cplcUFeNvcXPR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeNvcXPL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeNvcXPR(gO2,i2,i1))
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
! bar[Chi], XO 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 2
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MChi2(i1),MXO2(i2)),dp) 
B0m2 = MChi(i1)*Real(B0(p2,MChi2(i1),MXO2(i2)),dp) 
coupL1 = cplcChicUFeXOL(i1,gO1,i2)
coupR1 = cplcChicUFeXOR(i1,gO1,i2)
coupL2 =  Conjg(cplcChicUFeXOL(i1,gO2,i2))
coupR2 =  Conjg(cplcChicUFeXOR(i1,gO2,i2))
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
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopHp(g2,mH2,lam1,v,MVWp,MVWp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,           & 
& MXP,MXP2,MetI,MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,             & 
& MVZ,MVZ2,MXO,MXO2,cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,      & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,          & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplXOXPcHp,cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,        & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,MNv(3),MNv2(3),MChi(2),MChi2(2),MXP(2),MXP2(2),MetI,              & 
& MetI2,MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),MHp,MHp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MXO(2),MXO2(2)

Real(dp), Intent(in) :: g2,mH2,lam1,v

Complex(dp), Intent(in) :: cplAhcHpVWp,cplNvChicHpL(3,2),cplNvChicHpR(3,2),cpletIXPcHp(2),cplcFdFucHpL(3,3),     & 
& cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,        & 
& cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,     & 
& cplcHpVWpVZ,cplXOXPcHp(2,2),cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,    & 
& cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHp'
 
mi2 = -1._dp*(mH2) + (lam1*v**2)/2._dp + (g2**2*v**2*RXiWp)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,MetI,              & 
& MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MXO,              & 
& MXO2,cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,cplcFdFucHpR,      & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,           & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplXOXPcHp,       & 
& cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,MetI,              & 
& MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,MXO,              & 
& MXO2,cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,cplcFdFucHpR,      & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,           & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplXOXPcHp,       & 
& cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,kont,PiSf)

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
 
 
Subroutine Pi1LoopHp(p2,MVWp,MVWp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,             & 
& MetI,MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,MHp,MHp2,Mhh,Mhh2,MVZ,MVZ2,             & 
& MXO,MXO2,cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,               & 
& cplcFdFucHpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,          & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplXOXPcHp,cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,        & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,MNv(3),MNv2(3),MChi(2),MChi2(2),MXP(2),MXP2(2),MetI,              & 
& MetI2,MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),MHp,MHp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplAhcHpVWp,cplNvChicHpL(3,2),cplNvChicHpR(3,2),cpletIXPcHp(2),cplcFdFucHpL(3,3),     & 
& cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,        & 
& cplcgWCgZcHp,cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,     & 
& cplcHpVWpVZ,cplXOXPcHp(2,2),cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,    & 
& cplHpcHpVPVP,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! VWp, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVWp2) 
coup1 = cplAhcHpVWp
coup2 =  Conjg(cplAhcHpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Nv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MNv2(i1),MChi2(i2)) 
B0m2 = -2._dp*MNv(i1)*MChi(i2)*B0(p2,MNv2(i1),MChi2(i2)) 
coupL1 = cplNvChicHpL(i1,i2)
coupR1 = cplNvChicHpR(i1,i2)
coupL2 =  Conjg(cplNvChicHpL(i1,i2))
coupR2 =  Conjg(cplNvChicHpR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XP, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MetI2) 
coup1 = cpletIXPcHp(i1)
coup2 = Conjg(cpletIXPcHp(i1))
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
 G0m2 = Gloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
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
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgWpcHp
coup2 =  cplcgWpgZHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgZcHp
coup2 =  cplcgZgWCHp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,Mhh2) 
coup1 = cplhhHpcHp
coup2 = Conjg(cplhhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Mhh2,MVWp2) 
coup1 = cplhhcHpVWp
coup2 =  Conjg(cplhhcHpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
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
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWp2) 
coup1 = cplcHpVPVWp
coup2 =  Conjg(cplcHpVPVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWp2,MVZ2) 
coup1 = cplcHpVWpVZ
coup2 =  Conjg(cplcHpVWpVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! XP, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MXO2(i2)) 
coup1 = cplXOXPcHp(i2,i1)
coup2 = Conjg(cplXOXPcHp(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
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
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplhhhhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
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
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
coup1 = cplHpXOXOcHp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
coup1 = cplHpXPcHpcXP(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 

res = oo16pi2*res 
 
End Subroutine Pi1LoopHp 
 
Subroutine OneLoopAh(g1,g2,mH2,lam1,v,TW,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,            & 
& MXO2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,               & 
& MNv,MNv2,MXP,MXP2,cplAhAhhh,cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,        & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,         & 
& cplAhAhXPcXP,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MChi(2),MChi2(2),MXO(2),MXO2(2),MetI,MetI2,MFd(3),MFd2(3),          & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv(3),MNv2(3),             & 
& MXP(2),MXP2(2)

Real(dp), Intent(in) :: g1,g2,mH2,lam1,v,TW

Complex(dp), Intent(in) :: cplAhAhhh,cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplAhetIXO(2),cplcFdFdAhL(3,3),       & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL(3,3),cplNvNvAhR(3,3),       & 
& cplAhXPcXP(2,2),cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,     & 
& cplAhAhVZVZ,cplAhAhXOXO(2,2),cplAhAhXPcXP(2,2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mi2 = (-4._dp*(mH2) + 2*lam1*v**2 + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv,MNv2,MXP,MXP2,cplAhAhhh,       & 
& cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,               & 
& cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,    & 
& cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,cplAhAhXPcXP,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv,MNv2,MXP,MXP2,cplAhAhhh,       & 
& cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,            & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,               & 
& cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,    & 
& cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,cplAhAhXPcXP,kont,PiSf)

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
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv,MNv2,MXP,MXP2,             & 
& cplAhAhhh,cplcChiChiAhL,cplcChiChiAhR,cplAhetIXO,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,cplAhAhAhAh,cplAhAhetIetI,      & 
& cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,cplAhAhXPcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MChi(2),MChi2(2),MXO(2),MXO2(2),MetI,MetI2,MFd(3),MFd2(3),          & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MVZ,MVZ2,MVWp,MVWp2,MHp,MHp2,MNv(3),MNv2(3),             & 
& MXP(2),MXP2(2)

Complex(dp), Intent(in) :: cplAhAhhh,cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplAhetIXO(2),cplcFdFdAhL(3,3),       & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL(3,3),cplNvNvAhR(3,3),       & 
& cplAhXPcXP(2,2),cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhcVWpVWp,     & 
& cplAhAhVZVZ,cplAhAhXOXO(2,2),cplAhAhXPcXP(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,MAh2) 
coup1 = cplAhAhhh
coup2 = Conjg(cplAhAhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Chi], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MChi2(i1),MChi2(i2)) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*B0(p2,MChi2(i1),MChi2(i2)) 
coupL1 = cplcChiChiAhL(i1,i2)
coupR1 = cplcChiChiAhR(i1,i2)
coupL2 =  Conjg(cplcChiChiAhL(i1,i2))
coupR2 =  Conjg(cplcChiChiAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XO, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXO2(i1),MetI2) 
coup1 = cplAhetIXO(i1)
coup2 = Conjg(cplAhetIXO(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
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
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,Mhh2,MVZ2) 
coup1 = cplAhhhVZ
coup2 =  Conjg(cplAhhhVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
coup1 = cplAhHpcVWp
coup2 =  Conjg(cplAhHpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! Nv, Nv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MNv2(i1),MNv2(i2)) 
B0m2 = -2._dp*MNv(i1)*MNv(i2)*B0(p2,MNv2(i1),MNv2(i2)) 
coupL1 = cplNvNvAhL(i1,i2)
coupR1 = cplNvNvAhR(i1,i2)
coupL2 =  Conjg(cplNvNvAhL(i1,i2))
coupR2 =  Conjg(cplNvNvAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MXP2(i2)) 
coup1 = cplAhXPcXP(i2,i1)
coup2 = Conjg(cplAhXPcXP(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
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
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplAhAhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
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
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
coup1 = cplAhAhXOXO(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
coup1 = cplAhAhXPcXP(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 

res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoophh(mH2,lam1,v,MAh,MAh2,MVZ,MVZ2,MChi,MChi2,MetI,MetI2,              & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXO,MXO2,             & 
& MXP,MXP2,cplAhAhhh,cplAhhhVZ,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO,cplhhXPcXP,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,     & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,cplhhhhXPcXP,delta,mass,           & 
& mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MVZ,MVZ2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv(3),MNv2(3),MXO(2),MXO2(2),             & 
& MXP(2),MXP2(2)

Real(dp), Intent(in) :: mH2,lam1,v

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcChiChihhL(2,2),cplcChiChihhR(2,2),cpletIetIhh,cplcFdFdhhL(3,3),& 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL(3,3), & 
& cplNvNvhhR(3,3),cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcXP(2,2),cplAhAhhhhh,     & 
& cpletIetIhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO(2,2),    & 
& cplhhhhXPcXP(2,2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mi2 = -1._dp*(mH2) + (3*lam1*v**2)/2._dp 

 
p2 = Mhh2
PiSf = ZeroC 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXO,MXO2,MXP,MXP2,cplAhAhhh,       & 
& cplAhhhVZ,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhXOXO,cplhhXPcXP,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,cplhhhhHpcHp,     & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,cplhhhhXPcXP,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MChi,MChi2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXO,MXO2,MXP,MXP2,cplAhAhhh,       & 
& cplAhhhVZ,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,        & 
& cplhhVZVZ,cplhhXOXO,cplhhXPcXP,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,cplhhhhHpcHp,     & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,cplhhhhXPcXP,kont,PiSf)

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
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MChi,MChi2,MetI,MetI2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXO,MXO2,MXP,MXP2,             & 
& cplAhAhhh,cplAhhhVZ,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,        & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO,cplhhXPcXP,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,     & 
& cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,cplhhhhXPcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MVZ,MVZ2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),          & 
& MFu(3),MFu2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MNv(3),MNv2(3),MXO(2),MXO2(2),             & 
& MXP(2),MXP2(2)

Complex(dp), Intent(in) :: cplAhAhhh,cplAhhhVZ,cplcChiChihhL(2,2),cplcChiChihhR(2,2),cpletIetIhh,cplcFdFdhhL(3,3),& 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcHp,cplhhHpcVWp,cplNvNvhhL(3,3), & 
& cplNvNvhhR(3,3),cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcXP(2,2),cplAhAhhhhh,     & 
& cpletIetIhhhh,cplhhhhhhhh,cplhhhhHpcHp,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO(2,2),    & 
& cplhhhhXPcXP(2,2)

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
coup1 = cplAhAhhh
coup2 = Conjg(cplAhAhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVZ2) 
coup1 = cplAhhhVZ
coup2 =  Conjg(cplAhhhVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Chi], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MChi2(i1),MChi2(i2)) 
B0m2 = -2._dp*MChi(i1)*MChi(i2)*B0(p2,MChi2(i1),MChi2(i2)) 
coupL1 = cplcChiChihhL(i1,i2)
coupR1 = cplcChiChihhR(i1,i2)
coupL2 =  Conjg(cplcChiChihhL(i1,i2))
coupR2 =  Conjg(cplcChiChihhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MetI2,MetI2) 
coup1 = cpletIetIhh
coup2 = Conjg(cpletIetIhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdhhL(i1,i2)
coupR1 = cplcFdFdhhR(i1,i2)
coupL2 =  Conjg(cplcFdFdhhL(i1,i2))
coupR2 =  Conjg(cplcFdFdhhR(i1,i2))
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
coupL1 = cplcFeFehhL(i1,i2)
coupR1 = cplcFeFehhR(i1,i2)
coupL2 =  Conjg(cplcFeFehhL(i1,i2))
coupR2 =  Conjg(cplcFeFehhR(i1,i2))
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
coupL1 = cplcFuFuhhL(i1,i2)
coupR1 = cplcFuFuhhR(i1,i2)
coupL2 =  Conjg(cplcFuFuhhL(i1,i2))
coupR2 =  Conjg(cplcFuFuhhR(i1,i2))
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
 coup1 = cplcgWpgWphh
coup2 =  cplcgWpgWphh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWChh
coup2 =  cplcgWCgWChh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 coup1 = cplcgZgZhh
coup2 =  cplcgZgZhh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,Mhh2) 
coup1 = cplhhhhhh
coup2 = Conjg(cplhhhhhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MHp2,MHp2) 
coup1 = cplhhHpcHp
coup2 = Conjg(cplhhHpcHp)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MHp2,MVWp2) 
coup1 = cplhhHpcVWp
coup2 =  Conjg(cplhhHpcVWp)
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
!------------------------ 
! Nv, Nv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MNv2(i1),MNv2(i2)) 
B0m2 = -2._dp*MNv(i1)*MNv(i2)*B0(p2,MNv2(i1),MNv2(i2)) 
coupL1 = cplNvNvhhL(i1,i2)
coupR1 = cplNvNvhhR(i1,i2)
coupL2 =  Conjg(cplNvNvhhL(i1,i2))
coupR2 =  Conjg(cplNvNvhhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWp2,MVWp2) 
coup1 = cplhhcVWpVWp
coup2 =  Conjg(cplhhcVWpVWp)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZ2) 
coup1 = cplhhVZVZ
coup2 =  Conjg(cplhhVZVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,MXO2(i1),MXO2(i2)) 
coup1 = cplhhXOXO(i1,i2)
coup2 = Conjg(cplhhXOXO(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MXP2(i2)) 
coup1 = cplhhXPcXP(i2,i1)
coup2 = Conjg(cplhhXPcXP(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MAh2) 
coup1 = cplAhAhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MetI2) 
coup1 = cpletIetIhhhh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cplhhhhhhhh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MHp2) 
coup1 = cplhhhhHpcHp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWp2) + 0.25_dp*RXi*A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cplhhhhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplhhhhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
coup1 = cplhhhhXOXO(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
coup1 = cplhhhhXPcXP(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 

res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopetI(mEt2,lam3,lam4,lam5,v,MXO,MXO2,MAh,MAh2,MFe,MFe2,               & 
& MChi,MChi2,Mhh,Mhh2,MetI,MetI2,MNv,MNv2,MFv,MFv2,MXP,MXP2,MHp,MHp2,MVWp,               & 
& MVWp2,MVZ,MVZ2,cplAhetIXO,cplChiFeetIL,cplChiFeetIR,cpletIetIhh,cplFvNvetIL,           & 
& cplFvNvetIR,cpletIHpcXP,cpletIcXPVWp,cpletIXOVZ,cplAhAhetIetI,cpletIetIetIetI,         & 
& cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,             & 
& cpletIetIXPcXP,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MXO(2),MXO2(2),MAh,MAh2,MFe(3),MFe2(3),MChi(2),MChi2(2),Mhh,Mhh2,MetI,MetI2,          & 
& MNv(3),MNv2(3),MFv(3),MFv2(3),MXP(2),MXP2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Real(dp), Intent(in) :: mEt2,lam3,lam4,lam5,v

Complex(dp), Intent(in) :: cplAhetIXO(2),cplChiFeetIL(2,3),cplChiFeetIR(2,3),cpletIetIhh,cplFvNvetIL(3,3),       & 
& cplFvNvetIR(3,3),cpletIHpcXP(2),cpletIcXPVWp(2),cpletIXOVZ(2),cplAhAhetIetI,           & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,           & 
& cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetI'
 
mi2 = (2._dp*(mEt2) + (lam3 + lam4 - lam5)*v**2)/2._dp 

 
p2 = MetI2
PiSf = ZeroC 
Call Pi1LoopetI(p2,MXO,MXO2,MAh,MAh2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MetI,               & 
& MetI2,MNv,MNv2,MFv,MFv2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIXO,              & 
& cplChiFeetIL,cplChiFeetIR,cpletIetIhh,cplFvNvetIL,cplFvNvetIR,cpletIHpcXP,             & 
& cpletIcXPVWp,cpletIXOVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,cpletIetIXPcXP,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopetI(p2,MXO,MXO2,MAh,MAh2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,MetI,               & 
& MetI2,MNv,MNv2,MFv,MFv2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIXO,              & 
& cplChiFeetIL,cplChiFeetIR,cpletIetIhh,cplFvNvetIL,cplFvNvetIR,cpletIHpcXP,             & 
& cpletIcXPVWp,cpletIXOVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,cpletIetIXPcXP,kont,PiSf)

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
 
 
Subroutine Pi1LoopetI(p2,MXO,MXO2,MAh,MAh2,MFe,MFe2,MChi,MChi2,Mhh,Mhh2,              & 
& MetI,MetI2,MNv,MNv2,MFv,MFv2,MXP,MXP2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIXO,         & 
& cplChiFeetIL,cplChiFeetIR,cpletIetIhh,cplFvNvetIL,cplFvNvetIR,cpletIHpcXP,             & 
& cpletIcXPVWp,cpletIXOVZ,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetIXOXO,cpletIetIXPcXP,kont,res)

Implicit None 
Real(dp), Intent(in) :: MXO(2),MXO2(2),MAh,MAh2,MFe(3),MFe2(3),MChi(2),MChi2(2),Mhh,Mhh2,MetI,MetI2,          & 
& MNv(3),MNv2(3),MFv(3),MFv2(3),MXP(2),MXP2(2),MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhetIXO(2),cplChiFeetIL(2,3),cplChiFeetIR(2,3),cpletIetIhh,cplFvNvetIL(3,3),       & 
& cplFvNvetIR(3,3),cpletIHpcXP(2),cpletIcXPVWp(2),cpletIXOVZ(2),cplAhAhetIetI,           & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIcVWpVWp,cpletIetIVZVZ,           & 
& cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! XO, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXO2(i1),MAh2) 
coup1 = cplAhetIXO(i1)
coup2 = Conjg(cplAhetIXO(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Fe, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 G0m2 = Gloop(p2,MFe2(i1),MChi2(i2)) 
B0m2 = -2._dp*MFe(i1)*MChi(i2)*B0(p2,MFe2(i1),MChi2(i2)) 
coupL1 = cplChiFeetIL(i2,i1)
coupR1 = cplChiFeetIR(i2,i1)
coupL2 =  Conjg(cplChiFeetIL(i2,i1))
coupR2 =  Conjg(cplChiFeetIR(i2,i1))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,Mhh2,MetI2) 
coup1 = cpletIetIhh
coup2 = Conjg(cpletIetIhh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Nv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MNv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MNv(i1)*MFv(i2)*B0(p2,MNv2(i1),MFv2(i2)) 
coupL1 = cplFvNvetIL(i2,i1)
coupR1 = cplFvNvetIR(i2,i1)
coupL2 =  Conjg(cplFvNvetIL(i2,i1))
coupR2 =  Conjg(cplFvNvetIR(i2,i1))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[XP], Hp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = B0(p2,MXP2(i1),MHp2) 
coup1 = cpletIHpcXP(i1)
coup2 = Conjg(cpletIHpcXP(i1))
    SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], VWp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXP2(i1),MVWp2) 
coup1 = cpletIcXPVWp(i1)
coup2 =  Conjg(cpletIcXPVWp(i1))
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
      End Do 
 !------------------------ 
! XO, VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 F0m2 = FloopRXi(p2,MXO2(i1),MVZ2) 
coup1 = cpletIXOVZ(i1)
coup2 =  Conjg(cpletIXOVZ(i1))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
      End Do 
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
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(Mhh2) 
coup1 = cpletIetIhhhh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
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
!------------------------ 
! XO, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXO2(i1)) 
coup1 = cpletIetIXOXO(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = A0(MXP2(i1)) 
coup1 = cpletIetIXPcXP(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 

res = oo16pi2*res 
 
End Subroutine Pi1LoopetI 
 
Subroutine OneLoopVZ(g1,g2,v,TW,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,           & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,MNv,            & 
& MNv2,MXP,MXP2,cplAhhhVZ,cplcChiChiVZL,cplcChiChiVZR,cpletIXOVZ,cplcFdFdVZL,            & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWCgWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,      & 
& cplXPcXPVZ,cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,         & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MChi(2),MChi2(2),MXO(2),MXO2(2),MetI,MetI2,MFd(3),MFd2(3),          & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,             & 
& MNv(3),MNv2(3),MXP(2),MXP2(2)

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(in) :: cplAhhhVZ,cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cpletIXOVZ(2),cplcFdFdVZL(3,3),       & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWCgWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,         & 
& cplNvNvVZL(3,3),cplNvNvVZR(3,3),cplcVWpVWpVZ,cplXPcXPVZ(2,2),cplAhAhVZVZ,              & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& cplXOXOVZVZ(2,2),cplXPcXPVZVZ(2,2)

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
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXP,             & 
& MXP2,cplAhhhVZ,cplcChiChiVZL,cplcChiChiVZR,cpletIXOVZ,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,        & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,    & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,MFd,               & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,MXP,             & 
& MXP2,cplAhhhVZ,cplcChiChiVZL,cplcChiChiVZR,cpletIXOVZ,cplcFdFdVZL,cplcFdFdVZR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,        & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,    & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,kont,PiSf)

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
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MChi,MChi2,MXO,MXO2,MetI,MetI2,             & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,MNv,MNv2,             & 
& MXP,MXP2,cplAhhhVZ,cplcChiChiVZL,cplcChiChiVZR,cpletIXOVZ,cplcFdFdVZL,cplcFdFdVZR,     & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,        & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,    & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh,Mhh2,MAh,MAh2,MChi(2),MChi2(2),MXO(2),MXO2(2),MetI,MetI2,MFd(3),MFd2(3),          & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHp,MHp2,MVWp,MVWp2,             & 
& MNv(3),MNv2(3),MXP(2),MXP2(2)

Complex(dp), Intent(in) :: cplAhhhVZ,cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cpletIXOVZ(2),cplcFdFdVZL(3,3),       & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWCgWpVZ,cplhhVZVZ,cplHpcHpVZ,cplHpcVWpVZ,         & 
& cplNvNvVZL(3,3),cplNvNvVZR(3,3),cplcVWpVWpVZ,cplXPcXPVZ(2,2),cplAhAhVZVZ,              & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHpcHpVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& cplXOXOVZVZ(2,2),cplXPcXPVZVZ(2,2)

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
 
B22m2 = VSSloop(p2,MAh2,Mhh2)  
coup1 = cplAhhhVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Chi], Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 H0m2 = Hloop(p2,MChi2(i1),MChi2(i2)) 
B0m2 = 4._dp*MChi(i1)*MChi(i2)*B0(p2,MChi2(i1),MChi2(i2)) 
coupL1 = cplcChiChiVZL(i1,i2)
coupR1 = cplcChiChiVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XO, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = VSSloop(p2,MetI2,MXO2(i1))  
coup1 = cpletIXOVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
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
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWpC], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWp2,MVWp2)
coup1 = cplcgWCgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZ2,Mhh2) 
coup1 = cplhhVZVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hp], Hp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MHp2,MHp2)  
coup1 = cplHpcHpVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWp2,MHp2) 
coup1 = cplHpcVWpVZ
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! Nv, Nv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MNv2(i1),MNv2(i2)) 
B0m2 = 4._dp*MNv(i1)*MNv(i2)*B0(p2,MNv2(i1),MNv2(i2)) 
coupL1 = cplNvNvVZL(i1,i2)
coupR1 = cplNvNvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[XP], XP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = VSSloop(p2,MXP2(i2),MXP2(i1))  
coup1 = cplXPcXPVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
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
! hh 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Mhh2)
 coup1 = cplhhhhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
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
!------------------------ 
! XO 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MXO2(i1))
 coup1 = cplXOXOVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MXP2(i1))
 coup1 = cplXPcXPVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine OneLoopVWp(g2,v,MHp,MHp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,            & 
& MetI,MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO,MXO2,cplAhHpcVWp,cplNvChicVWpL,cplNvChicVWpR,cpletIXPcVWp,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,        & 
& cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp,cplXPcXPcVWpVWp,delta,mass,             & 
& mass2,kont)

Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,MNv(3),MNv2(3),MChi(2),MChi2(2),MXP(2),MXP2(2),MetI,MetI2,          & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh,Mhh2,MVWp,             & 
& MVWp2,MVZ,MVZ2,MXO(2),MXO2(2)

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(in) :: cplAhHpcVWp,cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),cpletIXPcVWp(2),cplcFdFucVWpL(3,3), & 
& cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhHpcVWp,cplhhcVWpVWp,     & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp(2,2),cplAhAhcVWpVWp,     & 
& cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,       & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp(2,2),cplXPcXPcVWpVWp(2,2)

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
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,MetI,               & 
& MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MXO,            & 
& MXO2,cplAhHpcVWp,cplNvChicVWpL,cplNvChicVWpR,cpletIXPcVWp,cplcFdFucVWpL,               & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,        & 
& cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp,cplXPcXPcVWpVWp,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,MetI,               & 
& MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,MXO,            & 
& MXO2,cplAhHpcVWp,cplNvChicVWpL,cplNvChicVWpR,cpletIXPcVWp,cplcFdFucVWpL,               & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,        & 
& cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp,cplXPcXPcVWpVWp,kont,PiSf)

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
 
 
Subroutine Pi1LoopVWp(p2,MHp,MHp2,MAh,MAh2,MNv,MNv2,MChi,MChi2,MXP,MXP2,              & 
& MetI,MetI2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO,MXO2,cplAhHpcVWp,cplNvChicVWpL,cplNvChicVWpR,cpletIXPcVWp,cplcFdFucVWpL,           & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplhhHpcVWp,cplhhcVWpVWp,cplHpcVWpVP,        & 
& cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp,cplAhAhcVWpVWp,cpletIetIcVWpVWp,     & 
& cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,        & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp,cplXPcXPcVWpVWp,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHp,MHp2,MAh,MAh2,MNv(3),MNv2(3),MChi(2),MChi2(2),MXP(2),MXP2(2),MetI,MetI2,          & 
& MFd(3),MFd2(3),MFu(3),MFu2(3),MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh,Mhh2,MVWp,             & 
& MVWp2,MVZ,MVZ2,MXO(2),MXO2(2)

Complex(dp), Intent(in) :: cplAhHpcVWp,cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),cpletIXPcVWp(2),cplcFdFucVWpL(3,3), & 
& cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplhhHpcVWp,cplhhcVWpVWp,     & 
& cplHpcVWpVP,cplHpcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplXOXPcVWp(2,2),cplAhAhcVWpVWp,     & 
& cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHpcHpcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,       & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOcVWpVWp(2,2),cplXPcXPcVWpVWp(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hp, Ah 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MAh2,MHp2)  
coup1 = cplAhHpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! Nv, Chi 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 H0m2 = Hloop(p2,MNv2(i1),MChi2(i2)) 
B0m2 = 4._dp*MNv(i1)*MChi(i2)*B0(p2,MNv2(i1),MChi2(i2)) 
coupL1 = cplNvChicVWpL(i1,i2)
coupR1 = cplNvChicVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! XP, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = VSSloop(p2,MetI2,MXP2(i1))  
coup1 = cpletIXPcVWp(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFu(i2)*B0(p2,MFd2(i1),MFu2(i2)) 
coupL1 = cplcFdFucVWpL(i1,i2)
coupR1 = cplcFdFucVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcVWpL(i1,i2)
coupR1 = cplcFeFvcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Hp, hh 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,Mhh2,MHp2)  
coup1 = cplhhHpcVWp
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWp2,Mhh2) 
coup1 = cplhhcVWpVWp
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,0._dp,MHp2) 
coup1 = cplHpcVWpVP
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, Hp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVZ2,MHp2) 
coup1 = cplHpcVWpVZ
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
! XP, XO 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B22m2 = VSSloop(p2,MXO2(i2),MXP2(i1))  
coup1 = cplXOXPcVWp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
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
! hh 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(Mhh2)
 coup1 = cplhhhhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
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
!------------------------ 
! XO 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MXO2(i1))
 coup1 = cplXOXOcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[XP] 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = A0(MXP2(i1))
 coup1 = cplXPcXPcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
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
End Module LoopMasses_radinertDTFDTSDM 
