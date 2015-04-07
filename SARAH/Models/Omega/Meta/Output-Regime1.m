Mathematica 7.0 for Linux x86 (64-bit)
Copyright 1988-2008 Wolfram Research, Inc.

In[1]:= SARAH SARAHVERSION
by Florian Staub, 2013

References:
  Comput.Phys.Commun.181 (2010) 1077-1086. (arXiv:0909.2863[hep-ph])
  Comput.Phys.Commun.182 (2011) 808-833. (arXiv:1002.0840[hep-ph])
  Comput.Phys.Commun.184 (2013) 1792-1809. (arXiv:1207.0906[hep-ph])
  arXiv:1309.7223[hep-ph]
Download and Documentation:
  http://sarah.hepforge.org

Begin evaluation of Model with:       Start["Name of Model"]
  e.g. Start["MSSM"] or Start["NMSSM","CKM"]
To get a list with all installed models, use ShowModels

In[2]:= Initialization

Model file for the Omega Model (Regime-3) loaded
*****************************
Model files loaded   
  Model    : Omega
  Author(s): undefined
  Date     : 2012-09-01
*****************************
******************************************************* 
Loading Susyno functions for the handling of Lie Groups 
Based on Susyno v.2.0 by Renato Fonseca (1106.5016)
webpage: web.ist.utl.pt/renato.fonseca/susyno.html
******************************************************* 
Generate all Superfields
Checking Model Files ...
    Model File is okay
    Particle File is okay
    Parameter File is okay
Check for needed generators
   Calculate Lie Group constants
Create all component Fields
   vector superfields
   chiral superfields
    Create Substitution rules
Generate Parameter Dependences
Set Information for Rotations
Generate cubic Dynkins
Checking Anomalies
     No (bminl)^3 Gauge Anomaly
     No (bminl)x(gravity)^2 Anomaly
     No (left)^3 Gauge Anomaly
     No (right)^3 Gauge Anomaly
     No (color)^3 Gauge Anomaly
     No (left)^2 x bminl Gauge Anomaly
     No (right)^2 x bminl Gauge Anomaly
     No (color)^2 x bminl Gauge Anomaly
     No Witten Anomaly (left)
     No Witten Anomaly (right)
Calc Superpotential
   Defined Mu3 as Symmetric
   Defined B[Mu3] as Symmetric
   Defined f as Symmetric
   Defined T[f] as Symmetric
   Defined AlphaOm as AntiSymmetric
   Defined T[AlphaOm] as AntiSymmetric
Checking charge conservation of superpotential
     No violation of charge conservation in superpotential
     No violation of a global in superpotential
Calc F-Terms
Calc Fermion-Scalar
Calc Soft Breaking
   Defined mqL2 as Hermitian
   Defined mqR2 as Hermitian
   Defined mlL2 as Hermitian
   Defined mlR2 as Hermitian
   Defined mPhi2 as Hermitian
Calc Kinetic Terms
Calc D-Terms
Calc Gaugino Interactions
Calculate Vector Boson - Gaugino - Interactions
Calculate Vector Boson Self Interactions
Calc Gauge Transformations
Calc Complete Lagrangian

-----------------------------------
Evolve States: GaugeES
-----------------------------------
Calc Ghost Interactions
Calc Mixings of Matter Fields
Save Model Information: GaugeES
      TadpoleEquations
      Interactions
      Split Lagrangian

-----------------------------------
Evolve States: EWSB
-----------------------------------
Parametrize Higgs Sector
Update Gauge Transformations
Update Gauge Transformations
Calc Ghost Interactions
Calc Mixings of Matter Fields
Calc Mass Matrices
    For {SdeltaRm, conj[SdeltaRbarp]}
    For {SomegaRm, conj[SomegaRp]}
    For {fWR0, FomegaR0}
    For {fWRm, FomegaRm}{fWRp, FomegaRp}
    For {SdL}
    For {SuL}
    For {SdR}
    For {SuR}
    For {SeL}
    For {SeR}
    For {SvL}
    For {SvR}
    For {SHd0, conj[SHu0]}
    For {SHdm, conj[SHup]}
    For {SomegaLm, conj[SomegaLp]}
    For {SdeltaLp, conj[SdeltaLbarm]}
    For {SdeltaLpp, conj[SdeltaLbarmm]}
    For {SdeltaL0, conj[SdeltaLbar0]}
    For {SdeltaRmm, conj[SdeltaRbarpp]}
    For {SdeltaR0, conj[SdeltaRbar0]}
Update Gauge Transformations
Calculate Tadpole Equations
Save Model Information: EWSB
      TadpoleEquations
      Interactions
      Split Lagrangian

ModelFile::NoGoldstone: 
   No Goldstone boson for (possibly) massive gauge boson VWR0 defined.

-----------------------------------
Finishing
-----------------------------------
Calculate final Lagrangian
Add Matrix Products
Checking for massless particles
Calculating Tree Level Masses
     For GaugeES
     For EWSB
Simplify Mass Matrices
Checking for Spectrum File
     No Spectrum File defined
Reading Parameter Values and Dependences
Calculate Mixing Matrices
Checking for CP even and odd scalars

All Done... Omega is ready!


