! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:27 on 28.9.2016   
! ----------------------------------------------------------------------  
 
 
Module RGEs_radinertDTFDTSDM 
 
Use Control 
Use Model_Data_radinertDTFDTSDM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters82(g,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,             & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3)

Implicit None 
Real(dp), Intent(in) :: g(82) 
Real(dp),Intent(out) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp),Intent(out) :: Yu(3,3),Yd(3,3),Ye(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters82' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= g(4) 
lam2= g(5) 
lam3= g(6) 
lam4= g(7) 
lam6= g(8) 
lam7= g(9) 
lam8= g(10) 
lam5= g(11) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+12), g(SumI+13), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+30), g(SumI+31), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+48), g(SumI+49), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
eta(i1) =  g(SumI+66) 
End Do 
 
A= g(69) 
B= g(70) 
Do i1 = 1,3
SumI = (i1-1) 
Yf(i1) =  g(SumI+71) 
End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
Y3(i1) =  g(SumI+74) 
End Do 
 
MTF= g(77) 
MDF= g(78) 
mu= g(79) 
mH2= g(80) 
mEt2= g(81) 
mu3= g(82) 
Do i1=1,82 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters82

Subroutine ParametersToG82(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,               & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,g)

Implicit None 
Real(dp), Intent(out) :: g(82) 
Real(dp), Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3

Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG82' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = lam1  
g(5) = lam2  
g(6) = lam3  
g(7) = lam4  
g(8) = lam6  
g(9) = lam7  
g(10) = lam8  
g(11) = lam5  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+12) = Real(Yu(i1,i2), dp) 
g(SumI+13) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+30) = Real(Yd(i1,i2), dp) 
g(SumI+31) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+48) = Real(Ye(i1,i2), dp) 
g(SumI+49) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+66) = eta(i1) 
End Do 

g(69) = A  
g(70) = B  
Do i1 = 1,3
SumI = (i1-1) 
g(SumI+71) = Yf(i1) 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+74) = Y3(i1) 
End Do 

g(77) = MTF  
g(78) = MDF  
g(79) = mu  
g(80) = mH2  
g(81) = mEt2  
g(82) = mu3  
Iname = Iname - 1 
 
End Subroutine ParametersToG82

Subroutine rge82(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,Dlam2,lam3,betalam31,      & 
& betalam32,Dlam3,lam4,betalam41,betalam42,Dlam4,lam6,betalam61,betalam62,               & 
& Dlam6,lam7,betalam71,betalam72,Dlam7,lam8,betalam81,betalam82,Dlam8,lam5,              & 
& betalam51,betalam52,Dlam5,eta(3),betaeta1(3),betaeta2(3),Deta(3),A,betaA1,             & 
& betaA2,DA,B,betaB1,betaB2,DB,Yf(3),betaYf1(3),betaYf2(3),DYf(3),Y3(3),betaY31(3)       & 
& ,betaY32(3),DY3(3),MTF,betaMTF1,betaMTF2,DMTF,MDF,betaMDF1,betaMDF2,DMDF,              & 
& mu,betamu1,betamu2,Dmu,mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,betamEt22,            & 
& DmEt2,mu3,betamu31,betamu32,Dmu3
Complex(dp) :: Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)          & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge82' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters82(gy,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,             & 
& Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3)

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
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
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
 
 
!-------------------- 
! lam8 
!-------------------- 
 
betalam81  = 0

 
 
If (TwoLoopRGE) Then 
betalam82 = 0

 
Dlam8 = oo16pi2*( betalam81 + oo16pi2 * betalam82 ) 

 
Else 
Dlam8 = oo16pi2* betalam81 
End If 
 
 
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
! eta 
!-------------------- 
 
betaeta1  = 0

 
 
If (TwoLoopRGE) Then 
betaeta2 = 0

 
Deta = oo16pi2*( betaeta1 + oo16pi2 * betaeta2 ) 

 
Else 
Deta = oo16pi2* betaeta1 
End If 
 
 
!-------------------- 
! A 
!-------------------- 
 
betaA1  = 0

 
 
If (TwoLoopRGE) Then 
betaA2 = 0

 
DA = oo16pi2*( betaA1 + oo16pi2 * betaA2 ) 

 
Else 
DA = oo16pi2* betaA1 
End If 
 
 
!-------------------- 
! B 
!-------------------- 
 
betaB1  = 0

 
 
If (TwoLoopRGE) Then 
betaB2 = 0

 
DB = oo16pi2*( betaB1 + oo16pi2 * betaB2 ) 

 
Else 
DB = oo16pi2* betaB1 
End If 
 
 
!-------------------- 
! Yf 
!-------------------- 
 
