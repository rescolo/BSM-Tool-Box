! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:04 on 13.10.2016   
! ----------------------------------------------------------------------  
 
 
Module Ft03Decays_radinertRSIII 
 
Use Control 
Use CouplingsForDecays_radinertRSIII 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine Ft0ThreeBodyDecay(n_in,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,          & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gFt0cFtcFvFe,        & 
& gFt0FvFvFt0,gFt0FecFeFt0,gFt0FtccFtcFt0,gFt0FtccFdFu,epsI,deltaM,CheckRealStates,      & 
& gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),MFe2(3),              & 
& MFt0(3),MFt02(3),MFtc(3),MFtc2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplcFeFt0cetpL(3,3),cplcFeFt0cetpR(3,3),        & 
& cplcFtcFeetIL(3,3),cplcFtcFeetIR(3,3),cplcFtcFeetRL(3,3),cplcFtcFeetRR(3,3),           & 
& cplcFtcFt0cVWpL(3,3),cplcFtcFt0cVWpR(3,3),cplcFtcFvcetpL(3,3),cplcFtcFvcetpR(3,3),     & 
& cplFt0FeetpL(3,3),cplFt0FeetpR(3,3),cplFt0FtcVWpL(3,3),cplFt0FtcVWpR(3,3),             & 
& cplFt0FvetIL(3,3),cplFt0FvetIR(3,3),cplFt0FvetRL(3,3),cplFt0FvetRR(3,3),               & 
& cplFvFeVWpL(3,3),cplFvFeVWpR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,lam5,v

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yu(3,3),Yd(3,3),Ye(3,3),Yn(3,3),MTF(3,3),mH2,mEt2

Real(dp),Intent(inout) :: gFt0cFtcFvFe(3,3,3,3),gFt0FvFvFt0(3,3,3,3),gFt0FecFeFt0(3,3,3,3),gFt0FtccFtcFt0(3,3,3,3),& 
& gFt0FtccFdFu(3,3,3,3)

Real(dp),Intent(in) :: gTetI,gTetp,gTetR,gTVWp

Real(dp) :: gFt0cFtcFvFei(3,3,3),gFt0FvFvFt0i(3,3,3),gFt0FecFeFt0i(3,3,3),gFt0FtccFtcFt0i(3,3,3), & 
& gFt0FtccFdFui(3,3,3)

Real(dp) :: gTetItemp,gTetptemp,gTetRtemp,gTVWptemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
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
gTetItemp = 0._dp 
gTetptemp = 0._dp 
gTetRtemp = 0._dp 
gTVWptemp = 0._dp 
Else 
gTetItemp = gTetI 
gTetptemp = gTetp 
gTetRtemp = gTetR 
gTVWptemp = gTVWp 
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
 
Call CouplingsFor_Ft0_decays_3B(MFt0(i_run),i_run,MAh,MAh2,MetI,MetI2,Metp,           & 
& Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,             & 
& g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,cplcFdFucVWpL,            & 
& cplcFdFucVWpR,cplcFeFt0cetpL,cplcFeFt0cetpR,cplcFtcFeetIL,cplcFtcFeetIR,               & 
& cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,cplcFtcFvcetpL,            & 
& cplcFtcFvcetpR,cplFt0FeetpL,cplFt0FeetpR,cplFt0FtcVWpL,cplFt0FtcVWpR,cplFt0FvetIL,     & 
& cplFt0FvetIR,cplFt0FvetRL,cplFt0FvetRR,cplFvFeVWpL,cplFvFeVWpR,deltaM)

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

 
gFt0cFtcFvFei = 0._dp 
Call Ft0TocFtcFvFe(i_run,MFtc,MFv,MFe,MVWp,Metp,MetI,MetR,MFt0,cplcFtcFeetIL,         & 
& cplcFtcFeetIR,cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,             & 
& cplcFtcFvcetpL,cplcFtcFvcetpR,cplFt0FeetpL,cplFt0FeetpR,cplFt0FvetIL,cplFt0FvetIR,     & 
& cplFt0FvetRL,cplFt0FvetRR,cplFvFeVWpL,cplFvFeVWpR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,           & 
& NVVss,gTVWptemp,gTetptemp,gTetItemp,gTetRtemp,deltaM,epsI,check,gFt0cFtcFvFei)

