! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 11:51 on 17.6.2016   
! ----------------------------------------------------------------------  
 
 
Module Ss3Decays_radinertT13A 
 
Use Control 
Use CouplingsForDecays_radinertT13A 
Use ThreeBodyPhaseSpaceS 
 
Contains 
 
Subroutine SsThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFre,MFre2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,MVWp2,MVZ,MVZ2,           & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,             & 
& YR1,YR4,Mn,MDF,mu2,MS2,v,gSsFeHpNv0,gSsSsFecFe,gSsFreAhcFe,gSsFreFvHp,gSshhFrecFe,     & 
& gSsFreSscFre,gSsFvAhNv0,gSsFvFvSs,gSshhFvNv0,gSsSsNv0Nv0,gSsSsFdcFd,gSsSsFucFu,        & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFre,MFre2,MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv0(3),MNv02(3),MSs(3),MSs2(3),MVWp,MVWp2,MVZ,              & 
& MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),VSs(3,3),ZUL(3,3),Vv(3,3),               & 
& ZvN(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFreSsL(3,3),cplcFeFreSsR(3,3),cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),& 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplFvNv0SsL(3,3,3),  & 
& cplFvNv0SsR(3,3,3),cplhhSsSs(3,3),cplNv0FreHpL(3),cplNv0FreHpR(3),cplNv0Nv0AhL(3,3),   & 
& cplNv0Nv0AhR(3,3),cplNv0Nv0hhL(3,3),cplNv0Nv0hhR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v

Complex(dp),Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Real(dp),Intent(inout) :: gSsFeHpNv0(3,3,1,3),gSsSsFecFe(3,3,3,3),gSsFreAhcFe(3,1,1,3),gSsFreFvHp(3,1,3,1),     & 
& gSshhFrecFe(3,1,1,3),gSsFreSscFre(3,1,3,1),gSsFvAhNv0(3,3,1,3),gSsFvFvSs(3,3,3,3),     & 
& gSshhFvNv0(3,1,3,3),gSsSsNv0Nv0(3,3,3,3),gSsSsFdcFd(3,3,3,3),gSsSsFucFu(3,3,3,3)

Real(dp) :: gSsFeHpNv0i(3,1,3),gSsSsFecFei(3,3,3),gSsFreAhcFei(1,1,3),gSsFreFvHpi(1,3,1),         & 
& gSshhFrecFei(1,1,3),gSsFreSscFrei(1,3,1),gSsFvAhNv0i(3,1,3),gSsFvFvSsi(3,3,3),         & 
& gSshhFvNv0i(1,3,3),gSsSsNv0Nv0i(3,3,3),gSsSsFdcFdi(3,3,3),gSsSsFucFui(3,3,3)

Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'SsThreeBodyDecay' 
 

 
If (CheckRealStates) Then 
Else 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Ss_decays_3B(MSs(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFre,MFre2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv0,MNv02,MSs,MSs2,MVWp,               & 
& MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,VSs,ZUL,Vv,ZvN,ZW,ZZ,g1,g2,g3,Lam,               & 
& LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v,cplcFdFdhhL,cplcFdFdhhR,cplcFeFeAhL,         & 
& cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFreSsL,cplcFeFreSsR,cplcFreFeSsL,            & 
& cplcFreFeSsR,cplcFuFuhhL,cplcFuFuhhR,cplFvFeHpL,cplFvFeHpR,cplFvNv0SsL,cplFvNv0SsR,    & 
& cplhhSsSs,cplNv0FreHpL,cplNv0FreHpR,cplNv0Nv0AhL,cplNv0Nv0AhR,cplNv0Nv0hhL,            & 
& cplNv0Nv0hhR,deltaM)


 
gSsFeHpNv0i = 0._dp 
Call SsToFeHpNv0(i_run,MFe,MHp,MNv0,MFre,MFv,MSs,cplcFreFeSsL,cplcFreFeSsR,           & 
& cplFvFeHpL,cplFvFeHpR,cplFvNv0SsL,cplFvNv0SsR,cplNv0FreHpL,cplNv0FreHpR,               & 
& deltaM,epsI,check,gSsFeHpNv0i)

gSsFeHpNv0(i_run,:,:,:) = gSsFeHpNv0i 
gT(i_run) = gT(i_run) + 2._dp*Sum(gSsFeHpNv0i) 
 
gSsSsFecFei = 0._dp 
Call SsToSsFecFe(i_run,MSs,MFe,Mhh,MFre,cplhhSsSs,cplcFeFehhL,cplcFeFehhR,            & 
& cplcFeFreSsL,cplcFeFreSsR,cplcFreFeSsL,cplcFreFeSsR,deltaM,epsI,check,gSsSsFecFei)

gSsSsFecFe(i_run,:,:,:) = gSsSsFecFei 
gT(i_run) = gT(i_run) + Sum(gSsSsFecFei) 
 
gSsFreAhcFei = 0._dp 
Call SsToFreAhcFe(i_run,MFre,MAh,MFe,MSs,cplcFeFeAhL,cplcFeFeAhR,cplcFeFreSsL,        & 
& cplcFeFreSsR,deltaM,epsI,check,gSsFreAhcFei)

gSsFreAhcFe(i_run,:,:,:) = gSsFreAhcFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gSsFreAhcFei) 
 
gSsFreFvHpi = 0._dp 
Call SsToFreFvHp(i_run,MFre,MFv,MHp,MFe,MNv0,MSs,cplcFeFreSsL,cplcFeFreSsR,           & 
& cplFvFeHpL,cplFvFeHpR,cplFvNv0SsL,cplFvNv0SsR,cplNv0FreHpL,cplNv0FreHpR,               & 
& deltaM,epsI,check,gSsFreFvHpi)

gSsFreFvHp(i_run,:,:,:) = gSsFreFvHpi 
gT(i_run) = gT(i_run) + 2._dp*Sum(gSsFreFvHpi) 
 
gSshhFrecFei = 0._dp 
Call SsTohhFrecFe(i_run,Mhh,MFre,MFe,MSs,cplhhSsSs,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFreSsL,cplcFeFreSsR,deltaM,epsI,check,gSshhFrecFei)

gSshhFrecFe(i_run,:,:,:) = gSshhFrecFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gSshhFrecFei) 
 
