! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 12:36 on 3.11.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_radinertDTFDTSDM 
 
Use Model_Data_radinertDTFDTSDM 
Use TreeLevelMasses_radinertDTFDTSDM 
Use RGEs_radinertDTFDTSDM 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,              & 
& lam8,lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp),Intent(inout) :: Yu(3,3),Yd(3,3),Ye(3,3)

Complex(dp), Intent(in) :: Tad1Loop(3)

! For numerical routines 
Real(dp) :: gC(83)
logical :: broycheck 
Real(dp) :: broyx(1)

If (HighScaleModel.Eq."LOW") Then 
mH2 = (lam1*v**2)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mH2.ne.mH2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 Else 
mH2 = (lam1*v**2)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (mH2.ne.mH2) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,             & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp),Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Complex(dp), Intent(in) :: Tad1Loop(1)

Real(dp), Intent(out) :: TadpoleValues(1)

TadpoleValues(1) = Real(-(mH2*v) + (lam1*v**3)/2._dp - Tad1Loop(1),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_radinertDTFDTSDM 
 
