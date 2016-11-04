! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:33 on 3.11.2016   
! ----------------------------------------------------------------------  
 
 
Module Couplings_radinertDTFDTSDM
 
Use Control 
Use Model_Data_radinertDTFDTSDM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(lam1,v,mu,lam5,ZX0,ZXP,lam3,lam4,lam7,               & 
& lam2,lam8,lam6,g1,g2,TW,g3,A,B,Q2,Q3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,O,               & 
& eta,Y3,Yf,Vv,cplAhAhhh,cplAhetIXO,cplAhXPcXP,cpletIetIhh,cpletIHpcXP,cpletIXPcHp,      & 
& cplhhhhhh,cplhhHpcHp,cplhhXOXO,cplhhXPcXP,cplHpXOcXP,cplXOXPcHp,cplAhAhAhAh,           & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhXOXO,cplAhAhXPcXP,cplAhetIhhXO,          & 
& cplAhetIHpcXP,cplAhetIXPcHp,cplAhHpXOcXP,cplAhXOXPcHp,cpletIetIetIetI,cpletIetIhhhh,   & 
& cpletIetIHpcHp,cpletIetIXOXO,cpletIetIXPcXP,cpletIhhHpcXP,cpletIhhXPcHp,               & 
& cplhhhhhhhh,cplhhhhHpcHp,cplhhhhXOXO,cplhhhhXPcXP,cplhhHpXOcXP,cplhhXOXPcHp,           & 
& cplHpHpcHpcHp,cplHpHpcXPcXP,cplHpXOXOcHp,cplHpXPcHpcXP,cplXOXOXOXO,cplXOXOXPcXP,       & 
& cplXPXPcHpcHp,cplXPXPcXPcXP,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cpletIcXPVWp,            & 
& cpletIXOVZ,cpletIXPcVWp,cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplXPcXPVP,      & 
& cplXOcXPVWp,cplXPcXPVZ,cplXOXPcVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,     & 
& cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,        & 
& cplAhcHpVPVWp,cplAhcHpVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIcXPVPVWp,             & 
& cpletIXPcVWpVP,cpletIcXPVWpVZ,cpletIXPcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,               & 
& cplhhHpcVWpVP,cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,     & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplXPcXPVPVP,cplXOcXPVPVWp,cplXPcXPVPVZ,cplXOXPcVWpVP,    & 
& cplcXPcXPVWpVWp,cplXOcXPVWpVZ,cplXOXOcVWpVWp,cplXPcXPcVWpVWp,cplXOXOVZVZ,              & 
& cplXPcXPVZVZ,cplXOXPcVWpVZ,cplXPXPcVWpcVWp,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcChiChiAhL,cplcChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFuFuAhL,cplcFuFuAhR,cplNvNvAhL,cplNvNvAhR,cplChiFeetIL,cplChiFeetIR,               & 
& cplChiFeXOL,cplChiFeXOR,cplFvChicXPL,cplFvChicXPR,cplcChiChihhL,cplcChiChihhR,         & 
& cplNvChicHpL,cplNvChicHpR,cplFvNvetIL,cplFvNvetIR,cplcChicFeetIL,cplcChicFeetIR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplNvFeXPL,cplNvFeXPR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,   & 
& cplFvNvXOL,cplFvNvXOR,cplcChiFvXPL,cplcChiFvXPR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplNvNvhhL,cplNvNvhhR,cplcChiNvHpL,cplcChiNvHpR,cplcFeNvcXPL,cplcFeNvcXPR,             & 
& cplcChicFeXOL,cplcChicFeXOR,cplNvChicVWpL,cplNvChicVWpR,cplcChiChiVPL,cplcChiChiVPR,   & 
& cplcChiChiVZL,cplcChiChiVZR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplNvNvVZL,cplNvNvVZR,               & 
& cplcChiNvVWpL,cplcChiNvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,    & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWCgAVWp,cplcgWpgAcVWp,cplcgWCgWpVP,    & 
& cplcgWCgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWpgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWpgWCVZ,cplcgWCgZVWp,cplcgWpgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,          & 
& cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,           & 
& cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp)

Implicit None 
Real(dp), Intent(in) :: lam1,v,mu,lam5,lam3,lam4,lam7,lam2,lam8,lam6,g1,g2,TW,g3,A,B,eta(3),Y3(3),Yf(3)

Complex(dp), Intent(in) :: ZX0(2,2),ZXP(2,2),Q2(2,2),Q3(2,2),Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),         & 
& ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),O(3,3),Vv(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplAhetIXO(2),cplAhXPcXP(2,2),cpletIetIhh,cpletIHpcXP(2),cpletIXPcHp(2),    & 
& cplhhhhhh,cplhhHpcHp,cplhhXOXO(2,2),cplhhXPcXP(2,2),cplHpXOcXP(2,2),cplXOXPcHp(2,2),   & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhXOXO(2,2),cplAhAhXPcXP(2,2), & 
& cplAhetIhhXO(2),cplAhetIHpcXP(2),cplAhetIXPcHp(2),cplAhHpXOcXP(2,2),cplAhXOXPcHp(2,2), & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2),   & 
& cpletIhhHpcXP(2),cpletIhhXPcHp(2),cplhhhhhhhh,cplhhhhHpcHp,cplhhhhXOXO(2,2),           & 
& cplhhhhXPcXP(2,2),cplhhHpXOcXP(2,2),cplhhXOXPcHp(2,2),cplHpHpcHpcHp,cplHpHpcXPcXP(2,2),& 
& cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2),cplXOXOXOXO(2,2,2,2),cplXOXOXPcXP(2,2,2,2),       & 
& cplXPXPcHpcHp(2,2),cplXPXPcXPcXP(2,2,2,2),cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,           & 
& cpletIcXPVWp(2),cpletIXOVZ(2),cpletIXPcVWp(2),cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,      & 
& cplHpcHpVZ,cplXPcXPVP(2,2),cplXOcXPVWp(2,2),cplXPcXPVZ(2,2),cplXOXPcVWp(2,2),          & 
& cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplAhAhcVWpVWp, & 
& cplAhAhVZVZ,cplAhHpcVWpVP,cplAhHpcVWpVZ,cplAhcHpVPVWp,cplAhcHpVWpVZ,cpletIetIcVWpVWp,  & 
& cpletIetIVZVZ,cpletIcXPVPVWp(2),cpletIXPcVWpVP(2),cpletIcXPVWpVZ(2),cpletIXPcVWpVZ(2), & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpcVWpVP,cplhhHpcVWpVZ,cplhhcHpVPVWp,cplhhcHpVWpVZ,    & 
& cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplXPcXPVPVP(2,2),              & 
& cplXOcXPVPVWp(2,2),cplXPcXPVPVZ(2,2),cplXOXPcVWpVP(2,2),cplcXPcXPVWpVWp(2,2),          & 
& cplXOcXPVWpVZ(2,2),cplXOXOcVWpVWp(2,2),cplXPcXPcVWpVWp(2,2),cplXOXOVZVZ(2,2),          & 
& cplXPcXPVZVZ(2,2),cplXOXPcVWpVZ(2,2),cplXPXPcVWpcVWp(2,2),cplVGVGVG,cplcVWpVPVWp,      & 
& cplcVWpVWpVZ,cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),  & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplNvNvAhL(3,3),   & 
& cplNvNvAhR(3,3),cplChiFeetIL(2,3),cplChiFeetIR(2,3),cplChiFeXOL(2,3,2),cplChiFeXOR(2,3,2),& 
& cplFvChicXPL(3,2,2),cplFvChicXPR(3,2,2),cplcChiChihhL(2,2),cplcChiChihhR(2,2),         & 
& cplNvChicHpL(3,2),cplNvChicHpR(3,2),cplFvNvetIL(3,3),cplFvNvetIR(3,3),cplcChicFeetIL(2,3),& 
& cplcChicFeetIR(2,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),& 
& cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplNvFeXPL(3,3,2),   & 
& cplNvFeXPR(3,3,2),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplFvNvXOL(3,3,2),cplFvNvXOR(3,3,2),cplcChiFvXPL(2,3,2),cplcChiFvXPR(2,3,2),           & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplcChiNvHpL(2,3), & 
& cplcChiNvHpR(2,3),cplcFeNvcXPL(3,3,2),cplcFeNvcXPR(3,3,2),cplcChicFeXOL(2,3,2),        & 
& cplcChicFeXOR(2,3,2),cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),cplcChiChiVPL(2,2),         & 
& cplcChiChiVPR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3)

Complex(dp), Intent(out) :: cplNvNvVZL(3,3),cplNvNvVZR(3,3),cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3),cplVGVGVGVG1,    & 
& cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,             & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWCgAVWp,cplcgWpgAcVWp,cplcgWCgWpVP,cplcgWCgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWpgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgWCVZ,cplcgWCgZVWp,cplcgWpgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgZgAhh,cplcgWpgAHp,cplcgWCgAcHp,cplcgWpgWphh,            & 
& cplcgZgWpcHp,cplcgWCgWChh,cplcgZgWCHp,cplcgZgZhh,cplcgWpgZHp,cplcgWCgZcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhhT(lam1,v,cplAhAhhh)



cplAhetIXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIXOT(gt3,mu,lam5,v,ZX0,cplAhetIXO(gt3))

End Do 


cplAhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXPcXPT(gt2,gt3,mu,ZXP,cplAhXPcXP(gt2,gt3))

 End Do 
End Do 


cpletIetIhh = 0._dp 
Call CouplingetIetIhhT(lam3,lam4,lam5,v,cpletIetIhh)



cpletIHpcXP = 0._dp 
Do gt3 = 1, 2
Call CouplingetIHpcXPT(gt3,lam4,mu,lam5,v,ZXP,cpletIHpcXP(gt3))

End Do 


cpletIXPcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcHpT(gt2,lam4,mu,lam5,v,ZXP,cpletIXPcHp(gt2))

End Do 


cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(lam1,v,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpT(lam1,v,cplhhHpcHp)



cplhhXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXOT(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhXOXO(gt2,gt3))

 End Do 
End Do 


cplhhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcXPT(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcXP(gt2,gt3))

 End Do 
End Do 


cplHpXOcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOcXPT(gt2,gt3,lam4,mu,lam5,v,ZXP,ZX0,cplHpXOcXP(gt2,gt3))

 End Do 
End Do 


cplXOXPcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcHpT(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,cplXOXPcHp(gt1,gt2))

 End Do 
End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhT(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIT(lam3,lam4,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhT(lam1,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpT(lam1,cplAhAhHpcHp)



cplAhAhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXOXOT(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplAhAhXOXO(gt3,gt4))

 End Do 
End Do 


cplAhAhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXPcXPT(gt3,gt4,lam3,lam7,ZXP,cplAhAhXPcXP(gt3,gt4))

 End Do 
End Do 


cplAhetIhhXO = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIhhXOT(gt4,lam5,ZX0,cplAhetIhhXO(gt4))

End Do 


cplAhetIHpcXP = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIHpcXPT(gt4,lam4,lam5,ZXP,cplAhetIHpcXP(gt4))

End Do 


cplAhetIXPcHp = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIXPcHpT(gt3,lam4,lam5,ZXP,cplAhetIXPcHp(gt3))

End Do 


cplAhHpXOcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhHpXOcXPT(gt3,gt4,lam4,lam5,ZXP,ZX0,cplAhHpXOcXP(gt3,gt4))

 End Do 
End Do 


cplAhXOXPcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXOXPcHpT(gt2,gt3,lam4,lam5,ZXP,ZX0,cplAhXOXPcHp(gt2,gt3))

 End Do 
End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIT(lam2,cpletIetIetIetI)



cpletIetIhhhh = 0._dp 
Call CouplingetIetIhhhhT(lam3,lam4,lam5,cpletIetIhhhh)



cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHpT(lam3,cpletIetIHpcHp)



cpletIetIXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXOXOT(gt3,gt4,lam2,lam8,ZX0,cpletIetIXOXO(gt3,gt4))

 End Do 
End Do 


cpletIetIXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXPcXPT(gt3,gt4,lam2,lam8,ZXP,cpletIetIXPcXP(gt3,gt4))

 End Do 
End Do 


cpletIhhHpcXP = 0._dp 
Do gt4 = 1, 2
Call CouplingetIhhHpcXPT(gt4,lam4,lam5,ZXP,cpletIhhHpcXP(gt4))

End Do 


cpletIhhXPcHp = 0._dp 
Do gt3 = 1, 2
Call CouplingetIhhXPcHpT(gt3,lam4,lam5,ZXP,cpletIhhXPcHp(gt3))

End Do 


cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhT(lam1,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpT(lam1,cplhhhhHpcHp)



cplhhhhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXOXOT(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplhhhhXOXO(gt3,gt4))

 End Do 
End Do 


cplhhhhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXPcXPT(gt3,gt4,lam3,lam7,ZXP,cplhhhhXPcXP(gt3,gt4))

 End Do 
End Do 


cplhhHpXOcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhHpXOcXPT(gt3,gt4,lam4,lam5,ZXP,ZX0,cplhhHpXOcXP(gt3,gt4))

 End Do 
End Do 


cplhhXOXPcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXPcHpT(gt2,gt3,lam4,lam5,ZXP,ZX0,cplhhXOXPcHp(gt2,gt3))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpT(lam1,cplHpHpcHpcHp)



cplHpHpcXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpHpcXPcXPT(gt3,gt4,lam5,ZXP,cplHpHpcXPcXP(gt3,gt4))

 End Do 
End Do 


cplHpXOXOcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOXOcHpT(gt2,gt3,lam3,lam7,ZX0,cplHpXOXOcHp(gt2,gt3))

 End Do 
End Do 


cplHpXPcHpcXP = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpXPcHpcXPT(gt2,gt4,lam3,lam4,lam7,ZXP,cplHpXPcHpcXP(gt2,gt4))

 End Do 
End Do 


cplXOXOXOXO = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXOXOXOXOT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,cplXOXOXOXO(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplXOXOXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXOXOXPcXPT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,ZX0,cplXOXOXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplXPXPcHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPXPcHpcHpT(gt1,gt2,lam5,ZXP,cplXPXPcHpcHp(gt1,gt2))

 End Do 
End Do 


cplXPXPcXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXPXPcXPcXPT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,cplXPXPcXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Call CouplingAhhhVZT(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpT(g2,cplAhHpcVWp)



cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpT(g2,cplAhcHpVWp)



cpletIcXPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVWpT(gt2,g2,ZXP,cpletIcXPVWp(gt2))

End Do 


cpletIXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXOVZT(gt2,g1,g2,ZX0,TW,cpletIXOVZ(gt2))

End Do 


cpletIXPcVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpT(gt2,g2,ZXP,cpletIXPcVWp(gt2))

End Do 


cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpT(g2,cplhhHpcVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpT(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cplXPcXPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVPT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVP(gt1,gt2))

 End Do 
End Do 


cplXOcXPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOcXPVWpT(gt1,gt2,g2,ZXP,ZX0,cplXOcXPVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZ(gt1,gt2))

 End Do 
End Do 


cplXOXPcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpT(gt1,gt2,g2,ZXP,ZX0,cplXOXPcVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,v,TW,cplhhVZVZ)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,v,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,v,TW,cplHpcVWpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,v,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,v,TW,cplcHpVWpVZ)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpT(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZT(g1,g2,TW,cplAhAhVZVZ)



cplAhHpcVWpVP = 0._dp 
Call CouplingAhHpcVWpVPT(g1,g2,TW,cplAhHpcVWpVP)



cplAhHpcVWpVZ = 0._dp 
Call CouplingAhHpcVWpVZT(g1,g2,TW,cplAhHpcVWpVZ)



cplAhcHpVPVWp = 0._dp 
Call CouplingAhcHpVPVWpT(g1,g2,TW,cplAhcHpVPVWp)



cplAhcHpVWpVZ = 0._dp 
Call CouplingAhcHpVWpVZT(g1,g2,TW,cplAhcHpVWpVZ)



cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpT(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZT(g1,g2,TW,cpletIetIVZVZ)



cpletIcXPVPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVPVWpT(gt2,g1,g2,ZXP,TW,cpletIcXPVPVWp(gt2))

End Do 


cpletIXPcVWpVP = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpVPT(gt2,g1,g2,ZXP,TW,cpletIXPcVWpVP(gt2))

End Do 


cpletIcXPVWpVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVWpVZT(gt2,g1,g2,ZXP,TW,cpletIcXPVWpVZ(gt2))

End Do 


cpletIXPcVWpVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpVZT(gt2,g1,g2,ZXP,TW,cpletIXPcVWpVZ(gt2))

End Do 


cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpT(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZT(g1,g2,TW,cplhhhhVZVZ)



cplhhHpcVWpVP = 0._dp 
Call CouplinghhHpcVWpVPT(g1,g2,TW,cplhhHpcVWpVP)



cplhhHpcVWpVZ = 0._dp 
Call CouplinghhHpcVWpVZT(g1,g2,TW,cplhhHpcVWpVZ)



cplhhcHpVPVWp = 0._dp 
Call CouplinghhcHpVPVWpT(g1,g2,TW,cplhhcHpVPVWp)



cplhhcHpVWpVZ = 0._dp 
Call CouplinghhcHpVWpVZT(g1,g2,TW,cplhhcHpVWpVZ)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPT(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZT(g1,g2,TW,cplHpcHpVPVZ)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpT(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZT(g1,g2,TW,cplHpcHpVZVZ)



cplXPcXPVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVPVPT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVPVP(gt1,gt2))

 End Do 
End Do 


cplXOcXPVPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOcXPVPVWpT(gt1,gt2,g1,g2,ZXP,ZX0,TW,cplXOcXPVPVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPVPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVPVZT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVPVZ(gt1,gt2))

 End Do 
End Do 


cplXOXPcVWpVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpVPT(gt1,gt2,g1,g2,ZXP,ZX0,TW,cplXOXPcVWpVP(gt1,gt2))

 End Do 
End Do 


cplcXPcXPVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcXPcXPVWpVWpT(gt1,gt2,g2,ZXP,cplcXPcXPVWpVWp(gt1,gt2))

 End Do 
End Do 


cplXOcXPVWpVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOcXPVWpVZT(gt1,gt2,g1,g2,ZXP,ZX0,TW,cplXOcXPVWpVZ(gt1,gt2))

 End Do 
End Do 


cplXOXOcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOcVWpVWpT(gt1,gt2,g2,ZX0,cplXOXOcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPcVWpVWpT(gt1,gt2,g2,ZXP,cplXPcXPcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplXOXOVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOVZVZT(gt1,gt2,g1,g2,ZX0,TW,cplXOXOVZVZ(gt1,gt2))

 End Do 
End Do 


cplXPcXPVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZVZT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZVZ(gt1,gt2))

 End Do 
End Do 


cplXOXPcVWpVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpVZT(gt1,gt2,g1,g2,ZXP,ZX0,TW,cplXOXPcVWpVZ(gt1,gt2))

 End Do 
End Do 


cplXPXPcVWpcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPXPcVWpcVWpT(gt1,gt2,g2,ZXP,cplXPXPcVWpcVWp(gt1,gt2))

 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcChiChiAhL = 0._dp 
cplcChiChiAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiAhT(gt1,gt2,A,B,Q2,Q3,cplcChiChiAhL(gt1,gt2),cplcChiChiAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplNvNvAhL = 0._dp 
cplNvNvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvAhT(gt1,gt2,A,B,O,cplNvNvAhL(gt1,gt2),cplNvNvAhR(gt1,gt2))

 End Do 
End Do 


cplChiFeetIL = 0._dp 
cplChiFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingChiFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplChiFeetIL(gt1,gt2)             & 
& ,cplChiFeetIR(gt1,gt2))

 End Do 
End Do 


cplChiFeXOL = 0._dp 
cplChiFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingChiFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplChiFeXOL(gt1,gt2,gt3)& 
& ,cplChiFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChicXPL = 0._dp 
cplFvChicXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingFvChicXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplFvChicXPL(gt1,gt2,gt3)      & 
& ,cplFvChicXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiChihhL = 0._dp 
cplcChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChihhT(gt1,gt2,A,B,Q2,Q3,cplcChiChihhL(gt1,gt2),cplcChiChihhR(gt1,gt2))

 End Do 
End Do 


cplNvChicHpL = 0._dp 
cplNvChicHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicHpT(gt1,gt2,A,B,O,Q2,Q3,cplNvChicHpL(gt1,gt2),cplNvChicHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvetIL = 0._dp 
cplFvNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvNvetIT(gt1,gt2,eta,Vv,O,cplFvNvetIL(gt1,gt2),cplFvNvetIR(gt1,gt2))

 End Do 
End Do 


cplcChicFeetIL = 0._dp 
cplcChicFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChicFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplcChicFeetIL(gt1,gt2)         & 
& ,cplcChicFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)              & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFeHpT(gt1,gt2,Ye,Vv,ZER,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplNvFeXPL = 0._dp 
cplNvFeXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingNvFeXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplNvFeXPL(gt1,gt2,gt3)      & 
& ,cplNvFeXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvXOL = 0._dp 
cplFvNvXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvNvXOT(gt1,gt2,gt3,eta,Yf,Vv,O,ZX0,cplFvNvXOL(gt1,gt2,gt3)              & 
& ,cplFvNvXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiFvXPL = 0._dp 
cplcChiFvXPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChiFvXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplcChiFvXPL(gt1,gt2,gt3)      & 
& ,cplcChiFvXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,Vv,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplNvNvhhL = 0._dp 
cplNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvhhT(gt1,gt2,A,B,O,cplNvNvhhL(gt1,gt2),cplNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplcChiNvHpL = 0._dp 
cplcChiNvHpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChiNvHpT(gt1,gt2,A,B,O,Q2,Q3,cplcChiNvHpL(gt1,gt2),cplcChiNvHpR(gt1,gt2))

 End Do 
End Do 


cplcFeNvcXPL = 0._dp 
cplcFeNvcXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeNvcXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplcFeNvcXPL(gt1,gt2,gt3)  & 
& ,cplcFeNvcXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChicFeXOL = 0._dp 
cplcChicFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChicFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplcChicFeXOL(gt1,gt2,gt3)& 
& ,cplcChicFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplNvChicVWpL = 0._dp 
cplNvChicVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicVWpT(gt1,gt2,g2,O,Q2,Q3,cplNvChicVWpL(gt1,gt2),cplNvChicVWpR(gt1,gt2))

 End Do 
End Do 


cplcChiChiVPL = 0._dp 
cplcChiChiVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVPT(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVPL(gt1,gt2),cplcChiChiVPR(gt1,gt2))

 End Do 
End Do 


cplcChiChiVZL = 0._dp 
cplcChiChiVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVZT(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVZL(gt1,gt2),cplcChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWpL = 0._dp 
cplFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFeVWpT(gt1,gt2,g2,Vv,ZEL,cplFvFeVWpL(gt1,gt2),cplFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,Vv,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplNvNvVZL = 0._dp 
cplNvNvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvVZT(gt1,gt2,g1,g2,O,TW,cplNvNvVZL(gt1,gt2),cplNvNvVZR(gt1,gt2))

 End Do 
End Do 


cplcChiNvVWpL = 0._dp 
cplcChiNvVWpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChiNvVWpT(gt1,gt2,g2,O,Q2,Q3,cplcChiNvVWpL(gt1,gt2),cplcChiNvVWpR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpT(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZT(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpT(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZT(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWCgAVWp = 0._dp 
Call CouplingcgWCgAVWpT(g2,TW,cplcgWCgAVWp)



cplcgWpgAcVWp = 0._dp 
Call CouplingcgWpgAcVWpT(g2,TW,cplcgWpgAcVWp)



cplcgWCgWpVP = 0._dp 
Call CouplingcgWCgWpVPT(g2,TW,cplcgWCgWpVP)



cplcgWCgWpVZ = 0._dp 
Call CouplingcgWCgWpVZT(g2,TW,cplcgWCgWpVZ)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpT(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpT(g2,TW,cplcgZgWpcVWp)



cplcgWpgWCVP = 0._dp 
Call CouplingcgWpgWCVPT(g2,TW,cplcgWpgWCVP)



cplcgAgWCVWp = 0._dp 
Call CouplingcgAgWCVWpT(g2,TW,cplcgAgWCVWp)



cplcgZgWCVWp = 0._dp 
Call CouplingcgZgWCVWpT(g2,TW,cplcgZgWCVWp)



cplcgWpgWCVZ = 0._dp 
Call CouplingcgWpgWCVZT(g2,TW,cplcgWpgWCVZ)



cplcgWCgZVWp = 0._dp 
Call CouplingcgWCgZVWpT(g2,TW,cplcgWCgZVWp)



cplcgWpgZcVWp = 0._dp 
Call CouplingcgWpgZcVWpT(g2,TW,cplcgWpgZcVWp)



cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhT(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhT(g2,v,cplcgWCgWCAh)



cplcgZgAhh = 0._dp 
Call CouplingcgZgAhhT(g1,g2,v,TW,cplcgZgAhh)



cplcgWpgAHp = 0._dp 
Call CouplingcgWpgAHpT(g1,g2,v,TW,cplcgWpgAHp)



cplcgWCgAcHp = 0._dp 
Call CouplingcgWCgAcHpT(g1,g2,v,TW,cplcgWCgAcHp)



cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhT(g2,v,cplcgWpgWphh)



cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpT(g1,g2,v,TW,cplcgZgWpcHp)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhT(g2,v,cplcgWCgWChh)



cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpT(g1,g2,v,TW,cplcgZgWCHp)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhT(g1,g2,v,TW,cplcgZgZhh)



cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpT(g1,g2,v,TW,cplcgWpgZHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpT(g1,g2,v,TW,cplcgWCgZcHp)



Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(lam1,v,mu,lam5,ZX0,ZXP,lam3,lam4,lam7,g1,g2,TW,               & 
& g3,A,B,Q2,Q3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,O,eta,Y3,Yf,Vv,cplAhAhhh,cplAhetIXO,     & 
& cplAhXPcXP,cpletIetIhh,cpletIHpcXP,cpletIXPcHp,cplhhhhhh,cplhhHpcHp,cplhhXOXO,         & 
& cplhhXPcXP,cplHpXOcXP,cplXOXPcHp,cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cpletIcXPVWp,       & 
& cpletIXOVZ,cpletIXPcVWp,cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplXPcXPVP,      & 
& cplXOcXPVWp,cplXPcXPVZ,cplXOXPcVWp,cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,     & 
& cplcHpVPVWp,cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcChiChiAhL,             & 
& cplcChiChiAhR,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,             & 
& cplcFuFuAhR,cplNvNvAhL,cplNvNvAhR,cplChiFeetIL,cplChiFeetIR,cplChiFeXOL,               & 
& cplChiFeXOR,cplFvChicXPL,cplFvChicXPR,cplcChiChihhL,cplcChiChihhR,cplNvChicHpL,        & 
& cplNvChicHpR,cplFvNvetIL,cplFvNvetIR,cplcChicFeetIL,cplcChicFeetIR,cplcFdFdhhL,        & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,     & 
& cplNvFeXPL,cplNvFeXPR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,               & 
& cplFvNvXOL,cplFvNvXOR,cplcChiFvXPL,cplcChiFvXPR,cplcFeFvcHpL,cplcFeFvcHpR,             & 
& cplNvNvhhL,cplNvNvhhR,cplcChiNvHpL,cplcChiNvHpR,cplcFeNvcXPL,cplcFeNvcXPR,             & 
& cplcChicFeXOL,cplcChicFeXOR,cplNvChicVWpL,cplNvChicVWpR,cplcChiChiVPL,cplcChiChiVPR,   & 
& cplcChiChiVZL,cplcChiChiVZR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeVWpL,cplFvFeVWpR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucVWpL,cplcFdFucVWpR,           & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplNvNvVZL,cplNvNvVZR,               & 
& cplcChiNvVWpL,cplcChiNvVWpR)

Implicit None 
Real(dp), Intent(in) :: lam1,v,mu,lam5,lam3,lam4,lam7,g1,g2,TW,g3,A,B,eta(3),Y3(3),Yf(3)

Complex(dp), Intent(in) :: ZX0(2,2),ZXP(2,2),Q2(2,2),Q3(2,2),Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),         & 
& ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),O(3,3),Vv(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplAhetIXO(2),cplAhXPcXP(2,2),cpletIetIhh,cpletIHpcXP(2),cpletIXPcHp(2),    & 
& cplhhhhhh,cplhhHpcHp,cplhhXOXO(2,2),cplhhXPcXP(2,2),cplHpXOcXP(2,2),cplXOXPcHp(2,2),   & 
& cplAhhhVZ,cplAhHpcVWp,cplAhcHpVWp,cpletIcXPVWp(2),cpletIXOVZ(2),cpletIXPcVWp(2),       & 
& cplhhHpcVWp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplXPcXPVP(2,2),cplXOcXPVWp(2,2),        & 
& cplXPcXPVZ(2,2),cplXOXPcVWp(2,2),cplhhcVWpVWp,cplhhVZVZ,cplHpcVWpVP,cplHpcVWpVZ,       & 
& cplcHpVPVWp,cplcHpVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcChiChiAhL(2,2),        & 
& cplcChiChiAhR(2,2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),& 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplNvNvAhL(3,3),cplNvNvAhR(3,3),cplChiFeetIL(2,3),   & 
& cplChiFeetIR(2,3),cplChiFeXOL(2,3,2),cplChiFeXOR(2,3,2),cplFvChicXPL(3,2,2),           & 
& cplFvChicXPR(3,2,2),cplcChiChihhL(2,2),cplcChiChihhR(2,2),cplNvChicHpL(3,2),           & 
& cplNvChicHpR(3,2),cplFvNvetIL(3,3),cplFvNvetIR(3,3),cplcChicFeetIL(2,3),               & 
& cplcChicFeetIR(2,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),& 
& cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplNvFeXPL(3,3,2),   & 
& cplNvFeXPR(3,3,2),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplFvNvXOL(3,3,2),cplFvNvXOR(3,3,2),cplcChiFvXPL(2,3,2),cplcChiFvXPR(2,3,2),           & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplcChiNvHpL(2,3), & 
& cplcChiNvHpR(2,3),cplcFeNvcXPL(3,3,2),cplcFeNvcXPR(3,3,2),cplcChicFeXOL(2,3,2),        & 
& cplcChicFeXOR(2,3,2),cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),cplcChiChiVPL(2,2),         & 
& cplcChiChiVPR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucVWpL(3,3),& 
& cplcFdFucVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),& 
& cplNvNvVZL(3,3),cplNvNvVZR(3,3),cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhhT(lam1,v,cplAhAhhh)



cplAhetIXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIXOT(gt3,mu,lam5,v,ZX0,cplAhetIXO(gt3))

End Do 


cplAhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXPcXPT(gt2,gt3,mu,ZXP,cplAhXPcXP(gt2,gt3))

 End Do 
End Do 


cpletIetIhh = 0._dp 
Call CouplingetIetIhhT(lam3,lam4,lam5,v,cpletIetIhh)



cpletIHpcXP = 0._dp 
Do gt3 = 1, 2
Call CouplingetIHpcXPT(gt3,lam4,mu,lam5,v,ZXP,cpletIHpcXP(gt3))

End Do 


cpletIXPcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcHpT(gt2,lam4,mu,lam5,v,ZXP,cpletIXPcHp(gt2))

End Do 


cplhhhhhh = 0._dp 
Call CouplinghhhhhhT(lam1,v,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpT(lam1,v,cplhhHpcHp)



cplhhXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXOT(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhXOXO(gt2,gt3))

 End Do 
End Do 


cplhhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcXPT(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcXP(gt2,gt3))

 End Do 
End Do 


cplHpXOcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOcXPT(gt2,gt3,lam4,mu,lam5,v,ZXP,ZX0,cplHpXOcXP(gt2,gt3))

 End Do 
End Do 


cplXOXPcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcHpT(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,cplXOXPcHp(gt1,gt2))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Call CouplingAhhhVZT(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpT(g2,cplAhHpcVWp)



cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpT(g2,cplAhcHpVWp)



cpletIcXPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVWpT(gt2,g2,ZXP,cpletIcXPVWp(gt2))

End Do 


cpletIXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXOVZT(gt2,g1,g2,ZX0,TW,cpletIXOVZ(gt2))

End Do 


cpletIXPcVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpT(gt2,g2,ZXP,cpletIXPcVWp(gt2))

End Do 


cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpT(g2,cplhhHpcVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpT(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cplXPcXPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVPT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVP(gt1,gt2))

 End Do 
End Do 


cplXOcXPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOcXPVWpT(gt1,gt2,g2,ZXP,ZX0,cplXOcXPVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZT(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZ(gt1,gt2))

 End Do 
End Do 


cplXOXPcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpT(gt1,gt2,g2,ZXP,ZX0,cplXOXPcVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpT(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZT(g1,g2,v,TW,cplhhVZVZ)



cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPT(g1,g2,v,TW,cplHpcVWpVP)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZT(g1,g2,v,TW,cplHpcVWpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpT(g1,g2,v,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZT(g1,g2,v,TW,cplcHpVWpVZ)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcChiChiAhL = 0._dp 
cplcChiChiAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiAhT(gt1,gt2,A,B,Q2,Q3,cplcChiChiAhL(gt1,gt2),cplcChiChiAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplNvNvAhL = 0._dp 
cplNvNvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvAhT(gt1,gt2,A,B,O,cplNvNvAhL(gt1,gt2),cplNvNvAhR(gt1,gt2))

 End Do 
End Do 


cplChiFeetIL = 0._dp 
cplChiFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingChiFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplChiFeetIL(gt1,gt2)             & 
& ,cplChiFeetIR(gt1,gt2))

 End Do 
End Do 


cplChiFeXOL = 0._dp 
cplChiFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingChiFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplChiFeXOL(gt1,gt2,gt3)& 
& ,cplChiFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChicXPL = 0._dp 
cplFvChicXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingFvChicXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplFvChicXPL(gt1,gt2,gt3)      & 
& ,cplFvChicXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiChihhL = 0._dp 
cplcChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChihhT(gt1,gt2,A,B,Q2,Q3,cplcChiChihhL(gt1,gt2),cplcChiChihhR(gt1,gt2))

 End Do 
End Do 


cplNvChicHpL = 0._dp 
cplNvChicHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicHpT(gt1,gt2,A,B,O,Q2,Q3,cplNvChicHpL(gt1,gt2),cplNvChicHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvetIL = 0._dp 
cplFvNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvNvetIT(gt1,gt2,eta,Vv,O,cplFvNvetIL(gt1,gt2),cplFvNvetIR(gt1,gt2))

 End Do 
End Do 


cplcChicFeetIL = 0._dp 
cplcChicFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChicFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplcChicFeetIL(gt1,gt2)         & 
& ,cplcChicFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)              & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFeHpT(gt1,gt2,Ye,Vv,ZER,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplNvFeXPL = 0._dp 
cplNvFeXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingNvFeXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplNvFeXPL(gt1,gt2,gt3)      & 
& ,cplNvFeXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvXOL = 0._dp 
cplFvNvXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvNvXOT(gt1,gt2,gt3,eta,Yf,Vv,O,ZX0,cplFvNvXOL(gt1,gt2,gt3)              & 
& ,cplFvNvXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiFvXPL = 0._dp 
cplcChiFvXPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChiFvXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplcChiFvXPL(gt1,gt2,gt3)      & 
& ,cplcChiFvXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,Vv,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplNvNvhhL = 0._dp 
cplNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvhhT(gt1,gt2,A,B,O,cplNvNvhhL(gt1,gt2),cplNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplcChiNvHpL = 0._dp 
cplcChiNvHpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChiNvHpT(gt1,gt2,A,B,O,Q2,Q3,cplcChiNvHpL(gt1,gt2),cplcChiNvHpR(gt1,gt2))

 End Do 
End Do 


cplcFeNvcXPL = 0._dp 
cplcFeNvcXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeNvcXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplcFeNvcXPL(gt1,gt2,gt3)  & 
& ,cplcFeNvcXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChicFeXOL = 0._dp 
cplcChicFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChicFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplcChicFeXOL(gt1,gt2,gt3)& 
& ,cplcChicFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplNvChicVWpL = 0._dp 
cplNvChicVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicVWpT(gt1,gt2,g2,O,Q2,Q3,cplNvChicVWpL(gt1,gt2),cplNvChicVWpR(gt1,gt2))

 End Do 
End Do 


cplcChiChiVPL = 0._dp 
cplcChiChiVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVPT(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVPL(gt1,gt2),cplcChiChiVPR(gt1,gt2))

 End Do 
End Do 


cplcChiChiVZL = 0._dp 
cplcChiChiVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVZT(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVZL(gt1,gt2),cplcChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFdVWpL = 0._dp 
cplcFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdVWpL(gt1,gt2),cplcFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplFvFeVWpL = 0._dp 
cplFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFeVWpT(gt1,gt2,g2,Vv,ZEL,cplFvFeVWpL(gt1,gt2),cplFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpT(gt1,gt2,g2,Vv,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplNvNvVZL = 0._dp 
cplNvNvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvVZT(gt1,gt2,g1,g2,O,TW,cplNvNvVZL(gt1,gt2),cplNvNvVZR(gt1,gt2))

 End Do 
End Do 


cplcChiNvVWpL = 0._dp 
cplcChiNvVWpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChiNvVWpT(gt1,gt2,g2,O,Q2,Q3,cplcChiNvVWpL(gt1,gt2),cplcChiNvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhhhT(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplingAhetIXOT(gt3,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam5*v*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt3,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIXOT  
 
 
Subroutine CouplingAhXPcXPT(gt2,gt3,mu,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: mu

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhXPcXPT  
 
 
Subroutine CouplingetIetIhhT(lam3,lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
res = 0._dp 
res = res-(lam3*v)
res = res-(lam4*v)
res = res+lam5*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhT  
 
 
Subroutine CouplingetIHpcXPT(gt3,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*v*ZXP(gt3,1))/2._dp
res = res-(lam5*v*ZXP(gt3,1))/2._dp
res = res-(mu*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcXPT  
 
 
Subroutine CouplingetIXPcHpT(gt2,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(lam5*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(mu*Conjg(ZXP(gt2,2)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcHpT  
 
 
Subroutine CouplinghhhhhhT(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*lam1*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHpcHpT(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpT  
 
 
Subroutine CouplinghhXOXOT(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam4,lam7,mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXOXO' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam4*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam5*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1)))/2._dp
res = res+(mu*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2)))/2._dp
res = res-(lam7*v*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXOXOT  
 
 
Subroutine CouplinghhXPcXPT(gt2,gt3,lam3,lam7,mu,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7,mu,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZXP(gt2,1))*ZXP(gt3,1))
res = res-(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = res-(lam7*v*Conjg(ZXP(gt2,2))*ZXP(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXPcXPT  
 
 
Subroutine CouplingHpXOcXPT(gt2,gt3,lam4,mu,lam5,v,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZX0(gt2,1))*ZXP(gt3,1))/2._dp
res = res-(lam5*v*Conjg(ZX0(gt2,1))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZX0(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZX0(gt2,1))*ZXP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOcXPT  
 
 
Subroutine CouplingXOXPcHpT(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(lam5*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcHpT  
 
 
Subroutine CouplingAhAhAhAhT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhetIetIT(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetIT  
 
 
Subroutine CouplingAhAhhhhhT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHpcHpT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpT  
 
 
Subroutine CouplingAhAhXOXOT(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res+lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXOXOT  
 
 
Subroutine CouplingAhAhXPcXPT(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXPcXPT  
 
 
Subroutine CouplingAhetIhhXOT(gt4,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhhXO' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam5*Conjg(ZX0(gt4,1)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhXOT  
 
 
Subroutine CouplingAhetIHpcXPT(gt4,lam4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHpcXP' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*ZXP(gt4,1))/2._dp
res = res-(lam5*ZXP(gt4,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHpcXPT  
 
 
Subroutine CouplingAhetIXPcHpT(gt3,lam4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIXPcHp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*Conjg(ZXP(gt3,1)))/2._dp
res = res-(lam5*Conjg(ZXP(gt3,1)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIXPcHpT  
 
 
Subroutine CouplingAhHpXOcXPT(gt3,gt4,lam4,lam5,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpXOcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*Conjg(ZX0(gt3,1))*ZXP(gt4,1))/2._dp
res = res+(lam5*Conjg(ZX0(gt3,1))*ZXP(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpXOcXPT  
 
 
Subroutine CouplingAhXOXPcHpT(gt2,gt3,lam4,lam5,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhXOXPcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1)))/2._dp
res = res-(lam5*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhXOXPcHpT  
 
 
Subroutine CouplingetIetIetIetIT(lam2,res)

Implicit None 

Real(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetIT  
 
 
Subroutine CouplingetIetIhhhhT(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res+lam5
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhT  
 
 
Subroutine CouplingetIetIHpcHpT(lam3,res)

Implicit None 

Real(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHpcHpT  
 
 
Subroutine CouplingetIetIXOXOT(gt3,gt4,lam2,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam2*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXOXOT  
 
 
Subroutine CouplingetIetIXPcXPT(gt3,gt4,lam2,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam2*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam8*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXPcXPT  
 
 
Subroutine CouplingetIhhHpcXPT(gt4,lam4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHpcXP' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*ZXP(gt4,1))/2._dp
res = res-(lam5*ZXP(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHpcXPT  
 
 
Subroutine CouplingetIhhXPcHpT(gt3,lam4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhXPcHp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*Conjg(ZXP(gt3,1)))/2._dp
res = res+(lam5*Conjg(ZXP(gt3,1)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhXPcHpT  
 
 
Subroutine CouplinghhhhhhhhT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHpcHpT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpT  
 
 
Subroutine CouplinghhhhXOXOT(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXOXOT  
 
 
Subroutine CouplinghhhhXPcXPT(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXPcXPT  
 
 
Subroutine CouplinghhHpXOcXPT(gt3,gt4,lam4,lam5,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpXOcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*Conjg(ZX0(gt3,1))*ZXP(gt4,1))/2._dp
res = res-(lam5*Conjg(ZX0(gt3,1))*ZXP(gt4,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpXOcXPT  
 
 
Subroutine CouplinghhXOXPcHpT(gt2,gt3,lam4,lam5,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,lam5

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXOXPcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1)))/2._dp
res = res-(lam5*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXOXPcHpT  
 
 
Subroutine CouplingHpHpcHpcHpT(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpT  
 
 
Subroutine CouplingHpHpcXPcXPT(gt3,gt4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*lam5*ZXP(gt3,1)*ZXP(gt4,1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcXPcXPT  
 
 
Subroutine CouplingHpXOXOcHpT(gt2,gt3,lam3,lam7,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOXOcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam7*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOXOcHpT  
 
 
Subroutine CouplingHpXPcHpcXPT(gt2,gt4,lam3,lam4,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXPcHpcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
res = res-(lam4*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt2,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXPcHpcXPT  
 
 
Subroutine CouplingXOXOXOXOT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOXOXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*lam2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
res = res-3*lam6*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOXOXOT  
 
 
Subroutine CouplingXOXOXPcXPT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
res = res-(lam6*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOXPcXPT  
 
 
Subroutine CouplingXPXPcHpcHpT(gt1,gt2,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPXPcHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*lam5*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,1))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPXPcHpcHpT  
 
 
Subroutine CouplingXPXPcXPcXPT(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPXPcXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-2*lam2*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,1))*ZXP(gt3,1)*ZXP(gt4,1)
res = res-(lam8*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,1))*ZXP(gt3,2)*ZXP(gt4,1))
res = res-(lam8*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,2))*ZXP(gt3,2)*ZXP(gt4,1))
res = res-(lam8*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,1))*ZXP(gt3,1)*ZXP(gt4,2))
res = res-(lam8*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,2))*ZXP(gt3,1)*ZXP(gt4,2))
res = res-2*lam6*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,2))*ZXP(gt3,2)*ZXP(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPXPcXPcXPT  
 
 
Subroutine CouplingAhhhVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res+(g1*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpT  
 
 
Subroutine CouplingAhcHpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpT  
 
 
Subroutine CouplingetIcXPVWpT(gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcXPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZXP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcXPVWpT  
 
 
Subroutine CouplingetIXOVZT(gt2,g1,g2,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXOVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZX0(gt2,1))*Cos(TW))/2._dp
res = res+(g1*Conjg(ZX0(gt2,1))*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXOVZT  
 
 
Subroutine CouplingetIXPcVWpT(gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZXP(gt2,1)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcVWpT  
 
 
Subroutine CouplinghhHpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpT  
 
 
Subroutine CouplinghhcHpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
res = 0._dp 
res = res+g2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpT  
 
 
Subroutine CouplingHpcHpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPT  
 
 
Subroutine CouplingHpcHpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-(g1*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZT  
 
 
Subroutine CouplingXPcXPVPT(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*Conjg(ZXP(gt1,1))*Cos(TW)*ZXP(gt2,1))/2._dp
res = res+(g2*Conjg(ZXP(gt1,1))*Sin(TW)*ZXP(gt2,1))/2._dp
res = res+(g2*Conjg(ZXP(gt1,2))*Sin(TW)*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVPT  
 
 
Subroutine CouplingXOcXPVWpT(gt1,gt2,g2,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOcXPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZX0(gt1,1))*ZXP(gt2,1))/2._dp
res = res-(g2*Conjg(ZX0(gt1,2))*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOcXPVWpT  
 
 
Subroutine CouplingXPcXPVZT(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZXP(gt1,1))*Cos(TW)*ZXP(gt2,1))/2._dp
res = res-(g1*Conjg(ZXP(gt1,1))*Sin(TW)*ZXP(gt2,1))/2._dp
res = res+(g2*Conjg(ZXP(gt1,2))*Cos(TW)*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVZT  
 
 
Subroutine CouplingXOXPcVWpT(gt1,gt2,g2,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res+(g2*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcVWpT  
 
 
Subroutine CouplinghhcVWpVWpT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
res = 0._dp 
res = res+(g2**2*v)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpT  
 
 
Subroutine CouplinghhVZVZT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2)/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)
res = res+(g1**2*v*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHpcVWpVPT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPT  
 
 
Subroutine CouplingHpcVWpVZT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZT  
 
 
Subroutine CouplingcHpVPVWpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpT  
 
 
Subroutine CouplingcHpVWpVZT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZT  
 
 
Subroutine CouplingAhAhcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpT  
 
 
Subroutine CouplingAhAhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhHpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVPT  
 
 
Subroutine CouplingAhHpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpVZT  
 
 
Subroutine CouplingAhcHpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVPVWp' 
 
res = 0._dp 
res = res-(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVPVWpT  
 
 
Subroutine CouplingAhcHpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWpVZ' 
 
res = 0._dp 
res = res+(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpVZT  
 
 
Subroutine CouplingetIetIcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIcVWpVWpT  
 
 
Subroutine CouplingetIetIVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIVZVZT  
 
 
Subroutine CouplingetIcXPVPVWpT(gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcXPVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZXP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcXPVPVWpT  
 
 
Subroutine CouplingetIXPcVWpVPT(gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcVWpVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZXP(gt2,1))*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcVWpVPT  
 
 
Subroutine CouplingetIcXPVWpVZT(gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcXPVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZXP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcXPVWpVZT  
 
 
Subroutine CouplingetIXPcVWpVZT(gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Conjg(ZXP(gt2,1))*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcVWpVZT  
 
 
Subroutine CouplinghhhhcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpT  
 
 
Subroutine CouplinghhhhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVPT  
 
 
Subroutine CouplinghhHpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpVZT  
 
 
Subroutine CouplinghhcHpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVPVWpT  
 
 
Subroutine CouplinghhcHpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpVZT  
 
 
Subroutine CouplingHpcHpVPVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPT  
 
 
Subroutine CouplingHpcHpVPVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW)))/2._dp
res = res-(g1**2*Sin(2._dp*(TW)))/4._dp
res = res+(g2**2*Sin(2._dp*(TW)))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVZT  
 
 
Subroutine CouplingHpcHpcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpT  
 
 
Subroutine CouplingHpcHpVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZT  
 
 
Subroutine CouplingXPcXPVPVPT(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*Conjg(ZXP(gt1,1))*Cos(TW)**2*ZXP(gt2,1))/2._dp
res = res+g1*g2*Conjg(ZXP(gt1,1))*Cos(TW)*Sin(TW)*ZXP(gt2,1)
res = res+(g2**2*Conjg(ZXP(gt1,1))*Sin(TW)**2*ZXP(gt2,1))/2._dp
res = res+g2**2*Conjg(ZXP(gt1,2))*Sin(TW)**2*ZXP(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVPVPT  
 
 
Subroutine CouplingXOcXPVPVWpT(gt1,gt2,g1,g2,ZXP,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOcXPVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZX0(gt1,1))*Cos(TW)*ZXP(gt2,1))/2._dp
res = res-(g2**2*Conjg(ZX0(gt1,2))*Sin(TW)*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOcXPVPVWpT  
 
 
Subroutine CouplingXPcXPVPVZT(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZXP(gt1,1))*Cos(2._dp*(TW))*ZXP(gt2,1))/2._dp
res = res-(g1**2*Conjg(ZXP(gt1,1))*Sin(2._dp*(TW))*ZXP(gt2,1))/4._dp
res = res+(g2**2*Conjg(ZXP(gt1,1))*Sin(2._dp*(TW))*ZXP(gt2,1))/4._dp
res = res+(g2**2*Conjg(ZXP(gt1,2))*Sin(2._dp*(TW))*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVPVZT  
 
 
Subroutine CouplingXOXPcVWpVPT(gt1,gt2,g1,g2,ZXP,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1))*Cos(TW))/2._dp
res = res-(g2**2*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,2))*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcVWpVPT  
 
 
Subroutine CouplingcXPcXPVWpVWpT(gt1,gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcXPcXPVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*ZXP(gt1,2)*ZXP(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcXPcXPVWpVWpT  
 
 
Subroutine CouplingXOcXPVWpVZT(gt1,gt2,g1,g2,ZXP,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOcXPVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Conjg(ZX0(gt1,1))*Sin(TW)*ZXP(gt2,1))/2._dp
res = res-(g2**2*Conjg(ZX0(gt1,2))*Cos(TW)*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOcXPVWpVZT  
 
 
Subroutine CouplingXOXOcVWpVWpT(gt1,gt2,g2,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1)))/2._dp
res = res+g2**2*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOcVWpVWpT  
 
 
Subroutine CouplingXPcXPcVWpVWpT(gt1,gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZXP(gt1,1))*ZXP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZXP(gt1,2))*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPcVWpVWpT  
 
 
Subroutine CouplingXOXOVZVZT(gt1,gt2,g1,g2,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Cos(TW)**2)/2._dp
res = res+g1*g2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Cos(TW)*Sin(TW)
res = res+(g1**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOVZVZT  
 
 
Subroutine CouplingXPcXPVZVZT(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZXP(gt1,1))*Cos(TW)**2*ZXP(gt2,1))/2._dp
res = res-(g1*g2*Conjg(ZXP(gt1,1))*Cos(TW)*Sin(TW)*ZXP(gt2,1))
res = res+(g1**2*Conjg(ZXP(gt1,1))*Sin(TW)**2*ZXP(gt2,1))/2._dp
res = res+g2**2*Conjg(ZXP(gt1,2))*Cos(TW)**2*ZXP(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVZVZT  
 
 
Subroutine CouplingXOXPcVWpVZT(gt1,gt2,g1,g2,ZXP,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,2))*Cos(TW))/2._dp
res = res-(g1*g2*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1))*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcVWpVZT  
 
 
Subroutine CouplingXPXPcVWpcVWpT(gt1,gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPXPcVWpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPXPcVWpcVWpT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWpVPVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpT  
 
 
Subroutine CouplingcVWpVWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZT  
 
 
Subroutine CouplingcChiChiAhT(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL+(A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp)
resR = 0._dp 
resR = resR+(B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp)
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiAhT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingNvNvAhT(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL+(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR-(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR-(B*O(gt1,1)*O(gt2,3))/2._dp
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvAhT  
 
 
Subroutine CouplingChiFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*eta(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp))
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeetIT  
 
 
Subroutine CouplingChiFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZX0(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,2))*Conjg(ZEL(gt2,j1))*Conjg(ZX0(gt3,2))*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZX0(gt3,1))*eta(j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,1))*Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeXOT  
 
 
Subroutine CouplingFvChicXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),Q2(2,2),Q3(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvChicXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt2,2))*Conjg(Vv(gt1,j1))*Yf(j1)*ZXP(gt3,2))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Q3(gt2,1)*Vv(gt1,j1)*eta(j1)*ZXP(gt3,1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvChicXPT  
 
 
Subroutine CouplingcChiChihhT(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL-((A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp))
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChihhT  
 
 
Subroutine CouplingNvChicHpT(gt1,gt2,A,B,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvChicHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(B*Conjg(O(gt1,3))*Conjg(Q2(gt2,1)))
resL = resL-((B*Conjg(O(gt1,1))*Conjg(Q2(gt2,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR+A*O(gt1,2)*Q3(gt2,1)
resR = resR-((A*O(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvChicHpT  
 
 
Subroutine CouplingFvNvetIT(gt1,gt2,eta,Vv,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*eta(j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvetIT  
 
 
Subroutine CouplingcChicFeetIT(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q3(gt1,2))*Conjg(ZER(gt2,j1))*Y3(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Q2(gt1,1)*ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicFeetIT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHpT  
 
 
Subroutine CouplingFvFeHpT(gt1,gt2,Ye,Vv,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*Vv(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHpT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingNvFeXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZXP(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvFeXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt1,3))*Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,2))*Yf(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((Conjg(O(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(ZXP(gt3,1))*O(gt1,2)*ZER(gt2,j1)*Y3(j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvFeXPT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucHpT(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpT  
 
 
Subroutine CouplingFvNvXOT(gt1,gt2,gt3,eta,Yf,Vv,O,ZX0,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3),ZX0(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,3))*Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,2))*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,1))*eta(j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*O(gt2,3)*Vv(gt1,j1)*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(Conjg(ZX0(gt3,1))*O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvXOT  
 
 
Subroutine CouplingcChiFvXPT(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),Q2(2,2),Q3(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiFvXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(Q3(gt1,1))*Conjg(Vv(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Conjg(ZXP(gt3,2))*Q2(gt1,2)*Vv(gt2,j1)*Yf(j1))/sqrt(2._dp))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiFvXPT  
 
 
Subroutine CouplingcFeFvcHpT(gt1,gt2,Ye,Vv,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(Vv(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpT  
 
 
Subroutine CouplingNvNvhhT(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL-(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR+(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR+(B*O(gt1,1)*O(gt2,3))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvhhT  
 
 
Subroutine CouplingcChiNvHpT(gt1,gt2,A,B,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiNvHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+A*Conjg(O(gt2,2))*Conjg(Q3(gt1,1))
resL = resL-((A*Conjg(O(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(B*O(gt2,3)*Q2(gt1,1))
resR = resR-((B*O(gt2,1)*Q2(gt1,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiNvHpT  
 
 
Subroutine CouplingcFeNvcXPT(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZXP(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeNvcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(O(gt2,2))*Conjg(ZER(gt1,j1))*Y3(j1)*ZXP(gt3,1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((O(gt2,1)*ZEL(gt1,j1)*eta(j1)*ZXP(gt3,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(O(gt2,3)*ZEL(gt1,j1)*Yf(j1)*ZXP(gt3,2))/sqrt(2._dp)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeNvcXPT  
 
 
Subroutine CouplingcChicFeXOT(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZX0(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q3(gt1,2))*Conjg(ZER(gt2,j1))*Conjg(ZX0(gt3,1))*Y3(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*Q2(gt1,2)*ZEL(gt2,j1)*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-((Conjg(ZX0(gt3,1))*Q2(gt1,1)*ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicFeXOT  
 
 
Subroutine CouplingNvChicVWpT(gt1,gt2,g2,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvChicVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(Q2(gt2,1))*O(gt1,1)
resL = resL-((g2*Conjg(Q2(gt2,2))*O(gt1,3))/sqrt(2._dp))
resR = 0._dp 
resR = resR+g2*Conjg(O(gt1,1))*Q3(gt2,1)
resR = resR+(g2*Conjg(O(gt1,2))*Q3(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvChicVWpT  
 
 
Subroutine CouplingcChiChiVPT(gt1,gt2,g1,g2,Q2,Q3,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g1*Conjg(Q2(gt2,2))*Cos(TW)*Q2(gt1,2))/2._dp
resL = resL-(g2*Conjg(Q2(gt2,1))*Q2(gt1,1)*Sin(TW))
resL = resL-(g2*Conjg(Q2(gt2,2))*Q2(gt1,2)*Sin(TW))/2._dp
resR = 0._dp 
resR = resR-(g1*Conjg(Q3(gt1,2))*Cos(TW)*Q3(gt2,2))/2._dp
resR = resR-(g2*Conjg(Q3(gt1,1))*Q3(gt2,1)*Sin(TW))
resR = resR-(g2*Conjg(Q3(gt1,2))*Q3(gt2,2)*Sin(TW))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiVPT  
 
 
Subroutine CouplingcChiChiVZT(gt1,gt2,g1,g2,Q2,Q3,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(Q2(gt2,1))*Cos(TW)*Q2(gt1,1))
resL = resL-(g2*Conjg(Q2(gt2,2))*Cos(TW)*Q2(gt1,2))/2._dp
resL = resL+(g1*Conjg(Q2(gt2,2))*Q2(gt1,2)*Sin(TW))/2._dp
resR = 0._dp 
resR = resR-(g2*Conjg(Q3(gt1,1))*Cos(TW)*Q3(gt2,1))
resR = resR-(g2*Conjg(Q3(gt1,2))*Cos(TW)*Q3(gt2,2))/2._dp
resR = resR+(g1*Conjg(Q3(gt1,2))*Q3(gt2,2)*Sin(TW))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiVZT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFuFdVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdVWpT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingFvFeVWpT(gt1,gt2,g2,Vv,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: Vv(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*Vv(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeVWpT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingcFdFucVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpT  
 
 
Subroutine CouplingFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZT  
 
 
Subroutine CouplingcFeFvcVWpT(gt1,gt2,g2,Vv,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: Vv(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(Vv(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpT  
 
 
Subroutine CouplingNvNvVZT(gt1,gt2,g1,g2,O,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(O(gt2,2))*Cos(TW)*O(gt1,2))/2._dp
resL = resL+(g2*Conjg(O(gt2,3))*Cos(TW)*O(gt1,3))/2._dp
resL = resL-(g1*Conjg(O(gt2,2))*O(gt1,2)*Sin(TW))/2._dp
resL = resL+(g1*Conjg(O(gt2,3))*O(gt1,3)*Sin(TW))/2._dp
resR = 0._dp 
resR = resR+(g2*Conjg(O(gt1,2))*Cos(TW)*O(gt2,2))/2._dp
resR = resR-(g2*Conjg(O(gt1,3))*Cos(TW)*O(gt2,3))/2._dp
resR = resR+(g1*Conjg(O(gt1,2))*O(gt2,2)*Sin(TW))/2._dp
resR = resR-(g1*Conjg(O(gt1,3))*O(gt2,3)*Sin(TW))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvVZT  
 
 
Subroutine CouplingcChiNvVWpT(gt1,gt2,g2,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiNvVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(O(gt2,1))*Q2(gt1,1)
resL = resL-((g2*Conjg(O(gt2,3))*Q2(gt1,2))/sqrt(2._dp))
resR = 0._dp 
resR = resR+g2*Conjg(Q3(gt1,1))*O(gt2,1)
resR = resR+(g2*Conjg(Q3(gt1,2))*O(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiNvVWpT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWpVPVPVWpT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpT  
 
 
Subroutine CouplingcVWpVPVWpVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3-(g2**2*Sin(2._dp*(TW)))
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZT  
 
 
Subroutine CouplingcVWpcVWpVWpVWpT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpT  
 
 
Subroutine CouplingcVWpVWpVZVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWCgAVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAVWpT  
 
 
Subroutine CouplingcgWpgAcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAcVWpT  
 
 
Subroutine CouplingcgWCgWpVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWpVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWpVPT  
 
 
Subroutine CouplingcgWCgWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWpVZT  
 
 
Subroutine CouplingcgAgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpT  
 
 
Subroutine CouplingcgZgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpT  
 
 
Subroutine CouplingcgWpgWCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWCVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWCVPT  
 
 
Subroutine CouplingcgAgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWCVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWCVWpT  
 
 
Subroutine CouplingcgZgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCVWpT  
 
 
Subroutine CouplingcgWpgWCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWCVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWCVZT  
 
 
Subroutine CouplingcgWCgZVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZVWpT  
 
 
Subroutine CouplingcgWpgZcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcVWpT  
 
 
Subroutine CouplingcgWpgWpAhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhT  
 
 
Subroutine CouplingcgWCgWCAhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhT  
 
 
Subroutine CouplingcgZgAhhT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(2._dp*(TW))*RXiZ)/4._dp
res = res+(g1**2*v*RXiZ*Sin(2._dp*(TW)))/8._dp
res = res-(g2**2*v*RXiZ*Sin(2._dp*(TW)))/8._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWpgAHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAHp' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAHpT  
 
 
Subroutine CouplingcgWCgAcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcHp' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcHpT  
 
 
Subroutine CouplingcgWpgWphhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhT  
 
 
Subroutine CouplingcgZgWpcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpT  
 
 
Subroutine CouplingcgWCgWChhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhT  
 
 
Subroutine CouplingcgZgWCHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpT  
 
 
Subroutine CouplingcgZgZhhT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW))/2._dp
res = res-(g1**2*v*RXiZ*Sin(TW)**2)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWpgZHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpT  
 
 
Subroutine CouplingcgWCgZcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpT  
 
 
Subroutine CouplingsForEffPot4(lam1,lam3,lam4,lam5,lam7,ZX0,ZXP,lam2,lam8,            & 
& lam6,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhXOXO,cplAhAhXPcXP,      & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIXOXO,cpletIetIXPcXP,             & 
& cplhhhhhhhh,cplhhhhHpcHp,cplhhhhXOXO,cplhhhhXPcXP,cplHpHpcHpcHp,cplHpHpcXPcXP,         & 
& cplHpXOXOcHp,cplHpXPcHpcXP,cplXOXOXOXO,cplXOXOXPcXP,cplXPXPcHpcHp,cplXPXPcXPcXP)

Implicit None 
Real(dp), Intent(in) :: lam1,lam3,lam4,lam5,lam7,lam2,lam8,lam6

Complex(dp), Intent(in) :: ZX0(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHpcHp,cplAhAhXOXO(2,2),cplAhAhXPcXP(2,2),& 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHpcHp,cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2),   & 
& cplhhhhhhhh,cplhhhhHpcHp,cplhhhhXOXO(2,2),cplhhhhXPcXP(2,2),cplHpHpcHpcHp,             & 
& cplHpHpcXPcXP(2,2),cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2),cplXOXOXOXO(2,2,2,2),          & 
& cplXOXOXPcXP(2,2,2,2),cplXPXPcHpcHp(2,2),cplXPXPcXPcXP(2,2,2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2L(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetI2L(lam3,lam4,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhh2L(lam1,cplAhAhhhhh)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHp2L(lam1,cplAhAhHpcHp)



cplAhAhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXOXO2L(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplAhAhXOXO(gt3,gt4))

 End Do 
End Do 


cplAhAhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXPcXP2L(gt3,gt4,lam3,lam7,ZXP,cplAhAhXPcXP(gt3,gt4))

 End Do 
End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetI2L(lam2,cpletIetIetIetI)



cpletIetIhhhh = 0._dp 
Call CouplingetIetIhhhh2L(lam3,lam4,lam5,cpletIetIhhhh)



cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHp2L(lam3,cpletIetIHpcHp)



cpletIetIXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXOXO2L(gt3,gt4,lam2,lam8,ZX0,cpletIetIXOXO(gt3,gt4))

 End Do 
End Do 


cpletIetIXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXPcXP2L(gt3,gt4,lam2,lam8,ZXP,cpletIetIXPcXP(gt3,gt4))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Call Couplinghhhhhhhh2L(lam1,cplhhhhhhhh)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHp2L(lam1,cplhhhhHpcHp)



cplhhhhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXOXO2L(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplhhhhXOXO(gt3,gt4))

 End Do 
End Do 


cplhhhhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXPcXP2L(gt3,gt4,lam3,lam7,ZXP,cplhhhhXPcXP(gt3,gt4))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2L(lam1,cplHpHpcHpcHp)



cplHpHpcXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpHpcXPcXP2L(gt3,gt4,lam5,ZXP,cplHpHpcXPcXP(gt3,gt4))

 End Do 
End Do 


cplHpXOXOcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOXOcHp2L(gt2,gt3,lam3,lam7,ZX0,cplHpXOXOcHp(gt2,gt3))

 End Do 
End Do 


cplHpXPcHpcXP = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpXPcHpcXP2L(gt2,gt4,lam3,lam4,lam7,ZXP,cplHpXPcHpcXP(gt2,gt4))

 End Do 
End Do 


cplXOXOXOXO = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXOXOXOXO2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,cplXOXOXOXO(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplXOXOXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXOXOXPcXP2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,ZX0,cplXOXOXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplXPXPcHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPXPcHpcHp2L(gt1,gt2,lam5,ZXP,cplXPXPcHpcHp(gt1,gt2))

 End Do 
End Do 


cplXPXPcXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXPXPcXPcXP2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,cplXPXPcXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(lam1,v,mu,lam5,ZX0,ZXP,lam3,lam4,lam7,g3,              & 
& A,B,Q2,Q3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,O,eta,Y3,Yf,Vv,cplAhAhhh,cplAhetIXO,        & 
& cplAhXPcXP,cpletIetIhh,cpletIHpcXP,cpletIXPcHp,cplhhhhhh,cplhhHpcHp,cplhhXOXO,         & 
& cplhhXPcXP,cplHpXOcXP,cplXOXPcHp,cplVGVGVG,cplcChiChiAhL,cplcChiChiAhR,cplcFdFdAhL,    & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplNvNvAhL,cplNvNvAhR,     & 
& cplChiFeetIL,cplChiFeetIR,cplChiFeXOL,cplChiFeXOR,cplFvChicXPL,cplFvChicXPR,           & 
& cplcChiChihhL,cplcChiChihhR,cplNvChicHpL,cplNvChicHpR,cplFvNvetIL,cplFvNvetIR,         & 
& cplcChicFeetIL,cplcChicFeetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,         & 
& cplFvFeHpL,cplFvFeHpR,cplcFeFehhL,cplcFeFehhR,cplNvFeXPL,cplNvFeXPR,cplcFuFuhhL,       & 
& cplcFuFuhhR,cplcFdFucHpL,cplcFdFucHpR,cplFvNvXOL,cplFvNvXOR,cplcChiFvXPL,              & 
& cplcChiFvXPR,cplcFeFvcHpL,cplcFeFvcHpR,cplNvNvhhL,cplNvNvhhR,cplcChiNvHpL,             & 
& cplcChiNvHpR,cplcFeNvcXPL,cplcFeNvcXPR,cplcChicFeXOL,cplcChicFeXOR,cplcFdFdVGL,        & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: lam1,v,mu,lam5,lam3,lam4,lam7,g3,A,B,eta(3),Y3(3),Yf(3)

Complex(dp), Intent(in) :: ZX0(2,2),ZXP(2,2),Q2(2,2),Q3(2,2),Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),         & 
& ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),O(3,3),Vv(3,3)

Complex(dp), Intent(out) :: cplAhAhhh,cplAhetIXO(2),cplAhXPcXP(2,2),cpletIetIhh,cpletIHpcXP(2),cpletIXPcHp(2),    & 
& cplhhhhhh,cplhhHpcHp,cplhhXOXO(2,2),cplhhXPcXP(2,2),cplHpXOcXP(2,2),cplXOXPcHp(2,2),   & 
& cplVGVGVG,cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),     & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplNvNvAhL(3,3),   & 
& cplNvNvAhR(3,3),cplChiFeetIL(2,3),cplChiFeetIR(2,3),cplChiFeXOL(2,3,2),cplChiFeXOR(2,3,2),& 
& cplFvChicXPL(3,2,2),cplFvChicXPR(3,2,2),cplcChiChihhL(2,2),cplcChiChihhR(2,2),         & 
& cplNvChicHpL(3,2),cplNvChicHpR(3,2),cplFvNvetIL(3,3),cplFvNvetIR(3,3),cplcChicFeetIL(2,3),& 
& cplcChicFeetIR(2,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),& 
& cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplNvFeXPL(3,3,2),   & 
& cplNvFeXPR(3,3,2),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplFvNvXOL(3,3,2),cplFvNvXOR(3,3,2),cplcChiFvXPL(2,3,2),cplcChiFvXPR(2,3,2),           & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplcChiNvHpL(2,3), & 
& cplcChiNvHpR(2,3),cplcFeNvcXPL(3,3,2),cplcFeNvcXPR(3,3,2),cplcChicFeXOL(2,3,2),        & 
& cplcChicFeXOR(2,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhhh = 0._dp 
Call CouplingAhAhhh2L(lam1,v,cplAhAhhh)



cplAhetIXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIXO2L(gt3,mu,lam5,v,ZX0,cplAhetIXO(gt3))

End Do 


cplAhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXPcXP2L(gt2,gt3,mu,ZXP,cplAhXPcXP(gt2,gt3))

 End Do 
End Do 


cpletIetIhh = 0._dp 
Call CouplingetIetIhh2L(lam3,lam4,lam5,v,cpletIetIhh)



cpletIHpcXP = 0._dp 
Do gt3 = 1, 2
Call CouplingetIHpcXP2L(gt3,lam4,mu,lam5,v,ZXP,cpletIHpcXP(gt3))

End Do 


cpletIXPcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcHp2L(gt2,lam4,mu,lam5,v,ZXP,cpletIXPcHp(gt2))

End Do 


cplhhhhhh = 0._dp 
Call Couplinghhhhhh2L(lam1,v,cplhhhhhh)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHp2L(lam1,v,cplhhHpcHp)



cplhhXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXO2L(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhXOXO(gt2,gt3))

 End Do 
End Do 


cplhhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcXP2L(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcXP(gt2,gt3))

 End Do 
End Do 


cplHpXOcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOcXP2L(gt2,gt3,lam4,mu,lam5,v,ZXP,ZX0,cplHpXOcXP(gt2,gt3))

 End Do 
End Do 


cplXOXPcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcHp2L(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,cplXOXPcHp(gt1,gt2))

 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcChiChiAhL = 0._dp 
cplcChiChiAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiAh2L(gt1,gt2,A,B,Q2,Q3,cplcChiChiAhL(gt1,gt2),cplcChiChiAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplNvNvAhL = 0._dp 
cplNvNvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvAh2L(gt1,gt2,A,B,O,cplNvNvAhL(gt1,gt2),cplNvNvAhR(gt1,gt2))

 End Do 
End Do 


cplChiFeetIL = 0._dp 
cplChiFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingChiFeetI2L(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplChiFeetIL(gt1,gt2)            & 
& ,cplChiFeetIR(gt1,gt2))

 End Do 
End Do 


cplChiFeXOL = 0._dp 
cplChiFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingChiFeXO2L(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplChiFeXOL(gt1,gt2,gt3)& 
& ,cplChiFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvChicXPL = 0._dp 
cplFvChicXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingFvChicXP2L(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplFvChicXPL(gt1,gt2,gt3)     & 
& ,cplFvChicXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiChihhL = 0._dp 
cplcChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChihh2L(gt1,gt2,A,B,Q2,Q3,cplcChiChihhL(gt1,gt2),cplcChiChihhR(gt1,gt2))

 End Do 
End Do 


cplNvChicHpL = 0._dp 
cplNvChicHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicHp2L(gt1,gt2,A,B,O,Q2,Q3,cplNvChicHpL(gt1,gt2),cplNvChicHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvetIL = 0._dp 
cplFvNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvNvetI2L(gt1,gt2,eta,Vv,O,cplFvNvetIL(gt1,gt2),cplFvNvetIR(gt1,gt2))

 End Do 
End Do 


cplcChicFeetIL = 0._dp 
cplcChicFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChicFeetI2L(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplcChicFeetIL(gt1,gt2)        & 
& ,cplcChicFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhh2L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)             & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplFvFeHpL = 0._dp 
cplFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFeHp2L(gt1,gt2,Ye,Vv,ZER,cplFvFeHpL(gt1,gt2),cplFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehh2L(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplNvFeXPL = 0._dp 
cplNvFeXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingNvFeXP2L(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplNvFeXPL(gt1,gt2,gt3)     & 
& ,cplNvFeXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhh2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)           & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplFvNvXOL = 0._dp 
cplFvNvXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvNvXO2L(gt1,gt2,gt3,eta,Yf,Vv,O,ZX0,cplFvNvXOL(gt1,gt2,gt3)             & 
& ,cplFvNvXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChiFvXPL = 0._dp 
cplcChiFvXPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChiFvXP2L(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,cplcChiFvXPL(gt1,gt2,gt3)     & 
& ,cplcChiFvXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHp2L(gt1,gt2,Ye,Vv,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplNvNvhhL = 0._dp 
cplNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvhh2L(gt1,gt2,A,B,O,cplNvNvhhL(gt1,gt2),cplNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplcChiNvHpL = 0._dp 
cplcChiNvHpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChiNvHp2L(gt1,gt2,A,B,O,Q2,Q3,cplcChiNvHpL(gt1,gt2),cplcChiNvHpR(gt1,gt2))

 End Do 
End Do 


cplcFeNvcXPL = 0._dp 
cplcFeNvcXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeNvcXP2L(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,cplcFeNvcXPL(gt1,gt2,gt3) & 
& ,cplcFeNvcXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChicFeXOL = 0._dp 
cplcChicFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChicFeXO2L(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,cplcChicFeXOL(gt1,gt2,gt3)& 
& ,cplcChicFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhetIetI2L(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetI2L  
 
 
Subroutine CouplingAhAhhhhh2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHpcHp2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHp2L  
 
 
Subroutine CouplingAhAhXOXO2L(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res+lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXOXO2L  
 
 
Subroutine CouplingAhAhXPcXP2L(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXPcXP2L  
 
 
Subroutine CouplingetIetIetIetI2L(lam2,res)

Implicit None 

Real(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetI2L  
 
 
Subroutine CouplingetIetIhhhh2L(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res+lam5
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhh2L  
 
 
Subroutine CouplingetIetIHpcHp2L(lam3,res)

Implicit None 

Real(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHpcHp2L  
 
 
Subroutine CouplingetIetIXOXO2L(gt3,gt4,lam2,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam2*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXOXO2L  
 
 
Subroutine CouplingetIetIXPcXP2L(gt3,gt4,lam2,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam2*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXPcXP2L  
 
 
Subroutine Couplinghhhhhhhh2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHpcHp2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2L  
 
 
Subroutine CouplinghhhhXOXO2L(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXOXO2L  
 
 
Subroutine CouplinghhhhXPcXP2L(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXPcXP2L  
 
 
Subroutine CouplingHpHpcHpcHp2L(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHp2L  
 
 
Subroutine CouplingHpHpcXPcXP2L(gt3,gt4,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-2*lam5*ZXP(gt3,1)*ZXP(gt4,1)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcXPcXP2L  
 
 
Subroutine CouplingHpXOXOcHp2L(gt2,gt3,lam3,lam7,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOXOcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt2.eq.gt3)) Then 
res = res-(lam3*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
End If 
If ((gt2.eq.gt3)) Then 
res = res-(lam7*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOXOcHp2L  
 
 
Subroutine CouplingHpXPcHpcXP2L(gt2,gt4,lam3,lam4,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXPcHpcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt2.eq.gt4)) Then 
res = res-(lam3*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
End If 
If ((gt2.eq.gt4)) Then 
res = res-(lam4*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
End If 
If ((gt2.eq.gt4)) Then 
res = res-(lam7*Conjg(ZXP(gt2,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXPcHpcXP2L  
 
 
Subroutine CouplingXOXOXOXO2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOXOXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*lam2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*lam6*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOXOXO2L  
 
 
Subroutine CouplingXOXOXPcXP2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam6*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOXPcXP2L  
 
 
Subroutine CouplingXPXPcHpcHp2L(gt1,gt2,lam5,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPXPcHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2)) Then 
res = res-2*lam5*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,1))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPXPcHpcHp2L  
 
 
Subroutine CouplingXPXPcXPcXP2L(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPXPcXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam2*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,1))*ZXP(gt3,1)*ZXP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,1))*ZXP(gt3,2)*ZXP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,2))*ZXP(gt3,2)*ZXP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,1))*ZXP(gt3,1)*ZXP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*Conjg(ZXP(gt1,1))*Conjg(ZXP(gt2,2))*ZXP(gt3,1)*ZXP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam6*Conjg(ZXP(gt1,2))*Conjg(ZXP(gt2,2))*ZXP(gt3,2)*ZXP(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPXPcXPcXP2L  
 
 
Subroutine CouplingAhAhhh2L(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine CouplingAhetIXO2L(gt3,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam5*v*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt3,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIXO2L  
 
 
Subroutine CouplingAhXPcXP2L(gt2,gt3,mu,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: mu

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhXPcXP2L  
 
 
Subroutine CouplingetIetIhh2L(lam3,lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
res = 0._dp 
res = res-(lam3*v)
res = res-(lam4*v)
res = res+lam5*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhh2L  
 
 
Subroutine CouplingetIHpcXP2L(gt3,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*v*ZXP(gt3,1))/2._dp
res = res-(lam5*v*ZXP(gt3,1))/2._dp
res = res-(mu*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcXP2L  
 
 
Subroutine CouplingetIXPcHp2L(gt2,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(lam5*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(mu*Conjg(ZXP(gt2,2)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcHp2L  
 
 
Subroutine Couplinghhhhhh2L(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*lam1*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHpcHp2L(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2L  
 
 
Subroutine CouplinghhXOXO2L(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam4,lam7,mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXOXO' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam4*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam5*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1)))/2._dp
res = res+(mu*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2)))/2._dp
res = res-(lam7*v*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXOXO2L  
 
 
Subroutine CouplinghhXPcXP2L(gt2,gt3,lam3,lam7,mu,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7,mu,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZXP(gt2,1))*ZXP(gt3,1))
res = res-(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = res-(lam7*v*Conjg(ZXP(gt2,2))*ZXP(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXPcXP2L  
 
 
Subroutine CouplingHpXOcXP2L(gt2,gt3,lam4,mu,lam5,v,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZX0(gt2,1))*ZXP(gt3,1))/2._dp
res = res-(lam5*v*Conjg(ZX0(gt2,1))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZX0(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZX0(gt2,1))*ZXP(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOcXP2L  
 
 
Subroutine CouplingXOXPcHp2L(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(lam5*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcHp2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcChiChiAh2L(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL+(A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp)
resR = 0._dp 
resR = resR+(B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp)
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiAh2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingNvNvAh2L(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL+(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR-(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR-(B*O(gt1,1)*O(gt2,3))/2._dp
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvAh2L  
 
 
Subroutine CouplingChiFeetI2L(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*eta(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp))
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeetI2L  
 
 
Subroutine CouplingChiFeXO2L(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZX0(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,2))*Conjg(ZEL(gt2,j1))*Conjg(ZX0(gt3,2))*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZX0(gt3,1))*eta(j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,1))*Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeXO2L  
 
 
Subroutine CouplingFvChicXP2L(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),Q2(2,2),Q3(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvChicXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt2,2))*Conjg(Vv(gt1,j1))*Yf(j1)*ZXP(gt3,2))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Q3(gt2,1)*Vv(gt1,j1)*eta(j1)*ZXP(gt3,1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvChicXP2L  
 
 
Subroutine CouplingcChiChihh2L(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL-((A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp))
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChihh2L  
 
 
Subroutine CouplingNvChicHp2L(gt1,gt2,A,B,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvChicHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(B*Conjg(O(gt1,3))*Conjg(Q2(gt2,1)))
resL = resL-((B*Conjg(O(gt1,1))*Conjg(Q2(gt2,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR+A*O(gt1,2)*Q3(gt2,1)
resR = resR-((A*O(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvChicHp2L  
 
 
Subroutine CouplingFvNvetI2L(gt1,gt2,eta,Vv,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*eta(j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvetI2L  
 
 
Subroutine CouplingcChicFeetI2L(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q3(gt1,2))*Conjg(ZER(gt2,j1))*Y3(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Q2(gt1,1)*ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicFeetI2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHp2L  
 
 
Subroutine CouplingFvFeHp2L(gt1,gt2,Ye,Vv,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*Vv(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHp2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingNvFeXP2L(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZXP(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvFeXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt1,3))*Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,2))*Yf(j1))/sqrt(2._dp)
End Do 
Do j1 = 1,3
resL = resL-((Conjg(O(gt1,1))*Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+Conjg(ZXP(gt3,1))*O(gt1,2)*ZER(gt2,j1)*Y3(j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvFeXP2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucHp2L(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2L  
 
 
Subroutine CouplingFvNvXO2L(gt1,gt2,gt3,eta,Yf,Vv,O,ZX0,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3),ZX0(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,3))*Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,2))*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resL = resL-(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,1))*eta(j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*O(gt2,3)*Vv(gt1,j1)*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-(Conjg(ZX0(gt3,1))*O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvXO2L  
 
 
Subroutine CouplingcChiFvXP2L(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),Q2(2,2),Q3(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiFvXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(Q3(gt1,1))*Conjg(Vv(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Conjg(ZXP(gt3,2))*Q2(gt1,2)*Vv(gt2,j1)*Yf(j1))/sqrt(2._dp))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiFvXP2L  
 
 
Subroutine CouplingcFeFvcHp2L(gt1,gt2,Ye,Vv,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(Vv(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2L  
 
 
Subroutine CouplingNvNvhh2L(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL-(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR+(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR+(B*O(gt1,1)*O(gt2,3))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvhh2L  
 
 
Subroutine CouplingcChiNvHp2L(gt1,gt2,A,B,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiNvHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+A*Conjg(O(gt2,2))*Conjg(Q3(gt1,1))
resL = resL-((A*Conjg(O(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-(B*O(gt2,3)*Q2(gt1,1))
resR = resR-((B*O(gt2,1)*Q2(gt1,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiNvHp2L  
 
 
Subroutine CouplingcFeNvcXP2L(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZXP(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeNvcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+Conjg(O(gt2,2))*Conjg(ZER(gt1,j1))*Y3(j1)*ZXP(gt3,1)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((O(gt2,1)*ZEL(gt1,j1)*eta(j1)*ZXP(gt3,1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resR = resR+(O(gt2,3)*ZEL(gt1,j1)*Yf(j1)*ZXP(gt3,2))/sqrt(2._dp)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeNvcXP2L  
 
 
Subroutine CouplingcChicFeXO2L(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,ZEL,ZER,               & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZX0(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q3(gt1,2))*Conjg(ZER(gt2,j1))*Conjg(ZX0(gt3,1))*Y3(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*Q2(gt1,2)*ZEL(gt2,j1)*Yf(j1))/2._dp
End Do 
Do j1 = 1,3
resR = resR-((Conjg(ZX0(gt3,1))*Q2(gt1,1)*ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicFeXO2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsForLoopMasses(eta,Yf,Q2,Q3,ZXP,O,Ye,ZER,g2,ZEL,g1,Vv,             & 
& TW,ZX0,A,B,Y3,mu,lam4,lam5,v,lam3,lam7,lam2,lam8,lam6,Yd,ZDL,ZDR,g3,Yu,ZUL,            & 
& ZUR,lam1,cplUFvChicXPL,cplUFvChicXPR,cplUFvNvetIL,cplUFvNvetIR,cplUFvFeHpL,            & 
& cplUFvFeHpR,cplUFvFeVWpL,cplUFvFeVWpR,cplUFvFvVZL,cplUFvFvVZR,cplUFvNvXOL,             & 
& cplUFvNvXOR,cplUNvNvAhL,cplUNvNvAhR,cplUNvChicHpL,cplUNvChicHpR,cplUNvChicVWpL,        & 
& cplUNvChicVWpR,cplFvUNvetIL,cplFvUNvetIR,cplUNvFeXPL,cplUNvFeXPR,cplFvUNvXOL,          & 
& cplFvUNvXOR,cplUNvNvhhL,cplUNvNvhhR,cplUNvNvVZL,cplUNvNvVZR,cplcUChiChiAhL,            & 
& cplcUChiChiAhR,cplcUChiChihhL,cplcUChiChihhR,cplcUChiChiVPL,cplcUChiChiVPR,            & 
& cplcUChiChiVZL,cplcUChiChiVZR,cplcUChicFeetIL,cplcUChicFeetIR,cplcUChiFvXPL,           & 
& cplcUChiFvXPR,cplcUChiNvHpL,cplcUChiNvHpR,cplcUChiNvVWpL,cplcUChiNvVWpR,               & 
& cplcUChicFeXOL,cplcUChicFeXOR,cplAhXPcUXP,cplFvChicUXPL,cplFvChicUXPR,cpletIHpcUXP,    & 
& cpletIcUXPVWp,cplhhXPcUXP,cplHpXOcUXP,cplcFeNvcUXPL,cplcFeNvcUXPR,cplXPcUXPVP,         & 
& cplXOcUXPVWp,cplXPcUXPVZ,cplAhAhUXPcUXP,cpletIetIUXPcUXP,cplhhhhUXPcUXP,               & 
& cplHpUXPcHpcUXP,cplUXPcUXPVPVP,cplUXPcUXPcVWpVWp,cplUXPcUXPVZVZ,cplXOXOUXPcUXP,        & 
& cplUXPXPcUXPcXP,cplAhetIUXO,cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,         & 
& cplFvNvUXOR,cplhhUXOXO,cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,         & 
& cplhhhhUXOUXO,cplHpUXOUXOcHp,cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,             & 
& cplUXOUXOXPcXP,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,       & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHpL,        & 
& cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdHpL,    & 
& cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,   & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvcVWpL,     & 
& cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,cplcChicUFeXOL,cplcChicUFeXOR,              & 
& cplAhcHpVWp,cplNvChicHpL,cplNvChicHpR,cpletIXPcHp,cplcFdFucHpL,cplcFdFucHpR,           & 
& cplcFeFvcHpL,cplcFeFvcHpR,cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,cplcgZgWCHp,           & 
& cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplXOXPcHp,       & 
& cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,   & 
& cplHpcHpVZVZ,cplHpXOXOcHp,cplHpXPcHpcXP,cplAhAhhh,cplcChiChiAhL,cplcChiChiAhR,         & 
& cplAhetIXO,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL,cplNvNvAhR,cplAhXPcXP,      & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO,          & 
& cplAhAhXPcXP,cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,cplhhVZVZ,         & 
& cplhhXOXO,cplhhXPcXP,cpletIetIhhhh,cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ,             & 
& cplhhhhXOXO,cplhhhhXPcXP,cplChiFeetIL,cplChiFeetIR,cplFvNvetIL,cplFvNvetIR,            & 
& cpletIHpcXP,cpletIcXPVWp,cpletIXOVZ,cpletIetIetIetI,cpletIetIcVWpVWp,cpletIetIVZVZ,    & 
& cpletIetIXOXO,cpletIetIXPcXP,cplcChiChiVZL,cplcChiChiVZR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWCgWpVZ,    & 
& cplHpcVWpVZ,cplNvNvVZL,cplNvNvVZR,cplcVWpVWpVZ,cplXPcXPVZ,cplcVWpVWpVZVZ1,             & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOVZVZ,cplXPcXPVZVZ,cplNvChicVWpL,cplNvChicVWpR,  & 
& cpletIXPcVWp,cplcFdFucVWpL,cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplHpcVWpVP,      & 
& cplcVWpVPVWp,cplXOXPcVWp,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,              & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplXOXOcVWpVWp,               & 
& cplXPcXPcVWpVWp)

Implicit None 
Real(dp), Intent(in) :: eta(3),Yf(3),g2,g1,TW,A,B,Y3(3),mu,lam4,lam5,v,lam3,lam7,lam2,lam8,lam6,g3,lam1

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZXP(2,2),O(3,3),Ye(3,3),ZER(3,3),ZEL(3,3),Vv(3,3),ZX0(2,2),           & 
& Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplUFvChicXPL(3,2,2),cplUFvChicXPR(3,2,2),cplUFvNvetIL(3,3),cplUFvNvetIR(3,3),        & 
& cplUFvFeHpL(3,3),cplUFvFeHpR(3,3),cplUFvFeVWpL(3,3),cplUFvFeVWpR(3,3),cplUFvFvVZL(3,3),& 
& cplUFvFvVZR(3,3),cplUFvNvXOL(3,3,2),cplUFvNvXOR(3,3,2),cplUNvNvAhL(3,3),               & 
& cplUNvNvAhR(3,3),cplUNvChicHpL(3,2),cplUNvChicHpR(3,2),cplUNvChicVWpL(3,2),            & 
& cplUNvChicVWpR(3,2),cplFvUNvetIL(3,3),cplFvUNvetIR(3,3),cplUNvFeXPL(3,3,2),            & 
& cplUNvFeXPR(3,3,2),cplFvUNvXOL(3,3,2),cplFvUNvXOR(3,3,2),cplUNvNvhhL(3,3),             & 
& cplUNvNvhhR(3,3),cplUNvNvVZL(3,3),cplUNvNvVZR(3,3),cplcUChiChiAhL(2,2),cplcUChiChiAhR(2,2),& 
& cplcUChiChihhL(2,2),cplcUChiChihhR(2,2),cplcUChiChiVPL(2,2),cplcUChiChiVPR(2,2),       & 
& cplcUChiChiVZL(2,2),cplcUChiChiVZR(2,2),cplcUChicFeetIL(2,3),cplcUChicFeetIR(2,3),     & 
& cplcUChiFvXPL(2,3,2),cplcUChiFvXPR(2,3,2),cplcUChiNvHpL(2,3),cplcUChiNvHpR(2,3),       & 
& cplcUChiNvVWpL(2,3),cplcUChiNvVWpR(2,3),cplcUChicFeXOL(2,3,2),cplcUChicFeXOR(2,3,2),   & 
& cplAhXPcUXP(2,2),cplFvChicUXPL(3,2,2),cplFvChicUXPR(3,2,2),cpletIHpcUXP(2),            & 
& cpletIcUXPVWp(2),cplhhXPcUXP(2,2),cplHpXOcUXP(2,2),cplcFeNvcUXPL(3,3,2),               & 
& cplcFeNvcUXPR(3,3,2),cplXPcUXPVP(2,2),cplXOcUXPVWp(2,2),cplXPcUXPVZ(2,2),              & 
& cplAhAhUXPcUXP(2,2),cpletIetIUXPcUXP(2,2),cplhhhhUXPcUXP(2,2),cplHpUXPcHpcUXP(2,2),    & 
& cplUXPcUXPVPVP(2,2),cplUXPcUXPcVWpVWp(2,2),cplUXPcUXPVZVZ(2,2),cplXOXOUXPcUXP(2,2,2,2),& 
& cplUXPXPcUXPcXP(2,2,2,2),cplAhetIUXO(2),cplChiFeUXOL(2,3,2),cplChiFeUXOR(2,3,2),       & 
& cpletIUXOVZ(2),cplFvNvUXOL(3,3,2),cplFvNvUXOR(3,3,2),cplhhUXOXO(2,2),cplHpUXOcXP(2,2), & 
& cplUXOcXPVWp(2,2),cplAhAhUXOUXO(2,2),cpletIetIUXOUXO(2,2),cplhhhhUXOUXO(2,2),          & 
& cplHpUXOUXOcHp(2,2),cplUXOUXOcVWpVWp(2,2),cplUXOUXOVZVZ(2,2),cplUXOUXOXOXO(2,2,2,2),   & 
& cplUXOUXOXPcXP(2,2,2,2),cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),         & 
& cplcUFdFdhhR(3,3),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),               & 
& cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),              & 
& cplcUFdFucHpR(3,3),cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFuFuAhL(3,3),          & 
& cplcUFuFuAhR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),              & 
& cplcUFuFdVWpR(3,3),cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),              & 
& cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),               & 
& cplcUFuFuVZR(3,3),cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcChicUFeetIL(2,3),            & 
& cplcChicUFeetIR(2,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),            & 
& cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),              & 
& cplcUFeFvcHpR(3,3),cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFeNvcXPL(3,3,2),       & 
& cplcUFeNvcXPR(3,3,2),cplcChicUFeXOL(2,3,2),cplcChicUFeXOR(2,3,2),cplAhcHpVWp,          & 
& cplNvChicHpL(3,2),cplNvChicHpR(3,2),cpletIXPcHp(2),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),& 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcgZgWpcHp,cplcgWpgZHp,cplcgWCgZcHp,             & 
& cplcgZgWCHp,cplhhHpcHp,cplhhcHpVWp,cplHpcHpVP,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,      & 
& cplXOXPcHp(2,2),cplAhAhHpcHp,cpletIetIHpcHp,cplhhhhHpcHp,cplHpHpcHpcHp,cplHpcHpVPVP,   & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplHpXOXOcHp(2,2),cplHpXPcHpcXP(2,2),cplAhAhhh

Complex(dp), Intent(out) :: cplcChiChiAhL(2,2),cplcChiChiAhR(2,2),cplAhetIXO(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3), & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,      & 
& cplcgWCgWCAh,cplAhhhVZ,cplAhHpcVWp,cplNvNvAhL(3,3),cplNvNvAhR(3,3),cplAhXPcXP(2,2),    & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhAhXOXO(2,2),     & 
& cplAhAhXPcXP(2,2),cplcChiChihhL(2,2),cplcChiChihhR(2,2),cpletIetIhh,cplcFdFdhhL(3,3),  & 
& cplcFdFdhhR(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),  & 
& cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplNvNvhhL(3,3),            & 
& cplNvNvhhR(3,3),cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcXP(2,2),cpletIetIhhhh,   & 
& cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO(2,2),cplhhhhXPcXP(2,2),             & 
& cplChiFeetIL(2,3),cplChiFeetIR(2,3),cplFvNvetIL(3,3),cplFvNvetIR(3,3),cpletIHpcXP(2),  & 
& cpletIcXPVWp(2),cpletIXOVZ(2),cpletIetIetIetI,cpletIetIcVWpVWp,cpletIetIVZVZ,          & 
& cpletIetIXOXO(2,2),cpletIetIXPcXP(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWCgWpVZ,cplHpcVWpVZ,             & 
& cplNvNvVZL(3,3),cplNvNvVZR(3,3),cplcVWpVWpVZ,cplXPcXPVZ(2,2),cplcVWpVWpVZVZ1,          & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplXOXOVZVZ(2,2),cplXPcXPVZVZ(2,2),cplNvChicVWpL(3,2), & 
& cplNvChicVWpR(3,2),cpletIXPcVWp(2),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),              & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplHpcVWpVP,cplcVWpVPVWp,cplXOXPcVWp(2,2),       & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplXOXOcVWpVWp(2,2),cplXPcXPcVWpVWp(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplUFvChicXPL = 0._dp 
cplUFvChicXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUFvChicXPL(gt1,gt2,gt3,eta,Yf,Q2,Q3,ZXP,cplUFvChicXPL(gt1,gt2,gt3)       & 
& ,cplUFvChicXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvNvetIL = 0._dp 
cplUFvNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvNvetIL(gt1,gt2,eta,O,cplUFvNvetIL(gt1,gt2),cplUFvNvetIR(gt1,gt2))

 End Do 
End Do 


cplUFvFeHpL = 0._dp 
cplUFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFeHpL(gt1,gt2,Ye,ZER,cplUFvFeHpL(gt1,gt2),cplUFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplUFvFeVWpL = 0._dp 
cplUFvFeVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFeVWpL(gt1,gt2,g2,ZEL,cplUFvFeVWpL(gt1,gt2),cplUFvFeVWpR(gt1,gt2))

 End Do 
End Do 


cplUFvFvVZL = 0._dp 
cplUFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFvVZL(gt1,gt2,g1,g2,Vv,TW,cplUFvFvVZL(gt1,gt2),cplUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplUFvNvXOL = 0._dp 
cplUFvNvXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingUFvNvXOL(gt1,gt2,gt3,eta,Yf,O,ZX0,cplUFvNvXOL(gt1,gt2,gt3)               & 
& ,cplUFvNvXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUNvNvAhL = 0._dp 
cplUNvNvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUNvNvAhL(gt1,gt2,A,B,O,cplUNvNvAhL(gt1,gt2),cplUNvNvAhR(gt1,gt2))

 End Do 
End Do 


cplUNvChicHpL = 0._dp 
cplUNvChicHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingUNvChicHpL(gt1,gt2,A,B,Q2,Q3,cplUNvChicHpL(gt1,gt2),cplUNvChicHpR(gt1,gt2))

 End Do 
End Do 


cplUNvChicVWpL = 0._dp 
cplUNvChicVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingUNvChicVWpL(gt1,gt2,g2,Q2,Q3,cplUNvChicVWpL(gt1,gt2),cplUNvChicVWpR(gt1,gt2))

 End Do 
End Do 


cplFvUNvetIL = 0._dp 
cplFvUNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvUNvetIL(gt1,gt2,eta,Vv,cplFvUNvetIL(gt1,gt2),cplFvUNvetIR(gt1,gt2))

 End Do 
End Do 


cplUNvFeXPL = 0._dp 
cplUNvFeXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingUNvFeXPL(gt1,gt2,gt3,eta,Yf,Y3,ZXP,ZEL,ZER,cplUNvFeXPL(gt1,gt2,gt3)      & 
& ,cplUNvFeXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvUNvXOL = 0._dp 
cplFvUNvXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvUNvXOL(gt1,gt2,gt3,eta,Yf,Vv,ZX0,cplFvUNvXOL(gt1,gt2,gt3)              & 
& ,cplFvUNvXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUNvNvhhL = 0._dp 
cplUNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUNvNvhhL(gt1,gt2,A,B,O,cplUNvNvhhL(gt1,gt2),cplUNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplUNvNvVZL = 0._dp 
cplUNvNvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUNvNvVZL(gt1,gt2,g1,g2,O,TW,cplUNvNvVZL(gt1,gt2),cplUNvNvVZR(gt1,gt2))

 End Do 
End Do 


cplcUChiChiAhL = 0._dp 
cplcUChiChiAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcUChiChiAhL(gt1,gt2,A,B,Q2,Q3,cplcUChiChiAhL(gt1,gt2),cplcUChiChiAhR(gt1,gt2))

 End Do 
End Do 


cplcUChiChihhL = 0._dp 
cplcUChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcUChiChihhL(gt1,gt2,A,B,Q2,Q3,cplcUChiChihhL(gt1,gt2),cplcUChiChihhR(gt1,gt2))

 End Do 
End Do 


cplcUChiChiVPL = 0._dp 
cplcUChiChiVPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcUChiChiVPL(gt1,gt2,g1,g2,Q2,Q3,TW,cplcUChiChiVPL(gt1,gt2)               & 
& ,cplcUChiChiVPR(gt1,gt2))

 End Do 
End Do 


cplcUChiChiVZL = 0._dp 
cplcUChiChiVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcUChiChiVZL(gt1,gt2,g1,g2,Q2,Q3,TW,cplcUChiChiVZL(gt1,gt2)               & 
& ,cplcUChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcUChicFeetIL = 0._dp 
cplcUChicFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcUChicFeetIL(gt1,gt2,eta,Y3,ZEL,ZER,cplcUChicFeetIL(gt1,gt2)             & 
& ,cplcUChicFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUChiFvXPL = 0._dp 
cplcUChiFvXPR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUChiFvXPL(gt1,gt2,gt3,eta,Yf,Vv,ZXP,cplcUChiFvXPL(gt1,gt2,gt3)          & 
& ,cplcUChiFvXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUChiNvHpL = 0._dp 
cplcUChiNvHpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcUChiNvHpL(gt1,gt2,A,B,O,cplcUChiNvHpL(gt1,gt2),cplcUChiNvHpR(gt1,gt2))

 End Do 
End Do 


cplcUChiNvVWpL = 0._dp 
cplcUChiNvVWpR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcUChiNvVWpL(gt1,gt2,g2,O,cplcUChiNvVWpL(gt1,gt2),cplcUChiNvVWpR(gt1,gt2))

 End Do 
End Do 


cplcUChicFeXOL = 0._dp 
cplcUChicFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUChicFeXOL(gt1,gt2,gt3,eta,Yf,Y3,ZX0,ZEL,ZER,cplcUChicFeXOL(gt1,gt2,gt3)& 
& ,cplcUChicFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhXPcUXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXPcUXPL(gt2,gt3,mu,ZXP,cplAhXPcUXP(gt2,gt3))

 End Do 
End Do 


cplFvChicUXPL = 0._dp 
cplFvChicUXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingFvChicUXPL(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,cplFvChicUXPL(gt1,gt2,gt3)        & 
& ,cplFvChicUXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIHpcUXP = 0._dp 
Do gt3 = 1, 2
Call CouplingetIHpcUXPL(gt3,lam4,mu,lam5,v,cpletIHpcUXP(gt3))

End Do 


cpletIcUXPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcUXPVWpL(gt2,g2,cpletIcUXPVWp(gt2))

End Do 


cplhhXPcUXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcUXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcUXP(gt2,gt3))

 End Do 
End Do 


cplHpXOcUXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOcUXPL(gt2,gt3,lam4,mu,lam5,v,ZX0,cplHpXOcUXP(gt2,gt3))

 End Do 
End Do 


cplcFeNvcUXPL = 0._dp 
cplcFeNvcUXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeNvcUXPL(gt1,gt2,gt3,eta,Yf,Y3,O,ZEL,ZER,cplcFeNvcUXPL(gt1,gt2,gt3)    & 
& ,cplcFeNvcUXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplXPcUXPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcUXPVPL(gt1,gt2,g1,g2,ZXP,TW,cplXPcUXPVP(gt1,gt2))

 End Do 
End Do 


cplXOcUXPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOcUXPVWpL(gt1,gt2,g2,ZX0,cplXOcUXPVWp(gt1,gt2))

 End Do 
End Do 


cplXPcUXPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcUXPVZL(gt1,gt2,g1,g2,ZXP,TW,cplXPcUXPVZ(gt1,gt2))

 End Do 
End Do 


cplAhAhUXPcUXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUXPcUXPL(gt3,gt4,lam3,lam7,cplAhAhUXPcUXP(gt3,gt4))

 End Do 
End Do 


cpletIetIUXPcUXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUXPcUXPL(gt3,gt4,lam2,lam8,cpletIetIUXPcUXP(gt3,gt4))

 End Do 
End Do 


cplhhhhUXPcUXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhUXPcUXPL(gt3,gt4,lam3,lam7,cplhhhhUXPcUXP(gt3,gt4))

 End Do 
End Do 


cplHpUXPcHpcUXP = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpUXPcHpcUXPL(gt2,gt4,lam3,lam4,lam7,cplHpUXPcHpcUXP(gt2,gt4))

 End Do 
End Do 


cplUXPcUXPVPVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXPcUXPVPVPL(gt1,gt2,g1,g2,TW,cplUXPcUXPVPVP(gt1,gt2))

 End Do 
End Do 


cplUXPcUXPcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXPcUXPcVWpVWpL(gt1,gt2,g2,cplUXPcUXPcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUXPcUXPVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXPcUXPVZVZL(gt1,gt2,g1,g2,TW,cplUXPcUXPVZVZ(gt1,gt2))

 End Do 
End Do 


cplXOXOUXPcUXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingXOXOUXPcUXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,cplXOXOUXPcUXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUXPXPcUXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUXPXPcUXPcXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,cplUXPXPcUXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhetIUXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUXOL(gt3,mu,lam5,v,cplAhetIUXO(gt3))

End Do 


cplChiFeUXOL = 0._dp 
cplChiFeUXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingChiFeUXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZEL,ZER,cplChiFeUXOL(gt1,gt2,gt3)  & 
& ,cplChiFeUXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIUXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUXOVZL(gt2,g1,g2,TW,cpletIUXOVZ(gt2))

End Do 


cplFvNvUXOL = 0._dp 
cplFvNvUXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvNvUXOL(gt1,gt2,gt3,eta,Yf,Vv,O,cplFvNvUXOL(gt1,gt2,gt3),               & 
& cplFvNvUXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhUXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhUXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhUXOXO(gt2,gt3))

 End Do 
End Do 


cplHpUXOcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpUXOcXPL(gt2,gt3,lam4,mu,lam5,v,ZXP,cplHpUXOcXP(gt2,gt3))

 End Do 
End Do 


cplUXOcXPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOcXPVWpL(gt1,gt2,g2,ZXP,cplUXOcXPVWp(gt1,gt2))

 End Do 
End Do 


cplAhAhUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,cplAhAhUXOUXO(gt3,gt4))

 End Do 
End Do 


cpletIetIUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUXOUXOL(gt3,gt4,lam2,lam8,cpletIetIUXOUXO(gt3,gt4))

 End Do 
End Do 


cplhhhhUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,cplhhhhUXOUXO(gt3,gt4))

 End Do 
End Do 


cplHpUXOUXOcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpUXOUXOcHpL(gt2,gt3,lam3,lam7,cplHpUXOUXOcHp(gt2,gt3))

 End Do 
End Do 


cplUXOUXOcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOUXOcVWpVWpL(gt1,gt2,g2,cplUXOUXOcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUXOUXOVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOUXOVZVZL(gt1,gt2,g1,g2,TW,cplUXOUXOVZVZ(gt1,gt2))

 End Do 
End Do 


cplUXOUXOXOXO = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUXOUXOXOXOL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,cplUXOUXOXOXO(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUXOUXOXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUXOUXOXPcXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,cplUXOUXOXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcChicUFeetIL = 0._dp 
cplcChicUFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChicUFeetIL(gt1,gt2,eta,Y3,Q2,Q3,cplcChicUFeetIL(gt1,gt2)               & 
& ,cplcChicUFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,Vv,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,Vv,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFeNvcXPL = 0._dp 
cplcUFeNvcXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeNvcXPL(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,cplcUFeNvcXPL(gt1,gt2,gt3)        & 
& ,cplcUFeNvcXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChicUFeXOL = 0._dp 
cplcChicUFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChicUFeXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,cplcChicUFeXOL(gt1,gt2,gt3)  & 
& ,cplcChicUFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpL(g2,cplAhcHpVWp)



cplNvChicHpL = 0._dp 
cplNvChicHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicHpL(gt1,gt2,A,B,O,Q2,Q3,cplNvChicHpL(gt1,gt2),cplNvChicHpR(gt1,gt2))

 End Do 
End Do 


cpletIXPcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcHpL(gt2,lam4,mu,lam5,v,ZXP,cpletIXPcHp(gt2))

End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)            & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpL(gt1,gt2,Ye,Vv,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcgZgWpcHp = 0._dp 
Call CouplingcgZgWpcHpL(g1,g2,v,TW,cplcgZgWpcHp)



cplcgWpgZHp = 0._dp 
Call CouplingcgWpgZHpL(g1,g2,v,TW,cplcgWpgZHp)



cplcgWCgZcHp = 0._dp 
Call CouplingcgWCgZcHpL(g1,g2,v,TW,cplcgWCgZcHp)



cplcgZgWCHp = 0._dp 
Call CouplingcgZgWCHpL(g1,g2,v,TW,cplcgZgWCHp)



cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpL(lam1,v,cplhhHpcHp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,v,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,v,TW,cplcHpVWpVZ)



cplXOXPcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcHpL(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,cplXOXPcHp(gt1,gt2))

 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpL(lam1,cplAhAhHpcHp)



cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHpL(lam3,cpletIetIHpcHp)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpL(lam1,cplhhhhHpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpL(lam1,cplHpHpcHpcHp)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cplHpXOXOcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpXOXOcHpL(gt2,gt3,lam3,lam7,ZX0,cplHpXOXOcHp(gt2,gt3))

 End Do 
End Do 


cplHpXPcHpcXP = 0._dp 
Do gt2 = 1, 2
 Do gt4 = 1, 2
Call CouplingHpXPcHpcXPL(gt2,gt4,lam3,lam4,lam7,ZXP,cplHpXPcHpcXP(gt2,gt4))

 End Do 
End Do 


cplAhAhhh = 0._dp 
Call CouplingAhAhhhL(lam1,v,cplAhAhhh)



cplcChiChiAhL = 0._dp 
cplcChiChiAhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiAhL(gt1,gt2,A,B,Q2,Q3,cplcChiChiAhL(gt1,gt2),cplcChiChiAhR(gt1,gt2))

 End Do 
End Do 


cplAhetIXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIXOL(gt3,mu,lam5,v,ZX0,cplAhetIXO(gt3))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhL(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhL(g2,v,cplcgWCgWCAh)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpL(g2,cplAhHpcVWp)



cplNvNvAhL = 0._dp 
cplNvNvAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvAhL(gt1,gt2,A,B,O,cplNvNvAhL(gt1,gt2),cplNvNvAhR(gt1,gt2))

 End Do 
End Do 


cplAhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhXPcXPL(gt2,gt3,mu,ZXP,cplAhXPcXP(gt2,gt3))

 End Do 
End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhL(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIL(lam3,lam4,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhL(lam1,cplAhAhhhhh)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplAhAhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXOXOL(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplAhAhXOXO(gt3,gt4))

 End Do 
End Do 


cplAhAhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhXPcXPL(gt3,gt4,lam3,lam7,ZXP,cplAhAhXPcXP(gt3,gt4))

 End Do 
End Do 


cplcChiChihhL = 0._dp 
cplcChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChihhL(gt1,gt2,A,B,Q2,Q3,cplcChiChihhL(gt1,gt2),cplcChiChihhR(gt1,gt2))

 End Do 
End Do 


cpletIetIhh = 0._dp 
Call CouplingetIetIhhL(lam3,lam4,lam5,v,cpletIetIhh)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhL(g2,v,cplcgWpgWphh)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhL(g2,v,cplcgWCgWChh)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhL(g1,g2,v,TW,cplcgZgZhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhL(lam1,v,cplhhhhhh)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplNvNvhhL = 0._dp 
cplNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvhhL(gt1,gt2,A,B,O,cplNvNvhhL(gt1,gt2),cplNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,v,TW,cplhhVZVZ)



cplhhXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhXOXO(gt2,gt3))

 End Do 
End Do 


cplhhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcXP(gt2,gt3))

 End Do 
End Do 


cpletIetIhhhh = 0._dp 
Call CouplingetIetIhhhhL(lam3,lam4,lam5,cpletIetIhhhh)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhL(lam1,cplhhhhhhhh)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



cplhhhhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXOXOL(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplhhhhXOXO(gt3,gt4))

 End Do 
End Do 


cplhhhhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXPcXPL(gt3,gt4,lam3,lam7,ZXP,cplhhhhXPcXP(gt3,gt4))

 End Do 
End Do 


cplChiFeetIL = 0._dp 
cplChiFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingChiFeetIL(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,cplChiFeetIL(gt1,gt2)             & 
& ,cplChiFeetIR(gt1,gt2))

 End Do 
End Do 


cplFvNvetIL = 0._dp 
cplFvNvetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvNvetIL(gt1,gt2,eta,Vv,O,cplFvNvetIL(gt1,gt2),cplFvNvetIR(gt1,gt2))

 End Do 
End Do 


cpletIHpcXP = 0._dp 
Do gt3 = 1, 2
Call CouplingetIHpcXPL(gt3,lam4,mu,lam5,v,ZXP,cpletIHpcXP(gt3))

End Do 


cpletIcXPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVWpL(gt2,g2,ZXP,cpletIcXPVWp(gt2))

End Do 


cpletIXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXOVZL(gt2,g1,g2,ZX0,TW,cpletIXOVZ(gt2))

End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIL(lam2,cpletIetIetIetI)



cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cpletIetIXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXOXOL(gt3,gt4,lam2,lam8,ZX0,cpletIetIXOXO(gt3,gt4))

 End Do 
End Do 


cpletIetIXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIXPcXPL(gt3,gt4,lam2,lam8,ZXP,cpletIetIXPcXP(gt3,gt4))

 End Do 
End Do 


cplcChiChiVZL = 0._dp 
cplcChiChiVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVZL(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVZL(gt1,gt2),cplcChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWCgWpVZ = 0._dp 
Call CouplingcgWCgWpVZL(g2,TW,cplcgWCgWpVZ)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,v,TW,cplHpcVWpVZ)



cplNvNvVZL = 0._dp 
cplNvNvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvVZL(gt1,gt2,g1,g2,O,TW,cplNvNvVZL(gt1,gt2),cplNvNvVZR(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplXPcXPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZL(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplXOXOVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOVZVZL(gt1,gt2,g1,g2,ZX0,TW,cplXOXOVZVZ(gt1,gt2))

 End Do 
End Do 


cplXPcXPVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZVZL(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZVZ(gt1,gt2))

 End Do 
End Do 


cplNvChicVWpL = 0._dp 
cplNvChicVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicVWpL(gt1,gt2,g2,O,Q2,Q3,cplNvChicVWpL(gt1,gt2),cplNvChicVWpR(gt1,gt2))

 End Do 
End Do 


cpletIXPcVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpL(gt2,g2,ZXP,cpletIXPcVWp(gt2))

End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpL(gt1,gt2,g2,Vv,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,v,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplXOXPcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpL(gt1,gt2,g2,ZXP,ZX0,cplXOXPcVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplXOXOcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOcVWpVWpL(gt1,gt2,g2,ZX0,cplXOXOcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPcVWpVWpL(gt1,gt2,g2,ZXP,cplXPcXPcVWpVWp(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingUFvChicXPL(gt1,gt2,gt3,eta,Yf,Q2,Q3,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvChicXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((Conjg(Q2(gt2,2))*Yf(gt1)*ZXP(gt3,2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+Q3(gt2,1)*eta(gt1)*ZXP(gt3,1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvChicXPL  
 
 
Subroutine CouplingUFvNvetIL(gt1,gt2,eta,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3)

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvNvetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(Conjg(O(gt2,1))*eta(gt1))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(O(gt2,1)*eta(gt1))/2._dp
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvNvetIL  
 
 
Subroutine CouplingUFvFeHpL(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeHpL  
 
 
Subroutine CouplingUFvFeVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeVWpL  
 
 
Subroutine CouplingUFvFvVZL(gt1,gt2,g1,g2,Vv,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Vv(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(Vv(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(Vv(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Cos(TW)*Vv(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*Vv(gt2,gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZL  
 
 
Subroutine CouplingUFvNvXOL(gt1,gt2,gt3,eta,Yf,O,ZX0,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: O(3,3),ZX0(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvNvXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(Conjg(O(gt2,3))*Conjg(ZX0(gt3,2))*Yf(gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(Conjg(O(gt2,1))*Conjg(ZX0(gt3,1))*eta(gt1))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(Conjg(ZX0(gt3,2))*O(gt2,3)*Yf(gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(Conjg(ZX0(gt3,1))*O(gt2,1)*eta(gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvNvXOL  
 
 
Subroutine CouplingUNvNvAhL(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvNvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL+(A*Conjg(O(gt2,2)))/2._dp
End If 
If ((1.eq.gt1)) Then 
resL = resL+(B*Conjg(O(gt2,3)))/2._dp
End If 
If ((2.eq.gt1)) Then 
resL = resL+(A*Conjg(O(gt2,1)))/2._dp
End If 
If ((3.eq.gt1)) Then 
resL = resL+(B*Conjg(O(gt2,1)))/2._dp
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR-(A*O(gt2,1))/2._dp
End If 
If ((3.eq.gt1)) Then 
resR = resR-(B*O(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
resR = resR-(A*O(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
resR = resR-(B*O(gt2,3))/2._dp
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvNvAhL  
 
 
Subroutine CouplingUNvChicHpL(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvChicHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL-((B*Conjg(Q2(gt2,2)))/sqrt(2._dp))
End If 
If ((3.eq.gt1)) Then 
resL = resL-(B*Conjg(Q2(gt2,1)))
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR+A*Q3(gt2,1)
End If 
If ((1.eq.gt1)) Then 
resR = resR-((A*Q3(gt2,2))/sqrt(2._dp))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvChicHpL  
 
 
Subroutine CouplingUNvChicVWpL(gt1,gt2,g2,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvChicVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL+g2*Conjg(Q2(gt2,1))
End If 
If ((3.eq.gt1)) Then 
resL = resL-((g2*Conjg(Q2(gt2,2)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((1.eq.gt1)) Then 
resR = resR+g2*Q3(gt2,1)
End If 
If ((2.eq.gt1)) Then 
resR = resR+(g2*Q3(gt2,2))/sqrt(2._dp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvChicVWpL  
 
 
Subroutine CouplingFvUNvetIL(gt1,gt2,eta,Vv,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3)

Complex(dp), Intent(in) :: Vv(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvUNvetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt2)) Then 
Do j1 = 1,3
resL = resL+(Conjg(Vv(gt1,j1))*eta(j1))/2._dp
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt2)) Then 
Do j1 = 1,3
resR = resR-(Vv(gt1,j1)*eta(j1))/2._dp
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvUNvetIL  
 
 
Subroutine CouplingUNvFeXPL(gt1,gt2,gt3,eta,Yf,Y3,ZXP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: ZXP(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvFeXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((3.eq.gt1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,2))*Yf(j1))/sqrt(2._dp)
End Do 
End If 
If ((1.eq.gt1)) Then 
Do j1 = 1,3
resL = resL-((Conjg(ZEL(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
Do j1 = 1,3
resR = resR+Conjg(ZXP(gt3,1))*ZER(gt2,j1)*Y3(j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvFeXPL  
 
 
Subroutine CouplingFvUNvXOL(gt1,gt2,gt3,eta,Yf,Vv,ZX0,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),ZX0(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvUNvXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((3.eq.gt2)) Then 
Do j1 = 1,3
resL = resL+(Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,2))*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt2)) Then 
Do j1 = 1,3
resL = resL-(Conjg(Vv(gt1,j1))*Conjg(ZX0(gt3,1))*eta(j1))/2._dp
End Do 
End If 
resR = 0._dp 
If ((3.eq.gt2)) Then 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*Vv(gt1,j1)*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt2)) Then 
Do j1 = 1,3
resR = resR-(Conjg(ZX0(gt3,1))*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvUNvXOL  
 
 
Subroutine CouplingUNvNvhhL(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvNvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL-(A*Conjg(O(gt2,2)))/2._dp
End If 
If ((1.eq.gt1)) Then 
resL = resL+(B*Conjg(O(gt2,3)))/2._dp
End If 
If ((2.eq.gt1)) Then 
resL = resL-(A*Conjg(O(gt2,1)))/2._dp
End If 
If ((3.eq.gt1)) Then 
resL = resL+(B*Conjg(O(gt2,1)))/2._dp
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR-(A*O(gt2,1))/2._dp
End If 
If ((3.eq.gt1)) Then 
resR = resR+(B*O(gt2,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
resR = resR-(A*O(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
resR = resR+(B*O(gt2,3))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvNvhhL  
 
 
Subroutine CouplingUNvNvVZL(gt1,gt2,g1,g2,O,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUNvNvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt1)) Then 
resL = resL-(g2*Conjg(O(gt2,2))*Cos(TW))/2._dp
End If 
If ((3.eq.gt1)) Then 
resL = resL+(g2*Conjg(O(gt2,3))*Cos(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
resL = resL-(g1*Conjg(O(gt2,2))*Sin(TW))/2._dp
End If 
If ((3.eq.gt1)) Then 
resL = resL+(g1*Conjg(O(gt2,3))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR+(g2*Cos(TW)*O(gt2,2))/2._dp
End If 
If ((3.eq.gt1)) Then 
resR = resR-(g2*Cos(TW)*O(gt2,3))/2._dp
End If 
If ((2.eq.gt1)) Then 
resR = resR+(g1*O(gt2,2)*Sin(TW))/2._dp
End If 
If ((3.eq.gt1)) Then 
resR = resR-(g1*O(gt2,3)*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUNvNvVZL  
 
 
Subroutine CouplingcUChiChiAhL(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL-((B*Conjg(Q2(gt2,2)))/sqrt(2._dp))
End If 
If ((2.eq.gt1)) Then 
resL = resL+(A*Conjg(Q2(gt2,1)))/sqrt(2._dp)
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR+(B*Q3(gt2,1))/sqrt(2._dp)
End If 
If ((1.eq.gt1)) Then 
resR = resR-((A*Q3(gt2,2))/sqrt(2._dp))
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiChiAhL  
 
 
Subroutine CouplingcUChiChihhL(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL-((B*Conjg(Q2(gt2,2)))/sqrt(2._dp))
End If 
If ((2.eq.gt1)) Then 
resL = resL-((A*Conjg(Q2(gt2,1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR-((B*Q3(gt2,1))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
resR = resR-((A*Q3(gt2,2))/sqrt(2._dp))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiChihhL  
 
 
Subroutine CouplingcUChiChiVPL(gt1,gt2,g1,g2,Q2,Q3,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiChiVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt1)) Then 
resL = resL-(g1*Conjg(Q2(gt2,2))*Cos(TW))/2._dp
End If 
If ((1.eq.gt1)) Then 
resL = resL-(g2*Conjg(Q2(gt2,1))*Sin(TW))
End If 
If ((2.eq.gt1)) Then 
resL = resL-(g2*Conjg(Q2(gt2,2))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR-(g1*Cos(TW)*Q3(gt2,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
resR = resR-(g2*Q3(gt2,1)*Sin(TW))
End If 
If ((2.eq.gt1)) Then 
resR = resR-(g2*Q3(gt2,2)*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiChiVPL  
 
 
Subroutine CouplingcUChiChiVZL(gt1,gt2,g1,g2,Q2,Q3,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL-(g2*Conjg(Q2(gt2,1))*Cos(TW))
End If 
If ((2.eq.gt1)) Then 
resL = resL-(g2*Conjg(Q2(gt2,2))*Cos(TW))/2._dp
End If 
If ((2.eq.gt1)) Then 
resL = resL+(g1*Conjg(Q2(gt2,2))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((1.eq.gt1)) Then 
resR = resR-(g2*Cos(TW)*Q3(gt2,1))
End If 
If ((2.eq.gt1)) Then 
resR = resR-(g2*Cos(TW)*Q3(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
resR = resR+(g1*Q3(gt2,2)*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiChiVZL  
 
 
Subroutine CouplingcUChicFeetIL(gt1,gt2,eta,Y3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChicFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt2,j1))*Y3(j1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt1)) Then 
Do j1 = 1,3
resR = resR-((ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChicFeetIL  
 
 
Subroutine CouplingcUChiFvXPL(gt1,gt2,gt3,eta,Yf,Vv,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiFvXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
Do j1 = 1,3
resL = resL+Conjg(Vv(gt2,j1))*Conjg(ZXP(gt3,1))*eta(j1)
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(ZXP(gt3,2))*Vv(gt2,j1)*Yf(j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiFvXPL  
 
 
Subroutine CouplingcUChiNvHpL(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiNvHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL+A*Conjg(O(gt2,2))
End If 
If ((2.eq.gt1)) Then 
resL = resL-((A*Conjg(O(gt2,1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
resR = resR-((B*O(gt2,1))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
resR = resR-(B*O(gt2,3))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiNvHpL  
 
 
Subroutine CouplingcUChiNvVWpL(gt1,gt2,g2,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChiNvVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt1)) Then 
resL = resL+g2*Conjg(O(gt2,1))
End If 
If ((2.eq.gt1)) Then 
resL = resL-((g2*Conjg(O(gt2,3)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((1.eq.gt1)) Then 
resR = resR+g2*O(gt2,1)
End If 
If ((2.eq.gt1)) Then 
resR = resR+(g2*O(gt2,2))/sqrt(2._dp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChiNvVWpL  
 
 
Subroutine CouplingcUChicFeXOL(gt1,gt2,gt3,eta,Yf,Y3,ZX0,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: ZX0(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUChicFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt2,j1))*Conjg(ZX0(gt3,1))*Y3(j1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(ZX0(gt3,2))*ZEL(gt2,j1)*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(ZX0(gt3,1))*ZEL(gt2,j1)*eta(j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUChicFeXOL  
 
 
Subroutine CouplingAhXPcUXPL(gt2,gt3,mu,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: mu

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhXPcUXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(mu*Conjg(ZXP(gt2,2)))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(mu*Conjg(ZXP(gt2,1)))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhXPcUXPL  
 
 
Subroutine CouplingFvChicUXPL(gt1,gt2,gt3,eta,Yf,Vv,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvChicUXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt2,2))*Conjg(Vv(gt1,j1))*Yf(j1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+Q3(gt2,1)*Vv(gt1,j1)*eta(j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvChicUXPL  
 
 
Subroutine CouplingetIHpcUXPL(gt3,lam4,mu,lam5,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcUXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res+(lam4*v)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(lam5*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-1._dp*(mu)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcUXPL  
 
 
Subroutine CouplingetIcUXPVWpL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcUXPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcUXPVWpL  
 
 
Subroutine CouplinghhXPcUXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7,mu,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXPcUXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam3*v*Conjg(ZXP(gt2,1)))
End If 
If ((1.eq.gt3)) Then 
res = res-(mu*Conjg(ZXP(gt2,2)))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(mu*Conjg(ZXP(gt2,1)))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*v*Conjg(ZXP(gt2,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXPcUXPL  
 
 
Subroutine CouplingHpXOcUXPL(gt2,gt3,lam4,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOcUXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam4*v*Conjg(ZX0(gt2,1)))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(lam5*v*Conjg(ZX0(gt2,1)))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(mu*Conjg(ZX0(gt2,2)))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(mu*Conjg(ZX0(gt2,1)))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOcUXPL  
 
 
Subroutine CouplingcFeNvcUXPL(gt1,gt2,gt3,eta,Yf,Y3,O,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeNvcUXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resL = resL+Conjg(O(gt2,2))*Conjg(ZER(gt1,j1))*Y3(j1)
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+(O(gt2,3)*ZEL(gt1,j1)*Yf(j1))/sqrt(2._dp)
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resR = resR-((O(gt2,1)*ZEL(gt1,j1)*eta(j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeNvcUXPL  
 
 
Subroutine CouplingXPcUXPVPL(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcUXPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g1*Conjg(ZXP(gt1,1))*Cos(TW))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g2*Conjg(ZXP(gt1,1))*Sin(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Conjg(ZXP(gt1,2))*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcUXPVPL  
 
 
Subroutine CouplingXOcUXPVWpL(gt1,gt2,g2,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOcUXPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Conjg(ZX0(gt1,1)))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g2*Conjg(ZX0(gt1,2)))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOcUXPVWpL  
 
 
Subroutine CouplingXPcUXPVZL(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcUXPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Conjg(ZXP(gt1,1))*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Conjg(ZXP(gt1,2))*Cos(TW))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(g1*Conjg(ZXP(gt1,1))*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcUXPVZL  
 
 
Subroutine CouplingAhAhUXPcUXPL(gt3,gt4,lam3,lam7,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUXPcUXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUXPcUXPL  
 
 
Subroutine CouplingetIetIUXPcUXPL(gt3,gt4,lam2,lam8,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUXPcUXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam2)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam8)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUXPcUXPL  
 
 
Subroutine CouplinghhhhUXPcUXPL(gt3,gt4,lam3,lam7,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhUXPcUXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhUXPcUXPL  
 
 
Subroutine CouplingHpUXPcHpcUXPL(gt2,gt4,lam3,lam4,lam7,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpUXPcHpcUXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((1.eq.gt2).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((2.eq.gt2).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpUXPcHpcUXPL  
 
 
Subroutine CouplingUXPcUXPVPVPL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXPcUXPVPVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2*Sin(TW)**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXPcUXPVPVPL  
 
 
Subroutine CouplingUXPcUXPcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXPcUXPcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXPcUXPcVWpVWpL  
 
 
Subroutine CouplingUXPcUXPVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXPcUXPVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2*Cos(TW)**2
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXPcUXPVZVZL  
 
 
Subroutine CouplingXOXOUXPcUXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOUXPcUXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1)))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2)))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam8*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1)))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam6*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOUXPcUXPL  
 
 
Subroutine CouplingUXPXPcUXPcXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXPXPcUXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-2*lam2*Conjg(ZXP(gt2,1))*ZXP(gt4,1)
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam8*Conjg(ZXP(gt2,2))*ZXP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam8*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(lam8*Conjg(ZXP(gt2,2))*ZXP(gt4,2))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(lam8*Conjg(ZXP(gt2,1))*ZXP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*lam6*Conjg(ZXP(gt2,2))*ZXP(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXPXPcUXPcXPL  
 
 
Subroutine CouplingAhetIUXOL(gt3,mu,lam5,v,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: mu,lam5,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIUXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam5*v)
End If 
If ((2.eq.gt3)) Then 
res = res+mu/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIUXOL  
 
 
Subroutine CouplingChiFeUXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeUXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,2))*Conjg(ZEL(gt2,j1))*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resL = resL-((Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*eta(j1))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+(Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeUXOL  
 
 
Subroutine CouplingetIUXOVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIUXOVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Cos(TW))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIUXOVZL  
 
 
Subroutine CouplingFvNvUXOL(gt1,gt2,gt3,eta,Yf,Vv,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvUXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,3))*Conjg(Vv(gt1,j1))*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resL = resL-(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*eta(j1))/2._dp
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j1 = 1,3
resR = resR+(O(gt2,3)*Vv(gt1,j1)*Yf(j1))/2._dp
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j1 = 1,3
resR = resR-(O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvUXOL  
 
 
Subroutine CouplinghhUXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam4,lam7,mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhUXOXO' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(lam3*v*Conjg(ZX0(gt3,1)))
End If 
If ((1.eq.gt2)) Then 
res = res-(lam4*v*Conjg(ZX0(gt3,1)))
End If 
If ((1.eq.gt2)) Then 
res = res-(lam5*v*Conjg(ZX0(gt3,1)))
End If 
If ((1.eq.gt2)) Then 
res = res+(mu*Conjg(ZX0(gt3,2)))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(mu*Conjg(ZX0(gt3,1)))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam7*v*Conjg(ZX0(gt3,2)))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhUXOXOL  
 
 
Subroutine CouplingHpUXOcXPL(gt2,gt3,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpUXOcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(lam4*v*ZXP(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(lam5*v*ZXP(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(mu*ZXP(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(mu*ZXP(gt3,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpUXOcXPL  
 
 
Subroutine CouplingUXOcXPVWpL(gt1,gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXOcXPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2*ZXP(gt2,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g2*ZXP(gt2,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXOcXPVWpL  
 
 
Subroutine CouplingAhAhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUXOUXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+lam5
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUXOUXOL  
 
 
Subroutine CouplingetIetIUXOUXOL(gt3,gt4,lam2,lam8,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUXOUXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam2)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam8)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUXOUXOL  
 
 
Subroutine CouplinghhhhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhUXOUXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam5)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhUXOUXOL  
 
 
Subroutine CouplingHpUXOUXOcHpL(gt2,gt3,lam3,lam7,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpUXOUXOcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2).And.(1.eq.gt3)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt2).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam7)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpUXOUXOcHpL  
 
 
Subroutine CouplingUXOUXOcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXOUXOcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXOUXOcVWpVWpL  
 
 
Subroutine CouplingUXOUXOVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXOUXOVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXOUXOVZVZL  
 
 
Subroutine CouplingUXOUXOXOXOL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXOUXOXOXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*lam2*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam8*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,1)))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam8*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,2)))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam8*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*lam6*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXOUXOXOXOL  
 
 
Subroutine CouplingUXOUXOXPcXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam2,lam6,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUXOUXOXPcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam2*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam8*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam8*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam6*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUXOUXOXPcXPL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*Yd(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,gt1))*ZUR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHpL  
 
 
Subroutine CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucVWpL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Yu(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,gt1))*ZDR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdHpL  
 
 
Subroutine CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdVWpL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcChicUFeetIL(gt1,gt2,eta,Y3,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicUFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL+(Conjg(Q3(gt1,2))*Y3(gt2))/sqrt(2._dp)
End If 
resR = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resR = resR-((Q2(gt1,1)*eta(gt2))/sqrt(2._dp))
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicUFeetIL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZER(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFvcHpL(gt1,gt2,Ye,Vv,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(Vv(gt2,j2))*Ye(gt1,j2)
End Do 
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHpL  
 
 
Subroutine CouplingcUFeFvcVWpL(gt1,gt2,g2,Vv,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: Vv(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(Vv(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcVWpL  
 
 
Subroutine CouplingcUFeNvcXPL(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: O(3,3),ZXP(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeNvcXP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+Conjg(O(gt2,2))*Y3(gt1)*ZXP(gt3,1)
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-((O(gt2,1)*eta(gt1)*ZXP(gt3,1))/sqrt(2._dp))
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(O(gt2,3)*Yf(gt1)*ZXP(gt3,2))/sqrt(2._dp)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeNvcXPL  
 
 
Subroutine CouplingcChicUFeXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: eta(3),Yf(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChicUFeXO' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL+(Conjg(Q3(gt1,2))*Conjg(ZX0(gt3,1))*Y3(gt2))/sqrt(2._dp)
End If 
resR = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resR = resR+(Conjg(ZX0(gt3,2))*Q2(gt1,2)*Yf(gt2))/2._dp
End If 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resR = resR-((Conjg(ZX0(gt3,1))*Q2(gt1,1)*eta(gt2))/sqrt(2._dp))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChicUFeXOL  
 
 
Subroutine CouplingAhcHpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpVWpL  
 
 
Subroutine CouplingNvChicHpL(gt1,gt2,A,B,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvChicHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(B*Conjg(O(gt1,3))*Conjg(Q2(gt2,1)))
resL = resL-((B*Conjg(O(gt1,1))*Conjg(Q2(gt2,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR+A*O(gt1,2)*Q3(gt2,1)
resR = resR-((A*O(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvChicHpL  
 
 
Subroutine CouplingetIXPcHpL(gt2,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(lam5*v*Conjg(ZXP(gt2,1)))/2._dp
res = res+(mu*Conjg(ZXP(gt2,2)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcHpL  
 
 
Subroutine CouplingcFdFucHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpL  
 
 
Subroutine CouplingcFeFvcHpL(gt1,gt2,Ye,Vv,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),Vv(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(Vv(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpL  
 
 
Subroutine CouplingcgZgWpcHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcHpL  
 
 
Subroutine CouplingcgWpgZHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZHpL  
 
 
Subroutine CouplingcgWCgZcHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcHpL  
 
 
Subroutine CouplingcgZgWCHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCHpL  
 
 
Subroutine CouplinghhHpcHpL(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpL  
 
 
Subroutine CouplinghhcHpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpVWp' 
 
res = 0._dp 
res = res+g2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpVWpL  
 
 
Subroutine CouplingHpcHpVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPL  
 
 
Subroutine CouplingHpcHpVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-(g1*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZL  
 
 
Subroutine CouplingcHpVPVWpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVPVWpL  
 
 
Subroutine CouplingcHpVWpVZL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpVWpVZL  
 
 
Subroutine CouplingXOXPcHpL(gt1,gt2,lam4,mu,lam5,v,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(lam5*v*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,1)))/2._dp
res = res-(mu*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcHpL  
 
 
Subroutine CouplingAhAhHpcHpL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcHpL  
 
 
Subroutine CouplingetIetIHpcHpL(lam3,res)

Implicit None 

Real(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHpcHpL  
 
 
Subroutine CouplinghhhhHpcHpL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpL  
 
 
Subroutine CouplingHpHpcHpcHpL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcHpcHpL  
 
 
Subroutine CouplingHpcHpVPVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVPVPL  
 
 
Subroutine CouplingHpcHpcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpcVWpVWpL  
 
 
Subroutine CouplingHpcHpVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcHpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcHpVZVZL  
 
 
Subroutine CouplingHpXOXOcHpL(gt2,gt3,lam3,lam7,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXOXOcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam7*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXOXOcHpL  
 
 
Subroutine CouplingHpXPcHpcXPL(gt2,gt4,lam3,lam4,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpXPcHpcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
res = res-(lam4*Conjg(ZXP(gt2,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt2,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpXPcHpcXPL  
 
 
Subroutine CouplingAhAhhhL(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
res = 0._dp 
res = res-(lam1*v)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhL  
 
 
Subroutine CouplingcChiChiAhL(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL+(A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp)
resR = 0._dp 
resR = resR+(B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp)
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiAhL  
 
 
Subroutine CouplingAhetIXOL(gt3,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam5*v*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt3,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIXOL  
 
 
Subroutine CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhL  
 
 
Subroutine CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhL  
 
 
Subroutine CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhL  
 
 
Subroutine CouplingcgWpgWpAhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhL  
 
 
Subroutine CouplingcgWCgWCAhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhL  
 
 
Subroutine CouplingAhhhVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res+(g1*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingAhHpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcVWpL  
 
 
Subroutine CouplingNvNvAhL(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL+(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR-(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR-(B*O(gt1,1)*O(gt2,3))/2._dp
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvAhL  
 
 
Subroutine CouplingAhXPcXPL(gt2,gt3,mu,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: mu

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhXPcXPL  
 
 
Subroutine CouplingAhAhAhAhL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhL  
 
 
Subroutine CouplingAhAhetIetIL(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetIL  
 
 
Subroutine CouplingAhAhhhhhL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhL  
 
 
Subroutine CouplingAhAhcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpL  
 
 
Subroutine CouplingAhAhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplingAhAhXOXOL(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res+lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1))
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXOXOL  
 
 
Subroutine CouplingAhAhXPcXPL(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhXPcXPL  
 
 
Subroutine CouplingcChiChihhL(gt1,gt2,A,B,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChihh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-((B*Conjg(Q2(gt2,2))*Conjg(Q3(gt1,1)))/sqrt(2._dp))
resL = resL-((A*Conjg(Q2(gt2,1))*Conjg(Q3(gt1,2)))/sqrt(2._dp))
resR = 0._dp 
resR = resR-((B*Q2(gt1,2)*Q3(gt2,1))/sqrt(2._dp))
resR = resR-((A*Q2(gt1,1)*Q3(gt2,2))/sqrt(2._dp))
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChihhL  
 
 
Subroutine CouplingetIetIhhL(lam3,lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
res = 0._dp 
res = res-(lam3*v)
res = res-(lam4*v)
res = res+lam5*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhL  
 
 
Subroutine CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhL  
 
 
Subroutine CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhL  
 
 
Subroutine CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhL  
 
 
Subroutine CouplingcgWpgWphhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhL  
 
 
Subroutine CouplingcgWCgWChhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhL  
 
 
Subroutine CouplingcgZgZhhL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*RXiZ)/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW))/2._dp
res = res-(g1**2*v*RXiZ*Sin(TW)**2)/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhL  
 
 
Subroutine CouplinghhhhhhL(lam1,v,res)

Implicit None 

Real(dp), Intent(in) :: lam1,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
res = 0._dp 
res = res-3*lam1*v
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhL  
 
 
Subroutine CouplinghhHpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcVWpL  
 
 
Subroutine CouplingNvNvhhL(gt1,gt2,A,B,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: A,B

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(A*Conjg(O(gt1,2))*Conjg(O(gt2,1)))/2._dp
resL = resL+(B*Conjg(O(gt1,3))*Conjg(O(gt2,1)))/2._dp
resL = resL-(A*Conjg(O(gt1,1))*Conjg(O(gt2,2)))/2._dp
resL = resL+(B*Conjg(O(gt1,1))*Conjg(O(gt2,3)))/2._dp
resR = 0._dp 
resR = resR-(A*O(gt1,2)*O(gt2,1))/2._dp
resR = resR+(B*O(gt1,3)*O(gt2,1))/2._dp
resR = resR-(A*O(gt1,1)*O(gt2,2))/2._dp
resR = resR+(B*O(gt1,1)*O(gt2,3))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvhhL  
 
 
Subroutine CouplinghhcVWpVWpL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
res = 0._dp 
res = res+(g2**2*v)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpL  
 
 
Subroutine CouplinghhVZVZL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2)/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)
res = res+(g1**2*v*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplinghhXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam4,lam7,mu,lam5,v

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXOXO' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam4*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res-(lam5*v*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,1)))
res = res+(mu*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,1)))/2._dp
res = res+(mu*Conjg(ZX0(gt2,1))*Conjg(ZX0(gt3,2)))/2._dp
res = res-(lam7*v*Conjg(ZX0(gt2,2))*Conjg(ZX0(gt3,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXOXOL  
 
 
Subroutine CouplinghhXPcXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam3,lam7,mu,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhXPcXP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*Conjg(ZXP(gt2,1))*ZXP(gt3,1))
res = res-(mu*Conjg(ZXP(gt2,2))*ZXP(gt3,1))/2._dp
res = res-(mu*Conjg(ZXP(gt2,1))*ZXP(gt3,2))/2._dp
res = res-(lam7*v*Conjg(ZXP(gt2,2))*ZXP(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhXPcXPL  
 
 
Subroutine CouplingetIetIhhhhL(lam3,lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam3,lam4,lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res+lam5
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhL  
 
 
Subroutine CouplinghhhhhhhhL(lam1,res)

Implicit None 

Real(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhL  
 
 
Subroutine CouplinghhhhcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpL  
 
 
Subroutine CouplinghhhhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplinghhhhXOXOL(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam4,lam7,lam5

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam4*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam5*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam7*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXOXOL  
 
 
Subroutine CouplinghhhhXPcXPL(gt3,gt4,lam3,lam7,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam3,lam7

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam7*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhXPcXPL  
 
 
Subroutine CouplingChiFeetIL(gt1,gt2,eta,Y3,Q2,Q3,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3),Y3(3)

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingChiFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(Q2(gt1,1))*Conjg(ZEL(gt2,j1))*eta(j1))/sqrt(2._dp)
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-((Q3(gt1,2)*ZER(gt2,j1)*Y3(j1))/sqrt(2._dp))
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingChiFeetIL  
 
 
Subroutine CouplingFvNvetIL(gt1,gt2,eta,Vv,O,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: eta(3)

Complex(dp), Intent(in) :: Vv(3,3),O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvNvetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL+(Conjg(O(gt2,1))*Conjg(Vv(gt1,j1))*eta(j1))/2._dp
End Do 
resR = 0._dp 
Do j1 = 1,3
resR = resR-(O(gt2,1)*Vv(gt1,j1)*eta(j1))/2._dp
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvNvetIL  
 
 
Subroutine CouplingetIHpcXPL(gt3,lam4,mu,lam5,v,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam4,mu,lam5,v

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*v*ZXP(gt3,1))/2._dp
res = res-(lam5*v*ZXP(gt3,1))/2._dp
res = res-(mu*ZXP(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcXPL  
 
 
Subroutine CouplingetIcXPVWpL(gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcXPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZXP(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcXPVWpL  
 
 
Subroutine CouplingetIXOVZL(gt2,g1,g2,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXOVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZX0(gt2,1))*Cos(TW))/2._dp
res = res+(g1*Conjg(ZX0(gt2,1))*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXOVZL  
 
 
Subroutine CouplingetIetIetIetIL(lam2,res)

Implicit None 

Real(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetIL  
 
 
Subroutine CouplingetIetIcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIcVWpVWpL  
 
 
Subroutine CouplingetIetIVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIVZVZL  
 
 
Subroutine CouplingetIetIXOXOL(gt3,gt4,lam2,lam8,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXOXO' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam2*Conjg(ZX0(gt3,1))*Conjg(ZX0(gt4,1)))
res = res-(lam8*Conjg(ZX0(gt3,2))*Conjg(ZX0(gt4,2)))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXOXOL  
 
 
Subroutine CouplingetIetIXPcXPL(gt3,gt4,lam2,lam8,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam2,lam8

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIXPcXP' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam2*Conjg(ZXP(gt3,1))*ZXP(gt4,1))
res = res-(lam8*Conjg(ZXP(gt3,2))*ZXP(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIXPcXPL  
 
 
Subroutine CouplingcChiChiVZL(gt1,gt2,g1,g2,Q2,Q3,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcChiChiVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(Q2(gt2,1))*Cos(TW)*Q2(gt1,1))
resL = resL-(g2*Conjg(Q2(gt2,2))*Cos(TW)*Q2(gt1,2))/2._dp
resL = resL+(g1*Conjg(Q2(gt2,2))*Q2(gt1,2)*Sin(TW))/2._dp
resR = 0._dp 
resR = resR-(g2*Conjg(Q3(gt1,1))*Cos(TW)*Q3(gt2,1))
resR = resR-(g2*Conjg(Q3(gt1,2))*Cos(TW)*Q3(gt2,2))/2._dp
resR = resR+(g1*Conjg(Q3(gt1,2))*Q3(gt2,2)*Sin(TW))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcChiChiVZL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZL  
 
 
Subroutine CouplingcgWCgWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWpVZL  
 
 
Subroutine CouplingHpcVWpVZL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVZL  
 
 
Subroutine CouplingNvNvVZL(gt1,gt2,g1,g2,O,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: O(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvNvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL-(g2*Conjg(O(gt2,2))*Cos(TW)*O(gt1,2))/2._dp
resL = resL+(g2*Conjg(O(gt2,3))*Cos(TW)*O(gt1,3))/2._dp
resL = resL-(g1*Conjg(O(gt2,2))*O(gt1,2)*Sin(TW))/2._dp
resL = resL+(g1*Conjg(O(gt2,3))*O(gt1,3)*Sin(TW))/2._dp
resR = 0._dp 
resR = resR+(g2*Conjg(O(gt1,2))*Cos(TW)*O(gt2,2))/2._dp
resR = resR-(g2*Conjg(O(gt1,3))*Cos(TW)*O(gt2,3))/2._dp
resR = resR+(g1*Conjg(O(gt1,2))*O(gt2,2)*Sin(TW))/2._dp
resR = resR-(g1*Conjg(O(gt1,3))*O(gt2,3)*Sin(TW))/2._dp
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvNvVZL  
 
 
Subroutine CouplingcVWpVWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZL  
 
 
Subroutine CouplingXPcXPVZL(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Conjg(ZXP(gt1,1))*Cos(TW)*ZXP(gt2,1))/2._dp
res = res-(g1*Conjg(ZXP(gt1,1))*Sin(TW)*ZXP(gt2,1))/2._dp
res = res+(g2*Conjg(ZXP(gt1,2))*Cos(TW)*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVZL  
 
 
Subroutine CouplingcVWpVWpVZVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZL  
 
 
Subroutine CouplingXOXOVZVZL(gt1,gt2,g1,g2,ZX0,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Cos(TW)**2)/2._dp
res = res+g1*g2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Cos(TW)*Sin(TW)
res = res+(g1**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1))*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOVZVZL  
 
 
Subroutine CouplingXPcXPVZVZL(gt1,gt2,g1,g2,ZXP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZXP(gt1,1))*Cos(TW)**2*ZXP(gt2,1))/2._dp
res = res-(g1*g2*Conjg(ZXP(gt1,1))*Cos(TW)*Sin(TW)*ZXP(gt2,1))
res = res+(g1**2*Conjg(ZXP(gt1,1))*Sin(TW)**2*ZXP(gt2,1))/2._dp
res = res+g2**2*Conjg(ZXP(gt1,2))*Cos(TW)**2*ZXP(gt2,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPVZVZL  
 
 
Subroutine CouplingNvChicVWpL(gt1,gt2,g2,O,Q2,Q3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingNvChicVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
resL = resL+g2*Conjg(Q2(gt2,1))*O(gt1,1)
resL = resL-((g2*Conjg(Q2(gt2,2))*O(gt1,3))/sqrt(2._dp))
resR = 0._dp 
resR = resR+g2*Conjg(O(gt1,1))*Q3(gt2,1)
resR = resR+(g2*Conjg(O(gt1,2))*Q3(gt2,2))/sqrt(2._dp)
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingNvChicVWpL  
 
 
Subroutine CouplingetIXPcVWpL(gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIXPcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZXP(gt2,1)))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIXPcVWpL  
 
 
Subroutine CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucVWpL  
 
 
Subroutine CouplingcFeFvcVWpL(gt1,gt2,g2,Vv,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: Vv(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(Vv(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcVWpL  
 
 
Subroutine CouplingHpcVWpVPL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpcVWpVPL  
 
 
Subroutine CouplingcVWpVPVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpL  
 
 
Subroutine CouplingXOXPcVWpL(gt1,gt2,g2,ZXP,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXPcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*Conjg(ZX0(gt1,1))*Conjg(ZXP(gt2,1)))/2._dp
res = res+(g2*Conjg(ZX0(gt1,2))*Conjg(ZXP(gt2,2)))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXPcVWpL  
 
 
Subroutine CouplingcVWpVPVPVWpL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpL  
 
 
Subroutine CouplingcVWpcVWpVWpVWpL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpL  
 
 
Subroutine CouplingXOXOcVWpVWpL(gt1,gt2,g2,ZX0,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZX0(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXOXOcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZX0(gt1,1))*Conjg(ZX0(gt2,1)))/2._dp
res = res+g2**2*Conjg(ZX0(gt1,2))*Conjg(ZX0(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXOXOcVWpVWpL  
 
 
Subroutine CouplingXPcXPcVWpVWpL(gt1,gt2,g2,ZXP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZXP(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingXPcXPcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*Conjg(ZXP(gt1,1))*ZXP(gt2,1))/2._dp
res = res+(g2**2*Conjg(ZXP(gt1,2))*ZXP(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingXPcXPcVWpVWpL  
 
 
Subroutine CouplingsForVectorBosons(g2,g1,TW,v,ZXP,ZX0,Q2,Q3,O,ZDL,ZUL,               & 
& Vv,ZEL,cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpcVWpVWp,     & 
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

Implicit None 
Real(dp), Intent(in) :: g2,g1,TW,v

Complex(dp), Intent(in) :: ZXP(2,2),ZX0(2,2),Q2(2,2),Q3(2,2),O(3,3),ZDL(3,3),ZUL(3,3),Vv(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhcHpVWp,cplhhcHpVWp,cplHpcHpVZ,cplcHpVPVWp,cplcHpVWpVZ,cplHpcHpcVWpVWp,           & 
& cplHpcHpVZVZ,cplAhhhVZ,cplAhHpcVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cplhhHpcVWp,             & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cpletIcXPVWp(2),cpletIXOVZ(2),       & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),cplcFdFdVZL(3,3), & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWCgWpVZ,cplHpcVWpVZ,cplNvNvVZL(3,3),              & 
& cplNvNvVZR(3,3),cplcVWpVWpVZ,cplXPcXPVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,          & 
& cplcVWpVWpVZVZ3,cplXOXOVZVZ(2,2),cplXPcXPVZVZ(2,2),cplNvChicVWpL(3,2),cplNvChicVWpR(3,2),& 
& cpletIXPcVWp(2),cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),              & 
& cplcFeFvcVWpR(3,3),cplHpcVWpVP,cplcVWpVPVWp,cplXOXPcVWp(2,2),cplcVWpVPVPVWp1,          & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,& 
& cplXOXOcVWpVWp(2,2),cplXPcXPcVWpVWp(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhcHpVWp = 0._dp 
Call CouplingAhcHpVWpL(g2,cplAhcHpVWp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpVPVWp = 0._dp 
Call CouplingcHpVPVWpL(g1,g2,v,TW,cplcHpVPVWp)



cplcHpVWpVZ = 0._dp 
Call CouplingcHpVWpVZL(g1,g2,v,TW,cplcHpVWpVZ)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhHpcVWp = 0._dp 
Call CouplingAhHpcVWpL(g2,cplAhHpcVWp)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,v,TW,cplhhVZVZ)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



cpletIcXPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIcXPVWpL(gt2,g2,ZXP,cpletIcXPVWp(gt2))

End Do 


cpletIXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXOVZL(gt2,g1,g2,ZX0,TW,cpletIXOVZ(gt2))

End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cplcChiChiVZL = 0._dp 
cplcChiChiVZR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChiVZL(gt1,gt2,g1,g2,Q2,Q3,TW,cplcChiChiVZL(gt1,gt2),cplcChiChiVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWCgWpVZ = 0._dp 
Call CouplingcgWCgWpVZL(g2,TW,cplcgWCgWpVZ)



cplHpcVWpVZ = 0._dp 
Call CouplingHpcVWpVZL(g1,g2,v,TW,cplHpcVWpVZ)



cplNvNvVZL = 0._dp 
cplNvNvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvVZL(gt1,gt2,g1,g2,O,TW,cplNvNvVZL(gt1,gt2),cplNvNvVZR(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplXPcXPVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZL(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplXOXOVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOVZVZL(gt1,gt2,g1,g2,ZX0,TW,cplXOXOVZVZ(gt1,gt2))

 End Do 
End Do 


cplXPcXPVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPVZVZL(gt1,gt2,g1,g2,ZXP,TW,cplXPcXPVZVZ(gt1,gt2))

 End Do 
End Do 


cplNvChicVWpL = 0._dp 
cplNvChicVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 2
Call CouplingNvChicVWpL(gt1,gt2,g2,O,Q2,Q3,cplNvChicVWpL(gt1,gt2),cplNvChicVWpR(gt1,gt2))

 End Do 
End Do 


cpletIXPcVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIXPcVWpL(gt2,g2,ZXP,cpletIXPcVWp(gt2))

End Do 


cplcFdFucVWpL = 0._dp 
cplcFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFdFucVWpL(gt1,gt2),cplcFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcVWpL = 0._dp 
cplcFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcVWpL(gt1,gt2,g2,Vv,ZEL,cplcFeFvcVWpL(gt1,gt2),cplcFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplHpcVWpVP = 0._dp 
Call CouplingHpcVWpVPL(g1,g2,v,TW,cplHpcVWpVP)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplXOXPcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXPcVWpL(gt1,gt2,g2,ZXP,ZX0,cplXOXPcVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplXOXOcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXOXOcVWpVWpL(gt1,gt2,g2,ZX0,cplXOXOcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplXPcXPcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingXPcXPcVWpVWpL(gt1,gt2,g2,ZXP,cplXPcXPcVWpVWp(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,ZDL,ZDR,g3,g1,g2,TW,Yu,ZUL,ZUR,Ye,               & 
& ZEL,ZER,eta,Y3,Q2,Q3,Vv,Yf,O,ZXP,ZX0,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,           & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFucHpL,cplcUFdFucHpR,cplcUFdFucVWpL,cplcUFdFucVWpR,cplcUFuFuAhL,   & 
& cplcUFuFuAhR,cplcUFuFdHpL,cplcUFuFdHpR,cplcUFuFdVWpL,cplcUFuFdVWpR,cplcUFuFuhhL,       & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcChicUFeetIL,cplcChicUFeetIR,cplcUFeFehhL,   & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHpL,        & 
& cplcUFeFvcHpR,cplcUFeFvcVWpL,cplcUFeFvcVWpR,cplcUFeNvcXPL,cplcUFeNvcXPR,               & 
& cplcChicUFeXOL,cplcChicUFeXOR)

Implicit None 
Real(dp), Intent(in) :: g3,g1,g2,TW,eta(3),Y3(3),Yf(3)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),        & 
& Q2(2,2),Q3(2,2),Vv(3,3),O(3,3),ZXP(2,2),ZX0(2,2)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),              & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),             & 
& cplcUFdFucVWpL(3,3),cplcUFdFucVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),           & 
& cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),cplcUFuFdVWpL(3,3),cplcUFuFdVWpR(3,3),             & 
& cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),               & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcChicUFeetIL(2,3),cplcChicUFeetIR(2,3),         & 
& cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),               & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),             & 
& cplcUFeFvcVWpL(3,3),cplcUFeFvcVWpR(3,3),cplcUFeNvcXPL(3,3,2),cplcUFeNvcXPR(3,3,2),     & 
& cplcChicUFeXOL(2,3,2),cplcChicUFeXOR(2,3,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,Yu,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucVWpL = 0._dp 
cplcUFdFucVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucVWpL(gt1,gt2,g2,ZUL,cplcUFdFucVWpL(gt1,gt2),cplcUFdFucVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,Yu,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdVWpL = 0._dp 
cplcUFuFdVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdVWpL(gt1,gt2,g2,ZDL,cplcUFuFdVWpL(gt1,gt2),cplcUFuFdVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcChicUFeetIL = 0._dp 
cplcChicUFeetIR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingcChicUFeetIL(gt1,gt2,eta,Y3,Q2,Q3,cplcChicUFeetIL(gt1,gt2)               & 
& ,cplcChicUFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,Vv,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcVWpL = 0._dp 
cplcUFeFvcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcVWpL(gt1,gt2,g2,Vv,cplcUFeFvcVWpL(gt1,gt2),cplcUFeFvcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFeNvcXPL = 0._dp 
cplcUFeNvcXPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeNvcXPL(gt1,gt2,gt3,eta,Yf,Y3,O,ZXP,cplcUFeNvcXPL(gt1,gt2,gt3)        & 
& ,cplcUFeNvcXPR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcChicUFeXOL = 0._dp 
cplcChicUFeXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcChicUFeXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZX0,cplcChicUFeXOL(gt1,gt2,gt3)  & 
& ,cplcChicUFeXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(A,B,O,Q2,Q3,lam3,lam7,mu,v,ZXP,lam5,eta,              & 
& Yf,Y3,ZEL,ZER,g1,g2,TW,Vv,lam4,ZX0,lam2,lam8,lam6,Yd,ZDL,ZDR,Yu,ZUL,ZUR,               & 
& Ye,lam1,cplUNvNvhhL,cplUNvNvhhR,cplcUChiChihhL,cplcUChiChihhR,cplhhXPcUXP,             & 
& cplhhhhUXPcUXP,cplAhetIUXO,cplChiFeUXOL,cplChiFeUXOR,cpletIUXOVZ,cplFvNvUXOL,          & 
& cplFvNvUXOR,cplhhUXOXO,cplHpUXOcXP,cplUXOcXPVWp,cplAhAhUXOUXO,cpletIetIUXOUXO,         & 
& cplhhhhUXOUXO,cplHpUXOUXOcHp,cplUXOUXOcVWpVWp,cplUXOUXOVZVZ,cplUXOUXOXOXO,             & 
& cplUXOUXOXPcXP,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,      & 
& cplcChiChihhL,cplcChiChihhR,cpletIetIhh,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,              & 
& cplhhhhhh,cplhhHpcVWp,cplNvNvhhL,cplNvNvhhR,cplhhcVWpVWp,cplhhVZVZ,cplhhXOXO,          & 
& cplhhXPcXP,cpletIetIhhhh,cplhhhhhhhh,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhhhXOXO,           & 
& cplhhhhXPcXP)

Implicit None 
Real(dp), Intent(in) :: A,B,lam3,lam7,mu,v,lam5,eta(3),Yf(3),Y3(3),g1,g2,TW,lam4,lam2,lam8,lam6,lam1

Complex(dp), Intent(in) :: O(3,3),Q2(2,2),Q3(2,2),ZXP(2,2),ZEL(3,3),ZER(3,3),Vv(3,3),ZX0(2,2),Yd(3,3),           & 
& ZDL(3,3),ZDR(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),Ye(3,3)

Complex(dp), Intent(out) :: cplUNvNvhhL(3,3),cplUNvNvhhR(3,3),cplcUChiChihhL(2,2),cplcUChiChihhR(2,2),            & 
& cplhhXPcUXP(2,2),cplhhhhUXPcUXP(2,2),cplAhetIUXO(2),cplChiFeUXOL(2,3,2),               & 
& cplChiFeUXOR(2,3,2),cpletIUXOVZ(2),cplFvNvUXOL(3,3,2),cplFvNvUXOR(3,3,2),              & 
& cplhhUXOXO(2,2),cplHpUXOcXP(2,2),cplUXOcXPVWp(2,2),cplAhAhUXOUXO(2,2),cpletIetIUXOUXO(2,2),& 
& cplhhhhUXOUXO(2,2),cplHpUXOUXOcHp(2,2),cplUXOUXOcVWpVWp(2,2),cplUXOUXOVZVZ(2,2),       & 
& cplUXOUXOXOXO(2,2,2,2),cplUXOUXOXPcXP(2,2,2,2),cplcUFdFdhhL(3,3),cplcUFdFdhhR(3,3),    & 
& cplcUFuFuhhL(3,3),cplcUFuFuhhR(3,3),cplcUFeFehhL(3,3),cplcUFeFehhR(3,3),               & 
& cplhhHpcHp,cplhhcHpVWp,cplhhhhHpcHp,cplAhAhhh,cplAhhhVZ,cplAhAhhhhh,cplcChiChihhL(2,2),& 
& cplcChiChihhR(2,2),cpletIetIhh,cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFehhL(3,3),     & 
& cplcFeFehhR(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcgWpgWphh,cplcgWCgWChh,          & 
& cplcgZgZhh,cplhhhhhh,cplhhHpcVWp,cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplhhcVWpVWp,         & 
& cplhhVZVZ,cplhhXOXO(2,2),cplhhXPcXP(2,2),cpletIetIhhhh,cplhhhhhhhh,cplhhhhcVWpVWp,     & 
& cplhhhhVZVZ,cplhhhhXOXO(2,2),cplhhhhXPcXP(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplUNvNvhhL = 0._dp 
cplUNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUNvNvhhL(gt1,gt2,A,B,O,cplUNvNvhhL(gt1,gt2),cplUNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplcUChiChihhL = 0._dp 
cplcUChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcUChiChihhL(gt1,gt2,A,B,Q2,Q3,cplcUChiChihhL(gt1,gt2),cplcUChiChihhR(gt1,gt2))

 End Do 
End Do 


cplhhXPcUXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcUXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcUXP(gt2,gt3))

 End Do 
End Do 


cplhhhhUXPcUXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhUXPcUXPL(gt3,gt4,lam3,lam7,cplhhhhUXPcUXP(gt3,gt4))

 End Do 
End Do 


cplAhetIUXO = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUXOL(gt3,mu,lam5,v,cplAhetIUXO(gt3))

End Do 


cplChiFeUXOL = 0._dp 
cplChiFeUXOR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingChiFeUXOL(gt1,gt2,gt3,eta,Yf,Y3,Q2,Q3,ZEL,ZER,cplChiFeUXOL(gt1,gt2,gt3)  & 
& ,cplChiFeUXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIUXOVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUXOVZL(gt2,g1,g2,TW,cpletIUXOVZ(gt2))

End Do 


cplFvNvUXOL = 0._dp 
cplFvNvUXOR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingFvNvUXOL(gt1,gt2,gt3,eta,Yf,Vv,O,cplFvNvUXOL(gt1,gt2,gt3),               & 
& cplFvNvUXOR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhUXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhUXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhUXOXO(gt2,gt3))

 End Do 
End Do 


cplHpUXOcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpUXOcXPL(gt2,gt3,lam4,mu,lam5,v,ZXP,cplHpUXOcXP(gt2,gt3))

 End Do 
End Do 


cplUXOcXPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOcXPVWpL(gt1,gt2,g2,ZXP,cplUXOcXPVWp(gt1,gt2))

 End Do 
End Do 


cplAhAhUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,cplAhAhUXOUXO(gt3,gt4))

 End Do 
End Do 


cpletIetIUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUXOUXOL(gt3,gt4,lam2,lam8,cpletIetIUXOUXO(gt3,gt4))

 End Do 
End Do 


cplhhhhUXOUXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhUXOUXOL(gt3,gt4,lam3,lam4,lam7,lam5,cplhhhhUXOUXO(gt3,gt4))

 End Do 
End Do 


cplHpUXOUXOcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingHpUXOUXOcHpL(gt2,gt3,lam3,lam7,cplHpUXOUXOcHp(gt2,gt3))

 End Do 
End Do 


cplUXOUXOcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOUXOcVWpVWpL(gt1,gt2,g2,cplUXOUXOcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUXOUXOVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUXOUXOVZVZL(gt1,gt2,g1,g2,TW,cplUXOUXOVZVZ(gt1,gt2))

 End Do 
End Do 


cplUXOUXOXOXO = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUXOUXOXOXOL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZX0,cplUXOUXOXOXO(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUXOUXOXPcXP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUXOUXOXPcXPL(gt1,gt2,gt3,gt4,lam2,lam6,lam8,ZXP,cplUXOUXOXPcXP(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2),cplcUFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2),cplcUFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFehhL(gt1,gt2),cplcUFeFehhR(gt1,gt2))

 End Do 
End Do 


cplhhHpcHp = 0._dp 
Call CouplinghhHpcHpL(lam1,v,cplhhHpcHp)



cplhhcHpVWp = 0._dp 
Call CouplinghhcHpVWpL(g2,cplhhcHpVWp)



cplhhhhHpcHp = 0._dp 
Call CouplinghhhhHpcHpL(lam1,cplhhhhHpcHp)



cplAhAhhh = 0._dp 
Call CouplingAhAhhhL(lam1,v,cplAhAhhh)



cplAhhhVZ = 0._dp 
Call CouplingAhhhVZL(g1,g2,TW,cplAhhhVZ)



cplAhAhhhhh = 0._dp 
Call CouplingAhAhhhhhL(lam1,cplAhAhhhhh)



cplcChiChihhL = 0._dp 
cplcChiChihhR = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingcChiChihhL(gt1,gt2,A,B,Q2,Q3,cplcChiChihhL(gt1,gt2),cplcChiChihhR(gt1,gt2))

 End Do 
End Do 


cpletIetIhh = 0._dp 
Call CouplingetIetIhhL(lam3,lam4,lam5,v,cpletIetIhh)



cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdhhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdhhL(gt1,gt2),cplcFdFdhhR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFehhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFehhL(gt1,gt2),cplcFeFehhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuhhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuhhL(gt1,gt2),cplcFuFuhhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWphh = 0._dp 
Call CouplingcgWpgWphhL(g2,v,cplcgWpgWphh)



cplcgWCgWChh = 0._dp 
Call CouplingcgWCgWChhL(g2,v,cplcgWCgWChh)



cplcgZgZhh = 0._dp 
Call CouplingcgZgZhhL(g1,g2,v,TW,cplcgZgZhh)



cplhhhhhh = 0._dp 
Call CouplinghhhhhhL(lam1,v,cplhhhhhh)



cplhhHpcVWp = 0._dp 
Call CouplinghhHpcVWpL(g2,cplhhHpcVWp)



cplNvNvhhL = 0._dp 
cplNvNvhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingNvNvhhL(gt1,gt2,A,B,O,cplNvNvhhL(gt1,gt2),cplNvNvhhR(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Call CouplinghhcVWpVWpL(g2,v,cplhhcVWpVWp)



cplhhVZVZ = 0._dp 
Call CouplinghhVZVZL(g1,g2,v,TW,cplhhVZVZ)



cplhhXOXO = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXOXOL(gt2,gt3,lam3,lam4,lam7,mu,lam5,v,ZX0,cplhhXOXO(gt2,gt3))

 End Do 
End Do 


cplhhXPcXP = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplinghhXPcXPL(gt2,gt3,lam3,lam7,mu,v,ZXP,cplhhXPcXP(gt2,gt3))

 End Do 
End Do 


cpletIetIhhhh = 0._dp 
Call CouplingetIetIhhhhL(lam3,lam4,lam5,cpletIetIhhhh)



cplhhhhhhhh = 0._dp 
Call CouplinghhhhhhhhL(lam1,cplhhhhhhhh)



cplhhhhcVWpVWp = 0._dp 
Call CouplinghhhhcVWpVWpL(g2,cplhhhhcVWpVWp)



cplhhhhVZVZ = 0._dp 
Call CouplinghhhhVZVZL(g1,g2,TW,cplhhhhVZVZ)



cplhhhhXOXO = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXOXOL(gt3,gt4,lam3,lam4,lam7,lam5,ZX0,cplhhhhXOXO(gt3,gt4))

 End Do 
End Do 


cplhhhhXPcXP = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplinghhhhXPcXPL(gt3,gt4,lam3,lam7,ZXP,cplhhhhXPcXP(gt3,gt4))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

End Module Couplings_radinertDTFDTSDM 
