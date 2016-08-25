! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:28 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module Couplings_2HDMHiggsBasis
 
Use Control 
Use Model_Data_2HDMHiggsBasis 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,               & 
& lam2,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,epsU,ZUL,ZUR,epsD,epsE,Yu,cplAhAhAh,            & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplAhhhhh,        & 
& cplAhHpcetp,cplAhHpcHp,cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,            & 
& cpletIhhhh,cpletIHpcetp,cpletIHpcHp,cpletphhcetp,cpletphhcHp,cplhhhhhh,cplhhHpcetp,    & 
& cplhhHpcHp,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,            & 
& cplAhAhetpcetp,cplAhAhetpcHp,cplAhAhhhhh,cplAhAhHpcetp,cplAhAhHpcHp,cplAhetIetIetI,    & 
& cplAhetIetIhh,cplAhetIetpcetp,cplAhetIetpcHp,cplAhetIhhhh,cplAhetIHpcetp,              & 
& cplAhetIHpcHp,cplAhetphhcetp,cplAhetphhcHp,cplAhhhhhhh,cplAhhhHpcetp,cplAhhhHpcHp,     & 
& cpletIetIetIetI,cpletIetIetIhh,cpletIetIetpcetp,cpletIetIetpcHp,cpletIetIhhhh,         & 
& cpletIetIHpcetp,cpletIetIHpcHp,cpletIetphhcetp,cpletIetphhcHp,cpletIhhhhhh,            & 
& cpletIhhHpcetp,cpletIhhHpcHp,cpletpetpcetpcetp,cpletpetpcetpcHp,cpletpetpcHpcHp,       & 
& cpletphhhhcetp,cpletphhhhcHp,cpletpHpcetpcetp,cpletpHpcetpcHp,cpletpHpcHpcHp,          & 
& cplhhhhhhhh,cplhhhhHpcetp,cplhhhhHpcHp,cplHpHpcetpcetp,cplHpHpcetpcHp,cplHpHpcHpcHp,   & 
& cplAhhhVZ,cplAhHpVWp,cplAhcHpcVWp,cpletIetpVWp,cpletIhhVZ,cpletIcetpcVWp,              & 
& cpletphhVWp,cpletpcetpVP,cpletpcetpVZ,cplhhHpVWp,cplhhcetpcVWp,cplhhcHpcVWp,           & 
& cplHpcHpVP,cplHpcHpVZ,cpletpVPVWp,cpletpVWpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpVPVWp,       & 
& cplHpVWpVZ,cplcetpcVWpVP,cplcHpcVWpVP,cplcetpcVWpVZ,cplcHpcVWpVZ,cplAhAhcVWpVWp,       & 
& cplAhAhVZVZ,cplAhHpVPVWp,cplAhHpVWpVZ,cplAhcHpcVWpVP,cplAhcHpcVWpVZ,cpletIetIcVWpVWp,  & 
& cpletIetIVZVZ,cpletIetpVPVWp,cpletIetpVWpVZ,cpletIcetpcVWpVP,cpletIcetpcVWpVZ,         & 
& cpletphhVPVWp,cpletphhVWpVZ,cpletpcetpVPVP,cpletpcetpVPVZ,cpletpcetpcVWpVWp,           & 
& cpletpcetpVZVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHpVPVWp,cplhhHpVWpVZ,cplhhcetpcVWpVP,   & 
& cplhhcHpcVWpVP,cplhhcetpcVWpVZ,cplhhcHpcVWpVZ,cplHpcHpVPVP,cplHpcHpVPVZ,               & 
& cplHpcHpcVWpVWp,cplHpcHpVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdetpL,         & 
& cplcFuFdetpR,cplcFvFeetpL,cplcFvFeetpR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,            & 
& cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFdFucetpL,cplcFdFucetpR,cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcetpL,       & 
& cplcFeFvcetpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,           & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFeFeVPL,           & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFvFecVWpL,cplcFvFecVWpR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFvFvVZL,cplcFvFvVZR,cplVGVGVGVG1,            & 
& cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,             & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2, & 
& cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,         & 
& cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,      & 
& cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,        & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgWCgAetp,cplcgZgWpetp,       & 
& cplcgWCgZetp,cplcgZgAhh,cplcgWCgAHp,cplcgWpgAcetp,cplcgWpgAcHp,cplcgWpgWphh,           & 
& cplcgZgWpHp,cplcgWCgWChh,cplcgZgWCcetp,cplcgZgWCcHp,cplcgZgZhh,cplcgWCgZHp,            & 
& cplcgWpgZcetp,cplcgWpgZcHp)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,lam2,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),             & 
& ZER(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),Yu(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhetpcetp,             & 
& cplAhetpcHp,cplAhhhhh(2,2),cplAhHpcetp,cplAhHpcHp,cpletIetIetI,cpletIetIhh(2),         & 
& cpletIetpcetp,cpletIetpcHp,cpletIhhhh(2,2),cpletIHpcetp,cpletIHpcHp,cpletphhcetp(2),   & 
& cpletphhcHp(2),cplhhhhhh(2,2,2),cplhhHpcetp(2),cplhhHpcHp(2),cplAhAhAhAh,              & 
& cplAhAhAhetI,cplAhAhAhhh(2),cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhetpcetp,              & 
& cplAhAhetpcHp,cplAhAhhhhh(2,2),cplAhAhHpcetp,cplAhAhHpcHp,cplAhetIetIetI,              & 
& cplAhetIetIhh(2),cplAhetIetpcetp,cplAhetIetpcHp,cplAhetIhhhh(2,2),cplAhetIHpcetp,      & 
& cplAhetIHpcHp,cplAhetphhcetp(2),cplAhetphhcHp(2),cplAhhhhhhh(2,2,2),cplAhhhHpcetp(2),  & 
& cplAhhhHpcHp(2),cpletIetIetIetI,cpletIetIetIhh(2),cpletIetIetpcetp,cpletIetIetpcHp,    & 
& cpletIetIhhhh(2,2),cpletIetIHpcetp,cpletIetIHpcHp,cpletIetphhcetp(2),cpletIetphhcHp(2),& 
& cpletIhhhhhh(2,2,2),cpletIhhHpcetp(2),cpletIhhHpcHp(2),cpletpetpcetpcetp,              & 
& cpletpetpcetpcHp,cpletpetpcHpcHp,cpletphhhhcetp(2,2),cpletphhhhcHp(2,2),               & 
& cpletpHpcetpcetp,cpletpHpcetpcHp,cpletpHpcHpcHp,cplhhhhhhhh(2,2,2,2),cplhhhhHpcetp(2,2),& 
& cplhhhhHpcHp(2,2),cplHpHpcetpcetp,cplHpHpcetpcHp,cplHpHpcHpcHp,cplAhhhVZ(2),           & 
& cplAhHpVWp,cplAhcHpcVWp,cpletIetpVWp,cpletIhhVZ(2),cpletIcetpcVWp,cpletphhVWp(2),      & 
& cpletpcetpVP,cpletpcetpVZ,cplhhHpVWp(2),cplhhcetpcVWp(2),cplhhcHpcVWp(2),              & 
& cplHpcHpVP,cplHpcHpVZ,cpletpVPVWp,cpletpVWpVZ,cplhhcVWpVWp(2),cplhhVZVZ(2),            & 
& cplHpVPVWp,cplHpVWpVZ,cplcetpcVWpVP,cplcHpcVWpVP,cplcetpcVWpVZ,cplcHpcVWpVZ,           & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHpVPVWp,cplAhHpVWpVZ,cplAhcHpcVWpVP,cplAhcHpcVWpVZ,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIetpVPVWp,cpletIetpVWpVZ,cpletIcetpcVWpVP,         & 
& cpletIcetpcVWpVZ,cpletphhVPVWp(2),cpletphhVWpVZ(2),cpletpcetpVPVP,cpletpcetpVPVZ,      & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ,cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhHpVPVWp(2), & 
& cplhhHpVWpVZ(2),cplhhcetpcVWpVP(2),cplhhcHpcVWpVP(2),cplhhcetpcVWpVZ(2),               & 
& cplhhcHpcVWpVZ(2),cplHpcHpVPVP,cplHpcHpVPVZ,cplHpcHpcVWpVWp,cplHpcHpVZVZ,              & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),& 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),cplcFvFeetpL(3,3),cplcFvFeetpR(3,3),               & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),           & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),             & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecVWpL(3,3),& 
& cplcFvFecVWpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFeFvVWpL(3,3)

