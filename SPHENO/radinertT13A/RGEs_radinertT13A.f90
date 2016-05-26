! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.8.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 17:00 on 25.5.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_radinertT13A 
 
Use Control 
Use Model_Data_radinertT13A 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters103(g,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,               & 
& MDF,mu2,MS2)

Implicit None 
Real(dp), Intent(in) :: g(103) 
Real(dp),Intent(out) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3)

Complex(dp),Intent(out) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters103' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
LSH(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+60), g(SumI+61), dp) 
End Do 
 End Do 
 
YR3= g(78) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
YR1(i1,i2) =  g(SumI+79) 
End Do 
 End Do 
 
YR4= g(88) 
Mn= Cmplx(g(89),g(90),dp) 
MDF= Cmplx(g(91),g(92),dp) 
mu2= Cmplx(g(93),g(94),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
MS2(i1,i2) =  g(SumI+95) 
End Do 
 End Do 
 
Do i1=1,103 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters103

Subroutine ParametersToG103(g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,             & 
& mu2,MS2,g)

Implicit None 
Real(dp), Intent(out) :: g(103) 
Real(dp), Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3)

Complex(dp), Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG103' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(LSH(i1,i2), dp) 
g(SumI+7) = Aimag(LSH(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yu(i1,i2), dp) 
g(SumI+25) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Yd(i1,i2), dp) 
g(SumI+43) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+60) = Real(Ye(i1,i2), dp) 
g(SumI+61) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(78) = YR3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
g(SumI+79) = YR1(i1,i2) 
End Do 
End Do 

g(88) = YR4  
g(89) = Real(Mn,dp)  
g(90) = Aimag(Mn)  
g(91) = Real(MDF,dp)  
g(92) = Aimag(MDF)  
g(93) = Real(mu2,dp)  
g(94) = Aimag(mu2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
g(SumI+95) = MS2(i1,i2) 
End Do 
End Do 

Iname = Iname - 1 
 
End Subroutine ParametersToG103

Subroutine rge103(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,YR3,betaYR31,betaYR32,DYR3,YR1(3,3),betaYR11(3,3),betaYR12(3,3),DYR1(3,3)          & 
& ,adjYR1(3,3),YR4,betaYR41,betaYR42,DYR4,MS2(3,3),betaMS21(3,3),betaMS22(3,3)           & 
& ,DMS2(3,3)
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,LSH(3,3),betaLSH1(3,3),betaLSH2(3,3)        & 
& ,DLSH(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)               & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),Mn,betaMn1,betaMn2,DMn,MDF,betaMDF1,betaMDF2,DMDF,mu2,            & 
& betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge103' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters103(gy,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2)

Call Adjungate(Yu,adjYu)
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
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = 0

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

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
! YR3 
!-------------------- 
 
betaYR31  = 0

 
 
If (TwoLoopRGE) Then 
betaYR32 = 0

 
DYR3 = oo16pi2*( betaYR31 + oo16pi2 * betaYR32 ) 

 
Else 
DYR3 = oo16pi2* betaYR31 
End If 
 
 
!-------------------- 
! YR1 
!-------------------- 
 
betaYR11  = 0

 
 
If (TwoLoopRGE) Then 
betaYR12 = 0

 
DYR1 = oo16pi2*( betaYR11 + oo16pi2 * betaYR12 ) 

 
Else 
DYR1 = oo16pi2* betaYR11 
End If 
 
 
!-------------------- 
! YR4 
!-------------------- 
 
betaYR41  = 0

 
 
If (TwoLoopRGE) Then 
betaYR42 = 0

 
DYR4 = oo16pi2*( betaYR41 + oo16pi2 * betaYR42 ) 

 
Else 
DYR4 = oo16pi2* betaYR41 
End If 
 
 
!-------------------- 
! Mn 
!-------------------- 
 
betaMn1  = 0

 
 
If (TwoLoopRGE) Then 
betaMn2 = 0

 
DMn = oo16pi2*( betaMn1 + oo16pi2 * betaMn2 ) 

 
Else 
DMn = oo16pi2* betaMn1 
End If 
 
 
Call Chop(DMn) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
Call Chop(DMDF) 

!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 0

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
Call ParametersToG103(Dg1,Dg2,Dg3,DLam,DLSH,DYu,DYd,DYe,DYR3,DYR1,DYR4,               & 
& DMn,DMDF,Dmu2,DMS2,f)

Iname = Iname - 1 
 
End Subroutine rge103  

Subroutine GToParameters104(g,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,               & 
& MDF,mu2,MS2,v)

Implicit None 
Real(dp), Intent(in) :: g(104) 
Real(dp),Intent(out) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v

Complex(dp),Intent(out) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters104' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
Lam= Cmplx(g(4),g(5),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
LSH(i1,i2) = Cmplx( g(SumI+6), g(SumI+7), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+24), g(SumI+25), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+42), g(SumI+43), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+60), g(SumI+61), dp) 
End Do 
 End Do 
 
YR3= g(78) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
YR1(i1,i2) =  g(SumI+79) 
End Do 
 End Do 
 