Are you unfamiliar with SARAH? Use SARAH`FirstSteps

In[3]:= 
Out[3]= {{YQ[index1, index2, 1], 
 
>     -(Csc[Theta1 - Theta2] (Sin[Theta2] Yd[index1, index2] + 
 
>          Sin[Theta1] Yu[index1, index2]))}, 
 
>    {YQ[index1, index2, 2], -(Csc[Theta1 - Theta2] 
 
>        (Cos[Theta2] Yd[index1, index2] + Cos[Theta1] Yu[index1, index2]))}, 
 
>    {YL[index1, index2, 1], -(Csc[Theta1 - Theta2] 
 
>        (Sin[Theta2] Ye[index1, index2] + Sin[Theta1] Yv[index1, index2]))}, 
 
>    {YL[index1, index2, 2], -(Csc[Theta1 - Theta2] 
 
>        (Cos[Theta2] Ye[index1, index2] + Cos[Theta1] Yv[index1, index2]))}, 
 
          gL + gR
>    {g2, -------}}
             2

In[4]:= Checking model for missing definitions

CheckModelFiles::MissingParticle: 
   The following particle are not defined in ParticleDefinitions in
     particles.m: {BinoR1, WinoLr1, GluR1, Fd1r1, Fu1r1, <<18>>, phiOmR, 
     SDL0r1}

CheckModelFiles::MissingOutputName: 
   For the following particles is no OutputName defined: 
    {BinoR1, WinoLr1, GluR1, Fd1r1, <<36>>, SDRmmR1, SDR0r1}

CheckModelFiles::WrongPDG: 
   The number of PDG numbers defined for the following particles does not fit
     to their number of generations: {VB, VWL, VG}

CheckModelFiles::WrongPDGIX: 
   The number of PDG.IX numbers defined for the following particles does not
     fit to their number of generations: {VB, VWL, VG}

CheckModelFiles::MissingOutputNameParameter: 
   For the following parameters is no OutputName defined: 
    {gBL, g2, g3, Mdelta, B[Mdelta], <<46>>, UDL0, UDRmm, UDR0}
Generate Directories
Building Particle List
--------------------------------
Calculate supersymmetric RGEs   
--------------------------------
Making Lists of Particles and Couplings
Calculating anomalous Dimensions
Calculate Beta Functions for trilinear Superpotential parameters
Calculate Beta Functions for bilinear Superpotential parameters
Calculate Beta Functions for linear Superpotential parameters
Calculate Beta Functions for trilinear soft breaking parameters
Calculate Beta Functions for bilinear soft breaking parameters
Calculate Beta Functions for linear soft breaking parameters
Calculate Traces for soft-scalar masses
Calculate Beta Functions for scalar soft breaking masses
Calculate Beta Functions for Gaugino masses
Calculate Beta Functions for Gauge Couplings
Calculate Beta Functions for 4-point Superpotential parameters
Calculate Beta Functions for 4-point soft breaking parameters
Calculate Beta Functions for VEVs

Finished with the calculation of the RGEs
The results are saved in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omeg\
 
>    a-Regime-1/RGEs/
--------------------------------
Generate SPheno Source Code
--------------------------------
Build parameter lists
-----------------------------------
Write RGEs for Low Scale Parameters
-----------------------------------
Write Function GToParameters
Write Function ParametersToG
Write RGE Function
-------------------------------
Write RGEs including VEVs      
-------------------------------
Write Function GToParameters
Write Function ParametersToG
Write RGE Function
----------------------------------------------
Writing Routines for Tree Level-Masses
----------------------------------------------
Getting needed Information
Writing Routine for Calculating all Masses
Write Tree-Level Masses for BinoR1
Write Tree-Level Masses for WinoLr1
Write Tree-Level Masses for GluR1
Write Tree-Level Masses for Fd1r1
Write Tree-Level Masses for Fu1r1
Write Tree-Level Masses for Fd2r1
Write Tree-Level Masses for Fu2r1
Write Tree-Level Masses for Fe1r1
Write Tree-Level Masses for FvL1
Write Tree-Level Masses for Fe2r1
Write Tree-Level Masses for FvR1
Write Tree-Level Masses for H0r1
Write Tree-Level Masses for HCr1
Write Tree-Level Masses for DL3r1
Write Tree-Level Masses for DL1r1
Write Tree-Level Masses for DL2r1
Write Tree-Level Masses for DR1r1
Write Tree-Level Masses for DR2r1
Write Tree-Level Masses for DR3r1
Write Tree-Level Masses for Om1r1
Write Tree-Level Masses for Om2r1
Write Tree-Level Masses for SomegaL0
Write Tree-Level Masses for sigmaOmR
Write Tree-Level Masses for phiOmR
Write Tree-Level Masses for VB
Write Tree-Level Masses for VWL
Write Tree-Level Masses for VG
Write Tree-Level Masses for VWRm
Write Tree-Level Masses for VWR0
Writing Subroutine for Calculating MHpm1R1
Writing Subroutine for Calculating MHpm2R1
Writing Subroutine for Calculating MCha1r1
Writing Subroutine for Calculating MSH0r1
Writing Subroutine for Calculating MSHCr1
Writing Subroutine for Calculating MSDLpR1
Writing Subroutine for Calculating MSDLppR1
Writing Subroutine for Calculating MSDL0r1
Writing Subroutine for Calculating MSDRmmR1
Writing Subroutine for Calculating {MVWRm}

Intersection::normal: 
   Nonatomic expression expected at position 1 in Intersection[List].

Part::partd: Part specification List[[3]] is longer than depth of object.

Part::partd: Part specification List[[3]] is longer than depth of object.
--------------------------------------
Writing Routines for Tadpole Equations 
--------------------------------------
Writing solver for tadpole equations 
Writing tadpole equations 
--------------------------------------
Writing SPheno Shifts for Parameters 
--------------------------------------
Subroutine for Shifts up and dowm

Finished! Output is in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omega-\
 
>    Regime-1/EWSB/SPheno/

The following steps are now necessary to implement the model in SPheno: 
  1. Copy the created files to a new subdirectory "/Omega" of your SPheno\
 
>    3.2.4 (or later) installation
  2. Compile the model by using 
        make Model=Omega
     in the main directory of SPheno

In[5]:= 