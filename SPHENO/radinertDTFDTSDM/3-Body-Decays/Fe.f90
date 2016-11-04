! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:33 on 3.11.2016   
! ----------------------------------------------------------------------  
 
 
Module Fe3Decays_radinertDTFDTSDM 
 
Use Control 
Use CouplingsForDecays_radinertDTFDTSDM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FeThreeBodyDecay(n_in,MAh,MAh2,MChi,MChi2,MetI,MetI2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,MVWp2,MVZ,MVZ2,             & 
& MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,ZX0,ZXP,ZZ,g1,              & 
& g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,              & 
& MDF,mu,mH2,mEt2,mu3,v,gTetI,gThh,gTVWp,gTVZ,gTXO,gTXP,gFeFecChiChi,gFeFvcChiNv,        & 
& gFecChicFecChi,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeNvNv,gFeFeFvFv,gFeFvcFuFd,        & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MChi(2),MChi2(2),MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),            & 
& MFu2(3),MFv(3),MFv2(3),Mhh,Mhh2,MHp,MHp2,MNv(3),MNv2(3),MVWp,MVWp2,MVZ,MVZ2,           & 
& MXO(2),MXO2(2),MXP(2),MXP2(2),TW,ZZ(2,2)

Complex(dp),Intent(in) :: O(3,3),Q2(2,2),Q3(2,2),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),         & 
& Vv(3,3),ZW(2,2),ZX0(2,2),ZXP(2,2)

Complex(dp) :: cplcChicFeetIL(2,3),cplcChicFeetIR(2,3),cplcChicFeXOL(2,3,2),cplcChicFeXOR(2,3,2),    & 
& cplcChiChihhL(2,2),cplcChiChihhR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),           & 
& cplcChiFvXPL(2,3,2),cplcChiFvXPR(2,3,2),cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3),         & 
& cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3),  & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),& 
& cplcFeNvcXPL(3,3,2),cplcFeNvcXPR(3,3,2),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3),           & 
& cplcFuFuhhL(3,3),cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplChiFeetIL(2,3), & 
& cplChiFeetIR(2,3),cplChiFeXOL(2,3,2),cplChiFeXOR(2,3,2),cplFvFeVWpL(3,3),              & 
& cplFvFeVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplFvNvetIL(3,3),cplFvNvetIR(3,3),    & 
& cplFvNvXOL(3,3,2),cplFvNvXOR(3,3,2),cplNvFeXPL(3,3,2),cplNvFeXPR(3,3,2),               & 
& cplNvNvhhL(3,3),cplNvNvhhR(3,3),cplNvNvVZL(3,3),cplNvNvVZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Real(dp),Intent(inout) :: gFeFecChiChi(3,3,2,2),gFeFvcChiNv(3,3,2,3),gFecChicFecChi(3,2,3,2),gFeFecFdFd(3,3,3,3),& 
& gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),gFeFeNvNv(3,3,3,3),gFeFeFvFv(3,3,3,3),         & 
& gFeFvcFuFd(3,3,3,3)

Real(dp),Intent(in) :: gTetI,gThh,gTVWp,gTVZ,gTXO(2),gTXP(2)

Real(dp) :: gFeFecChiChii(3,2,2),gFeFvcChiNvi(3,2,3),gFecChicFecChii(2,3,2),gFeFecFdFdi(3,3,3),   & 
& gFeFecFeFei(3,3,3),gFeFecFuFui(3,3,3),gFeFeNvNvi(3,3,3),gFeFeFvFvi(3,3,3),             & 
& gFeFvcFuFdi(3,3,3)

Real(dp) :: gTetItemp,gThhtemp,gTVWptemp,gTVZtemp,gTXOtemp(2),gTXPtemp(2)
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
NameOfUnit(Iname) = 'FeThreeBodyDecay' 
 
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
gThhtemp = 0._dp 
gTVWptemp = 0._dp 
gTVZtemp = 0._dp 
gTXOtemp = 0._dp 
gTXPtemp = 0._dp 
Else 
gTetItemp = gTetI 
gThhtemp = gThh 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
gTXOtemp = gTXO 
gTXPtemp = gTXP 
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
 
Call CouplingsFor_Fe_decays_3B(MFe(i_run),i_run,MAh,MAh2,MChi,MChi2,MetI,             & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHp,MHp2,MNv,MNv2,MVWp,             & 
& MVWp2,MVZ,MVZ2,MXO,MXO2,MXP,MXP2,O,Q2,Q3,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,Vv,ZW,             & 
& ZX0,ZXP,ZZ,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,Yu,Yd,Ye,eta,              & 
& A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,cplcChicFeetIL,cplcChicFeetIR,cplcChicFeXOL,       & 
& cplcChicFeXOR,cplcChiChihhL,cplcChiChihhR,cplcChiChiVZL,cplcChiChiVZR,cplcChiFvXPL,    & 
& cplcChiFvXPR,cplcChiNvVWpL,cplcChiNvVWpR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,             & 
& cplcFeFvcVWpR,cplcFeNvcXPL,cplcFeNvcXPR,cplcFuFdVWpL,cplcFuFdVWpR,cplcFuFuhhL,         & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplChiFeetIL,cplChiFeetIR,cplChiFeXOL,             & 
& cplChiFeXOR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,cplFvNvetIL,cplFvNvetIR,     & 
& cplFvNvXOL,cplFvNvXOR,cplNvFeXPL,cplNvFeXPR,cplNvNvhhL,cplNvNvhhR,cplNvNvVZL,          & 
& cplNvNvVZR,deltaM)

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

 
gFeFecChiChii = 0._dp 
Call FeToFecChiChi(i_run,MFe,MChi,MVZ,MetI,Mhh,MXO,cplcChicFeetIL,cplcChicFeetIR,     & 
& cplcChicFeXOL,cplcChicFeXOR,cplcChiChihhL,cplcChiChihhR,cplcChiChiVZL,cplcChiChiVZR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplChiFeetIL,cplChiFeetIR,             & 
& cplChiFeXOL,cplChiFeXOR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,               & 
& IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& gTVZtemp,gTetItemp,gThhtemp,gTXOtemp,deltaM,epsI,check,gFeFecChiChii)