betaYf1  = 0

 
 
If (TwoLoopRGE) Then 
betaYf2 = 0

 
DYf = oo16pi2*( betaYf1 + oo16pi2 * betaYf2 ) 

 
Else 
DYf = oo16pi2* betaYf1 
End If 
 
 
!-------------------- 
! Y3 
!-------------------- 
 
betaY31  = 0

 
 
If (TwoLoopRGE) Then 
betaY32 = 0

 
DY3 = oo16pi2*( betaY31 + oo16pi2 * betaY32 ) 

 
Else 
DY3 = oo16pi2* betaY31 
End If 
 
 
!-------------------- 
! MTF 
!-------------------- 
 
betaMTF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMTF2 = 0

 
DMTF = oo16pi2*( betaMTF1 + oo16pi2 * betaMTF2 ) 

 
Else 
DMTF = oo16pi2* betaMTF1 
End If 
 
 
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
 
 
!-------------------- 
! mu 
!-------------------- 
 
betamu1  = 0

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
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
 
 
!-------------------- 
! mu3 
!-------------------- 
 
betamu31  = 0

 
 
If (TwoLoopRGE) Then 
betamu32 = 0

 
Dmu3 = oo16pi2*( betamu31 + oo16pi2 * betamu32 ) 

 
Else 
Dmu3 = oo16pi2* betamu31 
End If 
 
 
Call ParametersToG82(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam3,Dlam4,Dlam6,Dlam7,Dlam8,           & 
& Dlam5,DYu,DYd,DYe,Deta,DA,DB,DYf,DY3,DMTF,DMDF,Dmu,DmH2,DmEt2,Dmu3,f)

Iname = Iname - 1 
 
End Subroutine rge82  

Subroutine GToParameters83(g,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,             & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v)

Implicit None 
Real(dp), Intent(in) :: g(83) 
Real(dp),Intent(out) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp),Intent(out) :: Yu(3,3),Yd(3,3),Ye(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters83' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= g(4) 
lam2= g(5) 
lam3= g(6) 
lam4= g(7) 
lam6= g(8) 
lam7= g(9) 
lam8= g(10) 
lam5= g(11) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+12), g(SumI+13), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+30), g(SumI+31), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+48), g(SumI+49), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
eta(i1) =  g(SumI+66) 
End Do 
 
A= g(69) 
B= g(70) 
Do i1 = 1,3
SumI = (i1-1) 
Yf(i1) =  g(SumI+71) 
End Do 
 
Do i1 = 1,3
SumI = (i1-1) 
Y3(i1) =  g(SumI+74) 
End Do 
 
MTF= g(77) 
MDF= g(78) 
mu= g(79) 
mH2= g(80) 
mEt2= g(81) 
mu3= g(82) 
v= g(83) 
Do i1=1,83 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters83

Subroutine ParametersToG83(g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,               & 
& lam5,Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v,g)

Implicit None 
Real(dp), Intent(out) :: g(83) 
Real(dp), Intent(in) :: g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,eta(3),A,B,Yf(3),Y3(3),              & 
& MTF,MDF,mu,mH2,mEt2,mu3,v

Complex(dp), Intent(in) :: Yu(3,3),Yd(3,3),Ye(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG83' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = lam1  
g(5) = lam2  
g(6) = lam3  
g(7) = lam4  
g(8) = lam6  
g(9) = lam7  
g(10) = lam8  
g(11) = lam5  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+12) = Real(Yu(i1,i2), dp) 
g(SumI+13) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+30) = Real(Yd(i1,i2), dp) 
g(SumI+31) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+48) = Real(Ye(i1,i2), dp) 
g(SumI+49) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+66) = eta(i1) 
End Do 

g(69) = A  
g(70) = B  
Do i1 = 1,3
SumI = (i1-1) 
g(SumI+71) = Yf(i1) 
End Do 

Do i1 = 1,3
SumI = (i1-1) 
g(SumI+74) = Y3(i1) 
End Do 

g(77) = MTF  
g(78) = MDF  
g(79) = mu  
g(80) = mH2  
g(81) = mEt2  
g(82) = mu3  
g(83) = v  
Iname = Iname - 1 
 
End Subroutine ParametersToG83

