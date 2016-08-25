! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:28 on 24.8.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_2HDMHiggsBasis 
 
Use Control 
Use Model_Data_2HDMHiggsBasis 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters130(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12)

Implicit None 
Real(dp), Intent(in) :: g(130) 
Real(dp),Intent(out) :: g1,g2,g3,lam5

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters130' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam7= Cmplx(g(12),g(13),dp) 
lam5= g(14) 
lam6= Cmplx(g(15),g(16),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+17), g(SumI+18), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+35), g(SumI+36), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+53), g(SumI+54), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+71), g(SumI+72), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+89), g(SumI+90), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+107), g(SumI+108), dp) 
End Do 
 End Do 
 
mH2= Cmplx(g(125),g(126),dp) 
mEt2= Cmplx(g(127),g(128),dp) 
M12= Cmplx(g(129),g(130),dp) 
Do i1=1,130 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters130

Subroutine ParametersToG130(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,              & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,g)

Implicit None 
Real(dp), Intent(out) :: g(130) 
Real(dp), Intent(in) :: g1,g2,g3,lam5

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG130' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = Real(lam7,dp)  
g(13) = Aimag(lam7)  
g(14) = lam5  
g(15) = Real(lam6,dp)  
g(16) = Aimag(lam6)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17) = Real(Yu(i1,i2), dp) 
g(SumI+18) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+35) = Real(epsU(i1,i2), dp) 
g(SumI+36) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+53) = Real(epsD(i1,i2), dp) 
g(SumI+54) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+71) = Real(epsE(i1,i2), dp) 
g(SumI+72) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+89) = Real(Yd(i1,i2), dp) 
g(SumI+90) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+107) = Real(Ye(i1,i2), dp) 
g(SumI+108) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(125) = Real(mH2,dp)  
g(126) = Aimag(mH2)  
g(127) = Real(mEt2,dp)  
g(128) = Aimag(mEt2)  
g(129) = Real(M12,dp)  
g(130) = Aimag(M12)  
Iname = Iname - 1 
 
End Subroutine ParametersToG130

Subroutine rge130(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,lam7,              & 
& betalam71,betalam72,Dlam7,lam6,betalam61,betalam62,Dlam6,Yu(3,3),betaYu1(3,3)          & 
& ,betaYu2(3,3),DYu(3,3),adjYu(3,3),epsU(3,3),betaepsU1(3,3),betaepsU2(3,3)              & 
& ,DepsU(3,3),adjepsU(3,3),epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3)            & 
& ,adjepsD(3,3),epsE(3,3),betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3)          & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,           & 
& betamEt22,DmEt2,M12,betaM121,betaM122,DM12
Iname = Iname +1 
NameOfUnit(Iname) = 'rge130' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters130(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,              & 
& epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12)

Call Adjungate(Yu,adjYu)
Call Adjungate(epsU,adjepsU)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = 0

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam7 
!-------------------- 
 
betalam71  = 0

 
 
If (TwoLoopRGE) Then 
betalam72 = 0

 
Dlam7 = oo16pi2*( betalam71 + oo16pi2 * betalam72 ) 

 
Else 
Dlam7 = oo16pi2* betalam71 
End If 
 
 
Call Chop(Dlam7) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 0

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! lam6 
!-------------------- 
 
betalam61  = 0

 
 
If (TwoLoopRGE) Then 
betalam62 = 0

 
Dlam6 = oo16pi2*( betalam61 + oo16pi2 * betalam62 ) 

 
Else 
Dlam6 = oo16pi2* betalam61 
End If 
 
 
Call Chop(Dlam6) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

!-------------------- 
! epsD 
!-------------------- 
 
betaepsD1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = 0

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

!-------------------- 
! mEt2 
!-------------------- 
 
betamEt21  = 0

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

Call ParametersToG130(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam7,Dlam5,Dlam6,          & 
& DYu,DepsU,DepsD,DepsE,DYd,DYe,DmH2,DmEt2,DM12,f)

Iname = Iname - 1 
 
End Subroutine rge130  

Subroutine GToParameters132(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv)

Implicit None 
Real(dp), Intent(in) :: g(132) 
Real(dp),Intent(out) :: g1,g2,g3,lam5,v,vv

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters132' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam7= Cmplx(g(12),g(13),dp) 
lam5= g(14) 
lam6= Cmplx(g(15),g(16),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+17), g(SumI+18), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+35), g(SumI+36), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+53), g(SumI+54), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+71), g(SumI+72), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+89), g(SumI+90), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+107), g(SumI+108), dp) 
End Do 
 End Do 
 