gFt0cFtcFvFe(i_run,:,:,:) = gFt0cFtcFvFei 
gT(i_run) = gT(i_run) + 2._dp*Sum(gFt0cFtcFvFei) 
 
gFt0FvFvFt0i = 0._dp 
Call Ft0ToFvFvFt0(i_run,MFv,MFt0,MetI,MetR,cplFt0FvetIL,cplFt0FvetIR,cplFt0FvetRL,    & 
& cplFt0FvetRR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTetItemp,           & 
& gTetRtemp,deltaM,epsI,check,gFt0FvFvFt0i)

gFt0FvFvFt0(i_run,:,:,:) = gFt0FvFvFt0i 
gT(i_run) = gT(i_run) + Sum(gFt0FvFvFt0i) 
 
gFt0FecFeFt0i = 0._dp 
Call Ft0ToFecFeFt0(i_run,MFe,MFt0,Metp,cplcFeFt0cetpL,cplcFeFt0cetpR,cplFt0FeetpL,    & 
& cplFt0FeetpR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,NSSst,gTetptemp,           & 
& deltaM,epsI,check,gFt0FecFeFt0i)

gFt0FecFeFt0(i_run,:,:,:) = gFt0FecFeFt0i 
gT(i_run) = gT(i_run) + Sum(gFt0FecFeFt0i) 
 
gFt0FtccFtcFt0i = 0._dp 
Call Ft0ToFtccFtcFt0(i_run,MFtc,MFt0,MVWp,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,            & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,            & 
& NVVst,gTVWptemp,deltaM,epsI,check,gFt0FtccFtcFt0i)

gFt0FtccFtcFt0(i_run,:,:,:) = gFt0FtccFtcFt0i 
gT(i_run) = gT(i_run) + Sum(gFt0FtccFtcFt0i) 
 
gFt0FtccFdFui = 0._dp 
Call Ft0ToFtccFdFu(i_run,MFtc,MFd,MFu,MVWp,MFt0,cplcFdFucVWpL,cplcFdFucVWpR,          & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,               & 
& deltaM,epsI,check,gFt0FtccFdFui)