Subroutine rge83(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,Dlam2,lam3,betalam31,      & 
& betalam32,Dlam3,lam4,betalam41,betalam42,Dlam4,lam6,betalam61,betalam62,               & 
& Dlam6,lam7,betalam71,betalam72,Dlam7,lam8,betalam81,betalam82,Dlam8,lam5,              & 
& betalam51,betalam52,Dlam5,eta(3),betaeta1(3),betaeta2(3),Deta(3),A,betaA1,             & 
& betaA2,DA,B,betaB1,betaB2,DB,Yf(3),betaYf1(3),betaYf2(3),DYf(3),Y3(3),betaY31(3)       & 
& ,betaY32(3),DY3(3),MTF,betaMTF1,betaMTF2,DMTF,MDF,betaMDF1,betaMDF2,DMDF,              & 
& mu,betamu1,betamu2,Dmu,mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,betamEt22,            & 
& DmEt2,mu3,betamu31,betamu32,Dmu3,v,betav1,betav2,Dv
Complex(dp) :: Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3),Yd(3,3)          & 
& ,betaYd1(3,3),betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3)       & 
& ,DYe(3,3),adjYe(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge83' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters83(gy,g1,g2,g3,lam1,lam2,lam3,lam4,lam6,lam7,lam8,lam5,             & 
& Yu,Yd,Ye,eta,A,B,Yf,Y3,MTF,MDF,mu,mH2,mEt2,mu3,v)

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
! lam1 
!-------------------- 
 
betalam11  = 0

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
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
 
 
!-------------------- 
! lam8 
!-------------------- 
 
betalam81  = 0

 
 
If (TwoLoopRGE) Then 
betalam82 = 0

 
Dlam8 = oo16pi2*( betalam81 + oo16pi2 * betalam82 ) 

 
Else 
Dlam8 = oo16pi2* betalam81 
End If 
 
 
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
! eta 
!-------------------- 
 
betaeta1  = 0

 
 
If (TwoLoopRGE) Then 
betaeta2 = 0

 
Deta = oo16pi2*( betaeta1 + oo16pi2 * betaeta2 ) 

 
Else 
Deta = oo16pi2* betaeta1 
End If 
 
 
!-------------------- 
! A 
!-------------------- 
 
betaA1  = 0

 
 
If (TwoLoopRGE) Then 
betaA2 = 0

 
DA = oo16pi2*( betaA1 + oo16pi2 * betaA2 ) 

 
Else 
DA = oo16pi2* betaA1 
End If 
 
 
!-------------------- 
! B 
!-------------------- 
 
betaB1  = 0

 
 
If (TwoLoopRGE) Then 
betaB2 = 0

 
DB = oo16pi2*( betaB1 + oo16pi2 * betaB2 ) 

 
Else 
DB = oo16pi2* betaB1 
End If 
 
 
!-------------------- 
! Yf 
!-------------------- 
 
betaYf1  = 0

 
 
If (TwoLoopRGE) Then 
betaYf2 = 0

 
DYf = oo16pi2*( betaYf1 + oo16pi2 * betaYf2 ) 

 
Else 
DYf = oo16pi2* betaYf1 
End If 
 
 
!-------------------- 
! Y3 
!-------------------- 
 
betaY31  = 0

 
 
If (TwoLoopRGE) Then 
betaY32 = 0

 
DY3 = oo16pi2*( betaY31 + oo16pi2 * betaY32 ) 

 
Else 
DY3 = oo16pi2* betaY31 
End If 
 
 
!-------------------- 
! MTF 
!-------------------- 
 
betaMTF1  = 0

 
 
If (TwoLoopRGE) Then 
betaMTF2 = 0

 
DMTF = oo16pi2*( betaMTF1 + oo16pi2 * betaMTF2 ) 

 
Else 
DMTF = oo16pi2* betaMTF1 
End If 
 
 
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
 
 
!-------------------- 
! mu 
!-------------------- 
 
betamu1  = 0

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
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
 
 
!-------------------- 
! mu3 
!-------------------- 
 
betamu31  = 0

 
 
If (TwoLoopRGE) Then 
betamu32 = 0

 
Dmu3 = oo16pi2*( betamu31 + oo16pi2 * betamu32 ) 

 
Else 
Dmu3 = oo16pi2* betamu31 
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
 
 
Call ParametersToG83(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam3,Dlam4,Dlam6,Dlam7,Dlam8,           & 
& Dlam5,DYu,DYd,DYe,Deta,DA,DB,DYf,DY3,DMTF,DMDF,Dmu,DmH2,DmEt2,Dmu3,Dv,f)

Iname = Iname - 1 
 
End Subroutine rge83  

End Module RGEs_radinertDTFDTSDM 
 