gFeFecChiChi(i_run,:,:,:) = gFeFecChiChii 
gT(i_run) = gT(i_run) + Sum(gFeFecChiChii) 
 
gFeFvcChiNvi = 0._dp 
Call FeToFvcChiNv(i_run,MFv,MChi,MNv,MVWp,MXP,MetI,MXO,MFe,cplcChicFeetIL,            & 
& cplcChicFeetIR,cplcChicFeXOL,cplcChicFeXOR,cplcChiFvXPL,cplcChiFvXPR,cplcChiNvVWpL,    & 
& cplcChiNvVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFeNvcXPL,cplcFeNvcXPR,cplFvNvetIL,       & 
& cplFvNvetIR,cplFvNvXOL,cplFvNvXOR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,     & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,NVVss,gTVWptemp,gTXPtemp,          & 
& gTetItemp,gTXOtemp,deltaM,epsI,check,gFeFvcChiNvi)

gFeFvcChiNv(i_run,:,:,:) = gFeFvcChiNvi 
gT(i_run) = gT(i_run) + Sum(gFeFvcChiNvi) 
 
gFecChicFecChii = 0._dp 
Call FeTocChicFecChi(i_run,MChi,MFe,MetI,MXO,cplcChicFeetIL,cplcChicFeetIR,           & 
& cplcChicFeXOL,cplcChicFeXOR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,            & 
& NSSst,gTetItemp,gTXOtemp,deltaM,epsI,check,gFecChicFecChii)

gFecChicFecChi(i_run,:,:,:) = gFecChicFecChii 
gT(i_run) = gT(i_run) + Sum(gFecChicFecChii) 
 
gFeFecFdFdi = 0._dp 
Call FeToFecFdFd(i_run,MFe,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,               & 
& gThhtemp,deltaM,epsI,check,gFeFecFdFdi)

gFeFecFdFd(i_run,:,:,:) = gFeFecFdFdi 
gT(i_run) = gT(i_run) + Sum(gFeFecFdFdi) 
 
gFeFecFeFei = 0._dp 
Call FeToFecFeFe(i_run,MFe,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,              & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZtemp,gThhtemp,deltaM,epsI,check,gFeFecFeFei)

gFeFecFeFe(i_run,:,:,:) = gFeFecFeFei 
gT(i_run) = gT(i_run) + Sum(gFeFecFeFei) 
 
gFeFecFuFui = 0._dp 
Call FeToFecFuFu(i_run,MFe,MFu,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,               & 
& gThhtemp,deltaM,epsI,check,gFeFecFuFui)

gFeFecFuFu(i_run,:,:,:) = gFeFecFuFui 
gT(i_run) = gT(i_run) + Sum(gFeFecFuFui) 
 
gFeFeNvNvi = 0._dp 
Call FeToFeNvNv(i_run,MFe,MNv,MVZ,MXP,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,        & 
& cplcFeFeVZR,cplcFeNvcXPL,cplcFeNvcXPR,cplNvFeXPL,cplNvFeXPR,cplNvNvhhL,cplNvNvhhR,     & 
& cplNvNvVZL,cplNvNvVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,    & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZtemp,              & 
& gTXPtemp,gThhtemp,deltaM,epsI,check,gFeFeNvNvi)

gFeFeNvNv(i_run,:,:,:) = gFeFeNvNvi 
gT(i_run) = gT(i_run) + Sum(gFeFeNvNvi) 
 
gFeFeFvFvi = 0._dp 
Call FeToFeFvFv(i_run,MFe,MFv,MVZ,MVWp,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,         & 
& cplcFeFvcVWpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,IntegralVs,IntegralVVss,   & 
& IntegralVVst,NVs,NVVss,NVVst,gTVZtemp,gTVWptemp,deltaM,epsI,check,gFeFeFvFvi)

gFeFeFvFv(i_run,:,:,:) = gFeFeFvFvi 
gT(i_run) = gT(i_run) + Sum(gFeFeFvFvi) 
 
gFeFvcFuFdi = 0._dp 
Call FeToFvcFuFd(i_run,MFv,MFu,MFd,MVWp,MFe,cplcFeFvcVWpL,cplcFeFvcVWpR,              & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWptemp,deltaM,          & 
& epsI,check,gFeFvcFuFdi)