mH2= Cmplx(g(125),g(126),dp) 
mEt2= Cmplx(g(127),g(128),dp) 
M12= Cmplx(g(129),g(130),dp) 
v= g(131) 
vv= g(132) 
Do i1=1,132 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters132

Subroutine ParametersToG132(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,              & 
& Yu,epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv,g)

Implicit None 
Real(dp), Intent(out) :: g(132) 
Real(dp), Intent(in) :: g1,g2,g3,lam5,v,vv

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,Yu(3,3),epsU(3,3),epsD(3,3),epsE(3,3),Yd(3,3),          & 
& Ye(3,3),mH2,mEt2,M12

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG132' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = Real(lam7,dp)  
g(13) = Aimag(lam7)  
g(14) = lam5  
g(15) = Real(lam6,dp)  
g(16) = Aimag(lam6)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+17) = Real(Yu(i1,i2), dp) 
g(SumI+18) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+35) = Real(epsU(i1,i2), dp) 
g(SumI+36) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+53) = Real(epsD(i1,i2), dp) 
g(SumI+54) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+71) = Real(epsE(i1,i2), dp) 
g(SumI+72) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+89) = Real(Yd(i1,i2), dp) 
g(SumI+90) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+107) = Real(Ye(i1,i2), dp) 
g(SumI+108) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(125) = Real(mH2,dp)  
g(126) = Aimag(mH2)  
g(127) = Real(mEt2,dp)  
g(128) = Aimag(mEt2)  
g(129) = Real(M12,dp)  
g(130) = Aimag(M12)  
g(131) = v  
g(132) = vv  
Iname = Iname - 1 
 
End Subroutine ParametersToG132

Subroutine rge132(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5,v,betav1,betav2,Dv,vv,betavv1,betavv2,Dvv
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,lam7,              & 
& betalam71,betalam72,Dlam7,lam6,betalam61,betalam62,Dlam6,Yu(3,3),betaYu1(3,3)          & 
& ,betaYu2(3,3),DYu(3,3),adjYu(3,3),epsU(3,3),betaepsU1(3,3),betaepsU2(3,3)              & 
& ,DepsU(3,3),adjepsU(3,3),epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3)            & 
& ,adjepsD(3,3),epsE(3,3),betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3)          & 
& ,Yd(3,3),betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3)            & 
& ,betaYe2(3,3),DYe(3,3),adjYe(3,3),mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,           & 
& betamEt22,DmEt2,M12,betaM121,betaM122,DM12
Iname = Iname +1 
NameOfUnit(Iname) = 'rge132' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters132(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,Yu,              & 
& epsU,epsD,epsE,Yd,Ye,mH2,mEt2,M12,v,vv)

Call Adjungate(Yu,adjYu)
Call Adjungate(epsU,adjepsU)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 0

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 0

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = 0

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 0

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam7 
!-------------------- 
 
betalam71  = 0

 
 
If (TwoLoopRGE) Then 
betalam72 = 0

 
Dlam7 = oo16pi2*( betalam71 + oo16pi2 * betalam72 ) 

 
Else 
Dlam7 = oo16pi2* betalam71 
End If 
 
 
Call Chop(Dlam7) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 0

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! lam6 
!-------------------- 
 
betalam61  = 0

 
 
If (TwoLoopRGE) Then 
betalam62 = 0

 
Dlam6 = oo16pi2*( betalam61 + oo16pi2 * betalam62 ) 

 
Else 
Dlam6 = oo16pi2* betalam61 
End If 
 
 
Call Chop(Dlam6) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = 0

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

!-------------------- 
! epsD 
!-------------------- 
 
betaepsD1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 0

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = 0

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = 0

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = 0

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

!-------------------- 
! mEt2 
!-------------------- 
 
betamEt21  = 0

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

!-------------------- 
! M12 
!-------------------- 
 
betaM121  = 0

 
 
If (TwoLoopRGE) Then 
betaM122 = 0

 
DM12 = oo16pi2*( betaM121 + oo16pi2 * betaM122 ) 

 
Else 
DM12 = oo16pi2* betaM121 
End If 
 
 
Call Chop(DM12) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = 0

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
!-------------------- 
! vv 
!-------------------- 
 
betavv1  = 0

 
 
If (TwoLoopRGE) Then 
betavv2 = 0

 
Dvv = oo16pi2*( betavv1 + oo16pi2 * betavv2 ) 

 
Else 
Dvv = oo16pi2* betavv1 
End If 
 
 
Call ParametersToG132(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam7,Dlam5,Dlam6,          & 
& DYu,DepsU,DepsD,DepsE,DYd,DYe,DmH2,DmEt2,DM12,Dv,Dvv,f)

Iname = Iname - 1 
 
End Subroutine rge132  

End Module RGEs_2HDMHiggsBasis 
 