YR4= g(88) 
Mn= Cmplx(g(89),g(90),dp) 
MDF= Cmplx(g(91),g(92),dp) 
mu2= Cmplx(g(93),g(94),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
MS2(i1,i2) =  g(SumI+95) 
End Do 
 End Do 
 
v= g(104) 
Do i1=1,104 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters104

Subroutine ParametersToG104(g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,             & 
& mu2,MS2,v,g)

Implicit None 
Real(dp), Intent(out) :: g(104) 
Real(dp), Intent(in) :: g1,g2,g3,YR3,YR1(3,3),YR4,MS2(3,3),v

Complex(dp), Intent(in) :: Lam,LSH(3,3),Yu(3,3),Yd(3,3),Ye(3,3),Mn,MDF,mu2

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG104' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(Lam,dp)  
g(5) = Aimag(Lam)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+6) = Real(LSH(i1,i2), dp) 
g(SumI+7) = Aimag(LSH(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+24) = Real(Yu(i1,i2), dp) 
g(SumI+25) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+42) = Real(Yd(i1,i2), dp) 
g(SumI+43) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+60) = Real(Ye(i1,i2), dp) 
g(SumI+61) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

g(78) = YR3  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
g(SumI+79) = YR1(i1,i2) 
End Do 
End Do 

g(88) = YR4  
g(89) = Real(Mn,dp)  
g(90) = Aimag(Mn)  
g(91) = Real(MDF,dp)  
g(92) = Aimag(MDF)  
g(93) = Real(mu2,dp)  
g(94) = Aimag(mu2)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
g(SumI+95) = MS2(i1,i2) 
End Do 
End Do 

g(104) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG104

Subroutine rge104(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,YR3,betaYR31,betaYR32,DYR3,YR1(3,3),betaYR11(3,3),betaYR12(3,3),DYR1(3,3)          & 
& ,adjYR1(3,3),YR4,betaYR41,betaYR42,DYR4,MS2(3,3),betaMS21(3,3),betaMS22(3,3)           & 
& ,DMS2(3,3),v,betav1,betav2,Dv
Complex(dp) :: Lam,betaLam1,betaLam2,DLam,LSH(3,3),betaLSH1(3,3),betaLSH2(3,3)        & 
& ,DLSH(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)               & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3),Mn,betaMn1,betaMn2,DMn,MDF,betaMDF1,betaMDF2,DMDF,mu2,            & 
& betamu21,betamu22,Dmu2
Iname = Iname +1 
NameOfUnit(Iname) = 'rge104' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters104(gy,g1,g2,g3,Lam,LSH,Yu,Yd,Ye,YR3,YR1,YR4,Mn,MDF,mu2,MS2,v)

Call Adjungate(Yu,adjYu)
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
! Lam 
!-------------------- 
 
betaLam1  = 0

 
 
If (TwoLoopRGE) Then 
betaLam2 = 0

 
DLam = oo16pi2*( betaLam1 + oo16pi2 * betaLam2 ) 

 
Else 
DLam = oo16pi2* betaLam1 
End If 
 
 
Call Chop(DLam) 

!-------------------- 
! LSH 
!-------------------- 
 
betaLSH1  = 0

 
 
If (TwoLoopRGE) Then 
betaLSH2 = 0

 
DLSH = oo16pi2*( betaLSH1 + oo16pi2 * betaLSH2 ) 

 
Else 
DLSH = oo16pi2* betaLSH1 
End If 
 
 
Call Chop(DLSH) 

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
! YR3 
!-------------------- 
 
betaYR31  = 0

 
 
If (TwoLoopRGE) Then 
betaYR32 = 0

 
DYR3 = oo16pi2*( betaYR31 + oo16pi2 * betaYR32 ) 

 
Else 
DYR3 = oo16pi2* betaYR31 
End If 
 
 
!-------------------- 
! YR1 
!-------------------- 
 
betaYR11  = 0

 
 
If (TwoLoopRGE) Then 
betaYR12 = 0

 
DYR1 = oo16pi2*( betaYR11 + oo16pi2 * betaYR12 ) 

 
Else 
DYR1 = oo16pi2* betaYR11 
End If 
 
 
!-------------------- 
! YR4 
!-------------------- 
 
betaYR41  = 0

 
 
If (TwoLoopRGE) Then 
betaYR42 = 0

 
DYR4 = oo16pi2*( betaYR41 + oo16pi2 * betaYR42 ) 

 
Else 
DYR4 = oo16pi2* betaYR41 
End If 
 
 
!-------------------- 
! Mn 
!-------------------- 
 
betaMn1  = 0

 
 
If (TwoLoopRGE) Then 
betaMn2 = 0

 
DMn = oo16pi2*( betaMn1 + oo16pi2 * betaMn2 ) 

 
Else 
DMn = oo16pi2* betaMn1 
End If 
 
 
Call Chop(DMn) 

!-------------------- 
! MDF 
!-------------------- 
 
betaMDF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMDF2 = 0

 
DMDF = oo16pi2*( betaMDF1 + oo16pi2 * betaMDF2 ) 

 
Else 
DMDF = oo16pi2* betaMDF1 
End If 
 
 
Call Chop(DMDF) 

!-------------------- 
! mu2 
!-------------------- 
 
betamu21  = 0

 
 
If (TwoLoopRGE) Then 
betamu22 = 0

 
Dmu2 = oo16pi2*( betamu21 + oo16pi2 * betamu22 ) 

 
Else 
Dmu2 = oo16pi2* betamu21 
End If 
 
 
Call Chop(Dmu2) 

!-------------------- 
! MS2 
!-------------------- 
 
betaMS21  = 0

 
 
If (TwoLoopRGE) Then 
betaMS22 = 0

 
DMS2 = oo16pi2*( betaMS21 + oo16pi2 * betaMS22 ) 

 
Else 
DMS2 = oo16pi2* betaMS21 
End If 
 
 
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
 
 
Call ParametersToG104(Dg1,Dg2,Dg3,DLam,DLSH,DYu,DYd,DYe,DYR3,DYR1,DYR4,               & 
& DMn,DMDF,Dmu2,DMS2,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge104  

End Module RGEs_radinertT13A 
 