gFeFvcFuFd(i_run,:,:,:) = gFeFvcFuFdi 
gT(i_run) = gT(i_run) + Sum(gFeFvcFuFdi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,2
gPartial(i1,n_length)= gFeFecChiChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,2
    Do gt3=1,3
gPartial(i1,n_length)= gFeFvcChiNv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=gt1,2
gPartial(i1,n_length)= gFecChicFecChi(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFeFecFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFecFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFeFeNvNv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFeFeFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFeFvcFuFd(i1,gt1,gt2,gt3)
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
 
End Subroutine FeThreeBodyDecay
 
 
Subroutine FeToFecChiChi(iIN,MFe,MChi,MVZ,MetI,Mhh,MXO,cplcChicFeetIL,cplcChicFeetIR, & 
& cplcChicFeXOL,cplcChicFeXOR,cplcChiChihhL,cplcChiChihhR,cplcChiChiVZL,cplcChiChiVZR,   & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplChiFeetIL,cplChiFeetIR,             & 
& cplChiFeXOL,cplChiFeXOR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,               & 
& IntegralVSss,IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& gTVZ,gTetI,gThh,gTXO,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MChi(2),MVZ,MetI,Mhh,MXO(2)

Complex(dp),Intent(in) :: cplcChicFeetIL(2,3),cplcChicFeetIR(2,3),cplcChicFeXOL(2,3,2),cplcChicFeXOR(2,3,2),    & 
& cplcChiChihhL(2,2),cplcChiChihhR(2,2),cplcChiChiVZL(2,2),cplcChiChiVZR(2,2),           & 
& cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplChiFeetIL(2,3), & 
& cplChiFeetIR(2,3),cplChiFeXOL(2,3,2),cplChiFeXOR(2,3,2)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTetI,gThh,gTXO(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
mass(1) = MFe(iIN) 
 
Isum = 25 
Allocate( gSum(3,2,2, Isum) ) 
Allocate( Contribution(3,2,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,2
        Do gt3=1,2
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MChi(gt3))+Abs(MChi(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcChiChiVZL(gt2,gt3)) 
coup(3) = Conjg(cplcChiChiVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: VZ" 
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
 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChicFeetIL(gt2,iIN)) 
coup(1) = Conjg(cplcChicFeetIR(gt2,iIN)) 
coup(4) = Conjg(cplChiFeetIL(gt3,gt1)) 
coup(3) = Conjg(cplChiFeetIR(gt3,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1)) 
coup(4) = Conjg(cplcChiChihhL(gt2,gt3)) 
coup(3) = Conjg(cplcChiChihhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  XO 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MXO(i1) 
Boson2(2) =gTXO(i1) 
 
Boson4(1) = MXO(i1) 
Boson4(2) =gTXO(i1) 
Boson4(3) = MXO(i1) 
Boson4(4) =gTXO(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChicFeXOL(gt2,iIN,i1)) 
coup(1) = Conjg(cplcChicFeXOR(gt2,iIN,i1)) 
coup(4) = Conjg(cplChiFeXOL(gt3,gt1,i1)) 
coup(3) = Conjg(cplChiFeXOR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='XO'
      End Do 



!-------------- 
!  VZ, etI 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChicFeetIL(gt2,iIN)) 
coup2(4) = Conjg(cplcChicFeetIR(gt2,iIN))  
coup2(5) = cplcChiChiVZL(gt2,gt3) 
coup2(6) = cplcChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplChiFeetIL(gt3,gt1)) 
coup2(8) = Conjg(cplChiFeetIR(gt3,gt1)) 
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
Write(*,*) "Fe->Fe cChi Chi Propagator: VZ,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etI'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcChiChiVZL(gt2,gt3) 
coup2(6) = cplcChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplcChiChihhL(gt2,gt3)) 
coup2(8) = Conjg(cplcChiChihhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



!-------------- 
!  VZ, XO 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplcChiChiVZL(gt2,gt3) 
coup2(6) = cplcChiChiVZR(gt2,gt3) 
coup2(7) = Conjg(cplChiFeXOL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplChiFeXOR(gt3,gt1,i2)) 
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
Write(*,*) "Fe->Fe cChi Chi Propagator: VZ,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,XO'
      End Do 



!-------------- 
!  etI, hh 
!-------------- 
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MChi(gt2) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcChicFeetIL(gt2,iIN) 
coup2(2) = cplcChicFeetIR(gt2,iIN) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplChiFeetIL(gt3,gt1) 
coup2(6) = cplChiFeetIR(gt3,gt1) 
coup2(7) = Conjg(cplcChiChihhL(gt2,gt3)) 
coup2(8) = Conjg(cplcChiChihhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: etI,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,hh'



!-------------- 
!  etI, XO 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChicFeetIL(gt2,iIN) 
coup2(2) = cplcChicFeetIR(gt2,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplChiFeetIL(gt3,gt1) 
coup2(6) = cplChiFeetIR(gt3,gt1) 
coup2(7) = Conjg(cplChiFeXOL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplChiFeXOR(gt3,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: etI,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,XO'
      End Do 



!-------------- 
!  hh, XO 
!-------------- 
  Do i2=1,2
Boson4(1) = Mhh 
Boson4(2) = gThh 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1) 
coup2(2) = cplcFeFehhR(iIN,gt1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplcChiChihhL(gt2,gt3) 
coup2(6) = cplcChiChihhR(gt2,gt3) 
coup2(7) = Conjg(cplChiFeXOL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplChiFeXOR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: hh,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,XO'
      End Do 



!-------------- 
!  XO, XO 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MXO(i1) 
Boson4(2) = gTXO(i1) 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MFe(gt1) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChicFeXOL(gt2,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt2,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplChiFeXOL(gt3,gt1,i1) 
coup2(6) = cplChiFeXOR(gt3,gt1,i1) 
coup2(7) = Conjg(cplChiFeXOL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplChiFeXOR(gt3,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cChi Chi Propagator: XO,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='XO,XO'
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
      Do gt2=1,2
        Do gt3=1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:25))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecChiChi 
 
 
Subroutine FeToFvcChiNv(iIN,MFv,MChi,MNv,MVWp,MXP,MetI,MXO,MFe,cplcChicFeetIL,        & 
& cplcChicFeetIR,cplcChicFeXOL,cplcChicFeXOR,cplcChiFvXPL,cplcChiFvXPR,cplcChiNvVWpL,    & 
& cplcChiNvVWpR,cplcFeFvcVWpL,cplcFeFvcVWpR,cplcFeNvcXPL,cplcFeNvcXPR,cplFvNvetIL,       & 
& cplFvNvetIR,cplFvNvXOL,cplFvNvXOR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,     & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSst,NVVss,gTVWp,gTXP,gTetI,            & 
& gTXO,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MChi(2),MNv(3),MVWp,MXP(2),MetI,MXO(2),MFe(3)

Complex(dp),Intent(in) :: cplcChicFeetIL(2,3),cplcChicFeetIR(2,3),cplcChicFeXOL(2,3,2),cplcChicFeXOR(2,3,2),    & 
& cplcChiFvXPL(2,3,2),cplcChiFvXPR(2,3,2),cplcChiNvVWpL(2,3),cplcChiNvVWpR(2,3),         & 
& cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFeNvcXPL(3,3,2),cplcFeNvcXPR(3,3,2),         & 
& cplFvNvetIL(3,3),cplFvNvetIR(3,3),cplFvNvXOL(3,3,2),cplFvNvXOR(3,3,2)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVWp,gTXP(2),gTetI,gTXO(2)

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
mass(1) = MFe(iIN) 
 
Isum = 36 
Allocate( gSum(3,2,3, Isum) ) 
Allocate( Contribution(3,2,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,2
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MNv(gt3))+Abs(MChi(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MChi(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcChiNvVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcChiNvVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  conj[XP] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MXP(i1) 
Boson2(2) =gTXP(i1) 
 
Boson4(1) = MXP(i1) 
Boson4(2) =gTXP(i1) 
Boson4(3) = MXP(i1) 
Boson4(4) =gTXP(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplcFeNvcXPL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeNvcXPR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcChiFvXPL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcChiFvXPR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP]'
      End Do 



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
 
mass(2) = MChi(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplcChicFeetIL(gt2,iIN)) 
coup(1) = Conjg(cplcChicFeetIR(gt2,iIN)) 
coup(4) = Conjg(cplFvNvetIL(gt1,gt3)) 
coup(3) = Conjg(cplFvNvetIR(gt1,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  XO 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MXO(i1) 
Boson2(2) =gTXO(i1) 
 
Boson4(1) = MXO(i1) 
Boson4(2) =gTXO(i1) 
Boson4(3) = MXO(i1) 
Boson4(4) =gTXO(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFv(gt1) 
 
coup(2) = Conjg(cplcChicFeXOL(gt2,iIN,i1)) 
coup(1) = Conjg(cplcChicFeXOR(gt2,iIN,i1)) 
coup(4) = Conjg(cplFvNvXOL(gt1,gt3,i1)) 
coup(3) = Conjg(cplFvNvXOR(gt1,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='XO'
      End Do 



!-------------- 
!  conj[VWp], conj[XP] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MXP(i2) 
Boson4(4) = gTXP(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv(gt3) 
mass(4) = MFv(gt1) 
mass(3) = -MChi(gt2) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt1) 
coup2(2) = cplcFeFvcVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt3,i2))  
coup2(5) = cplcChiNvVWpL(gt2,gt3) 
coup2(6) = cplcChiNvVWpR(gt2,gt3) 
coup2(7) = Conjg(cplcChiFvXPL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcChiFvXPR(gt2,gt1,i2)) 
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
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[VWp],conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],conj[XP]'
      End Do 



!-------------- 
!  conj[VWp], etI 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MNv(gt3) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt1) 
coup2(2) = cplcFeFvcVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcChicFeetIL(gt2,iIN)) 
coup2(4) = Conjg(cplcChicFeetIR(gt2,iIN))  
coup2(5) = cplcChiNvVWpL(gt2,gt3) 
coup2(6) = cplcChiNvVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFvNvetIL(gt1,gt3)) 
coup2(8) = Conjg(cplFvNvetIR(gt1,gt3)) 
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
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[VWp],etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etI'



!-------------- 
!  conj[VWp], XO 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MFv(gt1) 
mass(3) = -MNv(gt3) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt1) 
coup2(2) = cplcFeFvcVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplcChiNvVWpL(gt2,gt3) 
coup2(6) = cplcChiNvVWpR(gt2,gt3) 
coup2(7) = Conjg(cplFvNvXOL(gt1,gt3,i2)) 
coup2(8) = Conjg(cplFvNvXOR(gt1,gt3,i2)) 
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
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[VWp],XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],XO'
      End Do 



!-------------- 
!  conj[XP], conj[XP] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MXP(i1) 
Boson4(2) = gTXP(i1) 
Boson4(3) = MXP(i2) 
Boson4(4) = gTXP(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv(gt3) 
mass(3) = -MChi(gt2) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt3,i2))  
coup2(5) = cplcChiFvXPL(gt2,gt1,i1) 
coup2(6) = cplcChiFvXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcChiFvXPL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcChiFvXPR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[XP],conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP],conj[XP]'
        End Do 
      End Do 



!-------------- 
!  conj[XP], etI 
!-------------- 
Do i1=1,2
Boson4(1) = MXP(i1) 
Boson4(2) = gTXP(i1) 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MNv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcChicFeetIL(gt2,iIN)) 
coup2(4) = Conjg(cplcChicFeetIR(gt2,iIN))  
coup2(5) = cplcChiFvXPL(gt2,gt1,i1) 
coup2(6) = cplcChiFvXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvNvetIL(gt1,gt3)) 
coup2(8) = Conjg(cplFvNvetIR(gt1,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[XP],etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP],etI'
        End Do 



!-------------- 
!  conj[XP], XO 
!-------------- 
Do i1=1,2
  Do i2=1,2
Boson4(1) = MXP(i1) 
Boson4(2) = gTXP(i1) 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(4) = MNv(gt3) 
mass(3) = -MFv(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplcChiFvXPL(gt2,gt1,i1) 
coup2(6) = cplcChiFvXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplFvNvXOL(gt1,gt3,i2)) 
coup2(8) = Conjg(cplFvNvXOR(gt1,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: conj[XP],XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP],XO'
        End Do 
      End Do 



!-------------- 
!  etI, XO 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplcChicFeetIL(gt2,iIN) 
coup2(2) = cplcChicFeetIR(gt2,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplFvNvetIL(gt1,gt3) 
coup2(6) = cplFvNvetIR(gt1,gt3) 
coup2(7) = Conjg(cplFvNvXOL(gt1,gt3,i2)) 
coup2(8) = Conjg(cplFvNvXOR(gt1,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: etI,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,XO'
      End Do 



!-------------- 
!  XO, XO 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MXO(i1) 
Boson4(2) = gTXO(i1) 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFv(gt1) 
 
coup2(1) = cplcChicFeXOL(gt2,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt2,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt2,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt2,iIN,i2))  
coup2(5) = cplFvNvXOL(gt1,gt3,i1) 
coup2(6) = cplFvNvXOR(gt1,gt3,i1) 
coup2(7) = Conjg(cplFvNvXOL(gt1,gt3,i2)) 
coup2(8) = Conjg(cplFvNvXOR(gt1,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cChi Nv Propagator: XO,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='XO,XO'
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
      Do gt2=1,2
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:36))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcChiNv 
 
 
Subroutine FeTocChicFecChi(iIN,MChi,MFe,MetI,MXO,cplcChicFeetIL,cplcChicFeetIR,       & 
& cplcChicFeXOL,cplcChicFeXOR,IntegralSs,IntegralSSss,IntegralSSst,NSs,NSSss,            & 
& NSSst,gTetI,gTXO,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MChi(2),MFe(3),MetI,MXO(2)

Complex(dp),Intent(in) :: cplcChicFeetIL(2,3),cplcChicFeetIR(2,3),cplcChicFeXOL(2,3,2),cplcChicFeXOR(2,3,2)

Real(dp),Intent(inout) :: IntegralSs(500000,10)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16)

Real(dp),Intent(inout) :: gTetI,gTXO(2)

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
mass(1) = MFe(iIN) 
 
Isum = 9 
Allocate( gSum(2,3,2, Isum) ) 
Allocate( Contribution(2,3,2, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=gt1,2
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MChi(gt3))+Abs(MFe(gt2))+Abs(MChi(gt1)))) Then 
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
 
mass(2) = MChi(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChicFeetIL(gt1,iIN)) 
coup(1) = Conjg(cplcChicFeetIR(gt1,iIN)) 
coup(4) = Conjg(cplcChicFeetIL(gt3,gt2)) 
coup(3) = Conjg(cplcChicFeetIR(gt3,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChicFeetIL(gt3,iIN)) 
coup(1) = Conjg(cplcChicFeetIR(gt3,iIN)) 
coup(4) = Conjg(cplcChicFeetIL(gt1,gt2)) 
coup(3) = Conjg(cplcChicFeetIR(gt1,gt2))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeetIL(gt3,iIN) 
coup2(2) = cplcChicFeetIR(gt3,iIN) 
coup2(3) = Conjg(cplcChicFeetIL(gt1,iIN)) 
coup2(4) = Conjg(cplcChicFeetIR(gt1,iIN))  
coup2(5) = cplcChicFeetIL(gt1,gt2) 
coup2(6) = cplcChicFeetIR(gt1,gt2) 
coup2(7) = Conjg(cplcChicFeetIL(gt3,gt2)) 
coup2(8) = Conjg(cplcChicFeetIR(gt3,gt2)) 
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
Write(*,*) "Fe->cChi cFe cChi Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  XO 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MXO(i1) 
Boson2(2) =gTXO(i1) 
 
Boson4(1) = MXO(i1) 
Boson4(2) =gTXO(i1) 
Boson4(3) = MXO(i1) 
Boson4(4) =gTXO(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MChi(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt3) 
 
coup(2) = Conjg(cplcChicFeXOL(gt1,iIN,i1)) 
coup(1) = Conjg(cplcChicFeXOR(gt1,iIN,i1)) 
coup(4) = Conjg(cplcChicFeXOL(gt3,gt2,i1)) 
coup(3) = Conjg(cplcChicFeXOR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt1) 
 
coup(2) = Conjg(cplcChicFeXOL(gt3,iIN,i1)) 
coup(1) = Conjg(cplcChicFeXOR(gt3,iIN,i1)) 
coup(4) = Conjg(cplcChicFeXOL(gt1,gt2,i1)) 
coup(3) = Conjg(cplcChicFeXOR(gt1,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MChi(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeXOL(gt3,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt3,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt1,iIN,i1)) 
coup2(4) = Conjg(cplcChicFeXOR(gt1,iIN,i1))  
coup2(5) = cplcChicFeXOL(gt1,gt2,i1) 
coup2(6) = cplcChicFeXOR(gt1,gt2,i1) 
coup2(7) = Conjg(cplcChicFeXOL(gt3,gt2,i1)) 
coup2(8) = Conjg(cplcChicFeXOR(gt3,gt2,i1)) 
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
Write(*,*) "Fe->cChi cFe cChi Propagator: XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='XO'
      End Do 



!-------------- 
!  etI, XO 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChicFeetIL(gt1,iIN) 
coup2(2) = cplcChicFeetIR(gt1,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt1,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt1,iIN,i2))  
coup2(5) = cplcChicFeetIL(gt3,gt2) 
coup2(6) = cplcChicFeetIR(gt3,gt2) 
coup2(7) = Conjg(cplcChicFeXOL(gt3,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeetIL(gt3,iIN) 
coup2(2) = cplcChicFeetIR(gt3,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt1,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt1,iIN,i2))  
coup2(5) = cplcChicFeetIL(gt1,gt2) 
coup2(6) = cplcChicFeetIR(gt1,gt2) 
coup2(7) = Conjg(cplcChicFeXOL(gt3,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChicFeetIL(gt3,iIN) 
coup2(2) = cplcChicFeetIR(gt3,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt3,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt3,iIN,i2))  
coup2(5) = cplcChicFeetIL(gt1,gt2) 
coup2(6) = cplcChicFeetIR(gt1,gt2) 
coup2(7) = Conjg(cplcChicFeXOL(gt1,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeetIL(gt1,iIN) 
coup2(2) = cplcChicFeetIR(gt1,iIN) 
coup2(3) = Conjg(cplcChicFeXOL(gt3,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt3,iIN,i2))  
coup2(5) = cplcChicFeetIL(gt3,gt2) 
coup2(6) = cplcChicFeetIR(gt3,gt2) 
coup2(7) = Conjg(cplcChicFeXOL(gt1,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt1,gt2,i2)) 
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
Write(*,*) "Fe->cChi cFe cChi Propagator: etI,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,XO'
      End Do 



!-------------- 
!  XO, XO 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MXO(i1) 
Boson4(2) = gTXO(i1) 
Boson4(3) = MXO(i2) 
Boson4(4) = gTXO(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MChi(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt3) 
 
coup2(1) = cplcChicFeXOL(gt1,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt1,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt1,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt1,iIN,i2))  
coup2(5) = cplcChicFeXOL(gt3,gt2,i1) 
coup2(6) = cplcChicFeXOR(gt3,gt2,i1) 
coup2(7) = Conjg(cplcChicFeXOL(gt3,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt1) 
mass(4) = MChi(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeXOL(gt3,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt3,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt1,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt1,iIN,i2))  
coup2(5) = cplcChicFeXOL(gt1,gt2,i1) 
coup2(6) = cplcChicFeXOR(gt1,gt2,i1) 
coup2(7) = Conjg(cplcChicFeXOL(gt3,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MChi(gt1) 
 
coup2(1) = cplcChicFeXOL(gt3,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt3,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt3,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt3,iIN,i2))  
coup2(5) = cplcChicFeXOL(gt1,gt2,i1) 
coup2(6) = cplcChicFeXOR(gt1,gt2,i1) 
coup2(7) = Conjg(cplcChicFeXOL(gt1,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MChi(gt3) 
mass(4) = MChi(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcChicFeXOL(gt1,iIN,i1) 
coup2(2) = cplcChicFeXOR(gt1,iIN,i1) 
coup2(3) = Conjg(cplcChicFeXOL(gt3,iIN,i2)) 
coup2(4) = Conjg(cplcChicFeXOR(gt3,iIN,i2))  
coup2(5) = cplcChicFeXOL(gt3,gt2,i1) 
coup2(6) = cplcChicFeXOR(gt3,gt2,i1) 
coup2(7) = Conjg(cplcChicFeXOL(gt1,gt2,i2)) 
coup2(8) = Conjg(cplcChicFeXOR(gt1,gt2,i2)) 
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
Write(*,*) "Fe->cChi cFe cChi Propagator: XO,XO" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='XO,XO'
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
    Do gt1=1,2
      Do gt2=1,3
        Do gt3=gt1,2
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:9))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeTocChicFecChi 
 
 
Subroutine FeToFecFdFd(iIN,MFe,MFd,MVZ,Mhh,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gThh,              & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFd(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFdFdhhL(3,3),cplcFdFdhhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3), & 
& cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFdFd 
 
 
Subroutine FeToFecFeFe(iIN,MFe,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,           & 
& cplcFeFeVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,              & 
& IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,          & 
& NVVst,gTVZ,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
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
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFeFeVZR(gt2,gt3)) 
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
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt3)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt3) 
coup2(2) = cplcFeFehhR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcFeFehhL(gt2,gt1) 
coup2(6) = cplcFeFehhR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3)) 
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
Write(*,*) "Fe->Fe cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MFe(gt3) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeFeVZL(iIN,gt3) 
coup2(2) = cplcFeFeVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt1) 
coup2(6) = cplcFeFeVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFe(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt3)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt3))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt1)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFeFe 
 
 
Subroutine FeToFecFuFu(iIN,MFe,MFu,MVZ,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,       & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,   & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gThh,              & 
& deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFu(3),MVZ,Mhh

Complex(dp),Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3), & 
& cplcFuFuhhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gThh

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
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
mass(1) = MFe(iIN) 
 
Isum = 4 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFe(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



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
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:4))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFecFuFu 
 
 
Subroutine FeToFeNvNv(iIN,MFe,MNv,MVZ,MXP,Mhh,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,    & 
& cplcFeFeVZR,cplcFeNvcXPL,cplcFeNvcXPR,cplNvFeXPL,cplNvFeXPR,cplNvNvhhL,cplNvNvhhR,     & 
& cplNvNvVZL,cplNvNvVZR,IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,    & 
& IntegralVSst,IntegralVVss,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,gTVZ,gTXP,             & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MNv(3),MVZ,MXP(2),Mhh

Complex(dp),Intent(in) :: cplcFeFehhL(3,3),cplcFeFehhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeNvcXPL(3,3,2),& 
& cplcFeNvcXPR(3,3,2),cplNvFeXPL(3,3,2),cplNvFeXPR(3,3,2),cplNvNvhhL(3,3),               & 
& cplNvNvhhR(3,3),cplNvNvVZL(3,3),cplNvNvVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16)

Real(dp),Intent(inout) :: gTVZ,gTXP(2),gThh

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss
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
mass(1) = MFe(iIN) 
 
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
 
If(Abs(MFe(iIN)).gt.(Abs(MNv(gt3))+Abs(MNv(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplNvNvVZL(gt2,gt3)) 
coup(3) = Conjg(cplNvNvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MNv(gt3) 
mass(4) = MNv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
coup2(5) = cplNvNvVZL(gt3,gt2) 
coup2(6) = cplNvNvVZR(gt3,gt2) 
coup2(8) = Conjg(cplNvNvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplNvNvVZR(gt2,gt3)) 
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
Write(*,*) "Fe->Fe Nv Nv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  conj[XP] 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = MXP(i1) 
Boson2(2) =gTXP(i1) 
 
Boson4(1) = MXP(i1) 
Boson4(2) =gTXP(i1) 
Boson4(3) = MXP(i1) 
Boson4(4) =gTXP(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MNv(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeNvcXPL(iIN,gt2,i1)) 
coup(1) = Conjg(cplcFeNvcXPR(iIN,gt2,i1)) 
coup(4) = Conjg(cplNvFeXPL(gt3,gt1,i1)) 
coup(3) = Conjg(cplNvFeXPR(gt3,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv(gt3) 
mass(3) = -MNv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeNvcXPL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFeNvcXPR(iIN,gt3,i1)) 
coup(4) = Conjg(cplNvFeXPL(gt2,gt1,i1)) 
coup(3) = Conjg(cplNvFeXPR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MNv(gt2) 
mass(4) = MNv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt2,i1)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt2,i1))  
coup2(5) = cplNvFeXPL(gt2,gt1,i1) 
coup2(6) = cplNvFeXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplNvFeXPL(gt3,gt1,i1)) 
coup2(8) = Conjg(cplNvFeXPR(gt3,gt1,i1)) 
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
Write(*,*) "Fe->Fe Nv Nv Propagator: conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP]'
      End Do 



!-------------- 
!  hh 
!-------------- 
Isum = Isum + 1 
Boson2(1) = Mhh 
Boson2(2) =gThh 
 
Boson4(1) = Mhh 
Boson4(2) =gThh 
Boson4(3) = Mhh 
Boson4(4) =gThh 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFe(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup(2) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFehhR(iIN,gt1)) 
coup(4) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup(3) = Conjg(cplNvNvhhR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MNv(gt3) 
mass(4) = MNv(gt2) 
 
coup2(1) = cplcFeFehhL(iIN,gt1) 
coup2(2) = cplcFeFehhR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplNvNvhhL(gt3,gt2) 
coup2(6) = cplNvNvhhR(gt3,gt2) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
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
Write(*,*) "Fe->Fe Nv Nv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'



!-------------- 
!  VZ, conj[XP] 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MXP(i2) 
Boson4(4) = gTXP(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MNv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt2,i2))  
coup2(5) = cplNvNvVZL(gt2,gt3) 
coup2(6) = cplNvNvVZR(gt2,gt3) 
coup2(7) = Conjg(cplNvFeXPL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt3,gt1,i2)) 
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
mass(2) = MNv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MNv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt3,i2))  
coup2(5) = cplNvNvVZL(gt2,gt3) 
coup2(6) = cplNvNvVZR(gt2,gt3) 
coup2(7) = Conjg(cplNvFeXPL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt2,gt1,i2)) 
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
Write(*,*) "Fe->Fe Nv Nv Propagator: VZ,conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[XP]'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(3) = -MNv(gt2) 
mass(4) = MNv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplNvNvVZL(gt2,gt3) 
coup2(6) = cplNvNvVZR(gt2,gt3) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Nv Nv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'



!-------------- 
!  conj[XP], conj[XP] 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = MXP(i1) 
Boson4(2) = gTXP(i1) 
Boson4(3) = MXP(i2) 
Boson4(4) = gTXP(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MNv(gt2) 
mass(3) = -MNv(gt3) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt2,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt2,i2))  
coup2(5) = cplNvFeXPL(gt3,gt1,i1) 
coup2(6) = cplNvFeXPR(gt3,gt1,i1) 
coup2(7) = Conjg(cplNvFeXPL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt3,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv(gt2) 
mass(4) = MNv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt2,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt2,i2))  
coup2(5) = cplNvFeXPL(gt2,gt1,i1) 
coup2(6) = cplNvFeXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplNvFeXPL(gt3,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt3,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv(gt3) 
mass(3) = -MNv(gt2) 
mass(4) = MFe(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt3,i2))  
coup2(5) = cplNvFeXPL(gt2,gt1,i1) 
coup2(6) = cplNvFeXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplNvFeXPL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MNv(gt3) 
mass(4) = MNv(gt2) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt2,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeNvcXPL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFeNvcXPR(iIN,gt3,i2))  
coup2(5) = cplNvFeXPL(gt3,gt1,i1) 
coup2(6) = cplNvFeXPR(gt3,gt1,i1) 
coup2(7) = Conjg(cplNvFeXPL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplNvFeXPR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Nv Nv Propagator: conj[XP],conj[XP]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP],conj[XP]'
        End Do 
      End Do 



!-------------- 
!  conj[XP], hh 
!-------------- 
Do i1=1,2
Boson4(1) = MXP(i1) 
Boson4(2) = gTXP(i1) 
Boson4(3) = Mhh 
Boson4(4) = gThh 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFe(gt1) 
mass(4) = MNv(gt2) 
mass(3) = -MNv(gt3) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt2,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt2,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplNvFeXPL(gt3,gt1,i1) 
coup2(6) = cplNvFeXPR(gt3,gt1,i1) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFe(gt1) 
mass(4) = MNv(gt3) 
mass(3) = -MNv(gt2) 
 
coup2(1) = cplcFeNvcXPL(iIN,gt3,i1) 
coup2(2) = cplcFeNvcXPR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFeFehhL(iIN,gt1)) 
coup2(4) = Conjg(cplcFeFehhR(iIN,gt1))  
coup2(5) = cplNvFeXPL(gt2,gt1,i1) 
coup2(6) = cplNvFeXPR(gt2,gt1,i1) 
coup2(7) = Conjg(cplNvNvhhL(gt2,gt3)) 
coup2(8) = Conjg(cplNvNvhhR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Nv Nv Propagator: conj[XP],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[XP],hh'
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
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFeNvNv 
 
 
Subroutine FeToFeFvFv(iIN,MFe,MFv,MVZ,MVWp,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcVWpL,     & 
& cplcFeFvcVWpR,cplFvFeVWpL,cplFvFeVWpR,cplFvFvVZL,cplFvFvVZR,IntegralVs,IntegralVVss,   & 
& IntegralVVst,NVs,NVVss,NVVst,gTVZ,gTVWp,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFe(3),MFv(3),MVZ,MVWp

Complex(dp),Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),              & 
& cplFvFeVWpL(3,3),cplFvFeVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVWp

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
mass(1) = MFe(iIN) 
 
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
 
If(Abs(MFe(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFe(gt1)))) Then 
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
 
mass(2) = MFe(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFeVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFe(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFeVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFeFeVZR(iIN,gt1))  
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
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



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
 
mass(2) = MFv(gt2) 
mass(3) = -MFv(gt3) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt2)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt2)) 
coup(4) = Conjg(cplFvFeVWpL(gt3,gt1)) 
coup(3) = Conjg(cplFvFeVWpR(gt3,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt3) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt1) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt3)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt3)) 
coup(4) = Conjg(cplFvFeVWpL(gt2,gt1)) 
coup(3) = Conjg(cplFvFeVWpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFv(gt2) 
mass(4) = MFv(gt3) 
mass(3) = -MFe(gt1) 
 
coup2(1) = cplcFeFvcVWpL(iIN,gt3) 
coup2(2) = cplcFeFvcVWpR(iIN,gt3) 
coup2(4) = Conjg(cplcFeFvcVWpL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWpR(iIN,gt2))  
coup2(5) = cplFvFeVWpL(gt2,gt1) 
coup2(6) = cplFvFeVWpR(gt2,gt1) 
coup2(8) = Conjg(cplFvFeVWpL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWpR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
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
Write(*,*) "Fe->Fe Fv Fv Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  VZ, conj[VWp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFv(gt2) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt3) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWpL(iIN,gt2)) 
coup2(3) = Conjg(cplcFeFvcVWpR(iIN,gt2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWpL(gt3,gt1)) 
coup2(7) = Conjg(cplFvFeVWpR(gt3,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFv(gt3) 
mass(4) = MFe(gt1) 
mass(3) = -MFv(gt2) 
 
coup2(1) = cplcFeFeVZL(iIN,gt1) 
coup2(2) = cplcFeFeVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFeFvcVWpL(iIN,gt3)) 
coup2(3) = Conjg(cplcFeFvcVWpR(iIN,gt3))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFeVWpL(gt2,gt1)) 
coup2(7) = Conjg(cplFvFeVWpR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fe Fv Fv Propagator: VZ,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWp]'



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
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFeFvFv 
 
 
Subroutine FeToFvcFuFd(iIN,MFv,MFu,MFd,MVWp,MFe,cplcFeFvcVWpL,cplcFeFvcVWpR,          & 
& cplcFuFdVWpL,cplcFuFdVWpR,IntegralVs,IntegralVVss,NVs,NVVss,gTVWp,deltaM,              & 
& epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFv(3),MFu(3),MFd(3),MVWp,MFe(3)

Complex(dp),Intent(in) :: cplcFeFvcVWpL(3,3),cplcFeFvcVWpR(3,3),cplcFuFdVWpL(3,3),cplcFuFdVWpR(3,3)

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
mass(1) = MFe(iIN) 
 
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
 
If(Abs(MFe(iIN)).gt.(Abs(MFd(gt3))+Abs(MFu(gt2))+Abs(MFv(gt1)))) Then 
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
 
mass(2) = MFv(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFeFvcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFeFvcVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFdVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFdVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fe->Fv cFu Fd Propagator: conj[VWp]" 
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
  g = oo512pi3 / Abs(MFe(iIN))**3*g
End Subroutine FeToFvcFuFd 
 
 
End Module Fe3Decays_radinertDTFDTSDM 
 
