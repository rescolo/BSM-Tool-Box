! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:31 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_2HDMHiggsBasis 
 
Use Model_Data_2HDMHiggsBasis 
Use TreeLevelMasses_2HDMHiggsBasis 
Use RGEs_2HDMHiggsBasis 
Use Control 

Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: g1,g2,g3,lam5,v,vv

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp), Intent(in) :: Tad1Loop(2)

! For numerical routines 
Real(dp) :: gC(132)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
mH2 = (-(lam1*v**4) - lam6*v**3*vv + 2*mEt2*vv**2 + lam7*v*vv**3 + lam2*vv**4 -             & 
&  v**3*vv*Conjg(lam6) + v*vv**3*Conjg(lam7) + 2*v*Tad1Loop(1) - 2*vv*Tad1Loop(2))/(2._dp*v**2)
M12 = (lam6*v**3 + 4*mEt2*vv + 2*lam3*v**2*vv + 2*lam4*v**2*vv + 2*lam5*v**2*vv +           & 
&  3*lam7*v*vv**2 + 2*lam2*vv**3 + v**3*Conjg(lam6) + 3*v*vv**2*Conjg(lam7) -            & 
&  4*Tad1Loop(2))/(4._dp*v)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mH2,dp).ne.Real(mH2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mH2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mH2" 
   !Call TerminateProgram  
   mH2 = Real(mH2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M12,dp).ne.Real(M12,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M12" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M12)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M12" 
   !Call TerminateProgram  
   M12 = Real(M12,dp) 
  SignOfMuChanged= .True. 
End If 
 Else 
mH2 = (-(lam1*v**4) - lam6*v**3*vv + 2*mEt2*vv**2 + lam7*v*vv**3 + lam2*vv**4 -             & 
&  v**3*vv*Conjg(lam6) + v*vv**3*Conjg(lam7) + 2*v*Tad1Loop(1) - 2*vv*Tad1Loop(2))/(2._dp*v**2)
M12 = (lam6*v**3 + 4*mEt2*vv + 2*lam3*v**2*vv + 2*lam4*v**2*vv + 2*lam5*v**2*vv +           & 
&  3*lam7*v*vv**2 + 2*lam2*vv**3 + v**3*Conjg(lam6) + 3*v*vv**2*Conjg(lam7) -            & 
&  4*Tad1Loop(2))/(4._dp*v)

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (Real(mH2,dp).ne.Real(mH2,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for mH2" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(mH2)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for mH2" 
   !Call TerminateProgram  
   mH2 = Real(mH2,dp) 
  SignOfMuChanged= .True. 
End If 
 If (Real(M12,dp).ne.Real(M12,dp)) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for M12" 
   Call TerminateProgram  
 End If 
 If (Abs(AImag(M12)).gt.1.0E-04_dp) Then 
   Write(*,*) "No real solution of tadpole equations for M12" 
   !Call TerminateProgram  
   M12 = Real(M12,dp) 
  SignOfMuChanged= .True. 
End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,             & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real((2*lam1*v**3 + 2*v*(2._dp*(mH2) + (lam3 + lam4 + lam5)        & 
& *vv**2) + 3*v**2*vv*(lam6 + Conjg(lam6)) + vv*(-4._dp*(M12) + vv**2*(lam7 + Conjg(lam7))))& 
& /4._dp - Tad1Loop(1),dp) 
TadpoleValues(2) = Real((4*mEt2*vv + 2*(lam3 + lam4 + lam5)*v**2*vv + 2*lam2*vv**3 + v**3*(lam6 + Conjg(lam6))& 
&  + v*(-4._dp*(M12) + 3*vv**2*(lam7 + Conjg(lam7))))/4._dp - Tad1Loop(2),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_2HDMHiggsBasis 
 