Complex(dp), Intent(out) :: cplcFeFvVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplVGVGVGVG1,cplVGVGVGVG2,         & 
& cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,          & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,               & 
& cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,      & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,        & 
& cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgWCgAetp,cplcgZgWpetp,cplcgWCgZetp,       & 
& cplcgZgAhh(2),cplcgWCgAHp,cplcgWpgAcetp,cplcgWpgAcHp,cplcgWpgWphh(2),cplcgZgWpHp,      & 
& cplcgWCgWChh(2),cplcgZgWCcetp,cplcgZgWCcHp,cplcgZgZhh(2),cplcgWCgZHp,cplcgWpgZcetp,    & 
& cplcgWpgZcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIT(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIT(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhetpcetp = 0._dp 
Call CouplingAhetpcetpT(lam7,vv,cplAhetpcetp)



cplAhetpcHp = 0._dp 
Call CouplingAhetpcHpT(lam4,lam5,vv,cplAhetpcHp)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHpcetp = 0._dp 
Call CouplingAhHpcetpT(lam4,lam5,vv,cplAhHpcetp)



cplAhHpcHp = 0._dp 
Call CouplingAhHpcHpT(lam6,vv,cplAhHpcHp)



cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIetpcetp = 0._dp 
Call CouplingetIetpcetpT(lam7,v,cpletIetpcetp)



cpletIetpcHp = 0._dp 
Call CouplingetIetpcHpT(lam4,lam5,v,cpletIetpcHp)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHpcetp = 0._dp 
Call CouplingetIHpcetpT(lam4,lam5,v,cpletIHpcetp)



cpletIHpcHp = 0._dp 
Call CouplingetIHpcHpT(lam6,v,cpletIHpcHp)



cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cpletphhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcHpT(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,cpletphhcHp(gt2))

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


cplhhHpcetp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcetpT(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,cplhhHpcetp(gt1))

End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpT(gt1,lam1,lam3,lam6,v,vv,ZH,cplhhHpcHp(gt1))

End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhT(lam1,cplAhAhAhAh)



cplAhAhAhetI = 0._dp 
Call CouplingAhAhAhetIT(lam6,cplAhAhAhetI)



cplAhAhAhhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhhT(gt4,lam6,ZH,cplAhAhAhhh(gt4))

End Do 


cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIT(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhetIhhT(gt4,lam6,ZH,cplAhAhetIhh(gt4))

End Do 


cplAhAhetpcetp = 0._dp 
Call CouplingAhAhetpcetpT(lam3,cplAhAhetpcetp)



cplAhAhetpcHp = 0._dp 
Call CouplingAhAhetpcHpT(lam6,cplAhAhetpcHp)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHpcetp = 0._dp 
Call CouplingAhAhHpcetpT(lam6,cplAhAhHpcetp)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpT(lam1,cplAhAhHpcHp)



cplAhetIetIetI = 0._dp 
Call CouplingAhetIetIetIT(lam7,cplAhetIetIetI)



cplAhetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIetIhhT(gt4,lam7,ZH,cplAhetIetIhh(gt4))

End Do 


cplAhetIetpcetp = 0._dp 
Call CouplingAhetIetpcetpT(lam7,cplAhetIetpcetp)



cplAhetIetpcHp = 0._dp 
Call CouplingAhetIetpcHpT(lam4,lam5,cplAhetIetpcHp)



cplAhetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhetIhhhhT(gt3,gt4,lam7,lam5,lam6,ZH,cplAhetIhhhh(gt3,gt4))

 End Do 
End Do 


cplAhetIHpcetp = 0._dp 
Call CouplingAhetIHpcetpT(lam4,lam5,cplAhetIHpcetp)



cplAhetIHpcHp = 0._dp 
Call CouplingAhetIHpcHpT(lam6,cplAhetIHpcHp)



cplAhetphhcetp = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetphhcetpT(gt3,lam7,ZH,cplAhetphhcetp(gt3))

End Do 


cplAhetphhcHp = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetphhcHpT(gt3,lam4,lam5,ZH,cplAhetphhcHp(gt3))

End Do 


cplAhhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,cplAhhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhHpcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhHpcetpT(gt2,lam4,lam5,ZH,cplAhhhHpcetp(gt2))

End Do 


cplAhhhHpcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhHpcHpT(gt2,lam6,ZH,cplAhhhHpcHp(gt2))

End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIT(lam2,cpletIetIetIetI)



cpletIetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingetIetIetIhhT(gt4,lam7,ZH,cpletIetIetIhh(gt4))

End Do 


cpletIetIetpcetp = 0._dp 
Call CouplingetIetIetpcetpT(lam2,cpletIetIetpcetp)



cpletIetIetpcHp = 0._dp 
Call CouplingetIetIetpcHpT(lam7,cpletIetIetpcHp)



cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhhT(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHpcetp = 0._dp 
Call CouplingetIetIHpcetpT(lam7,cpletIetIHpcetp)



cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHpT(lam3,cpletIetIHpcHp)



cpletIetphhcetp = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetphhcetpT(gt3,lam7,ZH,cpletIetphhcetp(gt3))

End Do 


cpletIetphhcHp = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetphhcHpT(gt3,lam4,lam5,ZH,cpletIetphhcHp(gt3))

End Do 


cpletIhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingetIhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,cpletIhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIhhHpcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhHpcetpT(gt2,lam4,lam5,ZH,cpletIhhHpcetp(gt2))

End Do 


cpletIhhHpcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhHpcHpT(gt2,lam6,ZH,cpletIhhHpcHp(gt2))

End Do 


cpletpetpcetpcetp = 0._dp 
Call CouplingetpetpcetpcetpT(lam2,cpletpetpcetpcetp)



cpletpetpcetpcHp = 0._dp 
Call CouplingetpetpcetpcHpT(lam7,cpletpetpcetpcHp)



cpletpetpcHpcHp = 0._dp 
Call CouplingetpetpcHpcHpT(lam5,cpletpetpcHpcHp)



cpletphhhhcetp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetphhhhcetpT(gt2,gt3,lam2,lam3,lam7,ZH,cpletphhhhcetp(gt2,gt3))

 End Do 
End Do 


cpletphhhhcHp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetphhhhcHpT(gt2,gt3,lam4,lam7,lam5,lam6,ZH,cpletphhhhcHp(gt2,gt3))

 End Do 
End Do 


cpletpHpcetpcetp = 0._dp 
Call CouplingetpHpcetpcetpT(lam7,cpletpHpcetpcetp)



cpletpHpcetpcHp = 0._dp 
Call CouplingetpHpcetpcHpT(lam4,lam3,cpletpHpcetpcHp)



cpletpHpcHpcHp = 0._dp 
Call CouplingetpHpcHpcHpT(lam6,cpletpHpcHpcHp)



cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcetp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcetpT(gt1,gt2,lam4,lam7,lam5,lam6,ZH,cplhhhhHpcetp(gt1,gt2))

 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpT(gt1,gt2,lam1,lam3,lam6,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcetpcetp = 0._dp 
Call CouplingHpHpcetpcetpT(lam5,cplHpHpcetpcetp)



cplHpHpcetpcHp = 0._dp 
Call CouplingHpHpcetpcHpT(lam6,cplHpHpcetpcHp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpT(lam1,cplHpHpcHpcHp)



cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHpVWp = 0._dp 
Call CouplingAhHpVWpT(g2,cplAhHpVWp)



cplAhcHpcVWp = 0._dp 
Call CouplingAhcHpcVWpT(g2,cplAhcHpcVWp)



cpletIetpVWp = 0._dp 
Call CouplingetIetpVWpT(g2,cpletIetpVWp)



cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpT(g2,cpletIcetpcVWp)



cpletphhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVWpT(gt2,g2,ZH,cpletphhVWp(gt2))

End Do 


cpletpcetpVP = 0._dp 
Call CouplingetpcetpVPT(g1,g2,TW,cpletpcetpVP)



cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZT(g1,g2,TW,cpletpcetpVZ)



cplhhHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpVWpT(gt1,g2,ZH,cplhhHpVWp(gt1))

End Do 


cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpT(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplhhcHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpT(gt1,g2,ZH,cplhhcHpcVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cpletpVPVWp = 0._dp 
Call CouplingetpVPVWpT(g1,g2,vv,TW,cpletpVPVWp)



cpletpVWpVZ = 0._dp 
Call CouplingetpVWpVZT(g1,g2,vv,TW,cpletpVWpVZ)



cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHpVPVWp = 0._dp 
Call CouplingHpVPVWpT(g1,g2,v,TW,cplHpVPVWp)



cplHpVWpVZ = 0._dp 
Call CouplingHpVWpVZT(g1,g2,v,TW,cplHpVWpVZ)



cplcetpcVWpVP = 0._dp 
Call CouplingcetpcVWpVPT(g1,g2,vv,TW,cplcetpcVWpVP)



cplcHpcVWpVP = 0._dp 
Call CouplingcHpcVWpVPT(g1,g2,v,TW,cplcHpcVWpVP)



cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZT(g1,g2,vv,TW,cplcetpcVWpVZ)



cplcHpcVWpVZ = 0._dp 
Call CouplingcHpcVWpVZT(g1,g2,v,TW,cplcHpcVWpVZ)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpT(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZT(g1,g2,TW,cplAhAhVZVZ)



cplAhHpVPVWp = 0._dp 
Call CouplingAhHpVPVWpT(g1,g2,TW,cplAhHpVPVWp)



cplAhHpVWpVZ = 0._dp 
Call CouplingAhHpVWpVZT(g1,g2,TW,cplAhHpVWpVZ)



cplAhcHpcVWpVP = 0._dp 
Call CouplingAhcHpcVWpVPT(g1,g2,TW,cplAhcHpcVWpVP)



cplAhcHpcVWpVZ = 0._dp 
Call CouplingAhcHpcVWpVZT(g1,g2,TW,cplAhcHpcVWpVZ)



cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpT(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZT(g1,g2,TW,cpletIetIVZVZ)



cpletIetpVPVWp = 0._dp 
Call CouplingetIetpVPVWpT(g1,g2,TW,cpletIetpVPVWp)



cpletIetpVWpVZ = 0._dp 
Call CouplingetIetpVWpVZT(g1,g2,TW,cpletIetpVWpVZ)



cpletIcetpcVWpVP = 0._dp 
Call CouplingetIcetpcVWpVPT(g1,g2,TW,cpletIcetpcVWpVP)



cpletIcetpcVWpVZ = 0._dp 
Call CouplingetIcetpcVWpVZT(g1,g2,TW,cpletIcetpcVWpVZ)



cpletphhVPVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVPVWpT(gt2,g1,g2,ZH,TW,cpletphhVPVWp(gt2))

End Do 


cpletphhVWpVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVWpVZT(gt2,g1,g2,ZH,TW,cpletphhVWpVZ(gt2))

End Do 


cpletpcetpVPVP = 0._dp 
Call CouplingetpcetpVPVPT(g1,g2,TW,cpletpcetpVPVP)



cpletpcetpVPVZ = 0._dp 
Call CouplingetpcetpVPVZT(g1,g2,TW,cpletpcetpVPVZ)



cpletpcetpcVWpVWp = 0._dp 
Call CouplingetpcetpcVWpVWpT(g2,cpletpcetpcVWpVWp)



cpletpcetpVZVZ = 0._dp 
Call CouplingetpcetpVZVZT(g1,g2,TW,cpletpcetpVZVZ)



cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhHpVPVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpVPVWpT(gt1,g1,g2,ZH,TW,cplhhHpVPVWp(gt1))

End Do 


cplhhHpVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpVWpVZT(gt1,g1,g2,ZH,TW,cplhhHpVWpVZ(gt1))

End Do 


cplhhcetpcVWpVP = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpVPT(gt1,g1,g2,ZH,TW,cplhhcetpcVWpVP(gt1))

End Do 


cplhhcHpcVWpVP = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpVPT(gt1,g1,g2,ZH,TW,cplhhcHpcVWpVP(gt1))

End Do 


cplhhcetpcVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpVZT(gt1,g1,g2,ZH,TW,cplhhcetpcVWpVZ(gt1))

End Do 


cplhhcHpcVWpVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpVZT(gt1,g1,g2,ZH,TW,cplhhcHpcVWpVZ(gt1))

End Do 


cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPT(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpVPVZ = 0._dp 
Call CouplingHpcHpVPVZT(g1,g2,TW,cplHpcHpVPVZ)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpT(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZT(g1,g2,TW,cplHpcHpVZVZ)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



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
Call CouplingcFuFuAhT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
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


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)            & 
& ,cplcFuFdHpR(gt1,gt2))

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


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHpT(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

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


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

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


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

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



cplcgWpgAVWp = 0._dp 
Call CouplingcgWpgAVWpT(g2,TW,cplcgWpgAVWp)



cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpT(g2,TW,cplcgWCgAcVWp)



cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPT(g2,TW,cplcgWpgWpVP)



cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZT(g2,TW,cplcgWpgWpVZ)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpT(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpT(g2,TW,cplcgZgWpcVWp)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPT(g2,TW,cplcgWCgWCVP)



cplcgAgWCVWp = 0._dp 
Call CouplingcgAgWCVWpT(g2,TW,cplcgAgWCVWp)



cplcgZgWCVWp = 0._dp 
Call CouplingcgZgWCVWpT(g2,TW,cplcgZgWCVWp)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZT(g2,TW,cplcgWCgWCVZ)



cplcgWpgZVWp = 0._dp 
Call CouplingcgWpgZVWpT(g2,TW,cplcgWpgZVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpT(g2,TW,cplcgWCgZcVWp)



cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhT(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhT(g2,v,cplcgWCgWCAh)



cplcgWpgWpetI = 0._dp 
Call CouplingcgWpgWpetIT(g2,vv,cplcgWpgWpetI)



cplcgWCgWCetI = 0._dp 
Call CouplingcgWCgWCetIT(g2,vv,cplcgWCgWCetI)



cplcgWCgAetp = 0._dp 
Call CouplingcgWCgAetpT(g1,g2,vv,TW,cplcgWCgAetp)



cplcgZgWpetp = 0._dp 
Call CouplingcgZgWpetpT(g1,g2,vv,TW,cplcgZgWpetp)



cplcgWCgZetp = 0._dp 
Call CouplingcgWCgZetpT(g1,g2,vv,TW,cplcgWCgZetp)



cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,v,vv,ZH,TW,cplcgZgAhh(gt3))

End Do 


cplcgWCgAHp = 0._dp 
Call CouplingcgWCgAHpT(g1,g2,v,TW,cplcgWCgAHp)



cplcgWpgAcetp = 0._dp 
Call CouplingcgWpgAcetpT(g1,g2,vv,TW,cplcgWpgAcetp)



cplcgWpgAcHp = 0._dp 
Call CouplingcgWpgAcHpT(g1,g2,v,TW,cplcgWpgAcHp)



cplcgWpgWphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWphhT(gt3,g2,v,vv,ZH,cplcgWpgWphh(gt3))

End Do 


cplcgZgWpHp = 0._dp 
Call CouplingcgZgWpHpT(g1,g2,v,TW,cplcgZgWpHp)



cplcgWCgWChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWChhT(gt3,g2,v,vv,ZH,cplcgWCgWChh(gt3))

End Do 


cplcgZgWCcetp = 0._dp 
Call CouplingcgZgWCcetpT(g1,g2,vv,TW,cplcgZgWCcetp)



cplcgZgWCcHp = 0._dp 
Call CouplingcgZgWCcHpT(g1,g2,v,TW,cplcgZgWCcHp)



cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,v,vv,ZH,TW,cplcgZgZhh(gt3))

End Do 


cplcgWCgZHp = 0._dp 
Call CouplingcgWCgZHpT(g1,g2,v,TW,cplcgWCgZHp)



cplcgWpgZcetp = 0._dp 
Call CouplingcgWpgZcetpT(g1,g2,vv,TW,cplcgWpgZcetp)



cplcgWpgZcHp = 0._dp 
Call CouplingcgWpgZcHpT(g1,g2,v,TW,cplcgWpgZcHp)



Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,lam2,g1,g2,             & 
& TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,epsU,ZUL,ZUR,epsD,epsE,Yu,cplAhAhAh,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplAhhhhh,cplAhHpcetp,       & 
& cplAhHpcHp,cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,cpletIhhhh,             & 
& cpletIHpcetp,cpletIHpcHp,cpletphhcetp,cpletphhcHp,cplhhhhhh,cplhhHpcetp,               & 
& cplhhHpcHp,cplAhhhVZ,cplAhHpVWp,cplAhcHpcVWp,cpletIetpVWp,cpletIhhVZ,cpletIcetpcVWp,   & 
& cpletphhVWp,cpletpcetpVP,cpletpcetpVZ,cplhhHpVWp,cplhhcetpcVWp,cplhhcHpcVWp,           & 
& cplHpcHpVP,cplHpcHpVZ,cpletpVPVWp,cpletpVWpVZ,cplhhcVWpVWp,cplhhVZVZ,cplHpVPVWp,       & 
& cplHpVWpVZ,cplcetpcVWpVP,cplcHpcVWpVP,cplcetpcVWpVZ,cplcHpcVWpVZ,cplVGVGVG,            & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,           & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFdetpL,cplcFuFdetpR,cplcFvFeetpL,cplcFvFeetpR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFvFeHpL,cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucetpL,cplcFdFucetpR,           & 
& cplcFdFucHpL,cplcFdFucHpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcFeFvcHpL,cplcFeFvcHpR,       & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,           & 
& cplcFvFecVWpL,cplcFvFecVWpR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,           & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcFvFvVZL,cplcFvFvVZR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,lam2,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),             & 
& ZER(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),Yu(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhetpcetp,             & 
& cplAhetpcHp,cplAhhhhh(2,2),cplAhHpcetp,cplAhHpcHp,cpletIetIetI,cpletIetIhh(2),         & 
& cpletIetpcetp,cpletIetpcHp,cpletIhhhh(2,2),cpletIHpcetp,cpletIHpcHp,cpletphhcetp(2),   & 
& cpletphhcHp(2),cplhhhhhh(2,2,2),cplhhHpcetp(2),cplhhHpcHp(2),cplAhhhVZ(2),             & 
& cplAhHpVWp,cplAhcHpcVWp,cpletIetpVWp,cpletIhhVZ(2),cpletIcetpcVWp,cpletphhVWp(2),      & 
& cpletpcetpVP,cpletpcetpVZ,cplhhHpVWp(2),cplhhcetpcVWp(2),cplhhcHpcVWp(2),              & 
& cplHpcHpVP,cplHpcHpVZ,cpletpVPVWp,cpletpVWpVZ,cplhhcVWpVWp(2),cplhhVZVZ(2),            & 
& cplHpVPVWp,cplHpVWpVZ,cplcetpcVWpVP,cplcHpcVWpVP,cplcetpcVWpVZ,cplcHpcVWpVZ,           & 
& cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),& 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),& 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),cplcFvFeetpL(3,3),cplcFvFeetpR(3,3),               & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),           & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),             & 
& cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),& 
& cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFvFecVWpL(3,3),& 
& cplcFvFecVWpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFeFvVWpL(3,3),& 
& cplcFeFvVWpR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIT(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIT(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhetpcetp = 0._dp 
Call CouplingAhetpcetpT(lam7,vv,cplAhetpcetp)



cplAhetpcHp = 0._dp 
Call CouplingAhetpcHpT(lam4,lam5,vv,cplAhetpcHp)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHpcetp = 0._dp 
Call CouplingAhHpcetpT(lam4,lam5,vv,cplAhHpcetp)



cplAhHpcHp = 0._dp 
Call CouplingAhHpcHpT(lam6,vv,cplAhHpcHp)



cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIetpcetp = 0._dp 
Call CouplingetIetpcetpT(lam7,v,cpletIetpcetp)



cpletIetpcHp = 0._dp 
Call CouplingetIetpcHpT(lam4,lam5,v,cpletIetpcHp)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHpcetp = 0._dp 
Call CouplingetIHpcetpT(lam4,lam5,v,cpletIHpcetp)



cpletIHpcHp = 0._dp 
Call CouplingetIHpcHpT(lam6,v,cpletIHpcHp)



cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cpletphhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcHpT(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,cpletphhcHp(gt2))

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


cplhhHpcetp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcetpT(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,cplhhHpcetp(gt1))

End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpT(gt1,lam1,lam3,lam6,v,vv,ZH,cplhhHpcHp(gt1))

End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHpVWp = 0._dp 
Call CouplingAhHpVWpT(g2,cplAhHpVWp)



cplAhcHpcVWp = 0._dp 
Call CouplingAhcHpcVWpT(g2,cplAhcHpcVWp)



cpletIetpVWp = 0._dp 
Call CouplingetIetpVWpT(g2,cpletIetpVWp)



cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpT(g2,cpletIcetpcVWp)



cpletphhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhVWpT(gt2,g2,ZH,cpletphhVWp(gt2))

End Do 


cpletpcetpVP = 0._dp 
Call CouplingetpcetpVPT(g1,g2,TW,cpletpcetpVP)



cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZT(g1,g2,TW,cpletpcetpVZ)



cplhhHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpVWpT(gt1,g2,ZH,cplhhHpVWp(gt1))

End Do 


cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpT(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplhhcHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpT(gt1,g2,ZH,cplhhcHpcVWp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPT(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZT(g1,g2,TW,cplHpcHpVZ)



cpletpVPVWp = 0._dp 
Call CouplingetpVPVWpT(g1,g2,vv,TW,cpletpVPVWp)



cpletpVWpVZ = 0._dp 
Call CouplingetpVWpVZT(g1,g2,vv,TW,cpletpVWpVZ)



cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHpVPVWp = 0._dp 
Call CouplingHpVPVWpT(g1,g2,v,TW,cplHpVPVWp)



cplHpVWpVZ = 0._dp 
Call CouplingHpVWpVZT(g1,g2,v,TW,cplHpVWpVZ)



cplcetpcVWpVP = 0._dp 
Call CouplingcetpcVWpVPT(g1,g2,vv,TW,cplcetpcVWpVP)



cplcHpcVWpVP = 0._dp 
Call CouplingcHpcVWpVPT(g1,g2,v,TW,cplcHpcVWpVP)



cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZT(g1,g2,vv,TW,cplcetpcVWpVZ)



cplcHpcVWpVZ = 0._dp 
Call CouplingcHpcVWpVZT(g1,g2,v,TW,cplcHpcVWpVZ)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



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
Call CouplingcFuFuAhT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
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


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)            & 
& ,cplcFuFdHpR(gt1,gt2))

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


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHpT(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

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


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

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


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

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
End Subroutine AllCouplings

Subroutine CouplingAhAhAhT(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhT  
 
 
Subroutine CouplingAhAhetIT(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIT  
 
 
Subroutine CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplingAhetIetIT(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIT  
 
 
Subroutine CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhT  
 
 
Subroutine CouplingAhetpcetpT(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcetp' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcetpT  
 
 
Subroutine CouplingAhetpcHpT(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcHp' 
 
res = 0._dp 
res = res+(lam4*vv)/2._dp
res = res-(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcHpT  
 
 
Subroutine CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhT  
 
 
Subroutine CouplingAhHpcetpT(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcetp' 
 
res = 0._dp 
res = res-(lam4*vv)/2._dp
res = res+(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcetpT  
 
 
Subroutine CouplingAhHpcHpT(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcHp' 
 
res = 0._dp 
res = res-(lam6*vv)/2._dp
res = res+(vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcHpT  
 
 
Subroutine CouplingetIetIetIT(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIT  
 
 
Subroutine CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhT  
 
 
Subroutine CouplingetIetpcetpT(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcetp' 
 
res = 0._dp 
res = res+(lam7*v)/2._dp
res = res-(v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcetpT  
 
 
Subroutine CouplingetIetpcHpT(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcHp' 
 
res = 0._dp 
res = res-(lam4*v)/2._dp
res = res+(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcHpT  
 
 
Subroutine CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhT  
 
 
Subroutine CouplingetIHpcetpT(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcetp' 
 
res = 0._dp 
res = res+(lam4*v)/2._dp
res = res-(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcetpT  
 
 
Subroutine CouplingetIHpcHpT(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcHp' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcHpT  
 
 
Subroutine CouplingetphhcetpT(gt2,lam2,lam3,lam7,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt2,1))
res = res-(lam7*vv*ZH(gt2,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1))/2._dp
res = res-(lam7*v*ZH(gt2,2))/2._dp
res = res-(lam2*vv*ZH(gt2,2))
res = res-(v*Conjg(lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhcetpT  
 
 
Subroutine CouplingetphhcHpT(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt2,1))
res = res-(lam4*vv*ZH(gt2,1))/2._dp
res = res-(lam5*vv*ZH(gt2,1))/2._dp
res = res-(lam4*v*ZH(gt2,2))/2._dp
res = res-(lam5*v*ZH(gt2,2))/2._dp
res = res-(lam7*vv*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhcHpT  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
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

res = 0._dp 
res = res-3*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHpcetpT(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcetp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*vv*ZH(gt1,1))/2._dp
res = res-(lam5*vv*ZH(gt1,1))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1))
res = res-(lam4*v*ZH(gt1,2))/2._dp
res = res-(lam5*v*ZH(gt1,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcetpT  
 
 
Subroutine CouplinghhHpcHpT(gt1,lam1,lam3,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt1,1))
res = res-(lam6*vv*ZH(gt1,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1))/2._dp
res = res-(lam6*v*ZH(gt1,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpT  
 
 
Subroutine CouplingAhAhAhAhT(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhAhAhetIT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhetI' 
 
res = 0._dp 
res = res-3._dp*(lam6)/2._dp
res = res+(-3*Conjg(lam6))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhetIT  
 
 
Subroutine CouplingAhAhAhhhT(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*lam6*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam6)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhhT  
 
 
Subroutine CouplingAhAhetIetIT(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

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
 
 
Subroutine CouplingAhAhetIhhT(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam6*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIhhT  
 
 
Subroutine CouplingAhAhetpcetpT(lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetpcetpT  
 
 
Subroutine CouplingAhAhetpcHpT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam6)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetpcHpT  
 
 
Subroutine CouplingAhAhhhhhT(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
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
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHpcetpT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHpcetp' 
 
res = 0._dp 
res = res-Conjg(lam6)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHpcetpT  
 
 
Subroutine CouplingAhAhHpcHpT(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhetIetIetIT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam7)/2._dp
res = res+(-3*Conjg(lam7))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIetIT  
 
 
Subroutine CouplingAhetIetIhhT(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam7*ZH(gt4,2))/2._dp
res = res+(Conjg(lam7)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIhhT  
 
 
Subroutine CouplingAhetIetpcetpT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam7)/2._dp
res = res-Conjg(lam7)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetpcetpT  
 
 
Subroutine CouplingAhetIetpcHpT(lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam4)/2._dp
res = res-1._dp*(lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetpcHpT  
 
 
Subroutine CouplingAhetIhhhhT(gt3,gt4,lam7,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhhhh' 
 
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
res = res-(lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhhhT  
 
 
Subroutine CouplingAhetIHpcetpT(lam4,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam4)/2._dp
res = res-1._dp*(lam5)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHpcetpT  
 
 
Subroutine CouplingAhetIHpcHpT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam6)/2._dp
res = res-Conjg(lam6)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHpcHpT  
 
 
Subroutine CouplingAhetphhcetpT(gt3,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetphhcetp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam7*ZH(gt3,2))/2._dp
res = res+(Conjg(lam7)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetphhcetpT  
 
 
Subroutine CouplingAhetphhcHpT(gt3,lam4,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetphhcHp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*ZH(gt3,2))/2._dp
res = res-(lam5*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetphhcHpT  
 
 
Subroutine CouplingAhhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
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
res = res-(lam6*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhhT  
 
 
Subroutine CouplingAhhhHpcetpT(gt2,lam4,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHpcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*ZH(gt2,2))/2._dp
res = res+(lam5*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHpcetpT  
 
 
Subroutine CouplingAhhhHpcHpT(gt2,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHpcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*ZH(gt2,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHpcHpT  
 
 
Subroutine CouplingetIetIetIetIT(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

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
 
 
Subroutine CouplingetIetIetIhhT(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam7*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIhhT  
 
 
Subroutine CouplingetIetIetpcetpT(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetpcetpT  
 
 
Subroutine CouplingetIetIetpcHpT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam7)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetpcHpT  
 
 
Subroutine CouplingetIetIhhhhT(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
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
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhT  
 
 
Subroutine CouplingetIetIHpcetpT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHpcetp' 
 
res = 0._dp 
res = res-Conjg(lam7)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHpcetpT  
 
 
Subroutine CouplingetIetIHpcHpT(lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam3

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
 
 
Subroutine CouplingetIetphhcetpT(gt3,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetphhcetp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam7*ZH(gt3,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetphhcetpT  
 
 
Subroutine CouplingetIetphhcHpT(gt3,lam4,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetphhcHp' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*ZH(gt3,1))/2._dp
res = res+(lam5*ZH(gt3,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetphhcHpT  
 
 
Subroutine CouplingetIhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhhhh' 
 
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
res = res+(3*lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhhhT  
 
 
Subroutine CouplingetIhhHpcetpT(gt2,lam4,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHpcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam4*ZH(gt2,1))/2._dp
res = res-(lam5*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHpcetpT  
 
 
Subroutine CouplingetIhhHpcHpT(gt2,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHpcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam6*ZH(gt2,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHpcHpT  
 
 
Subroutine CouplingetpetpcetpcetpT(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetpetpcetpcetp' 
 
res = 0._dp 
res = res-2._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpetpcetpcetpT  
 
 
Subroutine CouplingetpetpcetpcHpT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpetpcetpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam7)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpetpcetpcHpT  
 
 
Subroutine CouplingetpetpcHpcHpT(lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpetpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpetpcHpcHpT  
 
 
Subroutine CouplingetphhhhcetpT(gt2,gt3,lam2,lam3,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhhhcetp' 
 
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
res = res-(lam3*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam7*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam7*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam2*ZH(gt2,2)*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhhhcetpT  
 
 
Subroutine CouplingetphhhhcHpT(gt2,gt3,lam4,lam7,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhhhcHp' 
 
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
res = res-(lam6*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam5*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam4*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam5*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam7*ZH(gt2,2)*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhhhcHpT  
 
 
Subroutine CouplingetpHpcetpcetpT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpHpcetpcetp' 
 
res = 0._dp 
res = res-2*Conjg(lam7)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpHpcetpcetpT  
 
 
Subroutine CouplingetpHpcetpcHpT(lam4,lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpHpcetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpHpcetpcHpT  
 
 
Subroutine CouplingetpHpcHpcHpT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpHpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam6)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpHpcHpcHpT  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,           & 
& lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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
res = res-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHpcetpT(gt1,gt2,lam4,lam7,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcetp' 
 
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
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcetpT  
 
 
Subroutine CouplinghhhhHpcHpT(gt1,gt2,lam1,lam3,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
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
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1))
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpT  
 
 
Subroutine CouplingHpHpcetpcetpT(lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcetpcetp' 
 
res = 0._dp 
res = res-2._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcetpcetpT  
 
 
Subroutine CouplingHpHpcetpcHpT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcetpcHp' 
 
res = 0._dp 
res = res-2*Conjg(lam6)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcetpcHpT  
 
 
Subroutine CouplingHpHpcHpcHpT(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhhhVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpVWpT  
 
 
Subroutine CouplingAhcHpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpcVWpT  
 
 
Subroutine CouplingetIetpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpVWpT  
 
 
Subroutine CouplingetIhhVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhVZT  
 
 
Subroutine CouplingetIcetpcVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcetpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcetpcVWpT  
 
 
Subroutine CouplingetphhVWpT(gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhVWpT  
 
 
Subroutine CouplingetpcetpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVPT  
 
 
Subroutine CouplingetpcetpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-(g1*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVZT  
 
 
Subroutine CouplinghhHpVWpT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpVWpT  
 
 
Subroutine CouplinghhcetpcVWpT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcetpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcetpcVWpT  
 
 
Subroutine CouplinghhcHpcVWpT(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpcVWpT  
 
 
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
 
 
Subroutine CouplingetpVPVWpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*vv*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpVPVWpT  
 
 
Subroutine CouplingetpVWpVZT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*vv*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpVWpVZT  
 
 
Subroutine CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHpVPVWpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpVPVWpT  
 
 
Subroutine CouplingHpVWpVZT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpVWpVZT  
 
 
Subroutine CouplingcetpcVWpVPT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcetpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vv*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcetpcVWpVPT  
 
 
Subroutine CouplingcHpcVWpVPT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpcVWpVPT  
 
 
Subroutine CouplingcetpcVWpVZT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcetpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*vv*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcetpcVWpVZT  
 
 
Subroutine CouplingcHpcVWpVZT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpcVWpVZT  
 
 
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
 
 
Subroutine CouplingAhHpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpVPVWpT  
 
 
Subroutine CouplingAhHpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpVWpVZT  
 
 
Subroutine CouplingAhcHpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpcVWpVP' 
 
res = 0._dp 
res = res-(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpcVWpVPT  
 
 
Subroutine CouplingAhcHpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpcVWpVZ' 
 
res = 0._dp 
res = res+(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpcVWpVZT  
 
 
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
 
 
Subroutine CouplingetIetpVPVWpT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpVPVWp' 
 
res = 0._dp 
res = res+(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpVPVWpT  
 
 
Subroutine CouplingetIetpVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpVWpVZT  
 
 
Subroutine CouplingetIcetpcVWpVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcetpcVWpVP' 
 
res = 0._dp 
res = res-(g1*g2*Cos(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcetpcVWpVPT  
 
 
Subroutine CouplingetIcetpcVWpVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcetpcVWpVZ' 
 
res = 0._dp 
res = res+(g1*g2*Sin(TW))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcetpcVWpVZT  
 
 
Subroutine CouplingetphhVPVWpT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhVPVWpT  
 
 
Subroutine CouplingetphhVWpVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhVWpVZT  
 
 
Subroutine CouplingetpcetpVPVPT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVPVPT  
 
 
Subroutine CouplingetpcetpVPVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVPVZ' 
 
res = 0._dp 
res = res+(g1*g2*Cos(2._dp*(TW)))/2._dp
res = res-(g1**2*Sin(2._dp*(TW)))/4._dp
res = res+(g2**2*Sin(2._dp*(TW)))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVPVZT  
 
 
Subroutine CouplingetpcetpcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpcVWpVWpT  
 
 
Subroutine CouplingetpcetpVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVZVZT  
 
 
Subroutine CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
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
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
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
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHpVPVWpT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpVPVWpT  
 
 
Subroutine CouplinghhHpVWpVZT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpVWpVZT  
 
 
Subroutine CouplinghhcetpcVWpVPT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcetpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcetpcVWpVPT  
 
 
Subroutine CouplinghhcHpcVWpVPT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpcVWpVPT  
 
 
Subroutine CouplinghhcetpcVWpVZT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcetpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcetpcVWpVZT  
 
 
Subroutine CouplinghhcHpcVWpVZT(gt1,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpcVWpVZT  
 
 
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
res = res+g2*Sin(TW)
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
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZT  
 
 
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
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
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
 
 
Subroutine CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetIT  
 
 
Subroutine CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetIT  
 
 
Subroutine CouplingcFuFuetIT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
 
End Subroutine CouplingcFuFuetIT  
 
 
Subroutine CouplingcFuFdetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdetp' 
 
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
resR = resR+Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdetpT  
 
 
Subroutine CouplingcFvFeetpT(gt1,gt2,epsE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeetp' 
 
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
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,gt1))*ZER(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeetpT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)
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
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFvFeHpT(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeHp' 
 
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
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeHpT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucetpT(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucetp' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)
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
 
End Subroutine CouplingcFdFucetpT  
 
 
Subroutine CouplingcFdFucHpT(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

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
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpT  
 
 
Subroutine CouplingcFeFvcetpT(gt1,gt2,epsE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcetp' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*epsE(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcetpT  
 
 
Subroutine CouplingcFeFvcHpT(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

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
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpT  
 
 
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
 
 
Subroutine CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWp' 
 
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
 
End Subroutine CouplingcFuFdcVWpT  
 
 
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
 
 
Subroutine CouplingcFvFecVWpT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecVWp' 
 
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
 
End Subroutine CouplingcFvFecVWpT  
 
 
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
 
 
Subroutine CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuVWp' 
 
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
 
End Subroutine CouplingcFdFuVWpT  
 
 
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
 
 
Subroutine CouplingcFeFvVWpT(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvVWp' 
 
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
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvVWpT  
 
 
Subroutine CouplingcFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
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
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZT  
 
 
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
 
 
Subroutine CouplingcgWpgAVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAVWpT  
 
 
Subroutine CouplingcgWCgAcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpT  
 
 
Subroutine CouplingcgWpgWpVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPT  
 
 
Subroutine CouplingcgWpgWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZT  
 
 
Subroutine CouplingcgAgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
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
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpT  
 
 
Subroutine CouplingcgWCgWCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPT  
 
 
Subroutine CouplingcgAgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWCVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
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
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCVWpT  
 
 
Subroutine CouplingcgWCgWCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZT  
 
 
Subroutine CouplingcgWpgZVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZVWpT  
 
 
Subroutine CouplingcgWCgZcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpT  
 
 
Subroutine CouplingcgWpgWpAhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
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
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhT  
 
 
Subroutine CouplingcgWpgWpetIT(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpetI' 
 
res = 0._dp 
res = res-(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpetIT  
 
 
Subroutine CouplingcgWCgWCetIT(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCetI' 
 
res = 0._dp 
res = res+(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCetIT  
 
 
Subroutine CouplingcgWCgAetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAetp' 
 
res = 0._dp 
res = res-(g1*g2*vv*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAetpT  
 
 
Subroutine CouplingcgZgWpetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpetp' 
 
res = 0._dp 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpetpT  
 
 
Subroutine CouplingcgWCgZetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZetp' 
 
res = 0._dp 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZetpT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(2._dp*(TW))*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res-(g2**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res+(g1*g2*vv*Cos(2._dp*(TW))*RXiZ*ZH(gt3,2))/4._dp
res = res+(g1**2*vv*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
res = res-(g2**2*vv*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWCgAHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAHp' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAHpT  
 
 
Subroutine CouplingcgWpgAcetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAcetp' 
 
res = 0._dp 
res = res-(g1*g2*vv*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAcetpT  
 
 
Subroutine CouplingcgWpgAcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAcHp' 
 
res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp)/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAcHpT  
 
 
Subroutine CouplingcgWpgWphhT(gt3,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWp*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*RXiWp*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhT  
 
 
Subroutine CouplingcgZgWpHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpHpT  
 
 
Subroutine CouplingcgWCgWChhT(gt3,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWp*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*RXiWp*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhT  
 
 
Subroutine CouplingcgZgWCcetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcetp' 
 
res = 0._dp 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcetpT  
 
 
Subroutine CouplingcgZgWCcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcHpT  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*RXiZ*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,1))/2._dp
res = res-(g1**2*v*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*Cos(TW)**2*RXiZ*ZH(gt3,2))/4._dp
res = res-(g1*g2*vv*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,2))/2._dp
res = res-(g1**2*vv*RXiZ*Sin(TW)**2*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWCgZHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZHpT  
 
 
Subroutine CouplingcgWpgZcetpT(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcetp' 
 
res = 0._dp 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcetpT  
 
 
Subroutine CouplingcgWpgZcHpT(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcHpT  
 
 
Subroutine CouplingsForEffPot4(lam1,lam4,lam3,lam5,lam6,ZH,lam2,lam7,cplAhAhAhAh,     & 
& cplAhAhetIetI,cplAhAhetpcetp,cplAhAhhhhh,cplAhAhHpcHp,cpletIetIetIetI,cpletIetIetpcetp,& 
& cpletIetIhhhh,cpletIetIHpcHp,cpletpetpcetpcetp,cpletpetpcHpcHp,cpletphhhhcetp,         & 
& cpletpHpcetpcHp,cplhhhhhhhh,cplhhhhHpcHp,cplHpHpcetpcetp,cplHpHpcHpcHp)

Implicit None 
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam2,lam7

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhetIetI,cplAhAhetpcetp,cplAhAhhhhh(2,2),cplAhAhHpcHp,               & 
& cpletIetIetIetI,cpletIetIetpcetp,cpletIetIhhhh(2,2),cpletIetIHpcHp,cpletpetpcetpcetp,  & 
& cpletpetpcHpcHp,cpletphhhhcetp(2,2),cpletpHpcetpcHp,cplhhhhhhhh(2,2,2,2),              & 
& cplhhhhHpcHp(2,2),cplHpHpcetpcetp,cplHpHpcHpcHp

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2L(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetI2L(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhetpcetp = 0._dp 
Call CouplingAhAhetpcetp2L(lam3,cplAhAhetpcetp)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHp2L(lam1,cplAhAhHpcHp)



cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetI2L(lam2,cpletIetIetIetI)



cpletIetIetpcetp = 0._dp 
Call CouplingetIetIetpcetp2L(lam2,cpletIetIetpcetp)



cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhh2L(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHp2L(lam3,cpletIetIHpcHp)



cpletpetpcetpcetp = 0._dp 
Call Couplingetpetpcetpcetp2L(lam2,cpletpetpcetpcetp)



cpletpetpcHpcHp = 0._dp 
Call CouplingetpetpcHpcHp2L(lam5,cpletpetpcHpcHp)



cpletphhhhcetp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call Couplingetphhhhcetp2L(gt2,gt3,lam2,lam3,lam7,ZH,cpletphhhhcetp(gt2,gt3))

 End Do 
End Do 


cpletpHpcetpcHp = 0._dp 
Call CouplingetpHpcetpcHp2L(lam4,lam3,cpletpHpcetpcHp)



cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHp2L(gt1,gt2,lam1,lam3,lam6,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcetpcetp = 0._dp 
Call CouplingHpHpcetpcetp2L(lam5,cplHpHpcetpcetp)



cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHp2L(lam1,cplHpHpcHpcHp)



Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,lam2,            & 
& g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,epsU,ZUL,ZUR,epsD,epsE,Yu,cplAhAhAh,cplAhAhetI,               & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhetpcetp,cplAhetpcHp,cplAhhhhh,cplAhHpcetp,       & 
& cplAhHpcHp,cpletIetIetI,cpletIetIhh,cpletIetpcetp,cpletIetpcHp,cpletIhhhh,             & 
& cpletIHpcetp,cpletIHpcHp,cpletphhcetp,cpletphhcHp,cplhhhhhh,cplhhHpcetp,               & 
& cplhhHpcHp,cplVGVGVG,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcFuFdetpL,cplcFuFdetpR,cplcFvFeetpL,cplcFvFeetpR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHpL,cplcFuFdHpR,cplcFeFehhL,cplcFeFehhR,cplcFvFeHpL,               & 
& cplcFvFeHpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucetpL,cplcFdFucetpR,cplcFdFucHpL,          & 
& cplcFdFucHpR,cplcFeFvcetpL,cplcFeFvcetpR,cplcFeFvcHpL,cplcFeFvcHpR,cplcFdFdVGL,        & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,lam2,Yd(3,3),ZDL(3,3),ZDR(3,3),Ye(3,3),ZEL(3,3),             & 
& ZER(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),Yu(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhetpcetp,             & 
& cplAhetpcHp,cplAhhhhh(2,2),cplAhHpcetp,cplAhHpcHp,cpletIetIetI,cpletIetIhh(2),         & 
& cpletIetpcetp,cpletIetpcHp,cpletIhhhh(2,2),cpletIHpcetp,cpletIHpcHp,cpletphhcetp(2),   & 
& cpletphhcHp(2),cplhhhhhh(2,2,2),cplhhHpcetp(2),cplhhHpcHp(2),cplVGVGVG,cplcFdFdAhL(3,3),& 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdetpL(3,3),cplcFuFdetpR(3,3),               & 
& cplcFvFeetpL(3,3),cplcFvFeetpR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),             & 
& cplcFuFdHpL(3,3),cplcFuFdHpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFvFeHpL(3,3),cplcFvFeHpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),             & 
& cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),             & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAh2L(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetI2L(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetI2L(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhh2L(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhetpcetp = 0._dp 
Call CouplingAhetpcetp2L(lam7,vv,cplAhetpcetp)



cplAhetpcHp = 0._dp 
Call CouplingAhetpcHp2L(lam4,lam5,vv,cplAhetpcHp)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHpcetp = 0._dp 
Call CouplingAhHpcetp2L(lam4,lam5,vv,cplAhHpcetp)



cplAhHpcHp = 0._dp 
Call CouplingAhHpcHp2L(lam6,vv,cplAhHpcHp)



cpletIetIetI = 0._dp 
Call CouplingetIetIetI2L(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhh2L(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIetpcetp = 0._dp 
Call CouplingetIetpcetp2L(lam7,v,cpletIetpcetp)



cpletIetpcHp = 0._dp 
Call CouplingetIetpcHp2L(lam4,lam5,v,cpletIetpcHp)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHpcetp = 0._dp 
Call CouplingetIHpcetp2L(lam4,lam5,v,cpletIHpcetp)



cpletIHpcHp = 0._dp 
Call CouplingetIHpcHp2L(lam6,v,cpletIHpcHp)



cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call Couplingetphhcetp2L(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cpletphhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcHp2L(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,cpletphhcHp(gt2))

End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpcetp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcetp2L(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,cplhhHpcetp(gt1))

End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHp2L(gt1,lam1,lam3,lam6,v,vv,ZH,cplhhHpcHp(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



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
Call CouplingcFuFuAh2L(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetI2L(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetI2L(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetI2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdetpL = 0._dp 
cplcFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdetp2L(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFuFdetpL(gt1,gt2)         & 
& ,cplcFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcFvFeetpL = 0._dp 
cplcFvFeetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeetp2L(gt1,gt2,epsE,ZER,cplcFvFeetpL(gt1,gt2),cplcFvFeetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)        & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHpL = 0._dp 
cplcFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdHp2L(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFuFdHpL(gt1,gt2)           & 
& ,cplcFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)        & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFvFeHpL = 0._dp 
cplcFvFeHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFeHp2L(gt1,gt2,Ye,ZER,cplcFvFeHpL(gt1,gt2),cplcFvFeHpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)        & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetp2L(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)       & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHp2L(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)         & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetp2L(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHp2L(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

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

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhAhetIetI2L(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

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
 
 
Subroutine CouplingAhAhetpcetp2L(lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetpcetp2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
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
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHpcHp2L(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingetIetIetIetI2L(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

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
 
 
Subroutine CouplingetIetIetpcetp2L(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetpcetp2L  
 
 
Subroutine CouplingetIetIhhhh2L(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
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
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhh2L  
 
 
Subroutine CouplingetIetIHpcHp2L(lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam3

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
 
 
Subroutine Couplingetpetpcetpcetp2L(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetpetpcetpcetp' 
 
res = 0._dp 
res = res-2._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingetpetpcetpcetp2L  
 
 
Subroutine CouplingetpetpcHpcHp2L(lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpetpcHpcHp' 
 
res = 0._dp 
res = res-2._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpetpcHpcHp2L  
 
 
Subroutine Couplingetphhhhcetp2L(gt2,gt3,lam2,lam3,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhhhcetp' 
 
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
res = res-(lam3*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((gt2.eq.gt3)) Then 
res = res-(lam7*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((gt2.eq.gt3)) Then 
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((gt2.eq.gt3)) Then 
res = res-(lam7*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((gt2.eq.gt3)) Then 
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((gt2.eq.gt3)) Then 
res = res-(lam2*ZH(gt2,2)*ZH(gt3,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingetphhhhcetp2L  
 
 
Subroutine CouplingetpHpcetpcHp2L(lam4,lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpHpcetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpHpcetpcHp2L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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
res = res-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHpcHp2L(gt1,gt2,lam1,lam3,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
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
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((gt1.eq.gt2)) Then 
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHp2L  
 
 
Subroutine CouplingHpHpcetpcetp2L(lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpHpcetpcetp' 
 
res = 0._dp 
res = res-2._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpHpcetpcetp2L  
 
 
Subroutine CouplingHpHpcHpcHp2L(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhAhAh2L(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAh2L  
 
 
Subroutine CouplingAhAhetI2L(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetI2L  
 
 
Subroutine CouplingAhAhhh2L(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine CouplingAhetIetI2L(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetI2L  
 
 
Subroutine CouplingAhetIhh2L(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhh2L  
 
 
Subroutine CouplingAhetpcetp2L(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcetp' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcetp2L  
 
 
Subroutine CouplingAhetpcHp2L(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcHp' 
 
res = 0._dp 
res = res+(lam4*vv)/2._dp
res = res-(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcHp2L  
 
 
Subroutine CouplingAhhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhh2L  
 
 
Subroutine CouplingAhHpcetp2L(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcetp' 
 
res = 0._dp 
res = res-(lam4*vv)/2._dp
res = res+(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcetp2L  
 
 
Subroutine CouplingAhHpcHp2L(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcHp' 
 
res = 0._dp 
res = res-(lam6*vv)/2._dp
res = res+(vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcHp2L  
 
 
Subroutine CouplingetIetIetI2L(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetI2L  
 
 
Subroutine CouplingetIetIhh2L(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhh2L  
 
 
Subroutine CouplingetIetpcetp2L(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcetp' 
 
res = 0._dp 
res = res+(lam7*v)/2._dp
res = res-(v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcetp2L  
 
 
Subroutine CouplingetIetpcHp2L(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcHp' 
 
res = 0._dp 
res = res-(lam4*v)/2._dp
res = res+(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcHp2L  
 
 
Subroutine CouplingetIhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhh2L  
 
 
Subroutine CouplingetIHpcetp2L(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcetp' 
 
res = 0._dp 
res = res+(lam4*v)/2._dp
res = res-(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcetp2L  
 
 
Subroutine CouplingetIHpcHp2L(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcHp' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcHp2L  
 
 
Subroutine Couplingetphhcetp2L(gt2,lam2,lam3,lam7,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt2,1))
res = res-(lam7*vv*ZH(gt2,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1))/2._dp
res = res-(lam7*v*ZH(gt2,2))/2._dp
res = res-(lam2*vv*ZH(gt2,2))
res = res-(v*Conjg(lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplingetphhcetp2L  
 
 
Subroutine CouplingetphhcHp2L(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt2,1))
res = res-(lam4*vv*ZH(gt2,1))/2._dp
res = res-(lam5*vv*ZH(gt2,1))/2._dp
res = res-(lam4*v*ZH(gt2,2))/2._dp
res = res-(lam5*v*ZH(gt2,2))/2._dp
res = res-(lam7*vv*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhcHp2L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
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

res = 0._dp 
res = res-3*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHpcetp2L(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcetp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*vv*ZH(gt1,1))/2._dp
res = res-(lam5*vv*ZH(gt1,1))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1))
res = res-(lam4*v*ZH(gt1,2))/2._dp
res = res-(lam5*v*ZH(gt1,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcetp2L  
 
 
Subroutine CouplinghhHpcHp2L(gt1,lam1,lam3,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt1,1))
res = res-(lam6*vv*ZH(gt1,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1))/2._dp
res = res-(lam6*v*ZH(gt1,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHp2L  
 
 
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
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
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
 
 
Subroutine CouplingcFdFdetI2L(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetI2L  
 
 
Subroutine CouplingcFeFeetI2L(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetI2L  
 
 
Subroutine CouplingcFuFuetI2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
 
End Subroutine CouplingcFuFuetI2L  
 
 
Subroutine CouplingcFuFdetp2L(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdetp' 
 
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
resR = resR+Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdetp2L  
 
 
Subroutine CouplingcFvFeetp2L(gt1,gt2,epsE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeetp' 
 
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
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,gt1))*ZER(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeetp2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHp2L(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)
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
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFvFeHp2L(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFeHp' 
 
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
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFeHp2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucetp2L(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucetp' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)
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
 
End Subroutine CouplingcFdFucetp2L  
 
 
Subroutine CouplingcFdFucHp2L(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

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
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHp2L  
 
 
Subroutine CouplingcFeFvcetp2L(gt1,gt2,epsE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcetp' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*epsE(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcetp2L  
 
 
Subroutine CouplingcFeFvcHp2L(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

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
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHp2L  
 
 
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
 
 
Subroutine CouplingsForLoopMasses(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,              & 
& g1,g2,TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,Yu,epsU,ZUL,ZUR,g3,cplAhAhUhh,           & 
& cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,  & 
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

Implicit None 
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam7,lam2,epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),epsE(3,3),          & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cpletpUhhcetp(2),cpletpUhhcHp(2),cpletpUhhVWp(2),      & 
& cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),       & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),             & 
& cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpVWp(2),cplUhhcVWpVWp(2),       & 
& cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),cpletpUhhUhhcetp(2,2),           & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2),   & 
& cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),             & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucetpL(3,3),cplcUFdFucetpR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),             & 
& cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),cplcUFuFdetpL(3,3),cplcUFuFdetpR(3,3),           & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),           & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),             & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcetpL(3,3),cplcUFeFvcetpR(3,3),           & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3),           & 
& cplAhcHpcVWp,cplAhetpcHp,cplAhHpcHp,cpletIetpcHp,cpletIHpcHp,cpletphhcHp(2),           & 
& cplcFdFucHpL(3,3),cplcFdFucHpR(3,3),cplcFeFvcHpL(3,3),cplcFeFvcHpR(3,3),               & 
& cplcgZgWCcHp,cplcgWCgZHp,cplcgWpgZcHp,cplcgZgWpHp,cplhhcHpcVWp(2),cplhhHpcHp(2),       & 
& cplHpcHpVP,cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplAhAhHpcHp,cpletIetIHpcHp,           & 
& cpletpHpcetpcHp,cplhhhhHpcHp(2,2),cplHpHpcHpcHp,cplHpcHpVPVP,cplHpcHpcVWpVWp,          & 
& cplHpcHpVZVZ,cplAhetpcetp,cplAhHpcetp,cpletIcetpcVWp,cpletIetpcetp,cpletIHpcetp,       & 
& cpletphhcetp(2),cpletpcetpVP,cpletpcetpVZ,cplcFdFucetpL(3,3),cplcFdFucetpR(3,3),       & 
& cplcFeFvcetpL(3,3),cplcFeFvcetpR(3,3),cplcgZgWCcetp,cplcgWCgZetp,cplcgWpgZcetp,        & 
& cplcgZgWpetp,cplhhcetpcVWp(2),cplhhHpcetp(2),cplcetpcVWpVP,cplcetpcVWpVZ,              & 
& cplAhAhetpcetp,cpletIetIetpcetp,cpletpetpcetpcetp,cpletphhhhcetp(2,2),cpletpcetpVPVP,  & 
& cpletpcetpcVWpVWp,cpletpcetpVZVZ,cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,        & 
& cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),     & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),            & 
& cplAhhhVZ(2),cplAhHpVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh(2,2),cplAhAhcVWpVWp,     & 
& cplAhAhVZVZ,cpletIetIetI,cpletIetIhh(2),cpletIetpVWp,cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),& 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIetIetIetI

Complex(dp), Intent(out) :: cpletIetIhhhh(2,2),cpletIetIcVWpVWp,cpletIetIVZVZ,cpletpVWpVZ,cplcFdFdVZL(3,3),        & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),              & 
& cplHpVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,              & 
& cplcVWpVWpVZVZ3,cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFvFecVWpL(3,3),              & 
& cplcFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplhhcVWpVWp(2),cplcVWpVPVWp,cplhhhhcVWpVWp(2,2),cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,      & 
& cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,cplAhAhUhh(gt3))

End Do 


cplAhetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,cplAhetIUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cpletIetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,cpletIetIUhh(gt3))

End Do 


cpletIUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIUhhhh(gt2,gt3))

 End Do 
End Do 


cpletIUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUhhVZL(gt2,g1,g2,TW,cpletIUhhVZ(gt2))

End Do 


cpletpUhhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhcetpL(gt2,lam2,lam3,lam7,v,vv,cpletpUhhcetp(gt2))

End Do 


cpletpUhhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhcHpL(gt2,lam4,lam7,lam5,lam6,v,vv,cpletpUhhcHp(gt2))

End Do 


cpletpUhhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhVWpL(gt2,g2,cpletpUhhVWp(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epsU,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,v,vv,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,v,vv,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcHpL(gt1,lam1,lam3,lam6,v,vv,cplUhhHpcHp(gt1))

End Do 


cplUhhHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpVWpL(gt1,g2,cplUhhHpVWp(gt1))

End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,v,vv,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletIetIUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,cpletIetIUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletpUhhUhhcetp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetpUhhUhhcetpL(gt2,gt3,lam2,lam3,lam7,cpletpUhhUhhcetp(gt2,gt3))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHpcHpL(gt1,gt2,lam1,lam3,lam6,cplUhhUhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdetIL = 0._dp 
cplcUFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcUFdFdetIL(gt1,gt2),cplcUFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
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


cplcUFdFucetpL = 0._dp 
cplcUFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucetpL(gt1,gt2,Yu,epsD,ZUL,ZUR,cplcUFdFucetpL(gt1,gt2)              & 
& ,cplcUFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,epsU,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),               & 
& cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuVWpL = 0._dp 
cplcUFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,cplcUFdFuVWpL(gt1,gt2),cplcUFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,epsU,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuetIL = 0._dp 
cplcUFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuetIL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuetIL(gt1,gt2),cplcUFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdetpL = 0._dp 
cplcUFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdetpL(gt1,gt2,Yu,epsD,ZDL,ZDR,cplcUFuFdetpL(gt1,gt2),               & 
& cplcUFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWpL = 0._dp 
cplcUFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,cplcUFuFdcVWpL(gt1,gt2),cplcUFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,epsU,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
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


cplcUFeFeetIL = 0._dp 
cplcUFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcUFeFeetIL(gt1,gt2),cplcUFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
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


cplcUFeFvcetpL = 0._dp 
cplcUFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcetpL(gt1,gt2,epsE,cplcUFeFvcetpL(gt1,gt2),cplcUFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvVWpL = 0._dp 
cplcUFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWpL(gt1,gt2,g2,cplcUFeFvVWpL(gt1,gt2),cplcUFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplAhcHpcVWp = 0._dp 
Call CouplingAhcHpcVWpL(g2,cplAhcHpcVWp)



cplAhetpcHp = 0._dp 
Call CouplingAhetpcHpL(lam4,lam5,vv,cplAhetpcHp)



cplAhHpcHp = 0._dp 
Call CouplingAhHpcHpL(lam6,vv,cplAhHpcHp)



cpletIetpcHp = 0._dp 
Call CouplingetIetpcHpL(lam4,lam5,v,cpletIetpcHp)



cpletIHpcHp = 0._dp 
Call CouplingetIHpcHpL(lam6,v,cpletIHpcHp)



cpletphhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcHpL(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,cpletphhcHp(gt2))

End Do 


cplcFdFucHpL = 0._dp 
cplcFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucHpL(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucHpL(gt1,gt2)          & 
& ,cplcFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHpL = 0._dp 
cplcFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcHpL(gt1,gt2,Ye,ZER,cplcFeFvcHpL(gt1,gt2),cplcFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcgZgWCcHp = 0._dp 
Call CouplingcgZgWCcHpL(g1,g2,v,TW,cplcgZgWCcHp)



cplcgWCgZHp = 0._dp 
Call CouplingcgWCgZHpL(g1,g2,v,TW,cplcgWCgZHp)



cplcgWpgZcHp = 0._dp 
Call CouplingcgWpgZcHpL(g1,g2,v,TW,cplcgWpgZcHp)



cplcgZgWpHp = 0._dp 
Call CouplingcgZgWpHpL(g1,g2,v,TW,cplcgZgWpHp)



cplhhcHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpL(gt1,g2,ZH,cplhhcHpcVWp(gt1))

End Do 


cplhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcHpL(gt1,lam1,lam3,lam6,v,vv,ZH,cplhhHpcHp(gt1))

End Do 


cplHpcHpVP = 0._dp 
Call CouplingHpcHpVPL(g1,g2,TW,cplHpcHpVP)



cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpcVWpVP = 0._dp 
Call CouplingcHpcVWpVPL(g1,g2,v,TW,cplcHpcVWpVP)



cplcHpcVWpVZ = 0._dp 
Call CouplingcHpcVWpVZL(g1,g2,v,TW,cplcHpcVWpVZ)



cplAhAhHpcHp = 0._dp 
Call CouplingAhAhHpcHpL(lam1,cplAhAhHpcHp)



cpletIetIHpcHp = 0._dp 
Call CouplingetIetIHpcHpL(lam3,cpletIetIHpcHp)



cpletpHpcetpcHp = 0._dp 
Call CouplingetpHpcetpcHpL(lam4,lam3,cpletpHpcetpcHp)



cplhhhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhHpcHpL(gt1,gt2,lam1,lam3,lam6,ZH,cplhhhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplHpHpcHpcHp = 0._dp 
Call CouplingHpHpcHpcHpL(lam1,cplHpHpcHpcHp)



cplHpcHpVPVP = 0._dp 
Call CouplingHpcHpVPVPL(g1,g2,TW,cplHpcHpVPVP)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cplAhetpcetp = 0._dp 
Call CouplingAhetpcetpL(lam7,vv,cplAhetpcetp)



cplAhHpcetp = 0._dp 
Call CouplingAhHpcetpL(lam4,lam5,vv,cplAhHpcetp)



cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpL(g2,cpletIcetpcVWp)



cpletIetpcetp = 0._dp 
Call CouplingetIetpcetpL(lam7,v,cpletIetpcetp)



cpletIHpcetp = 0._dp 
Call CouplingetIHpcetpL(lam4,lam5,v,cpletIHpcetp)



cpletphhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetphhcetpL(gt2,lam2,lam3,lam7,v,vv,ZH,cpletphhcetp(gt2))

End Do 


cpletpcetpVP = 0._dp 
Call CouplingetpcetpVPL(g1,g2,TW,cpletpcetpVP)



cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZL(g1,g2,TW,cpletpcetpVZ)



cplcFdFucetpL = 0._dp 
cplcFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFucetpL(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,cplcFdFucetpL(gt1,gt2)        & 
& ,cplcFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcetpL = 0._dp 
cplcFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvcetpL(gt1,gt2,epsE,ZER,cplcFeFvcetpL(gt1,gt2),cplcFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcgZgWCcetp = 0._dp 
Call CouplingcgZgWCcetpL(g1,g2,vv,TW,cplcgZgWCcetp)



cplcgWCgZetp = 0._dp 
Call CouplingcgWCgZetpL(g1,g2,vv,TW,cplcgWCgZetp)



cplcgWpgZcetp = 0._dp 
Call CouplingcgWpgZcetpL(g1,g2,vv,TW,cplcgWpgZcetp)



cplcgZgWpetp = 0._dp 
Call CouplingcgZgWpetpL(g1,g2,vv,TW,cplcgZgWpetp)



cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpL(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplhhHpcetp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhHpcetpL(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,cplhhHpcetp(gt1))

End Do 


cplcetpcVWpVP = 0._dp 
Call CouplingcetpcVWpVPL(g1,g2,vv,TW,cplcetpcVWpVP)



cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZL(g1,g2,vv,TW,cplcetpcVWpVZ)



cplAhAhetpcetp = 0._dp 
Call CouplingAhAhetpcetpL(lam3,cplAhAhetpcetp)



cpletIetIetpcetp = 0._dp 
Call CouplingetIetIetpcetpL(lam2,cpletIetIetpcetp)



cpletpetpcetpcetp = 0._dp 
Call CouplingetpetpcetpcetpL(lam2,cpletpetpcetpcetp)



cpletphhhhcetp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetphhhhcetpL(gt2,gt3,lam2,lam3,lam7,ZH,cpletphhhhcetp(gt2,gt3))

 End Do 
End Do 


cpletpcetpVPVP = 0._dp 
Call CouplingetpcetpVPVPL(g1,g2,TW,cpletpcetpVPVP)



cpletpcetpcVWpVWp = 0._dp 
Call CouplingetpcetpcVWpVWpL(g2,cpletpcetpcVWpVWp)



cpletpcetpVZVZ = 0._dp 
Call CouplingetpcetpVZVZL(g1,g2,TW,cpletpcetpVZVZ)



cplAhAhAh = 0._dp 
Call CouplingAhAhAhL(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIL(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIL(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhL(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

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
Call CouplingcFuFuAhL(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhL(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhL(g2,v,cplcgWCgWCAh)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHpVWp = 0._dp 
Call CouplingAhHpVWpL(g2,cplAhHpVWp)



cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhL(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIL(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cpletIetIetI = 0._dp 
Call CouplingetIetIetIL(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIetpVWp = 0._dp 
Call CouplingetIetpVWpL(g2,cpletIetpVWp)



cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpetI = 0._dp 
Call CouplingcgWpgWpetIL(g2,vv,cplcgWpgWpetI)



cplcgWCgWCetI = 0._dp 
Call CouplingcgWCgWCetIL(g2,vv,cplcgWCgWCetI)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZL(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIL(lam2,cpletIetIetIetI)



cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cpletpVWpVZ = 0._dp 
Call CouplingetpVWpVZL(g1,g2,vv,TW,cpletpVWpVZ)



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


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHpVWpVZ = 0._dp 
Call CouplingHpVWpVZL(g1,g2,v,TW,cplHpVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpL(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

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



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam1*v)
End If 
If ((1.eq.gt3)) Then 
res = res-(lam6*vv)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(vv*Conjg(lam6))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam3*vv)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam4*vv)
End If 
If ((2.eq.gt3)) Then 
res = res+lam5*vv
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam6))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam6*v)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(lam5*vv)
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(lam6))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam5*v)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*vv)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(vv*Conjg(lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIUhhL  
 
 
Subroutine CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhhh' 
 
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
res = res-(lam6*vv*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam6*v*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(v*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(lam6*v*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(v*Conjg(lam6)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(-3*lam7*vv*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(3*vv*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhhhL  
 
 
Subroutine CouplingAhUhhVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
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
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam3*v)
End If 
If ((1.eq.gt3)) Then 
res = res-(lam4*v)
End If 
If ((1.eq.gt3)) Then 
res = res+lam5*v
End If 
If ((1.eq.gt3)) Then 
res = res-(lam7*vv)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(vv*Conjg(lam7))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam2*vv)
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUhhL  
 
 
Subroutine CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIUhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(lam7*vv*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(lam7*vv*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(lam7*v*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIUhhhhL  
 
 
Subroutine CouplingetIUhhVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIUhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res+(g2*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIUhhVZL  
 
 
Subroutine CouplingetpUhhcetpL(gt2,lam2,lam3,lam7,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpUhhcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(lam3*v)
End If 
If ((1.eq.gt2)) Then 
res = res-(lam7*vv)/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(vv*Conjg(lam7))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam7*v)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam2*vv)
End If 
If ((2.eq.gt2)) Then 
res = res-(v*Conjg(lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpUhhcetpL  
 
 
Subroutine CouplingetpUhhcHpL(gt2,lam4,lam7,lam5,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpUhhcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res-(lam6*v)
End If 
If ((1.eq.gt2)) Then 
res = res-(lam4*vv)/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(lam5*vv)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam4*v)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam5*v)/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam7*vv)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpUhhcHpL  
 
 
Subroutine CouplingetpUhhVWpL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpUhhVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res+g2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpUhhVWpL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
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
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
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
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
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
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingcgWpgWpUhhL(gt3,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*RXiWp)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpUhhL  
 
 
Subroutine CouplingcgWCgWCUhhL(gt3,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*RXiWp)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1*g2*vv*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*v*RXiZ*Sin(TW)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1**2*vv*RXiZ*Sin(TW)**2)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
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

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-3*lam1*v*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-3*lam2*vv*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhHpcHpL(gt1,lam1,lam3,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-(lam1*v)
End If 
If ((1.eq.gt1)) Then 
res = res-(lam6*vv)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(vv*Conjg(lam6))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam6*v)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*vv)
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(lam6))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHpcHpL  
 
 
Subroutine CouplingUhhHpVWpL(gt1,g2,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res-1._dp*(g2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHpVWpL  
 
 
Subroutine CouplingUhhcVWpVWpL(gt1,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vv)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWpVWpL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vv*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*v*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1)) Then 
res = res+g1*g2*vv*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1**2*vv*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
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
res = res-1._dp*(lam1)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res+lam5
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUhhUhh' 
 
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
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUhhUhhL  
 
 
Subroutine CouplingetpUhhUhhcetpL(gt2,gt3,lam2,lam3,lam7,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpUhhUhhcetp' 
 
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
If ((1.eq.gt3).And.(2.eq.gt2)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt2)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt3)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((2.eq.gt2).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpUhhUhhcetpL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
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
res = res-3*lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHpcHpL(gt1,gt2,lam1,lam3,lam6,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHpcHp' 
 
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
res = res-1._dp*(lam1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-1._dp*(lam3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHpcHpL  
 
 
Subroutine CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWpVWp' 
 
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
 
End Subroutine CouplingUhhUhhcVWpVWpL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
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
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
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
 
 
Subroutine CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdetI' 
 
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
resL = resL+(Conjg(ZDL(gt2,j2))*epsD(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdetIL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*epsD(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
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
 
 
Subroutine CouplingcUFdFucetpL(gt1,gt2,Yu,epsD,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucetp' 
 
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
resL = resL+Conjg(ZUL(gt2,j2))*epsD(gt1,j2)
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
 
End Subroutine CouplingcUFdFucetpL  
 
 
Subroutine CouplingcUFdFucHpL(gt1,gt2,epsU,Yd,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZUL(3,3),ZUR(3,3)

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
resR = resR+Conjg(epsU(j1,gt1))*ZUR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHpL  
 
 
Subroutine CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuVWp' 
 
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
 
End Subroutine CouplingcUFdFuVWpL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+(Conjg(ZUL(gt2,j2))*epsU(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
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
 
 
Subroutine CouplingcUFuFuetIL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuetI' 
 
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
 
End Subroutine CouplingcUFuFuetIL  
 
 
Subroutine CouplingcUFuFdetpL(gt1,gt2,Yu,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdetp' 
 
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
resR = resR+Conjg(epsD(j1,gt1))*ZDR(gt2,j1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdetpL  
 
 
Subroutine CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcVWp' 
 
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
 
End Subroutine CouplingcUFuFdcVWpL  
 
 
Subroutine CouplingcUFuFdHpL(gt1,gt2,epsU,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

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
resL = resL+Conjg(ZDL(gt2,j2))*epsU(gt1,j2)
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
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*epsU(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
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
 
 
Subroutine CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeetI' 
 
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
resL = resL+(Conjg(ZEL(gt2,j2))*epsE(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeetIL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

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

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*epsE(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,gt1))*ZER(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
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
 
 
Subroutine CouplingcUFeFvcetpL(gt1,gt2,epsE,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcetp' 
 
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
resL = resL+epsE(gt1,gt2)
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcetpL  
 
 
Subroutine CouplingcUFeFvcHpL(gt1,gt2,Ye,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3)

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
resL = resL+Ye(gt1,gt2)
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHpL  
 
 
Subroutine CouplingcUFeFvVWpL(gt1,gt2,g2,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvVWp' 
 
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
If ((gt1.eq.gt2).And.(gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-(g2/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvVWpL  
 
 
Subroutine CouplingAhcHpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHpcVWpL  
 
 
Subroutine CouplingAhetpcHpL(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcHp' 
 
res = 0._dp 
res = res+(lam4*vv)/2._dp
res = res-(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcHpL  
 
 
Subroutine CouplingAhHpcHpL(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcHp' 
 
res = 0._dp 
res = res-(lam6*vv)/2._dp
res = res+(vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcHpL  
 
 
Subroutine CouplingetIetpcHpL(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcHp' 
 
res = 0._dp 
res = res-(lam4*v)/2._dp
res = res+(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcHpL  
 
 
Subroutine CouplingetIHpcHpL(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcHp' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcHpL  
 
 
Subroutine CouplingetphhcHpL(gt2,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetphhcHp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt2,1))
res = res-(lam4*vv*ZH(gt2,1))/2._dp
res = res-(lam5*vv*ZH(gt2,1))/2._dp
res = res-(lam4*v*ZH(gt2,2))/2._dp
res = res-(lam5*v*ZH(gt2,2))/2._dp
res = res-(lam7*vv*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhcHpL  
 
 
Subroutine CouplingcFdFucHpL(gt1,gt2,epsU,Yd,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

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
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHpL  
 
 
Subroutine CouplingcFeFvcHpL(gt1,gt2,Ye,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZER(3,3)

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
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHpL  
 
 
Subroutine CouplingcgZgWCcHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcHpL  
 
 
Subroutine CouplingcgWCgZHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZHpL  
 
 
Subroutine CouplingcgWpgZcHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcHp' 
 
res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcHpL  
 
 
Subroutine CouplingcgZgWpHpL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpHp' 
 
res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpHpL  
 
 
Subroutine CouplinghhcHpcVWpL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,1))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHpcVWpL  
 
 
Subroutine CouplinghhHpcHpL(gt1,lam1,lam3,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcHp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt1,1))
res = res-(lam6*vv*ZH(gt1,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1))/2._dp
res = res-(lam6*v*ZH(gt1,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcHpL  
 
 
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
 
 
Subroutine CouplingcHpcVWpVPL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*v*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpcVWpVPL  
 
 
Subroutine CouplingcHpcVWpVZL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHpcVWpVZL  
 
 
Subroutine CouplingAhAhHpcHpL(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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

Complex(dp), Intent(in) :: lam3

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
 
 
Subroutine CouplingetpHpcetpcHpL(lam4,lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpHpcetpcHp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpHpcetpcHpL  
 
 
Subroutine CouplinghhhhHpcHpL(gt1,gt2,lam1,lam3,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHpcHp' 
 
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
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1))
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHpcHpL  
 
 
Subroutine CouplingHpHpcHpcHpL(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhetpcetpL(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetpcetp' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetpcetpL  
 
 
Subroutine CouplingAhHpcetpL(lam4,lam5,vv,res)

Implicit None 

Real(dp), Intent(in) :: lam5,vv

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpcetp' 
 
res = 0._dp 
res = res-(lam4*vv)/2._dp
res = res+(lam5*vv)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpcetpL  
 
 
Subroutine CouplingetIcetpcVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcetpcVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcetpcVWpL  
 
 
Subroutine CouplingetIetpcetpL(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpcetp' 
 
res = 0._dp 
res = res+(lam7*v)/2._dp
res = res-(v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpcetpL  
 
 
Subroutine CouplingetIHpcetpL(lam4,lam5,v,res)

Implicit None 

Real(dp), Intent(in) :: lam5,v

Complex(dp), Intent(in) :: lam4

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHpcetp' 
 
res = 0._dp 
res = res+(lam4*v)/2._dp
res = res-(lam5*v)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHpcetpL  
 
 
Subroutine CouplingetphhcetpL(gt2,lam2,lam3,lam7,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhcetp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt2,1))
res = res-(lam7*vv*ZH(gt2,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1))/2._dp
res = res-(lam7*v*ZH(gt2,2))/2._dp
res = res-(lam2*vv*ZH(gt2,2))
res = res-(v*Conjg(lam7)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhcetpL  
 
 
Subroutine CouplingetpcetpVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVP' 
 
res = 0._dp 
res = res+(g1*Cos(TW))/2._dp
res = res+(g2*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVPL  
 
 
Subroutine CouplingetpcetpVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVZ' 
 
res = 0._dp 
res = res+(g2*Cos(TW))/2._dp
res = res-(g1*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVZL  
 
 
Subroutine CouplingcFdFucetpL(gt1,gt2,Yu,epsD,ZDL,ZDR,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),epsD(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucetp' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)
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
 
End Subroutine CouplingcFdFucetpL  
 
 
Subroutine CouplingcFeFvcetpL(gt1,gt2,epsE,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcetp' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*epsE(j1,gt2)
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcetpL  
 
 
Subroutine CouplingcgZgWCcetpL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcetp' 
 
res = 0._dp 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcetpL  
 
 
Subroutine CouplingcgWCgZetpL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZetp' 
 
res = 0._dp 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZetpL  
 
 
Subroutine CouplingcgWpgZcetpL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcetp' 
 
res = 0._dp 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcetpL  
 
 
Subroutine CouplingcgZgWpetpL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpetp' 
 
res = 0._dp 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpetpL  
 
 
Subroutine CouplinghhcetpcVWpL(gt1,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcetpcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcetpcVWpL  
 
 
Subroutine CouplinghhHpcetpL(gt1,lam4,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam4,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHpcetp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam4*vv*ZH(gt1,1))/2._dp
res = res-(lam5*vv*ZH(gt1,1))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1))
res = res-(lam4*v*ZH(gt1,2))/2._dp
res = res-(lam5*v*ZH(gt1,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHpcetpL  
 
 
Subroutine CouplingcetpcVWpVPL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcetpcVWpVP' 
 
res = 0._dp 
res = res+(g1*g2*vv*Cos(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcetpcVWpVPL  
 
 
Subroutine CouplingcetpcVWpVZL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcetpcVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*vv*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcetpcVWpVZL  
 
 
Subroutine CouplingAhAhetpcetpL(lam3,res)

Implicit None 

Complex(dp), Intent(in) :: lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetpcetpL  
 
 
Subroutine CouplingetIetIetpcetpL(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetpcetp' 
 
res = 0._dp 
res = res-1._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetpcetpL  
 
 
Subroutine CouplingetpetpcetpcetpL(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetpetpcetpcetp' 
 
res = 0._dp 
res = res-2._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpetpcetpcetpL  
 
 
Subroutine CouplingetphhhhcetpL(gt2,gt3,lam2,lam3,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplingetphhhhcetp' 
 
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
res = res-(lam3*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam7*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam7*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam2*ZH(gt2,2)*ZH(gt3,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetphhhhcetpL  
 
 
Subroutine CouplingetpcetpVPVPL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVPVP' 
 
res = 0._dp 
res = res+(g1**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g2**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVPVPL  
 
 
Subroutine CouplingetpcetpcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpcVWpVWpL  
 
 
Subroutine CouplingetpcetpVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpcetpVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW))
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpcetpVZVZL  
 
 
Subroutine CouplingAhAhAhL(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhL  
 
 
Subroutine CouplingAhAhetIL(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIL  
 
 
Subroutine CouplingAhAhhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhL  
 
 
Subroutine CouplingAhetIetIL(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIL  
 
 
Subroutine CouplingAhetIhhL(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhL  
 
 
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
 
 
Subroutine CouplingcFuFuAhL(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
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
res = res-(g2**2*v*RXiWp)/4._dp
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
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhL  
 
 
Subroutine CouplingAhhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhL  
 
 
Subroutine CouplingAhhhVZL(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingAhHpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHpVWpL  
 
 
Subroutine CouplingAhAhAhAhL(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

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
 
 
Subroutine CouplingAhAhetIetIL(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

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
 
 
Subroutine CouplingAhAhhhhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
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
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
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
 
 
Subroutine CouplingetIetIetIL(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIL  
 
 
Subroutine CouplingetIetIhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhL  
 
 
Subroutine CouplingetIetpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetpVWp' 
 
res = 0._dp 
res = res-1._dp*(g2)/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetpVWpL  
 
 
Subroutine CouplingcFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetIL  
 
 
Subroutine CouplingcFeFeetIL(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetIL  
 
 
Subroutine CouplingcFuFuetIL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
 
End Subroutine CouplingcFuFuetIL  
 
 
Subroutine CouplingcgWpgWpetIL(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpetI' 
 
res = 0._dp 
res = res-(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpetIL  
 
 
Subroutine CouplingcgWCgWCetIL(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCetI' 
 
res = 0._dp 
res = res+(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCetIL  
 
 
Subroutine CouplingetIhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhL  
 
 
Subroutine CouplingetIhhVZL(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhVZL  
 
 
Subroutine CouplingetIetIetIetIL(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

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
 
 
Subroutine CouplingetIetIhhhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
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
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhL  
 
 
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
 
 
Subroutine CouplingetpVWpVZL(g1,g2,vv,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*vv*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetpVWpVZL  
 
 
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
 
 
Subroutine CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFvVZ' 
 
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
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFvFvVZL  
 
 
Subroutine CouplingcgWpgWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZL  
 
 
Subroutine CouplingcgWCgWCVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplingHpVWpVZL(g1,g2,v,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,v,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHpVWpVZ' 
 
res = 0._dp 
res = res-(g1*g2*v*Sin(TW))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHpVWpVZL  
 
 
Subroutine CouplingcVWpVWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
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
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
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
 
 
Subroutine CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWp' 
 
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
 
End Subroutine CouplingcFuFdcVWpL  
 
 
Subroutine CouplingcFvFecVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFvFecVWp' 
 
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
 
End Subroutine CouplingcFvFecVWpL  
 
 
Subroutine CouplingcgWCgAcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpL  
 
 
Subroutine CouplingcgAgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpL  
 
 
Subroutine CouplingcgZgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpL  
 
 
Subroutine CouplingcgWCgZcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpL  
 
 
Subroutine CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpL  
 
 
Subroutine CouplingcVWpVPVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpL  
 
 
Subroutine CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
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
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpL  
 
 
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
 
 
Subroutine CouplingsForVectorBosons(g2,ZH,g1,TW,v,vv,ZDL,ZUL,ZEL,cplAhcHpcVWp,        & 
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

Implicit None 
Real(dp), Intent(in) :: g2,ZH(2,2),g1,TW,v,vv

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhcHpcVWp,cplhhcHpcVWp(2),cplHpcHpVZ,cplcHpcVWpVP,cplcHpcVWpVZ,cplHpcHpcVWpVWp,    & 
& cplHpcHpVZVZ,cpletIcetpcVWp,cpletpcetpVZ,cplhhcetpcVWp(2),cplcetpcVWpVP,               & 
& cplcetpcVWpVZ,cpletpcetpcVWpVWp,cpletpcetpVZVZ,cplAhhhVZ(2),cplAhHpVWp,cplAhAhcVWpVWp, & 
& cplAhAhVZVZ,cpletIetpVWp,cpletIhhVZ(2),cpletIetIcVWpVWp,cpletIetIVZVZ,cpletpVWpVZ,     & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcFvFvVZL(3,3),cplcFvFvVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,          & 
& cplhhVZVZ(2),cplHpVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ(2,2),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2, & 
& cplcVWpVWpVZVZ3,cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFvFecVWpL(3,3),              & 
& cplcFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,            & 
& cplhhcVWpVWp(2),cplcVWpVPVWp,cplhhhhcVWpVWp(2,2),cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,      & 
& cplcVWpVPVPVWp3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhcHpcVWp = 0._dp 
Call CouplingAhcHpcVWpL(g2,cplAhcHpcVWp)



cplhhcHpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcHpcVWpL(gt1,g2,ZH,cplhhcHpcVWp(gt1))

End Do 


cplHpcHpVZ = 0._dp 
Call CouplingHpcHpVZL(g1,g2,TW,cplHpcHpVZ)



cplcHpcVWpVP = 0._dp 
Call CouplingcHpcVWpVPL(g1,g2,v,TW,cplcHpcVWpVP)



cplcHpcVWpVZ = 0._dp 
Call CouplingcHpcVWpVZL(g1,g2,v,TW,cplcHpcVWpVZ)



cplHpcHpcVWpVWp = 0._dp 
Call CouplingHpcHpcVWpVWpL(g2,cplHpcHpcVWpVWp)



cplHpcHpVZVZ = 0._dp 
Call CouplingHpcHpVZVZL(g1,g2,TW,cplHpcHpVZVZ)



cpletIcetpcVWp = 0._dp 
Call CouplingetIcetpcVWpL(g2,cpletIcetpcVWp)



cpletpcetpVZ = 0._dp 
Call CouplingetpcetpVZL(g1,g2,TW,cpletpcetpVZ)



cplhhcetpcVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcetpcVWpL(gt1,g2,ZH,cplhhcetpcVWp(gt1))

End Do 


cplcetpcVWpVP = 0._dp 
Call CouplingcetpcVWpVPL(g1,g2,vv,TW,cplcetpcVWpVP)



cplcetpcVWpVZ = 0._dp 
Call CouplingcetpcVWpVZL(g1,g2,vv,TW,cplcetpcVWpVZ)



cpletpcetpcVWpVWp = 0._dp 
Call CouplingetpcetpcVWpVWpL(g2,cpletpcetpcVWpVWp)



cpletpcetpVZVZ = 0._dp 
Call CouplingetpcetpVZVZL(g1,g2,TW,cpletpcetpVZVZ)



cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHpVWp = 0._dp 
Call CouplingAhHpVWpL(g2,cplAhHpVWp)



cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cpletIetpVWp = 0._dp 
Call CouplingetIetpVWpL(g2,cpletIetpVWp)



cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZL(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cpletpVWpVZ = 0._dp 
Call CouplingetpVWpVZL(g1,g2,vv,TW,cpletpVWpVZ)



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


cplcFvFvVZL = 0._dp 
cplcFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFvVZL(gt1,gt2,g1,g2,TW,cplcFvFvVZL(gt1,gt2),cplcFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHpVWpVZ = 0._dp 
Call CouplingHpVWpVZL(g1,g2,v,TW,cplHpVWpVZ)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFvFecVWpL = 0._dp 
cplcFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFvFecVWpL(gt1,gt2,g2,ZEL,cplcFvFecVWpL(gt1,gt2),cplcFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

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



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,ZDL,ZDR,epsD,ZH,g3,g1,g2,TW,Yu,ZUL,              & 
& ZUR,epsU,Ye,ZEL,ZER,epsE,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,        & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucetpL,cplcUFdFucetpR,cplcUFdFucHpL,cplcUFdFucHpR,   & 
& cplcUFdFuVWpL,cplcUFdFuVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,     & 
& cplcUFuFdetpL,cplcUFuFdetpR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHpL,cplcUFuFdHpR,   & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,       & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcetpL,cplcUFeFvcetpR,cplcUFeFvcHpL,cplcUFeFvcHpR,cplcUFeFvVWpL,               & 
& cplcUFeFvVWpR)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),g3,g1,g2,TW

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),epsD(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsU(3,3),              & 
& Ye(3,3),ZEL(3,3),ZER(3,3),epsE(3,3)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucetpL(3,3),cplcUFdFucetpR(3,3),cplcUFdFucHpL(3,3),cplcUFdFucHpR(3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),             & 
& cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),cplcUFuFdetpL(3,3),cplcUFuFdetpR(3,3),           & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHpL(3,3),cplcUFuFdHpR(3,3),           & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),             & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcetpL(3,3),cplcUFeFvcetpR(3,3),           & 
& cplcUFeFvcHpL(3,3),cplcUFeFvcHpR(3,3),cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

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


cplcUFdFdetIL = 0._dp 
cplcUFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcUFdFdetIL(gt1,gt2),cplcUFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
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


cplcUFdFucetpL = 0._dp 
cplcUFdFucetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucetpL(gt1,gt2,Yu,epsD,ZUL,ZUR,cplcUFdFucetpL(gt1,gt2)              & 
& ,cplcUFdFucetpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHpL = 0._dp 
cplcUFdFucHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFucHpL(gt1,gt2,epsU,Yd,ZUL,ZUR,cplcUFdFucHpL(gt1,gt2),               & 
& cplcUFdFucHpR(gt1,gt2))

 End Do 
End Do 


cplcUFdFuVWpL = 0._dp 
cplcUFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,cplcUFdFuVWpL(gt1,gt2),cplcUFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,epsU,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuetIL = 0._dp 
cplcUFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuetIL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuetIL(gt1,gt2),cplcUFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdetpL = 0._dp 
cplcUFuFdetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdetpL(gt1,gt2,Yu,epsD,ZDL,ZDR,cplcUFuFdetpL(gt1,gt2),               & 
& cplcUFuFdetpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWpL = 0._dp 
cplcUFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,cplcUFuFdcVWpL(gt1,gt2),cplcUFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHpL = 0._dp 
cplcUFuFdHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdHpL(gt1,gt2,epsU,Yd,ZDL,ZDR,cplcUFuFdHpL(gt1,gt2),cplcUFuFdHpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,Yu,epsU,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
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


cplcUFeFeetIL = 0._dp 
cplcUFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcUFeFeetIL(gt1,gt2),cplcUFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
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


cplcUFeFvcetpL = 0._dp 
cplcUFeFvcetpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcetpL(gt1,gt2,epsE,cplcUFeFvcetpL(gt1,gt2),cplcUFeFvcetpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHpL = 0._dp 
cplcUFeFvcHpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvcHpL(gt1,gt2,Ye,cplcUFeFvcHpL(gt1,gt2),cplcUFeFvcHpR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvVWpL = 0._dp 
cplcUFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWpL(gt1,gt2,g2,cplcUFeFvVWpL(gt1,gt2),cplcUFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,g1,             & 
& g2,TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,Yu,epsU,ZUL,ZUR,cplAhAhUhh,cplAhetIUhh,     & 
& cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cpletpUhhcetp,              & 
& cpletpUhhcHp,cpletpUhhVWp,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,         & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,          & 
& cplUhhHpcHp,cplUhhHpVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,        & 
& cpletpUhhUhhcetp,cplUhhUhhhhhh,cplUhhUhhHpcHp,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ)

Implicit None 
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),g1,g2,TW

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam7,lam2,epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),epsE(3,3),          & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cpletpUhhcetp(2),cpletpUhhcHp(2),cpletpUhhVWp(2),      & 
& cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),       & 
& cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),             & 
& cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHpcHp(2),cplUhhHpVWp(2),cplUhhcVWpVWp(2),       & 
& cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),cpletpUhhUhhcetp(2,2),           & 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHpcHp(2,2),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,cplAhAhUhh(gt3))

End Do 


cplAhetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,cplAhetIUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cpletIetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,cpletIetIUhh(gt3))

End Do 


cpletIUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIUhhhh(gt2,gt3))

 End Do 
End Do 


cpletIUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUhhVZL(gt2,g1,g2,TW,cpletIUhhVZ(gt2))

End Do 


cpletpUhhcetp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhcetpL(gt2,lam2,lam3,lam7,v,vv,cpletpUhhcetp(gt2))

End Do 


cpletpUhhcHp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhcHpL(gt2,lam4,lam7,lam5,lam6,v,vv,cpletpUhhcHp(gt2))

End Do 


cpletpUhhVWp = 0._dp 
Do gt2 = 1, 2
Call CouplingetpUhhVWpL(gt2,g2,cpletpUhhVWp(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,Yu,epsU,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,v,vv,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,v,vv,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHpcHp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpcHpL(gt1,lam1,lam3,lam6,v,vv,cplUhhHpcHp(gt1))

End Do 


cplUhhHpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhHpVWpL(gt1,g2,cplUhhHpVWp(gt1))

End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,v,vv,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletIetIUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,cpletIetIUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletpUhhUhhcetp = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetpUhhUhhcetpL(gt2,gt3,lam2,lam3,lam7,cpletpUhhUhhcetp(gt2,gt3))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHpcHp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhHpcHpL(gt1,gt2,lam1,lam3,lam6,cplUhhUhhHpcHp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

End Module Couplings_2HDMHiggsBasis 