gSsFreSscFrei = 0._dp 
Call SsToFreSscFre(i_run,MFre,MSs,MFe,cplcFeFreSsL,cplcFeFreSsR,cplcFreFeSsL,         & 
& cplcFreFeSsR,deltaM,epsI,check,gSsFreSscFrei)

gSsFreSscFre(i_run,:,:,:) = gSsFreSscFrei 
gT(i_run) = gT(i_run) + Sum(gSsFreSscFrei) 
 
gSsFvAhNv0i = 0._dp 
Call SsToFvAhNv0(i_run,MFv,MAh,MNv0,MSs,cplFvNv0SsL,cplFvNv0SsR,cplNv0Nv0AhL,         & 
& cplNv0Nv0AhR,deltaM,epsI,check,gSsFvAhNv0i)

gSsFvAhNv0(i_run,:,:,:) = gSsFvAhNv0i 
gT(i_run) = gT(i_run) + Sum(gSsFvAhNv0i) 
 
gSsFvFvSsi = 0._dp 
Call SsToFvFvSs(i_run,MFv,MSs,MNv0,cplFvNv0SsL,cplFvNv0SsR,deltaM,epsI,               & 
& check,gSsFvFvSsi)

gSsFvFvSs(i_run,:,:,:) = gSsFvFvSsi 
gT(i_run) = gT(i_run) + Sum(gSsFvFvSsi) 
 
gSshhFvNv0i = 0._dp 
Call SsTohhFvNv0(i_run,Mhh,MFv,MNv0,MSs,cplhhSsSs,cplFvNv0SsL,cplFvNv0SsR,            & 
& cplNv0Nv0hhL,cplNv0Nv0hhR,deltaM,epsI,check,gSshhFvNv0i)

gSshhFvNv0(i_run,:,:,:) = gSshhFvNv0i 
gT(i_run) = gT(i_run) + Sum(gSshhFvNv0i) 
 
gSsSsNv0Nv0i = 0._dp 
Call SsToSsNv0Nv0(i_run,MSs,MNv0,Mhh,MFv,cplhhSsSs,cplFvNv0SsL,cplFvNv0SsR,           & 
& cplNv0Nv0hhL,cplNv0Nv0hhR,deltaM,epsI,check,gSsSsNv0Nv0i)

gSsSsNv0Nv0(i_run,:,:,:) = gSsSsNv0Nv0i 
gT(i_run) = gT(i_run) + Sum(gSsSsNv0Nv0i) 
 
gSsSsFdcFdi = 0._dp 
Call SsToSsFdcFd(i_run,MSs,MFd,Mhh,cplhhSsSs,cplcFdFdhhL,cplcFdFdhhR,deltaM,          & 
& epsI,check,gSsSsFdcFdi)

gSsSsFdcFd(i_run,:,:,:) = gSsSsFdcFdi 
gT(i_run) = gT(i_run) + Sum(gSsSsFdcFdi) 
 
gSsSsFucFui = 0._dp 
Call SsToSsFucFu(i_run,MSs,MFu,Mhh,cplhhSsSs,cplcFuFuhhL,cplcFuFuhhR,deltaM,          & 
& epsI,check,gSsSsFucFui)