gFt0FtccFdFu(i_run,:,:,:) = gFt0FtccFdFui 
gT(i_run) = gT(i_run) + 2._dp*Sum(gFt0FtccFdFui) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gFt0cFtcFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=gt1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFt0FvFvFt0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFt0FecFeFt0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFt0FtccFtcFt0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= 2._dp*gFt0FtccFdFu(i1,gt1,gt2,gt3)
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
 
 
Subroutine Ft0TocFtcFvFe(iIN,MFtc,MFv,MFe,MVWp,Metp,MetI,MetR,MFt0,cplcFtcFeetIL,     & 
& cplcFtcFeetIR,cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,             & 
& cplcFtcFvcetpL,cplcFtcFvcetpR,cplFt0FeetpL,cplFt0FeetpR,cplFt0FvetIL,cplFt0FvetIR,     & 
& cplFt0FvetRL,cplFt0FvetRR,cplFvFeVWpL,cplFvFeVWpR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,           & 
& NVVss,gTVWp,gTetp,gTetI,gTetR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFv(3),MFe(3),MVWp,Metp,MetI,MetR,MFt0(3)

Complex(dp),Intent(in) :: cplcFtcFeetIL(3,3),cplcFtcFeetIR(3,3),cplcFtcFeetRL(3,3),cplcFtcFeetRR(3,3),          & 
& cplcFtcFt0cVWpL(3,3),cplcFtcFt0cVWpR(3,3),cplcFtcFvcetpL(3,3),cplcFtcFvcetpR(3,3),     & 
& cplFt0FeetpL(3,3),cplFt0FeetpR(3,3),cplFt0FvetIL(3,3),cplFt0FvetIR(3,3),               & 
& cplFt0FvetRL(3,3),cplFt0FvetRR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWp,gTetp,gTetI,gTetR

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSst,NVVss
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
mass(1) = MFt0(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFt0(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  conj[VWp] 
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
 
mass(2) = MFtc(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(gt1,iIN)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(gt1,iIN)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  etp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Metp 
Boson2(2) =gTetp 
 
Boson4(1) = Metp 
Boson4(2) =gTetp 
Boson4(3) = Metp 
Boson4(4) =gTetp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt3) 
mass(3) = -MFtc(gt1) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplFt0FeetpL(iIN,gt3)) 
coup(1) = Conjg(cplFt0FeetpR(iIN,gt3)) 
coup(4) = Conjg(cplcFtcFvcetpL(gt1,gt2)) 
coup(3) = Conjg(cplcFtcFvcetpR(gt1,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etp'



!-------------- 
!  etI 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetI 
Boson2(2) =gTetI 
 
Boson4(1) = MetI 
Boson4(2) =gTetI 
Boson4(3) = MetI 
Boson4(4) =gTetI 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFtc(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFt0FvetIL(iIN,gt2)) 
coup(1) = Conjg(cplFt0FvetIR(iIN,gt2)) 
coup(4) = Conjg(cplcFtcFeetIL(gt1,gt3)) 
coup(3) = Conjg(cplcFtcFeetIR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  etR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetR 
Boson2(2) =gTetR 
 
Boson4(1) = MetR 
Boson4(2) =gTetR 
Boson4(3) = MetR 
Boson4(4) =gTetR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt2) 
mass(3) = -MFtc(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup(1) = Conjg(cplFt0FvetRR(iIN,gt2)) 
coup(4) = Conjg(cplcFtcFeetRL(gt1,gt3)) 
coup(3) = Conjg(cplcFtcFeetRR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etR'



!-------------- 
!  conj[VWp], etp 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = Metp 
Boson4(4) = gTetp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFtc(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFtcFt0cVWpL(gt1,iIN) 
coup2(2) = cplcFtcFt0cVWpR(gt1,iIN) 
coup2(3) = Conjg(cplFt0FeetpL(iIN,gt3)) 
coup2(4) = Conjg(cplFt0FeetpR(iIN,gt3))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplcFtcFvcetpL(gt1,gt2)) 
coup2(8) = Conjg(cplcFtcFvcetpR(gt1,gt2)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: conj[VWp],etp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etp'



!-------------- 
!  conj[VWp], etI 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFtc(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFtcFt0cVWpL(gt1,iIN) 
coup2(2) = cplcFtcFt0cVWpR(gt1,iIN) 
coup2(3) = Conjg(cplFt0FvetIL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetIR(iIN,gt2))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplcFtcFeetIL(gt1,gt3)) 
coup2(8) = Conjg(cplcFtcFeetIR(gt1,gt3)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: conj[VWp],etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etI'



!-------------- 
!  conj[VWp], etR 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFtc(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFtcFt0cVWpL(gt1,iIN) 
coup2(2) = cplcFtcFt0cVWpR(gt1,iIN) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt2))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplcFtcFeetRL(gt1,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt1,gt3)) 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: conj[VWp],etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etR'



!-------------- 
!  etp, etI 
!-------------- 
Boson4(1) = Metp 
Boson4(2) = gTetp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFtc(gt1) 
 
coup2(1) = cplFt0FeetpL(iIN,gt3) 
coup2(2) = cplFt0FeetpR(iIN,gt3) 
coup2(3) = Conjg(cplFt0FvetIL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetIR(iIN,gt2))  
coup2(5) = cplcFtcFvcetpL(gt1,gt2) 
coup2(6) = cplcFtcFvcetpR(gt1,gt2) 
coup2(7) = Conjg(cplcFtcFeetIL(gt1,gt3)) 
coup2(8) = Conjg(cplcFtcFeetIR(gt1,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etp,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etp,etI'



!-------------- 
!  etp, etR 
!-------------- 
Boson4(1) = Metp 
Boson4(2) = gTetp 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt3) 
mass(3) = -MFtc(gt1) 
 
coup2(1) = cplFt0FeetpL(iIN,gt3) 
coup2(2) = cplFt0FeetpR(iIN,gt3) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt2))  
coup2(5) = cplcFtcFvcetpL(gt1,gt2) 
coup2(6) = cplcFtcFvcetpR(gt1,gt2) 
coup2(7) = Conjg(cplcFtcFeetRL(gt1,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt1,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etp,etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etp,etR'



!-------------- 
!  etI, etR 
!-------------- 
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(3) = -MFtc(gt1) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt2) 
coup2(2) = cplFt0FvetIR(iIN,gt2) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt2))  
coup2(5) = cplcFtcFeetIL(gt1,gt3) 
coup2(6) = cplcFtcFeetIR(gt1,gt3) 
coup2(7) = Conjg(cplcFtcFeetRL(gt1,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt1,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->cFtc Fv Fe Propagator: etI,etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,etR'



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
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFt0(iIN))**3*g
End Subroutine Ft0TocFtcFvFe 
 
 
Subroutine Ft0ToFvFvFt0(iIN,MFv,MFt0,MetI,MetR,cplFt0FvetIL,cplFt0FvetIR,             & 
& cplFt0FvetRL,cplFt0FvetRR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,              & 
& NSSst,gTetI,gTetR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MFt0(3),MetI,MetR

Complex(dp),Intent(in) :: cplFt0FvetIL(3,3),cplFt0FvetIR(3,3),cplFt0FvetRL(3,3),cplFt0FvetRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTetI,gTetR

Integer, Intent(inout) :: NSs,NSSss,NSSst
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
mass(1) = MFt0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=gt1,3
        Do gt3=1, iIN-1
Isum = 0 
 
If(Abs(MFt0(iIN)).gt.(Abs(MFt0(gt3))+Abs(MFv(gt2))+Abs(MFv(gt1)))) Then 
!-------------- 
!  etI 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetI 
Boson2(2) =gTetI 
 
Boson4(1) = MetI 
Boson4(2) =gTetI 
Boson4(3) = MetI 
Boson4(4) =gTetI 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FvetIL(iIN,gt1)) 
coup(1) = Conjg(cplFt0FvetIR(iIN,gt1)) 
coup(4) = Conjg(cplFt0FvetIL(gt3,gt2)) 
coup(3) = Conjg(cplFt0FvetIR(gt3,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FvetIL(iIN,gt2)) 
coup(1) = Conjg(cplFt0FvetIR(iIN,gt2)) 
coup(4) = Conjg(cplFt0FvetIL(gt3,gt1)) 
coup(3) = Conjg(cplFt0FvetIR(gt3,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt2) 
coup2(2) = cplFt0FvetIR(iIN,gt2) 
coup2(3) = Conjg(cplFt0FvetIL(iIN,gt1)) 
coup2(4) = Conjg(cplFt0FvetIR(iIN,gt1))  
coup2(5) = cplFt0FvetIL(gt3,gt1) 
coup2(6) = cplFt0FvetIR(gt3,gt1) 
coup2(7) = Conjg(cplFt0FvetIL(gt3,gt2)) 
coup2(8) = Conjg(cplFt0FvetIR(gt3,gt2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fv Fv Ft0 Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  etR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetR 
Boson2(2) =gTetR 
 
Boson4(1) = MetR 
Boson4(2) =gTetR 
Boson4(3) = MetR 
Boson4(4) =gTetR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FvetRL(iIN,gt1)) 
coup(1) = Conjg(cplFt0FvetRR(iIN,gt1)) 
coup(4) = Conjg(cplFt0FvetRL(gt3,gt2)) 
coup(3) = Conjg(cplFt0FvetRR(gt3,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup(1) = Conjg(cplFt0FvetRR(iIN,gt2)) 
coup(4) = Conjg(cplFt0FvetRL(gt3,gt1)) 
coup(3) = Conjg(cplFt0FvetRR(gt3,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FvetRL(iIN,gt2) 
coup2(2) = cplFt0FvetRR(iIN,gt2) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt1)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt1))  
coup2(5) = cplFt0FvetRL(gt3,gt1) 
coup2(6) = cplFt0FvetRR(gt3,gt1) 
coup2(7) = Conjg(cplFt0FvetRL(gt3,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt3,gt2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fv Fv Ft0 Propagator: etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etR'



!-------------- 
!  etI, etR 
!-------------- 
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt1) 
coup2(2) = cplFt0FvetIR(iIN,gt1) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt1)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt1))  
coup2(5) = cplFt0FvetIL(gt3,gt2) 
coup2(6) = cplFt0FvetIR(gt3,gt2) 
coup2(7) = Conjg(cplFt0FvetRL(gt3,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt3,gt2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt1) 
mass(4) = MFv(gt2) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt2) 
coup2(2) = cplFt0FvetIR(iIN,gt2) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt1)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt1))  
coup2(5) = cplFt0FvetIL(gt3,gt1) 
coup2(6) = cplFt0FvetIR(gt3,gt1) 
coup2(7) = Conjg(cplFt0FvetRL(gt3,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt3,gt2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt1) 
mass(4) = MFt0(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt2) 
coup2(2) = cplFt0FvetIR(iIN,gt2) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt2))  
coup2(5) = cplFt0FvetIL(gt3,gt1) 
coup2(6) = cplFt0FvetIR(gt3,gt1) 
coup2(7) = Conjg(cplFt0FvetRL(gt3,gt1)) 
coup2(8) = Conjg(cplFt0FvetRR(gt3,gt1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FvetIL(iIN,gt1) 
coup2(2) = cplFt0FvetIR(iIN,gt1) 
coup2(3) = Conjg(cplFt0FvetRL(iIN,gt2)) 
coup2(4) = Conjg(cplFt0FvetRR(iIN,gt2))  
coup2(5) = cplFt0FvetIL(gt3,gt2) 
coup2(6) = cplFt0FvetIR(gt3,gt2) 
coup2(7) = Conjg(cplFt0FvetRL(gt3,gt1)) 
coup2(8) = Conjg(cplFt0FvetRR(gt3,gt1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fv Fv Ft0 Propagator: etI,etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,etR'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFt0(iIN))**3*g
End Subroutine Ft0ToFvFvFt0 
 
 
Subroutine Ft0ToFecFeFt0(iIN,MFe,MFt0,Metp,cplcFeFt0cetpL,cplcFeFt0cetpR,             & 
& cplFt0FeetpL,cplFt0FeetpR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,              & 
& NSSst,gTetp,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFt0(3),Metp

Complex(dp),Intent(in) :: cplcFeFt0cetpL(3,3),cplcFeFt0cetpR(3,3),cplFt0FeetpL(3,3),cplFt0FeetpR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTetp

Integer, Intent(inout) :: NSs,NSSss,NSSst
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
mass(1) = MFt0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1, iIN-1
Isum = 0 
 
If(Abs(MFt0(iIN)).gt.(Abs(MFt0(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
!-------------- 
!  etp 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Metp 
Boson2(2) =gTetp 
 
Boson4(1) = Metp 
Boson4(2) =gTetp 
Boson4(3) = Metp 
Boson4(4) =gTetp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FeetpL(iIN,gt1)) 
coup(1) = Conjg(cplFt0FeetpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFt0cetpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFt0cetpR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fe cFe Ft0 Propagator: etp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etp'



!-------------- 
!  conj[etp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Metp 
Boson2(2) =gTetp 
 
Boson4(1) = Metp 
Boson4(2) =gTetp 
Boson4(3) = Metp 
Boson4(4) =gTetp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt2) 
mass(3) = -MFt0(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFt0cetpL(gt2,iIN)) 
coup(1) = Conjg(cplcFeFt0cetpR(gt2,iIN)) 
coup(4) = Conjg(cplFt0FeetpL(gt3,gt1)) 
coup(3) = Conjg(cplFt0FeetpR(gt3,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fe cFe Ft0 Propagator: conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[etp]'



!-------------- 
!  etp, conj[etp] 
!-------------- 
Boson4(1) = Metp 
Boson4(2) = gTetp 
Boson4(3) = Metp 
Boson4(4) = gTetp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FeetpL(iIN,gt1) 
coup2(2) = cplFt0FeetpR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFt0cetpL(gt2,iIN)) 
coup2(4) = Conjg(cplcFeFt0cetpR(gt2,iIN))  
coup2(5) = cplcFeFt0cetpL(gt2,gt3) 
coup2(6) = cplcFeFt0cetpR(gt2,gt3) 
coup2(7) = Conjg(cplFt0FeetpL(gt3,gt1)) 
coup2(8) = Conjg(cplFt0FeetpR(gt3,gt1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Fe cFe Ft0 Propagator: etp,conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etp,conj[etp]'



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
      Do gt2=1,3
        Do gt3=1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFt0(iIN))**3*g
End Subroutine Ft0ToFecFeFt0 
 
 
Subroutine Ft0ToFtccFtcFt0(iIN,MFtc,MFt0,MVWp,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,        & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,            & 
& NVVst,gTVWp,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFt0(3),MVWp

Complex(dp),Intent(in) :: cplcFtcFt0cVWpL(3,3),cplcFtcFt0cVWpR(3,3),cplFt0FtcVWpL(3,3),cplFt0FtcVWpR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVWp

Integer, Intent(inout) :: NVs,NVVss,NVVst
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
mass(1) = MFt0(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1, iIN-1
Isum = 0 
 
If(Abs(MFt0(iIN)).gt.(Abs(MFt0(gt3))+Abs(MFtc(gt2))+Abs(MFtc(gt1)))) Then 
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
 
mass(2) = MFtc(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplFt0FtcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplFt0FtcVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcFtcFt0cVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFtcFt0cVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Ftc cFtc Ft0 Propagator: VWp" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWp'



!-------------- 
!  conj[VWp] 
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
 
mass(2) = MFtc(gt2) 
mass(3) = -MFtc(gt1) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(gt2,iIN)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(gt2,iIN)) 
coup(4) = Conjg(cplFt0FtcVWpL(gt3,gt1)) 
coup(3) = Conjg(cplFt0FtcVWpR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Ftc cFtc Ft0 Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  VWp, conj[VWp] 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFtc(gt2) 
mass(4) = MFtc(gt1) 
mass(3) = -MFt0(gt3) 
 
coup2(1) = cplFt0FtcVWpL(iIN,gt1) 
coup2(2) = cplFt0FtcVWpR(iIN,gt1) 
coup2(4) = Conjg(cplcFtcFt0cVWpL(gt2,iIN)) 
coup2(3) = Conjg(cplcFtcFt0cVWpR(gt2,iIN))  
coup2(5) = cplcFtcFt0cVWpL(gt2,gt3) 
coup2(6) = cplcFtcFt0cVWpR(gt2,gt3) 
coup2(8) = Conjg(cplFt0FtcVWpL(gt3,gt1)) 
coup2(7) = Conjg(cplFt0FtcVWpR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ft0->Ftc cFtc Ft0 Propagator: VWp,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWp,conj[VWp]'



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
      Do gt2=1,3
        Do gt3=1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFt0(iIN))**3*g
End Subroutine Ft0ToFtccFtcFt0 
 
 
Subroutine Ft0ToFtccFdFu(iIN,MFtc,MFd,MFu,MVWp,MFt0,cplcFdFucVWpL,cplcFdFucVWpR,      & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,            & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFd(3),MFu(3),MVWp,MFt0(3)

Complex(dp),Intent(in) :: cplcFdFucVWpL(3,3),cplcFdFucVWpR(3,3),cplFt0FtcVWpL(3,3),cplFt0FtcVWpR(3,3)

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
mass(1) = MFt0(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFt0(iIN)).gt.(Abs(MFu(gt3))+Abs(MFd(gt2))+Abs(MFtc(gt1)))) Then 
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
 
mass(2) = MFtc(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplFt0FtcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplFt0FtcVWpR(iIN,gt1)) 
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
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWp'



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
  g = oo512pi3 / Abs(MFt0(iIN))**3*g
End Subroutine Ft0ToFtccFdFu 
 
 
End Module Ft03Decays_radinertRSIII 
 
