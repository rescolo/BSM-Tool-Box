! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 14:11 on 25.8.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_SimplifiedDMTFDM 
 
Use Model_Data_SimplifiedDMTFDM 
Use TreeLevelMasses_SimplifiedDMTFDM 
Use RGEs_SimplifiedDMTFDM 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,v

Complex(dp),Intent(inout) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),MTF,Mu

Complex(dp), Intent(in) :: Tad1Loop(1)

! For numerical routines 
Real(dp) :: gC(64)
logical :: broycheck 
Real(dp) :: broyx(1)

If (HighScaleModel.Eq."LOW") Then 
Mu = (v**2*Lam)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   !Call TerminateProgram  
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
Mu = (v**2*Lam)/2._dp - Tad1Loop(1)/v

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(Mu,dp).ne.Real(Mu,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for Mu" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(Mu)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for Mu" 
   !Call TerminateProgram  
   Mu = Real(Mu,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,Lam,Yu,Yd,Ye,MTF,Mu,v,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,v

Complex(dp),Intent(in) :: Lam,Yu(3,3),Yd(3,3),Ye(3,3),MTF,Mu

Complex(dp), Intent(in) :: Tad1Loop(1)

Real(dp), Intent(out) :: TadpoleValues(1)

TadpoleValues(1) = Real(-(Mu*v) + (v**3*Lam)/2._dp - Tad1Loop(1),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_SimplifiedDMTFDM 
 