gSsSsFucFu(i_run,:,:,:) = gSsSsFucFui 
gT(i_run) = gT(i_run) + Sum(gSsSsFucFui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=2,1
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gSsFeHpNv0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSsSsFecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=2,1
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gSsFreAhcFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=2,1
gPartial(i1,n_length)= 2._dp*gSsFreFvHp(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,1
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gSshhFrecFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,1
gPartial(i1,n_length)= gSsFreSscFre(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=2,1
    Do gt3=1,3
gPartial(i1,n_length)= gSsFvAhNv0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSsFvFvSs(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSshhFvNv0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gSsSsNv0Nv0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSsSsFdcFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gSsSsFucFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Iname = Iname - 1 
 
End Subroutine SsThreeBodyDecay
 
 
Subroutine SsToFeHpNv0(iIN,MFe,MHp,MNv0,MFre,MFv,MSs,cplcFreFeSsL,cplcFreFeSsR,       & 
& cplFvFeHpL,cplFvFeHpR,cplFvNv0SsL,cplFvNv0SsR,cplNv0FreHpL,cplNv0FreHpR,               & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MHp,MNv0(3),MFre,MFv(3),MSs(3)

Complex(dp),Intent(in) :: cplcFreFeSsL(3,3),cplcFreFeSsR(3,3),cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplFvNv0SsL(3,3,3),& 
& cplFvNv0SsR(3,3,3),cplNv0FreHpL(3),cplNv0FreHpR(3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 16 
Allocate( gSum(3,1,3, Isum) ) 
Allocate( Contribution(3,1,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt1)/MSs(iIN))**2 
rm2 = (MNv0(gt3)/MSs(iIN))**2 
rj2 = (MHp/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MNv0(gt3))+Abs(MHp)+Abs(MFe(gt1)))) Then 
!-------------- 
!  bar[Fre] 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFre 
mass(2) = MFre 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFreFeSsL(gt1,iIN)) 
coup(1) = Conjg(cplcFreFeSsR(gt1,iIN)) 
coup(4) = Conjg(cplNv0FreHpL(gt3)) 
coup(3) = Conjg(cplNv0FreHpR(gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fe Hp Nv0 Propagator: bar[Fre]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='bar[Fre]'



!-------------- 
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvFeHpL(i1,gt1)) 
coup(3) = Conjg(cplFvFeHpR(i1,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fe Hp Nv0 Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  bar[Fre], Fv 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFre  
mass(2) = MFv(i2)  
coup(1) = cplcFreFeSsL(gt1,iIN) 
coup(2) = cplcFreFeSsR(gt1,iIN) 
coup(3) = cplNv0FreHpL(gt3) 
coup(4) = cplNv0FreHpR(gt3) 
coup(5) = cplFvNv0SsL(i2,gt3,iIN) 
coup(6) = cplFvNv0SsR(i2,gt3,iIN)  
coup(7) = cplFvFeHpL(i2,gt1) 
coup(8) = cplFvFeHpR(i2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fe Hp Nv0 Propagator: bar[Fre],Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='bar[Fre],Fv'
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvNv0SsL(i1,gt3,iIN) 
coup(2) = cplFvNv0SsR(i1,gt3,iIN) 
coup(3) = cplFvFeHpL(i1,gt1) 
coup(4) = cplFvFeHpR(i1,gt1) 
coup(5) = cplFvNv0SsL(i2,gt3,iIN) 
coup(6) = cplFvNv0SsR(i2,gt3,iIN)  
coup(7) = cplFvFeHpL(i2,gt1) 
coup(8) = cplFvFeHpR(i2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fe Hp Nv0 Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
        Do gt3=1,3
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:16))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
End Subroutine SsToFeHpNv0 
 
 
Subroutine SsToSsFecFe(iIN,MSs,MFe,Mhh,MFre,cplhhSsSs,cplcFeFehhL,cplcFeFehhR,        & 
& cplcFeFreSsL,cplcFeFreSsR,cplcFreFeSsL,cplcFreFeSsR,deltaM,epsI,check,g,               & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSs(3),MFe(3),Mhh,MFre

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFreSsL(3,3),cplcFeFreSsR(3,3), & 
& cplcFreFeSsL(3,3),cplcFreFeSsR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 9 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFe(gt2)/MSs(iIN))**2 
rm2 = (MFe(gt3)/MSs(iIN))**2 
rj2 = (MSs(gt1)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MSs(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh 
mass(2) = Mhh 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,gt1)) 
coup(3) = Conjg(cplcFeFehhL(gt3,gt2)) 
coup(2) = Conjg(cplcFeFehhR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  bar[Fre] 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFre 
mass(2) = MFre 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFreFeSsL(gt2,iIN)) 
coup(1) = Conjg(cplcFreFeSsR(gt2,iIN)) 
coup(4) = Conjg(cplcFeFreSsL(gt3,gt1)) 
coup(3) = Conjg(cplcFeFreSsR(gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: bar[Fre]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fre]'



!-------------- 
!  Fre 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFre 
mass(2) = MFre 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFeFreSsL(gt3,iIN)) 
coup(1) = Conjg(cplcFeFreSsR(gt3,iIN)) 
coup(4) = Conjg(cplcFreFeSsL(gt2,gt1)) 
coup(3) = Conjg(cplcFreFeSsR(gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: Fre" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fre'



!-------------- 
!  hh, bar[Fre] 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh  
mass(1) = MFre  
coup(1) = cplcFreFeSsL(gt2,iIN) 
coup(2) = cplcFreFeSsR(gt2,iIN) 
coup(4) = Conjg(cplcFeFreSsL(gt3,gt1)) 
coup(3) = Conjg(cplcFeFreSsR(gt3,gt1))  
coup(5) = cplhhSsSs(iIN,gt1) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: hh,bar[Fre]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,bar[Fre]'



!-------------- 
!  hh, Fre 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh  
mass(1) = MFre  
coup(1) = cplcFeFreSsL(gt3,iIN) 
coup(2) = cplcFeFreSsR(gt3,iIN) 
coup(4) = Conjg(cplcFreFeSsL(gt2,gt1)) 
coup(3) = Conjg(cplcFreFeSsR(gt2,gt1))  
coup(5) = cplhhSsSs(iIN,gt1) 
coup(7) = Conjg(cplcFeFehhL(gt3,gt2)) 
coup(6) = Conjg(cplcFeFehhR(gt3,gt2))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: hh,Fre" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fre'



!-------------- 
!  bar[Fre], Fre 
!-------------- 
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFre  
mass(2) = MFre  
coup(1) = cplcFreFeSsL(gt2,iIN) 
coup(2) = cplcFreFeSsR(gt2,iIN) 
coup(3) = cplcFeFreSsL(gt3,gt1) 
coup(4) = cplcFeFreSsR(gt3,gt1) 
coup(5) = cplcFeFreSsL(gt3,iIN) 
coup(6) = cplcFeFreSsR(gt3,iIN)  
coup(7) = cplcFreFeSsL(gt2,gt1) 
coup(8) = cplcFreFeSsR(gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fe cFe Propagator: bar[Fre],Fre" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='bar[Fre],Fre'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SsToSsFecFe 
 
 
Subroutine SsToFreAhcFe(iIN,MFre,MAh,MFe,MSs,cplcFeFeAhL,cplcFeFeAhR,cplcFeFreSsL,    & 
& cplcFeFreSsR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MAh,MFe(3),MSs(3)

Complex(dp),Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFreSsL(3,3),cplcFeFreSsR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 9 
Allocate( gSum(1,1,3, Isum) ) 
Allocate( Contribution(1,1,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFre/MSs(iIN))**2 
rm2 = (MFe(gt3)/MSs(iIN))**2 
rj2 = (MAh/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFe(gt3))+Abs(MAh)+Abs(MFre))) Then 
!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFeFreSsL(i1,iIN)) 
coup(1) = Conjg(cplcFeFreSsR(i1,iIN)) 
coup(4) = Conjg(cplcFeFeAhL(gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt3,i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ah cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp
Else 
gSum(1,1,gt3,Isum)=resD
End If 
Contribution(1,1,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplcFeFeAhL(gt3,i1) 
coup(4) = cplcFeFeAhR(gt3,i1) 
coup(5) = cplcFeFreSsL(i2,iIN) 
coup(6) = cplcFeFreSsR(i2,iIN)  
coup(7) = cplcFeFeAhL(gt3,i2) 
coup(8) = cplcFeFeAhR(gt3,i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ah cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp  
Else 
gSum(1,1,gt3,Isum)= resS  
End If 
Contribution(1,1,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



Else 
gSum(1,1,gt3,:)= 0._dp  
End If 
       End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
        Do gt3=1,3
g(1,1,gt3)=Sum(gSum(1,1,gt3,1:9))
If (g(1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,1,gt3)=0._dp
End If
       End Do 
End Subroutine SsToFreAhcFe 
 
 
Subroutine SsToFreFvHp(iIN,MFre,MFv,MHp,MFe,MNv0,MSs,cplcFeFreSsL,cplcFeFreSsR,       & 
& cplFvFeHpL,cplFvFeHpR,cplFvNv0SsL,cplFvNv0SsR,cplNv0FreHpL,cplNv0FreHpR,               & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MFv(3),MHp,MFe(3),MNv0(3),MSs(3)

Complex(dp),Intent(in) :: cplcFeFreSsL(3,3),cplcFeFreSsR(3,3),cplFvFeHpL(3,3),cplFvFeHpR(3,3),cplFvNv0SsL(3,3,3),& 
& cplFvNv0SsR(3,3,3),cplNv0FreHpL(3),cplNv0FreHpR(3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 36 
Allocate( gSum(1,3,1, Isum) ) 
Allocate( Contribution(1,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
Isum = 0 
 
rk2 = (MFre/MSs(iIN))**2 
rm2 = (MFv(gt2)/MSs(iIN))**2 
rj2 = (MHp/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MHp)+Abs(MFv(gt2))+Abs(MFre))) Then 
!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFeFreSsL(i1,iIN)) 
coup(1) = Conjg(cplcFeFreSsR(i1,iIN)) 
coup(4) = Conjg(cplFvFeHpL(gt2,i1)) 
coup(3) = Conjg(cplFvFeHpR(gt2,i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Fv Hp Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp
Else 
gSum(1,gt2,1,Isum)=resD
End If 
Contribution(1,gt2,1,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  Nv0 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MNv0(i1) 
mass(2) = MNv0(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(gt2,i1,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(gt2,i1,iIN)) 
coup(4) = Conjg(cplNv0FreHpL(i1)) 
coup(3) = Conjg(cplNv0FreHpR(i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Fv Hp Propagator: Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp
Else 
gSum(1,gt2,1,Isum)=resD
End If 
Contribution(1,gt2,1,Isum)='Nv0'
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplFvFeHpL(gt2,i1) 
coup(4) = cplFvFeHpR(gt2,i1) 
coup(5) = cplcFeFreSsL(i2,iIN) 
coup(6) = cplcFeFreSsR(i2,iIN)  
coup(7) = cplFvFeHpL(gt2,i2) 
coup(8) = cplFvFeHpR(gt2,i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Fv Hp Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], Nv0 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplFvFeHpL(gt2,i1) 
coup(4) = cplFvFeHpR(gt2,i1) 
coup(5) = cplFvNv0SsL(gt2,i2,iIN) 
coup(6) = cplFvNv0SsR(gt2,i2,iIN)  
coup(7) = cplNv0FreHpL(i2) 
coup(8) = cplNv0FreHpR(i2) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Fv Hp Propagator: bar[Fe],Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='bar[Fe],Nv0'
        End Do 
      End Do 



!-------------- 
!  Nv0, Nv0 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt2,i1,iIN) 
coup(2) = cplFvNv0SsR(gt2,i1,iIN) 
coup(3) = cplNv0FreHpL(i1) 
coup(4) = cplNv0FreHpR(i1) 
coup(5) = cplFvNv0SsL(gt2,i2,iIN) 
coup(6) = cplFvNv0SsR(gt2,i2,iIN)  
coup(7) = cplNv0FreHpL(i2) 
coup(8) = cplNv0FreHpR(i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Fv Hp Propagator: Nv0,Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='Nv0,Nv0'
        End Do 
      End Do 



Else 
gSum(1,gt2,1,:)= 0._dp  
End If 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
g(1,gt2,1)=Sum(gSum(1,gt2,1,1:36))
If (g(1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,1)=0._dp
End If
     End Do 
End Subroutine SsToFreFvHp 
 
 
Subroutine SsTohhFrecFe(iIN,Mhh,MFre,MFe,MSs,cplhhSsSs,cplcFeFehhL,cplcFeFehhR,       & 
& cplcFeFreSsL,cplcFeFreSsR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh,MFre,MFe(3),MSs(3)

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFreSsL(3,3),cplcFeFreSsR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 36 
Allocate( gSum(1,1,3, Isum) ) 
Allocate( Contribution(1,1,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFre/MSs(iIN))**2 
rm2 = (MFe(gt3)/MSs(iIN))**2 
rj2 = (Mhh/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFe(gt3))+Abs(MFre)+Abs(Mhh))) Then 
!-------------- 
!  Ss 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSs(i1) 
mass(2) = MSs(i1) 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,i1)) 
coup(3) = Conjg(cplcFeFreSsL(gt3,i1)) 
coup(2) = Conjg(cplcFeFreSsR(gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fre cFe Propagator: Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp
Else 
gSum(1,1,gt3,Isum)=resD
End If 
Contribution(1,1,gt3,Isum)='Ss'
      End Do 



!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFeFreSsL(i1,iIN)) 
coup(1) = Conjg(cplcFeFreSsR(i1,iIN)) 
coup(4) = Conjg(cplcFeFehhL(gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fre cFe Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp
Else 
gSum(1,1,gt3,Isum)=resD
End If 
Contribution(1,1,gt3,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  Ss, Ss 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSs(i1)  
mass(2) = MSs(i2)  
coup(1) = cplhhSsSs(iIN,i1) 
coup(3) = Conjg(cplcFeFreSsL(gt3,i1)) 
coup(2) = Conjg(cplcFeFreSsR(gt3,i1))  
coup(4) = cplhhSsSs(iIN,i2) 
coup(6) = Conjg(cplcFeFreSsL(gt3,i2)) 
coup(5) = Conjg(cplcFeFreSsR(gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fre cFe Propagator: Ss,Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp  
Else 
gSum(1,1,gt3,Isum)= resS  
End If 
Contribution(1,1,gt3,Isum)='Ss,Ss'
        End Do 
      End Do 



!-------------- 
!  Ss, bar[Fe] 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSs(i1)  
mass(1) = MFe(i2)  
coup(1) = cplcFeFreSsL(i2,iIN) 
coup(2) = cplcFeFreSsR(i2,iIN) 
coup(4) = Conjg(cplcFeFehhL(gt3,i2)) 
coup(3) = Conjg(cplcFeFehhR(gt3,i2))  
coup(5) = cplhhSsSs(iIN,i1) 
coup(7) = Conjg(cplcFeFreSsL(gt3,i1)) 
coup(6) = Conjg(cplcFeFreSsR(gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fre cFe Propagator: Ss,bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp  
Else 
gSum(1,1,gt3,Isum)= resS  
End If 
Contribution(1,1,gt3,Isum)='Ss,bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplcFeFehhL(gt3,i1) 
coup(4) = cplcFeFehhR(gt3,i1) 
coup(5) = cplcFeFreSsL(i2,iIN) 
coup(6) = cplcFeFreSsR(i2,iIN)  
coup(7) = cplcFeFehhL(gt3,i2) 
coup(8) = cplcFeFehhR(gt3,i2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fre cFe Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,1,gt3,Isum)= 0._dp  
Else 
gSum(1,1,gt3,Isum)= resS  
End If 
Contribution(1,1,gt3,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



Else 
gSum(1,1,gt3,:)= 0._dp  
End If 
       End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
        Do gt3=1,3
g(1,1,gt3)=Sum(gSum(1,1,gt3,1:36))
If (g(1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,1,gt3)=0._dp
End If
       End Do 
End Subroutine SsTohhFrecFe 
 
 
Subroutine SsToFreSscFre(iIN,MFre,MSs,MFe,cplcFeFreSsL,cplcFeFreSsR,cplcFreFeSsL,     & 
& cplcFreFeSsR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFre,MSs(3),MFe(3)

Complex(dp),Intent(in) :: cplcFeFreSsL(3,3),cplcFeFreSsR(3,3),cplcFreFeSsL(3,3),cplcFreFeSsR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 36 
Allocate( gSum(1,3,1, Isum) ) 
Allocate( Contribution(1,3,1, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1, iIN-1
Isum = 0 
 
rk2 = (MFre/MSs(iIN))**2 
rm2 = (MFre/MSs(iIN))**2 
rj2 = (MSs(gt2)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFre)+Abs(MSs(gt2))+Abs(MFre))) Then 
!-------------- 
!  bar[Fe] 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFeFreSsL(i1,iIN)) 
coup(1) = Conjg(cplcFeFreSsR(i1,iIN)) 
coup(4) = Conjg(cplcFreFeSsL(i1,gt2)) 
coup(3) = Conjg(cplcFreFeSsR(i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ss cFre Propagator: bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp
Else 
gSum(1,gt2,1,Isum)=resD
End If 
Contribution(1,gt2,1,Isum)='bar[Fe]'
      End Do 



!-------------- 
!  Fe 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFe(i1) 
mass(2) = MFe(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplcFreFeSsL(i1,iIN)) 
coup(1) = Conjg(cplcFreFeSsR(i1,iIN)) 
coup(4) = Conjg(cplcFeFreSsL(i1,gt2)) 
coup(3) = Conjg(cplcFeFreSsR(i1,gt2))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ss cFre Propagator: Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp
Else 
gSum(1,gt2,1,Isum)=resD
End If 
Contribution(1,gt2,1,Isum)='Fe'
      End Do 



!-------------- 
!  bar[Fe], bar[Fe] 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplcFreFeSsL(i1,gt2) 
coup(4) = cplcFreFeSsR(i1,gt2) 
coup(5) = cplcFeFreSsL(i2,iIN) 
coup(6) = cplcFeFreSsR(i2,iIN)  
coup(7) = cplcFreFeSsL(i2,gt2) 
coup(8) = cplcFreFeSsR(i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ss cFre Propagator: bar[Fe],bar[Fe]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='bar[Fe],bar[Fe]'
        End Do 
      End Do 



!-------------- 
!  bar[Fe], Fe 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFeFreSsL(i1,iIN) 
coup(2) = cplcFeFreSsR(i1,iIN) 
coup(3) = cplcFreFeSsL(i1,gt2) 
coup(4) = cplcFreFeSsR(i1,gt2) 
coup(5) = cplcFreFeSsL(i2,iIN) 
coup(6) = cplcFreFeSsR(i2,iIN)  
coup(7) = cplcFeFreSsL(i2,gt2) 
coup(8) = cplcFeFreSsR(i2,gt2) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ss cFre Propagator: bar[Fe],Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='bar[Fe],Fe'
        End Do 
      End Do 



!-------------- 
!  Fe, Fe 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFe(i1)  
mass(2) = MFe(i2)  
coup(1) = cplcFreFeSsL(i1,iIN) 
coup(2) = cplcFreFeSsR(i1,iIN) 
coup(3) = cplcFeFreSsL(i1,gt2) 
coup(4) = cplcFeFreSsR(i1,gt2) 
coup(5) = cplcFreFeSsL(i2,iIN) 
coup(6) = cplcFreFeSsR(i2,iIN)  
coup(7) = cplcFeFreSsL(i2,gt2) 
coup(8) = cplcFeFreSsR(i2,gt2) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fre Ss cFre Propagator: Fe,Fe" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,1,Isum)= 0._dp  
Else 
gSum(1,gt2,1,Isum)= resS  
End If 
Contribution(1,gt2,1,Isum)='Fe,Fe'
        End Do 
      End Do 



Else 
gSum(1,gt2,1,:)= 0._dp  
End If 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1, iIN-1
g(1,gt2,1)=Sum(gSum(1,gt2,1,1:36))
If (g(1,gt2,1).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,1)=0._dp
End If
     End Do 
End Subroutine SsToFreSscFre 
 
 
Subroutine SsToFvAhNv0(iIN,MFv,MAh,MNv0,MSs,cplFvNv0SsL,cplFvNv0SsR,cplNv0Nv0AhL,     & 
& cplNv0Nv0AhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MAh,MNv0(3),MSs(3)

Complex(dp),Intent(in) :: cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3),cplNv0Nv0AhL(3,3),cplNv0Nv0AhR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 9 
Allocate( gSum(3,1,3, Isum) ) 
Allocate( Contribution(3,1,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt1)/MSs(iIN))**2 
rm2 = (MNv0(gt3)/MSs(iIN))**2 
rj2 = (MAh/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MNv0(gt3))+Abs(MAh)+Abs(MFv(gt1)))) Then 
!-------------- 
!  Nv0 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MNv0(i1) 
mass(2) = MNv0(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(gt1,i1,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(gt1,i1,iIN)) 
coup(4) = Conjg(cplNv0Nv0AhL(i1,gt3)) 
coup(3) = Conjg(cplNv0Nv0AhR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fv Ah Nv0 Propagator: Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp
Else 
gSum(gt1,1,gt3,Isum)=resD
End If 
Contribution(gt1,1,gt3,Isum)='Nv0'
      End Do 



!-------------- 
!  Nv0, Nv0 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt1,i1,iIN) 
coup(2) = cplFvNv0SsR(gt1,i1,iIN) 
coup(3) = cplNv0Nv0AhL(i1,gt3) 
coup(4) = cplNv0Nv0AhR(i1,gt3) 
coup(5) = cplFvNv0SsL(gt1,i2,iIN) 
coup(6) = cplFvNv0SsR(gt1,i2,iIN)  
coup(7) = cplNv0Nv0AhL(i2,gt3) 
coup(8) = cplNv0Nv0AhR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fv Ah Nv0 Propagator: Nv0,Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,1,gt3,Isum)= 0._dp  
Else 
gSum(gt1,1,gt3,Isum)= resS  
End If 
Contribution(gt1,1,gt3,Isum)='Nv0,Nv0'
        End Do 
      End Do 



Else 
gSum(gt1,1,gt3,:)= 0._dp  
End If 
       End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
        Do gt3=1,3
g(gt1,1,gt3)=Sum(gSum(gt1,1,gt3,1:9))
If (g(gt1,1,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,1,gt3)=0._dp
End If
       End Do 
   End Do 
End Subroutine SsToFvAhNv0 
 
 
Subroutine SsToFvFvSs(iIN,MFv,MSs,MNv0,cplFvNv0SsL,cplFvNv0SsR,deltaM,epsI,           & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MSs(3),MNv0(3)

Complex(dp),Intent(in) :: cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 9 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1, iIN-1
Isum = 0 
 
rk2 = (MFv(gt1)/MSs(iIN))**2 
rm2 = (MFv(gt2)/MSs(iIN))**2 
rj2 = (MSs(gt3)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MSs(gt3))+Abs(MFv(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  Nv0 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MNv0(i1) 
mass(2) = MNv0(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(gt1,i1,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(gt1,i1,iIN)) 
coup(4) = Conjg(cplFvNv0SsL(gt2,i1,gt3)) 
coup(3) = Conjg(cplFvNv0SsR(gt2,i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MNv0(i1) 
mass(2) = MNv0(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(gt2,i1,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(gt2,i1,iIN)) 
coup(4) = Conjg(cplFvNv0SsL(gt1,i1,gt3)) 
coup(3) = Conjg(cplFvNv0SsR(gt1,i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MNv0(i1)  
mass(2) = MNv0(i1)  
coup(1) = cplFvNv0SsL(gt2,i1,iIN) 
coup(2) = cplFvNv0SsR(gt2,i1,iIN) 
coup(3) = cplFvNv0SsL(gt1,i1,gt3) 
coup(4) = cplFvNv0SsR(gt1,i1,gt3) 
coup(5) = cplFvNv0SsL(gt1,i1,iIN) 
coup(6) = cplFvNv0SsR(gt1,i1,iIN)  
coup(7) = cplFvNv0SsL(gt2,i1,gt3) 
coup(8) = cplFvNv0SsR(gt2,i1,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fv Fv Ss Propagator: Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Nv0'
      End Do 



!-------------- 
!  Nv0, Nv0 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt1,i1,iIN) 
coup(2) = cplFvNv0SsR(gt1,i1,iIN) 
coup(3) = cplFvNv0SsL(gt2,i1,gt3) 
coup(4) = cplFvNv0SsR(gt2,i1,gt3) 
coup(5) = cplFvNv0SsL(gt1,i2,iIN) 
coup(6) = cplFvNv0SsR(gt1,i2,iIN)  
coup(7) = cplFvNv0SsL(gt2,i2,gt3) 
coup(8) = cplFvNv0SsR(gt2,i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt2,i1,iIN) 
coup(2) = cplFvNv0SsR(gt2,i1,iIN) 
coup(3) = cplFvNv0SsL(gt1,i1,gt3) 
coup(4) = cplFvNv0SsR(gt1,i1,gt3) 
coup(5) = cplFvNv0SsL(gt1,i2,iIN) 
coup(6) = cplFvNv0SsR(gt1,i2,iIN)  
coup(7) = cplFvNv0SsL(gt2,i2,gt3) 
coup(8) = cplFvNv0SsR(gt2,i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt2,i1,iIN) 
coup(2) = cplFvNv0SsR(gt2,i1,iIN) 
coup(3) = cplFvNv0SsL(gt1,i1,gt3) 
coup(4) = cplFvNv0SsR(gt1,i1,gt3) 
coup(5) = cplFvNv0SsL(gt2,i2,iIN) 
coup(6) = cplFvNv0SsR(gt2,i2,iIN)  
coup(7) = cplFvNv0SsL(gt1,i2,gt3) 
coup(8) = cplFvNv0SsR(gt1,i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt1,i1,iIN) 
coup(2) = cplFvNv0SsR(gt1,i1,iIN) 
coup(3) = cplFvNv0SsL(gt2,i1,gt3) 
coup(4) = cplFvNv0SsR(gt2,i1,gt3) 
coup(5) = cplFvNv0SsL(gt2,i2,iIN) 
coup(6) = cplFvNv0SsR(gt2,i2,iIN)  
coup(7) = cplFvNv0SsL(gt1,i2,gt3) 
coup(8) = cplFvNv0SsR(gt1,i2,gt3) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Fv Fv Ss Propagator: Nv0,Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Nv0,Nv0'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SsToFvFvSs 
 
 
Subroutine SsTohhFvNv0(iIN,Mhh,MFv,MNv0,MSs,cplhhSsSs,cplFvNv0SsL,cplFvNv0SsR,        & 
& cplNv0Nv0hhL,cplNv0Nv0hhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: Mhh,MFv(3),MNv0(3),MSs(3)

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3),cplNv0Nv0hhL(3,3),               & 
& cplNv0Nv0hhR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 36 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFv(gt2)/MSs(iIN))**2 
rm2 = (MNv0(gt3)/MSs(iIN))**2 
rj2 = (Mhh/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MNv0(gt3))+Abs(MFv(gt2))+Abs(Mhh))) Then 
!-------------- 
!  Ss 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MSs(i1) 
mass(2) = MSs(i1) 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,i1)) 
coup(3) = Conjg(cplFvNv0SsL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvNv0SsR(gt2,gt3,i1))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fv Nv0 Propagator: Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Ss'
      End Do 



!-------------- 
!  Nv0 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MNv0(i1) 
mass(2) = MNv0(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(gt2,i1,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(gt2,i1,iIN)) 
coup(4) = Conjg(cplNv0Nv0hhL(i1,gt3)) 
coup(3) = Conjg(cplNv0Nv0hhR(i1,gt3))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fv Nv0 Propagator: Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='Nv0'
      End Do 



!-------------- 
!  Ss, Ss 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MSs(i1)  
mass(2) = MSs(i2)  
coup(1) = cplhhSsSs(iIN,i1) 
coup(3) = Conjg(cplFvNv0SsL(gt2,gt3,i1)) 
coup(2) = Conjg(cplFvNv0SsR(gt2,gt3,i1))  
coup(4) = cplhhSsSs(iIN,i2) 
coup(6) = Conjg(cplFvNv0SsL(gt2,gt3,i2)) 
coup(5) = Conjg(cplFvNv0SsR(gt2,gt3,i2))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fv Nv0 Propagator: Ss,Ss" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Ss,Ss'
        End Do 
      End Do 



!-------------- 
!  Ss, Nv0 
!-------------- 
Do i1=1,3
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MSs(i1)  
mass(1) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt2,i2,iIN) 
coup(2) = cplFvNv0SsR(gt2,i2,iIN) 
coup(4) = Conjg(cplNv0Nv0hhL(i2,gt3)) 
coup(3) = Conjg(cplNv0Nv0hhR(i2,gt3))  
coup(5) = cplhhSsSs(iIN,i1) 
coup(7) = Conjg(cplFvNv0SsL(gt2,gt3,i1)) 
coup(6) = Conjg(cplFvNv0SsR(gt2,gt3,i1))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fv Nv0 Propagator: Ss,Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Ss,Nv0'
        End Do 
      End Do 



!-------------- 
!  Nv0, Nv0 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MNv0(i1)  
mass(2) = MNv0(i2)  
coup(1) = cplFvNv0SsL(gt2,i1,iIN) 
coup(2) = cplFvNv0SsR(gt2,i1,iIN) 
coup(3) = cplNv0Nv0hhL(i1,gt3) 
coup(4) = cplNv0Nv0hhR(i1,gt3) 
coup(5) = cplFvNv0SsL(gt2,i2,iIN) 
coup(6) = cplFvNv0SsR(gt2,i2,iIN)  
coup(7) = cplNv0Nv0hhL(i2,gt3) 
coup(8) = cplNv0Nv0hhR(i2,gt3) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->hh Fv Nv0 Propagator: Nv0,Nv0" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(1,gt2,gt3,Isum)= resS  
End If 
Contribution(1,gt2,gt3,Isum)='Nv0,Nv0'
        End Do 
      End Do 



Else 
gSum(1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
      Do gt2=1,3
        Do gt3=1,3
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:36))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
End Subroutine SsTohhFvNv0 
 
 
Subroutine SsToSsNv0Nv0(iIN,MSs,MNv0,Mhh,MFv,cplhhSsSs,cplFvNv0SsL,cplFvNv0SsR,       & 
& cplNv0Nv0hhL,cplNv0Nv0hhR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSs(3),MNv0(3),Mhh,MFv(3)

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplFvNv0SsL(3,3,3),cplFvNv0SsR(3,3,3),cplNv0Nv0hhL(3,3),               & 
& cplNv0Nv0hhR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
rk2 = (MNv0(gt2)/MSs(iIN))**2 
rm2 = (MNv0(gt3)/MSs(iIN))**2 
rj2 = (MSs(gt1)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MNv0(gt3))+Abs(MNv0(gt2))+Abs(MSs(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh 
mass(2) = Mhh 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,gt1)) 
coup(3) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup(2) = Conjg(cplNv0Nv0hhR(gt2,gt3))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh 
mass(2) = Mhh 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,gt1)) 
coup(3) = Conjg(cplNv0Nv0hhL(gt3,gt2)) 
coup(2) = Conjg(cplNv0Nv0hhR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = Mhh  
mass(2) = Mhh  
coup(1) = cplhhSsSs(iIN,gt1) 
coup(3) = Conjg(cplNv0Nv0hhL(gt3,gt2)) 
coup(2) = Conjg(cplNv0Nv0hhR(gt3,gt2))  
coup(4) = cplhhSsSs(iIN,gt1) 
coup(6) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup(5) = Conjg(cplNv0Nv0hhR(gt2,gt3))  
Call IntegrateSaSb(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Nv0 Nv0 Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  Fv 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(i1,gt2,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(i1,gt2,iIN)) 
coup(4) = Conjg(cplFvNv0SsL(i1,gt3,gt1)) 
coup(3) = Conjg(cplFvNv0SsR(i1,gt3,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1) 
mass(2) = MFv(i1) 
m_in = MSs(iIN) 
coup(2) = Conjg(cplFvNv0SsL(i1,gt3,iIN)) 
coup(1) = Conjg(cplFvNv0SsR(i1,gt3,iIN)) 
coup(4) = Conjg(cplFvNv0SsL(i1,gt2,gt1)) 
coup(3) = Conjg(cplFvNv0SsR(i1,gt2,gt1))
coup(5:8) = coup(1:4) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
 
 mass(1) = MFv(i1)  
mass(2) = MFv(i1)  
coup(1) = cplFvNv0SsL(i1,gt3,iIN) 
coup(2) = cplFvNv0SsR(i1,gt3,iIN) 
coup(3) = cplFvNv0SsL(i1,gt2,gt1) 
coup(4) = cplFvNv0SsR(i1,gt2,gt1) 
coup(5) = cplFvNv0SsL(i1,gt2,iIN) 
coup(6) = cplFvNv0SsR(i1,gt2,iIN)  
coup(7) = cplFvNv0SsL(i1,gt3,gt1) 
coup(8) = cplFvNv0SsR(i1,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Nv0 Nv0 Propagator: Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv'
      End Do 



!-------------- 
!  hh, Fv 
!-------------- 
  Do i2=1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = Mhh  
mass(1) = MFv(i2)  
coup(1) = cplFvNv0SsL(i2,gt2,iIN) 
coup(2) = cplFvNv0SsR(i2,gt2,iIN) 
coup(4) = Conjg(cplFvNv0SsL(i2,gt3,gt1)) 
coup(3) = Conjg(cplFvNv0SsR(i2,gt3,gt1))  
coup(5) = cplhhSsSs(iIN,gt1) 
coup(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup(6) = Conjg(cplNv0Nv0hhR(gt2,gt3))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = Mhh  
mass(1) = MFv(i2)  
coup(1) = cplFvNv0SsL(i2,gt3,iIN) 
coup(2) = cplFvNv0SsR(i2,gt3,iIN) 
coup(4) = Conjg(cplFvNv0SsL(i2,gt2,gt1)) 
coup(3) = Conjg(cplFvNv0SsR(i2,gt2,gt1))  
coup(5) = cplhhSsSs(iIN,gt1) 
coup(7) = Conjg(cplNv0Nv0hhL(gt2,gt3)) 
coup(6) = Conjg(cplNv0Nv0hhR(gt2,gt3))  
Call IntegrateSF(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Nv0 Nv0 Propagator: hh,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,Fv'
      End Do 



!-------------- 
!  Fv, Fv 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Isum = Isum + 1 
 
resS = 0._dp 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvNv0SsL(i1,gt2,iIN) 
coup(2) = cplFvNv0SsR(i1,gt2,iIN) 
coup(3) = cplFvNv0SsL(i1,gt3,gt1) 
coup(4) = cplFvNv0SsR(i1,gt3,gt1) 
coup(5) = cplFvNv0SsL(i2,gt2,iIN) 
coup(6) = cplFvNv0SsR(i2,gt2,iIN)  
coup(7) = cplFvNv0SsL(i2,gt3,gt1) 
coup(8) = cplFvNv0SsR(i2,gt3,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvNv0SsL(i1,gt3,iIN) 
coup(2) = cplFvNv0SsR(i1,gt3,iIN) 
coup(3) = cplFvNv0SsL(i1,gt2,gt1) 
coup(4) = cplFvNv0SsR(i1,gt2,gt1) 
coup(5) = cplFvNv0SsL(i2,gt2,iIN) 
coup(6) = cplFvNv0SsR(i2,gt2,iIN)  
coup(7) = cplFvNv0SsL(i2,gt3,gt1) 
coup(8) = cplFvNv0SsR(i2,gt3,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvNv0SsL(i1,gt3,iIN) 
coup(2) = cplFvNv0SsR(i1,gt3,iIN) 
coup(3) = cplFvNv0SsL(i1,gt2,gt1) 
coup(4) = cplFvNv0SsR(i1,gt2,gt1) 
coup(5) = cplFvNv0SsL(i2,gt3,iIN) 
coup(6) = cplFvNv0SsR(i2,gt3,iIN)  
coup(7) = cplFvNv0SsL(i2,gt2,gt1) 
coup(8) = cplFvNv0SsR(i2,gt2,gt1) 
Call IntegrateFFLM(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(1) = MFv(i1)  
mass(2) = MFv(i2)  
coup(1) = cplFvNv0SsL(i1,gt2,iIN) 
coup(2) = cplFvNv0SsR(i1,gt2,iIN) 
coup(3) = cplFvNv0SsL(i1,gt3,gt1) 
coup(4) = cplFvNv0SsR(i1,gt3,gt1) 
coup(5) = cplFvNv0SsL(i2,gt3,iIN) 
coup(6) = cplFvNv0SsR(i2,gt3,iIN)  
coup(7) = cplFvNv0SsL(i2,gt2,gt1) 
coup(8) = cplFvNv0SsR(i2,gt2,gt1) 
Call IntegrateChiChiInterference(mass,m_in,r_outcrossed,coup,smin2,smax2,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC = 1*resC  ! Color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Nv0 Nv0 Propagator: Fv,Fv" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Fv,Fv'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SsToSsNv0Nv0 
 
 
Subroutine SsToSsFdcFd(iIN,MSs,MFd,Mhh,cplhhSsSs,cplcFdFdhhL,cplcFdFdhhR,             & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSs(3),MFd(3),Mhh

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplcFdFdhhL(3,3),cplcFdFdhhR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFd(gt2)/MSs(iIN))**2 
rm2 = (MFd(gt3)/MSs(iIN))**2 
rj2 = (MSs(gt1)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MSs(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh 
mass(2) = Mhh 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,gt1)) 
coup(3) = Conjg(cplcFdFdhhL(gt3,gt2)) 
coup(2) = Conjg(cplcFdFdhhR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fd cFd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SsToSsFdcFd 
 
 
Subroutine SsToSsFucFu(iIN,MSs,MFu,Mhh,cplhhSsSs,cplcFuFuhhL,cplcFuFuhhR,             & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MSs(3),MFu(3),Mhh

Complex(dp),Intent(in) :: cplhhSsSs(3,3),cplcFuFuhhL(3,3),cplcFuFuhhR(3,3)

Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp)::smin,smax,smin2,smax2,rj2,rk2,rm2 
Real(dp)::r_out(3),r_outcrossed(3) 
Real(dp)::mass(3) 
Complex(dp)::coup(10) 
mass(1) = MSs(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
rk2 = (MFu(gt2)/MSs(iIN))**2 
rm2 = (MFu(gt3)/MSs(iIN))**2 
rj2 = (MSs(gt1)/MSs(iIN))**2 
smin=2._dp*Sqrt(rk2) 
smax=1._dp+rk2-rj2-rm2-2._dp*Sqrt(rj2*rm2) 
smin2=2._dp*Sqrt(rm2) 
smax2=1._dp+rm2-rj2-rk2-2._dp*Sqrt(rj2*rk2) 
m_in=MSs(iIN) 
r_out(1)=rj2 
r_out(2)=rk2 
r_out(3)=rm2 
r_outcrossed(1)=rj2 
r_outcrossed(2)=rm2 
r_outcrossed(3)=rk2 
If(Abs(MSs(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MSs(gt1)))) Then 
!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
resS=0._dp 
resD=0._dp 
 
mass(1) = Mhh 
mass(2) = Mhh 
m_in = MSs(iIN) 
coup(1) = Conjg(cplhhSsSs(iIN,gt1)) 
coup(3) = Conjg(cplcFuFuhhL(gt3,gt2)) 
coup(2) = Conjg(cplcFuFuhhR(gt3,gt2))
coup(4:6) = coup(1:3) 
Call IntegrateSaSa(mass,m_in,r_out,coup,smin,smax,epsI,resC) 
If (resC.ne.resC) resC = 0._dp
resC = 3*resC  ! Color factor 
resS = resS + resC 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ss->Ss Fu cFu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
End Subroutine SsToSsFucFu 
 
 
End Module Ss3Decays_radinertT13A 
 
