! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:05 on 13.10.2016   
! ----------------------------------------------------------------------  
 
 
Module Ftc3Decays_radinertRSIII 
 
Use Control 
Use CouplingsForDecays_radinertRSIII 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FtcThreeBodyDecay(n_in,MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,          & 
& MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,           & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,g1,g2,g3,lam1,lam2,            & 
& lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,gTetI,gTetp,gTetR,gTVWp,gTVZ,gFtcFecFtcFe,   & 
& gFtcFt0FvFe,gFtcFtccFeFe,gFtcFt0cFuFd,gFtcFt0FtcFt0,gFtcFtccFdFd,gFtcFtccFtcFtc,       & 
& gFtcFtccFuFu,gFtcFtcFvFv,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,Metp,Metp2,MetR,MetR2,MFd(3),MFd2(3),MFe(3),MFe2(3),              & 
& MFt0(3),MFt02(3),MFtc(3),MFtc2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,              & 
& MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFtcetIL(3,3),& 
& cplcFeFtcetIR(3,3),cplcFeFtcetRL(3,3),cplcFeFtcetRR(3,3),cplcFtcFeetIL(3,3),           & 
& cplcFtcFeetIR(3,3),cplcFtcFeetRL(3,3),cplcFtcFeetRR(3,3),cplcFtcFt0cVWpL(3,3),         & 
& cplcFtcFt0cVWpR(3,3),cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3),cplcFtcFvcetpL(3,3),        & 
& cplcFtcFvcetpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),cplcFuFuVZL(3,3),              & 
& cplcFuFuVZR(3,3),cplFt0FeetpL(3,3),cplFt0FeetpR(3,3),cplFt0FtcVWpL(3,3),               & 
& cplFt0FtcVWpR(3,3),cplFt0FvetIL(3,3),cplFt0FvetIR(3,3),cplFt0FvetRL(3,3),              & 
& cplFt0FvetRR(3,3),cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplFvFtcetpL(3,3),cplFvFtcetpR(3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,lam5,v

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,Yu(3,3),Yd(3,3),Ye(3,3),Yn(3,3),MTF(3,3),mH2,mEt2

Real(dp),Intent(inout) :: gFtcFecFtcFe(3,3,3,3),gFtcFt0FvFe(3,3,3,3),gFtcFtccFeFe(3,3,3,3),gFtcFt0cFuFd(3,3,3,3),& 
& gFtcFt0FtcFt0(3,3,3,3),gFtcFtccFdFd(3,3,3,3),gFtcFtccFtcFtc(3,3,3,3),gFtcFtccFuFu(3,3,3,3),& 
& gFtcFtcFvFv(3,3,3,3)

Real(dp),Intent(in) :: gTetI,gTetp,gTetR,gTVWp,gTVZ

Real(dp) :: gFtcFecFtcFei(3,3,3),gFtcFt0FvFei(3,3,3),gFtcFtccFeFei(3,3,3),gFtcFt0cFuFdi(3,3,3),   & 
& gFtcFt0FtcFt0i(3,3,3),gFtcFtccFdFdi(3,3,3),gFtcFtccFtcFtci(3,3,3),gFtcFtccFuFui(3,3,3),& 
& gFtcFtcFvFvi(3,3,3)

Real(dp) :: gTetItemp,gTetptemp,gTetRtemp,gTVWptemp,gTVZtemp
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
NameOfUnit(Iname) = 'FtcThreeBodyDecay' 
 
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
gTVZtemp = 0._dp 
Else 
gTetItemp = gTetI 
gTetptemp = gTetp 
gTetRtemp = gTetR 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
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
 
Call CouplingsFor_Ftc_decays_3B(MFtc(i_run),i_run,MAh,MAh2,MetI,MetI2,Metp,           & 
& Metp2,MetR,MetR2,MFd,MFd2,MFe,MFe2,MFt0,MFt02,MFtc,MFtc2,MFu,MFu2,MFv,MFv2,            & 
& Mhh,Mhh2,MHp,MHp2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,             & 
& g1,g2,g3,lam1,lam2,lam4,lam3,lam5,Yu,Yd,Ye,Yn,MTF,mH2,mEt2,v,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFtcetIL,cplcFeFtcetIR,cplcFeFtcetRL,         & 
& cplcFeFtcetRR,cplcFtcFeetIL,cplcFtcFeetIR,cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL, & 
& cplcFtcFt0cVWpR,cplcFtcFtcVZL,cplcFtcFtcVZR,cplcFtcFvcetpL,cplcFtcFvcetpR,             & 
& cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFt0FeetpL,cplFt0FeetpR,           & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,cplFt0FvetIL,cplFt0FvetIR,cplFt0FvetRL,cplFt0FvetRR,       & 
& cplFvFeVWpL,cplFvFeVWpR,cplFvFtcetpL,cplFvFtcetpR,cplFvFvVZL,cplFvFvVZR,deltaM)

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

 
gFtcFecFtcFei = 0._dp 
Call FtcToFecFtcFe(i_run,MFe,MFtc,MetI,MetR,cplcFtcFeetIL,cplcFtcFeetIR,              & 
& cplcFtcFeetRL,cplcFtcFeetRR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,            & 
& NSSst,gTetItemp,gTetRtemp,deltaM,epsI,check,gFtcFecFtcFei)

gFtcFecFtcFe(i_run,:,:,:) = gFtcFecFtcFei 
gT(i_run) = gT(i_run) + Sum(gFtcFecFtcFei) 
 
gFtcFt0FvFei = 0._dp 
Call FtcToFt0FvFe(i_run,MFt0,MFv,MFe,MVWp,Metp,MetI,MetR,MFtc,cplcFtcFeetIL,          & 
& cplcFtcFeetIR,cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,             & 
& cplcFtcFvcetpL,cplcFtcFvcetpR,cplFt0FeetpL,cplFt0FeetpR,cplFt0FvetIL,cplFt0FvetIR,     & 
& cplFt0FvetRL,cplFt0FvetRR,cplFvFeVWpL,cplFvFeVWpR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,           & 
& NVVss,gTVWptemp,gTetptemp,gTetItemp,gTetRtemp,deltaM,epsI,check,gFtcFt0FvFei)

gFtcFt0FvFe(i_run,:,:,:) = gFtcFt0FvFei 
gT(i_run) = gT(i_run) + Sum(gFtcFt0FvFei) 
 
gFtcFtccFeFei = 0._dp 
Call FtcToFtccFeFe(i_run,MFtc,MFe,MVZ,MetI,MetR,cplcFeFeVZL,cplcFeFeVZR,              & 
& cplcFeFtcetIL,cplcFeFtcetIR,cplcFeFtcetRL,cplcFeFtcetRR,cplcFtcFeetIL,cplcFtcFeetIR,   & 
& cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFtcVZL,cplcFtcFtcVZR,IntegralSs,IntegralSSss,       & 
& IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NVs,NVSst,NVVss,gTVZtemp,               & 
& gTetItemp,gTetRtemp,deltaM,epsI,check,gFtcFtccFeFei)

gFtcFtccFeFe(i_run,:,:,:) = gFtcFtccFeFei 
gT(i_run) = gT(i_run) + Sum(gFtcFtccFeFei) 
 
gFtcFt0cFuFdi = 0._dp 
Call FtcToFt0cFuFd(i_run,MFt0,MFu,MFd,MVWp,MFtc,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,      & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,deltaM,          & 
& epsI,check,gFtcFt0cFuFdi)

gFtcFt0cFuFd(i_run,:,:,:) = gFtcFt0cFuFdi 
gT(i_run) = gT(i_run) + Sum(gFtcFt0cFuFdi) 
 
gFtcFt0FtcFt0i = 0._dp 
Call FtcToFt0FtcFt0(i_run,MFt0,MFtc,MVWp,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,             & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,            & 
& NVVst,gTVWptemp,deltaM,epsI,check,gFtcFt0FtcFt0i)

gFtcFt0FtcFt0(i_run,:,:,:) = gFtcFt0FtcFt0i 
gT(i_run) = gT(i_run) + Sum(gFtcFt0FtcFt0i) 
 
gFtcFtccFdFdi = 0._dp 
Call FtcToFtccFdFd(i_run,MFtc,MFd,MVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFtcFtcVZL,          & 
& cplcFtcFtcVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,deltaM,epsI,check,            & 
& gFtcFtccFdFdi)

gFtcFtccFdFd(i_run,:,:,:) = gFtcFtccFdFdi 
gT(i_run) = gT(i_run) + Sum(gFtcFtccFdFdi) 
 
gFtcFtccFtcFtci = 0._dp 
Call FtcToFtccFtcFtc(i_run,MFtc,MVZ,cplcFtcFtcVZL,cplcFtcFtcVZR,IntegralVs,           & 
& IntegralVVss,IntegralVVst,NVs,NVVss,NVVst,gTVZtemp,deltaM,epsI,check,gFtcFtccFtcFtci)

gFtcFtccFtcFtc(i_run,:,:,:) = gFtcFtccFtcFtci 
gT(i_run) = gT(i_run) + Sum(gFtcFtccFtcFtci) 
 
gFtcFtccFuFui = 0._dp 
Call FtcToFtccFuFu(i_run,MFtc,MFu,MVZ,cplcFtcFtcVZL,cplcFtcFtcVZR,cplcFuFuVZL,        & 
& cplcFuFuVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,deltaM,epsI,check,              & 
& gFtcFtccFuFui)

gFtcFtccFuFu(i_run,:,:,:) = gFtcFtccFuFui 
gT(i_run) = gT(i_run) + Sum(gFtcFtccFuFui) 
 
gFtcFtcFvFvi = 0._dp 
Call FtcToFtcFvFv(i_run,MFtc,MFv,MVZ,Metp,cplcFtcFtcVZL,cplcFtcFtcVZR,cplcFtcFvcetpL, & 
& cplcFtcFvcetpR,cplFvFtcetpL,cplFvFtcetpR,cplFvFvVZL,cplFvFvVZR,IntegralSs,             & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,              & 
& NSSst,NVs,NVSst,NVVss,gTVZtemp,gTetptemp,deltaM,epsI,check,gFtcFtcFvFvi)

gFtcFtcFvFv(i_run,:,:,:) = gFtcFtcFvFvi 
gT(i_run) = gT(i_run) + Sum(gFtcFtcFvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFtcFecFtcFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFtcFt0FvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFtcFtccFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFtcFt0cFuFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFtcFt0FtcFt0(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFtcFtccFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFtcFtccFtcFtc(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFtcFtccFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFtcFtcFvFv(i1,gt1,gt2,gt3)
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
 
End Subroutine FtcThreeBodyDecay
 
 
Subroutine FtcToFecFtcFe(iIN,MFe,MFtc,MetI,MetR,cplcFtcFeetIL,cplcFtcFeetIR,          & 
& cplcFtcFeetRL,cplcFtcFeetRR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,            & 
& NSSst,gTetI,gTetR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFtc(3),MetI,MetR

Complex(dp),Intent(in) :: cplcFtcFeetIL(3,3),cplcFtcFeetIR(3,3),cplcFtcFeetRL(3,3),cplcFtcFeetRR(3,3)

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
mass(1) = MFtc(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=gt1,3
Isum = 0 
 
If(Abs(MFtc(iIN)).gt.(Abs(MFe(gt3))+Abs(MFtc(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFeetIL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFeetIR(iIN,gt1)) 
coup(4) = Conjg(cplcFtcFeetIL(gt2,gt3)) 
coup(3) = Conjg(cplcFtcFeetIR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetIR(iIN,gt3)) 
coup(4) = Conjg(cplcFtcFeetIL(gt2,gt1)) 
coup(3) = Conjg(cplcFtcFeetIR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt3) 
coup2(2) = cplcFtcFeetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFtcFeetIR(iIN,gt1))  
coup2(5) = cplcFtcFeetIL(gt2,gt1) 
coup2(6) = cplcFtcFeetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFtcFeetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFtcFeetIR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Fe cFtc Fe Propagator: etI" 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFeetRL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFeetRR(iIN,gt1)) 
coup(4) = Conjg(cplcFtcFeetRL(gt2,gt3)) 
coup(3) = Conjg(cplcFtcFeetRR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetRR(iIN,gt3)) 
coup(4) = Conjg(cplcFtcFeetRL(gt2,gt1)) 
coup(3) = Conjg(cplcFtcFeetRR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFeetRL(iIN,gt3) 
coup2(2) = cplcFtcFeetRR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt1)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt1))  
coup2(5) = cplcFtcFeetRL(gt2,gt1) 
coup2(6) = cplcFtcFeetRR(gt2,gt1) 
coup2(7) = Conjg(cplcFtcFeetRL(gt2,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Fe cFtc Fe Propagator: etR" 
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
mass(2) = MFe(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt1) 
coup2(2) = cplcFtcFeetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt1)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt1))  
coup2(5) = cplcFtcFeetIL(gt2,gt3) 
coup2(6) = cplcFtcFeetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFtcFeetRL(gt2,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt2,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt3) 
coup2(2) = cplcFtcFeetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt1)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt1))  
coup2(5) = cplcFtcFeetIL(gt2,gt1) 
coup2(6) = cplcFtcFeetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFtcFeetRL(gt2,gt3)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFtc(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt3) 
coup2(2) = cplcFtcFeetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplcFtcFeetIL(gt2,gt1) 
coup2(6) = cplcFtcFeetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFtcFeetRL(gt2,gt1)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt2,gt1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt1) 
coup2(2) = cplcFtcFeetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplcFtcFeetIL(gt2,gt3) 
coup2(6) = cplcFtcFeetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFtcFeetRL(gt2,gt1)) 
coup2(8) = Conjg(cplcFtcFeetRR(gt2,gt1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Fe cFtc Fe Propagator: etI,etR" 
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
        Do gt3=gt1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFecFtcFe 
 
 
Subroutine FtcToFt0FvFe(iIN,MFt0,MFv,MFe,MVWp,Metp,MetI,MetR,MFtc,cplcFtcFeetIL,      & 
& cplcFtcFeetIR,cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,             & 
& cplcFtcFvcetpL,cplcFtcFvcetpR,cplFt0FeetpL,cplFt0FeetpR,cplFt0FvetIL,cplFt0FvetIR,     & 
& cplFt0FvetRL,cplFt0FvetRR,cplFvFeVWpL,cplFvFeVWpR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,           & 
& NVVss,gTVWp,gTetp,gTetI,gTetR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFt0(3),MFv(3),MFe(3),MVWp,Metp,MetI,MetR,MFtc(3)

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
mass(1) = MFtc(iIN) 
 
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
 
If(Abs(MFtc(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MFt0(gt1)))) Then 
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
 
mass(2) = MFt0(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(iIN,gt1)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt3)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



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
 
mass(2) = MFv(gt2) 
mass(3) = -MFt0(gt1) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFvcetpL(iIN,gt2)) 
coup(1) = Conjg(cplcFtcFvcetpR(iIN,gt2)) 
coup(4) = Conjg(cplFt0FeetpL(gt1,gt3)) 
coup(3) = Conjg(cplFt0FeetpR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[etp]'



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
 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt1) 
 
coup(2) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetIR(iIN,gt3)) 
coup(4) = Conjg(cplFt0FvetIL(gt1,gt2)) 
coup(3) = Conjg(cplFt0FvetIR(gt1,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: etI" 
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
 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt1) 
 
coup(2) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetRR(iIN,gt3)) 
coup(4) = Conjg(cplFt0FvetRL(gt1,gt2)) 
coup(3) = Conjg(cplFt0FvetRR(gt1,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etR'



!-------------- 
!  conj[VWp], conj[etp] 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = Metp 
Boson4(4) = gTetp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFt0(gt1) 
mass(3) = -MFe(gt3) 
 
coup2(1) = cplcFtcFt0cVWpL(iIN,gt1) 
coup2(2) = cplcFtcFt0cVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFvcetpL(iIN,gt2)) 
coup2(4) = Conjg(cplcFtcFvcetpR(iIN,gt2))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFt0FeetpL(gt1,gt3)) 
coup2(8) = Conjg(cplFt0FeetpR(gt1,gt3)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[VWp],conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],conj[etp]'



!-------------- 
!  conj[VWp], etI 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFt0(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFtcFt0cVWpL(iIN,gt1) 
coup2(2) = cplcFtcFt0cVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetIR(iIN,gt3))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFt0FvetIL(gt1,gt2)) 
coup2(8) = Conjg(cplFt0FvetIR(gt1,gt2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[VWp],etI" 
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
mass(2) = MFe(gt3) 
mass(4) = MFt0(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFtcFt0cVWpL(iIN,gt1) 
coup2(2) = cplcFtcFt0cVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplFvFeVWpL(gt2,gt3) 
coup2(6) = cplFvFeVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFt0FvetRL(gt1,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt1,gt2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[VWp],etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etR'



!-------------- 
!  conj[etp], etI 
!-------------- 
Boson4(1) = Metp 
Boson4(2) = gTetp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFt0(gt1) 
 
coup2(1) = cplcFtcFvcetpL(iIN,gt2) 
coup2(2) = cplcFtcFvcetpR(iIN,gt2) 
coup2(3) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetIR(iIN,gt3))  
coup2(5) = cplFt0FeetpL(gt1,gt3) 
coup2(6) = cplFt0FeetpR(gt1,gt3) 
coup2(7) = Conjg(cplFt0FvetIL(gt1,gt2)) 
coup2(8) = Conjg(cplFt0FvetIR(gt1,gt2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[etp],etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[etp],etI'



!-------------- 
!  conj[etp], etR 
!-------------- 
Boson4(1) = Metp 
Boson4(2) = gTetp 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFv(gt2) 
mass(3) = -MFt0(gt1) 
 
coup2(1) = cplcFtcFvcetpL(iIN,gt2) 
coup2(2) = cplcFtcFvcetpR(iIN,gt2) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplFt0FeetpL(gt1,gt3) 
coup2(6) = cplFt0FeetpR(gt1,gt3) 
coup2(7) = Conjg(cplFt0FvetRL(gt1,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt1,gt2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: conj[etp],etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[etp],etR'



!-------------- 
!  etI, etR 
!-------------- 
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFt0(gt1) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt3) 
coup2(2) = cplcFtcFeetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplFt0FvetIL(gt1,gt2) 
coup2(6) = cplFt0FvetIR(gt1,gt2) 
coup2(7) = Conjg(cplFt0FvetRL(gt1,gt2)) 
coup2(8) = Conjg(cplFt0FvetRR(gt1,gt2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Fv Fe Propagator: etI,etR" 
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
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFt0FvFe 
 
 
Subroutine FtcToFtccFeFe(iIN,MFtc,MFe,MVZ,MetI,MetR,cplcFeFeVZL,cplcFeFeVZR,          & 
& cplcFeFtcetIL,cplcFeFtcetIR,cplcFeFtcetRL,cplcFeFtcetRR,cplcFtcFeetIL,cplcFtcFeetIR,   & 
& cplcFtcFeetRL,cplcFtcFeetRR,cplcFtcFtcVZL,cplcFtcFtcVZR,IntegralSs,IntegralSSss,       & 
& IntegralVs,IntegralVSst,IntegralVVss,NSs,NSSss,NVs,NVSst,NVVss,gTVZ,gTetI,             & 
& gTetR,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFe(3),MVZ,MetI,MetR

Complex(dp),Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFtcetIL(3,3),cplcFeFtcetIR(3,3),              & 
& cplcFeFtcetRL(3,3),cplcFeFtcetRR(3,3),cplcFtcFeetIL(3,3),cplcFtcFeetIR(3,3),           & 
& cplcFtcFeetRL(3,3),cplcFtcFeetRR(3,3),cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTetI,gTetR

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSst,NVVss
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
mass(1) = MFtc(iIN) 
 
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
 
If(Abs(MFtc(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFtc(gt1) 
 
coup(2) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetIR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFtcetIL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFtcetIR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: etI" 
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
 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFtc(gt1) 
 
coup(2) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFeetRR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFtcetRL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFtcetRR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etR'



!-------------- 
!  VZ, etI 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFtc(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt1) 
coup2(2) = cplcFtcFtcVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetIL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetIR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFtcetIL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFtcetIR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: VZ,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etI'



!-------------- 
!  VZ, etR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(4) = MFtc(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt1) 
coup2(2) = cplcFtcFtcVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFtcetRL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFtcetRR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: VZ,etR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etR'



!-------------- 
!  etI, etR 
!-------------- 
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MetR 
Boson4(4) = gTetR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFtc(gt1) 
 
coup2(1) = cplcFtcFeetIL(iIN,gt3) 
coup2(2) = cplcFtcFeetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFeetRL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFeetRR(iIN,gt3))  
coup2(5) = cplcFeFtcetIL(gt2,gt1) 
coup2(6) = cplcFeFtcetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFtcetRL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFtcetRR(gt2,gt1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFe Fe Propagator: etI,etR" 
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
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFtccFeFe 
 
 
Subroutine FtcToFt0cFuFd(iIN,MFt0,MFu,MFd,MVWp,MFtc,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,  & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFt0(3),MFu(3),MFd(3),MVWp,MFtc(3)

Complex(dp),Intent(in) :: cplcFtcFt0cVWpL(3,3),cplcFtcFt0cVWpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3)

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
mass(1) = MFtc(iIN) 
 
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
 
If(Abs(MFtc(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MFt0(gt1)))) Then 
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
 
mass(2) = MFt0(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 cFu Fd Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



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
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFt0cFuFd 
 
 
Subroutine FtcToFt0FtcFt0(iIN,MFt0,MFtc,MVWp,cplcFtcFt0cVWpL,cplcFtcFt0cVWpR,         & 
& cplFt0FtcVWpL,cplFt0FtcVWpR,IntegralVs,IntegralVVss,IntegralVVst,NVs,NVVss,            & 
& NVVst,gTVWp,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFt0(3),MFtc(3),MVWp

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
mass(1) = MFtc(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1, iIN-1
        Do gt3=gt1,3
Isum = 0 
 
If(Abs(MFtc(iIN)).gt.(Abs(MFt0(gt3))+Abs(MFtc(gt2))+Abs(MFt0(gt1)))) Then 
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
 
mass(2) = MFt0(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFt0(gt3) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(iIN,gt1)) 
coup(4) = Conjg(cplFt0FtcVWpL(gt3,gt2)) 
coup(3) = Conjg(cplFt0FtcVWpR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFt0(gt3) 
mass(3) = -MFtc(gt2) 
mass(4) = MFt0(gt1) 
 
coup(2) = Conjg(cplcFtcFt0cVWpL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFt0cVWpR(iIN,gt3)) 
coup(4) = Conjg(cplFt0FtcVWpL(gt1,gt2)) 
coup(3) = Conjg(cplFt0FtcVWpR(gt1,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFt0(gt1) 
mass(4) = MFt0(gt3) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFt0cVWpL(iIN,gt3) 
coup2(2) = cplcFtcFt0cVWpR(iIN,gt3) 
coup2(4) = Conjg(cplcFtcFt0cVWpL(iIN,gt1)) 
coup2(3) = Conjg(cplcFtcFt0cVWpR(iIN,gt1))  
coup2(5) = cplFt0FtcVWpL(gt1,gt2) 
coup2(6) = cplFt0FtcVWpR(gt1,gt2) 
coup2(8) = Conjg(cplFt0FtcVWpL(gt3,gt2)) 
coup2(7) = Conjg(cplFt0FtcVWpR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ft0 Ftc Ft0 Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



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
      Do gt2=1, iIN-1
        Do gt3=gt1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFt0FtcFt0 
 
 
Subroutine FtcToFtccFdFd(iIN,MFtc,MFd,MVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFtcFtcVZL,      & 
& cplcFtcFtcVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,deltaM,epsI,check,g,              & 
& WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFd(3),MVZ

Complex(dp),Intent(in) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ

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
mass(1) = MFtc(iIN) 
 
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
 
If(Abs(MFtc(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFtccFdFd 
 
 
Subroutine FtcToFtccFtcFtc(iIN,MFtc,MVZ,cplcFtcFtcVZL,cplcFtcFtcVZR,IntegralVs,       & 
& IntegralVVss,IntegralVVst,NVs,NVVss,NVVst,gTVZ,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MVZ

Complex(dp),Intent(in) :: cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ

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
mass(1) = MFtc(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFtc(iIN)).gt.(Abs(MFtc(gt3))+Abs(MFtc(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc(gt1) 
mass(3) = -MFtc(gt2) 
mass(4) = MFtc(gt3) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFtcFtcVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFtcFtcVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFtc(gt3) 
mass(3) = -MFtc(gt2) 
mass(4) = MFtc(gt1) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFtcFtcVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFtcFtcVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFtc(gt1) 
mass(4) = MFtc(gt3) 
mass(3) = -MFtc(gt2) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt3) 
coup2(2) = cplcFtcFtcVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFtcFtcVZR(iIN,gt1))  
coup2(5) = cplcFtcFtcVZL(gt2,gt1) 
coup2(6) = cplcFtcFtcVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFtcFtcVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFtcFtcVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFtc Ftc Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFtccFtcFtc 
 
 
Subroutine FtcToFtccFuFu(iIN,MFtc,MFu,MVZ,cplcFtcFtcVZL,cplcFtcFtcVZR,cplcFuFuVZL,    & 
& cplcFuFuVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFu(3),MVZ

Complex(dp),Intent(in) :: cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ

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
mass(1) = MFtc(iIN) 
 
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
 
If(Abs(MFtc(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFtccFuFu 
 
 
Subroutine FtcToFtcFvFv(iIN,MFtc,MFv,MVZ,Metp,cplcFtcFtcVZL,cplcFtcFtcVZR,            & 
& cplcFtcFvcetpL,cplcFtcFvcetpR,cplFvFtcetpL,cplFvFtcetpR,cplFvFvVZL,cplFvFvVZR,         & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSst,IntegralVVss,             & 
& NSs,NSSss,NSSst,NVs,NVSst,NVVss,gTVZ,gTetp,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFtc(3),MFv(3),MVZ,Metp

Complex(dp),Intent(in) :: cplcFtcFtcVZL(3,3),cplcFtcFtcVZR(3,3),cplcFtcFvcetpL(3,3),cplcFtcFvcetpR(3,3),        & 
& cplFvFtcetpL(3,3),cplFvFtcetpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTetp

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
mass(1) = MFtc(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MFtc(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFtc(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFtc(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFtcFtcVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFtc(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt1) 
coup2(2) = cplcFtcFtcVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFtcFtcVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFtcFtcVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFtc(gt1) 
 
coup(2) = Conjg(cplcFtcFvcetpL(iIN,gt2)) 
coup(1) = Conjg(cplcFtcFvcetpR(iIN,gt2)) 
coup(4) = Conjg(cplFvFtcetpL(gt3,gt1)) 
coup(3) = Conjg(cplFvFtcetpR(gt3,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFtc(gt1) 
 
coup(2) = Conjg(cplcFtcFvcetpL(iIN,gt3)) 
coup(1) = Conjg(cplcFtcFvcetpR(iIN,gt3)) 
coup(4) = Conjg(cplFvFtcetpL(gt2,gt1)) 
coup(3) = Conjg(cplFvFtcetpR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFtc(gt1) 
 
coup2(1) = cplcFtcFvcetpL(iIN,gt3) 
coup2(2) = cplcFtcFvcetpR(iIN,gt3) 
coup2(3) = Conjg(cplcFtcFvcetpL(iIN,gt2)) 
coup2(4) = Conjg(cplcFtcFvcetpR(iIN,gt2))  
coup2(5) = cplFvFtcetpL(gt2,gt1) 
coup2(6) = cplFvFtcetpR(gt2,gt1) 
coup2(7) = Conjg(cplFvFtcetpL(gt3,gt1)) 
coup2(8) = Conjg(cplFvFtcetpR(gt3,gt1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc Fv Fv Propagator: conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[etp]'



!-------------- 
!  VZ, conj[etp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Metp 
Boson4(4) = gTetp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFtc(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt1) 
coup2(2) = cplcFtcFtcVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFvcetpL(iIN,gt2)) 
coup2(4) = Conjg(cplcFtcFvcetpR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFtcetpL(gt3,gt1)) 
coup2(8) = Conjg(cplFvFtcetpR(gt3,gt1)) 
coupT = coup2(2) 
coup2(2) = coup2(1) 
coup2(1) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFtc(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFtcFtcVZL(iIN,gt1) 
coup2(2) = cplcFtcFtcVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFtcFvcetpL(iIN,gt3)) 
coup2(4) = Conjg(cplcFtcFvcetpR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFtcetpL(gt2,gt1)) 
coup2(8) = Conjg(cplFvFtcetpR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Ftc->Ftc Fv Fv Propagator: VZ,conj[etp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[etp]'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFtc(iIN))**3*g
End Subroutine FtcToFtcFvFv 
 
 
End Module Ftc3Decays_radinertRSIII 
 
