! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 14:09 on 25.8.2016   
! ----------------------------------------------------------------------  
 
 
Module Ft03Decays_SimplifiedDMTFDM 
 
Use Control 
Use CouplingsForDecays_SimplifiedDMTFDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine Ft0ThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,              & 
& MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,             & 
& ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,gTVWp,gFt0FtccFdFu,        & 
& gFt0FtccFeFv,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFt0,MFt02,MFtc,MFtc2,MFu(3),MFu2(3),          & 
& MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),          & 
& cplFt0FtcVWpL,cplFt0FtcVWpR

Real(dp),Intent(in) :: g1,g2,g3,v

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),MTF,Mu

Real(dp),Intent(inout) :: gFt0FtccFdFu(1,1,3,3),gFt0FtccFeFv(1,1,3,3)

Real(dp),Intent(in) :: gTVWp

Real(dp) :: gFt0FtccFdFui(1,3,3),gFt0FtccFeFvi(1,3,3)

Real(dp) :: gTVWptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'Ft0ThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTVWptemp = 0._dp 
Else 
gTVWptemp = gTVWp 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 1 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 1) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,1) = ',n_in,1 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
i_run = 1 
 
Call CouplingsFor_Ft0_decays_3B(MFt0,i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFt0,           & 
& MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,cplcFdFucVWpL,      & 
& cplcFdFucVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplFt0FtcVWpL,cplFt0FtcVWpR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFt0FtccFdFui = 0._dp 
Call Ft0ToFtccFdFu(i_run,MFtc,MFd,MFu,MVWp,MFt0,cplcFdFucVWpL,cplcFdFucVWpR,          & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gFt0FtccFdFui)

gFt0FtccFdFu(i_run,:,:,:) = gFt0FtccFdFui 
gT = gT + 2._dp*Sum(gFt0FtccFdFui) 
 
gFt0FtccFeFvi = 0._dp 
Call Ft0ToFtccFeFv(i_run,MFtc,MFe,MFv,MVWp,MFt0,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gFt0FtccFeFvi)

gFt0FtccFeFv(i_run,:,:,:) = gFt0FtccFeFvi 
gT = gT + 2._dp*Sum(gFt0FtccFeFvi) 
 
If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gFt0FtccFdFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,1
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gFt0FtccFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT.Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine Ft0ThreeBodyDecay
 
 
Subroutine Ft0ToFtccFdFu(iIN,MFtc,MFd,MFu,MVWp,MFt0,cplcFdFucVWpL,cplcFdFucVWpR,      & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc,MFd(3),MFu(3),MVWp,MFt0

Complex(dp),Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplFt0FtcVWpL,cplFt0FtcVWpR

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFt0 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFt0).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFtc))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFt0FtcVWpL) 
coup(1) = Conjg(cplFt0FtcVWpR) 
coup(4) = Conjg(cplcFdFucVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFucVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Ftc cFd Fu Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



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
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MFt0)**3*g
End Subroutine Ft0ToFtccFdFu 
 
 
Subroutine Ft0ToFtccFeFv(iIN,MFtc,MFe,MFv,MVWp,MFt0,cplcFeFvcVWpL,cplcFeFvcVWpR,      & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc,MFe(3),MFv(3),MVWp,MFt0

Complex(dp),Intent(in) :: cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplFt0FtcVWpL,cplFt0FtcVWpR

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss
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
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFt0 
 
Isum = 1 
Allocate( gSum(1,3,3, Isum) ) 
Allocate( Contribution(1,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFt0).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MFtc))) Then 
!-------------- 
!  VWp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplFt0FtcVWpL) 
coup(1) = Conjg(cplFt0FtcVWpR) 
coup(4) = Conjg(cplcFeFvcVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvcVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Ftc cFe Fv Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(1,gt2,gt3,Isum)= 0._dp
Else 
gSum(1,gt2,gt3,Isum)=resD
End If 
Contribution(1,gt2,gt3,Isum)='VWp'



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
g(1,gt2,gt3)=Sum(gSum(1,gt2,gt3,1:1))
If (g(1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
  g = oo512pi3 / Abs(MFt0)**3*g
End Subroutine Ft0ToFtccFeFv 
 
 
End Module Ft03Decays_SimplifiedDMTFDM 
 
