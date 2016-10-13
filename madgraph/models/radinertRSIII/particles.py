# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.9.1 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 15:10 on 13.10.2016   
# ----------------------------------------------------------------------  
 
 
from __future__ import division 
from object_library import all_particles,Particle 
import parameters as Param 


Ft01 = Particle(pdg_code =6000057, 
	 name = 'Ft01' ,
	 antiname = 'Ft01' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFt01 ,
	 width = Param.WFt01 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'Ft01' ,
	 antitexname = 'Ft01' ) 
 
Ft02 = Particle(pdg_code =6000058, 
	 name = 'Ft02' ,
	 antiname = 'Ft02' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFt02 ,
	 width = Param.WFt02 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'Ft02' ,
	 antitexname = 'Ft02' ) 
 
Ft03 = Particle(pdg_code =6000059, 
	 name = 'Ft03' ,
	 antiname = 'Ft03' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFt03 ,
	 width = Param.WFt03 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = 0 ,
	 texname = 'Ft03' ,
	 antitexname = 'Ft03' ) 
 
Ftc1 = Particle(pdg_code =6000061, 
	 name = 'Ftc1' ,
	 antiname = 'Ftc1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFtc1 ,
	 width = Param.WFtc1 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1 ,
	 texname = 'Ftc1' ,
	 antitexname = 'Ftc1bar' ) 
 
Ftc1bar = Ftc1.anti() 
 
 
Ftc2 = Particle(pdg_code =6000062, 
	 name = 'Ftc2' ,
	 antiname = 'Ftc2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFtc2 ,
	 width = Param.WFtc2 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1 ,
	 texname = 'Ftc2' ,
	 antitexname = 'Ftc2bar' ) 
 
Ftc2bar = Ftc2.anti() 
 
 
Ftc3 = Particle(pdg_code =6000063, 
	 name = 'Ftc3' ,
	 antiname = 'Ftc3bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.MFtc3 ,
	 width = Param.WFtc3 ,
	 GhostNumber = 0, 
	 line = 'swavy' ,
	 charge = -1 ,
	 texname = 'Ftc3' ,
	 antitexname = 'Ftc3bar' ) 
 
Ftc3bar = Ftc3.anti() 
 
 
nu1 = Particle(pdg_code =12, 
	 name = 'nu1' ,
	 antiname = 'nu1' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu1' ,
	 antitexname = 'nu1' ) 
 
nu2 = Particle(pdg_code =14, 
	 name = 'nu2' ,
	 antiname = 'nu2' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu2' ,
	 antitexname = 'nu2' ) 
 
nu3 = Particle(pdg_code =16, 
	 name = 'nu3' ,
	 antiname = 'nu3' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 0 ,
	 texname = 'nu3' ,
	 antitexname = 'nu3' ) 
 
d1 = Particle(pdg_code =1, 
	 name = 'd1' ,
	 antiname = 'd1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd1' ,
	 antitexname = 'd1bar' ) 
 
d1bar = d1.anti() 
 
 
d2 = Particle(pdg_code =3, 
	 name = 'd2' ,
	 antiname = 'd2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd2' ,
	 antitexname = 'd2bar' ) 
 
d2bar = d2.anti() 
 
 
d3 = Particle(pdg_code =5, 
	 name = 'd3' ,
	 antiname = 'd3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Md3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1/3 ,
	 texname = 'd3' ,
	 antitexname = 'd3bar' ) 
 
d3bar = d3.anti() 
 
 
u1 = Particle(pdg_code =2, 
	 name = 'u1' ,
	 antiname = 'u1bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u1' ,
	 antitexname = 'u1bar' ) 
 
u1bar = u1.anti() 
 
 
u2 = Particle(pdg_code =4, 
	 name = 'u2' ,
	 antiname = 'u2bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u2' ,
	 antitexname = 'u2bar' ) 
 
u2bar = u2.anti() 
 
 
u3 = Particle(pdg_code =6, 
	 name = 'u3' ,
	 antiname = 'u3bar' ,
	 spin = 2 ,
	 color = 3 ,
	 mass = Param.Mu3 ,
	 width = Param.Wu3 ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = 2/3 ,
	 texname = 'u3' ,
	 antitexname = 'u3bar' ) 
 
u3bar = u3.anti() 
 
 
e1 = Particle(pdg_code =11, 
	 name = 'e1' ,
	 antiname = 'e1bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me1 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e1' ,
	 antitexname = 'e1bar' ) 
 
e1bar = e1.anti() 
 
 
e2 = Particle(pdg_code =13, 
	 name = 'e2' ,
	 antiname = 'e2bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me2 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e2' ,
	 antitexname = 'e2bar' ) 
 
e2bar = e2.anti() 
 
 
e3 = Particle(pdg_code =15, 
	 name = 'e3' ,
	 antiname = 'e3bar' ,
	 spin = 2 ,
	 color = 1 ,
	 mass = Param.Me3 ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'straight' ,
	 charge = -1 ,
	 texname = 'e3' ,
	 antitexname = 'e3bar' ) 
 
e3bar = e3.anti() 
 
 
Hp = Particle(pdg_code =999900, 
	 name = 'Hp' ,
	 antiname = 'Hpc' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = -1 ,
	 GoldstoneBoson = True ,
	 texname = 'Hp' ,
	 antitexname = 'Hpc' ) 
 
Hpc = Hp.anti() 
 
 
etp = Particle(pdg_code =37, 
	 name = 'etp' ,
	 antiname = 'etpc' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Metp ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 1 ,
	 texname = 'etp' ,
	 antitexname = 'etpc' ) 
 
etpc = etp.anti() 
 
 
Ah = Particle(pdg_code =999901, 
	 name = 'Ah' ,
	 antiname = 'Ah' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 GoldstoneBoson = True ,
	 texname = 'Ah' ,
	 antitexname = 'Ah' ) 
 
h = Particle(pdg_code =25, 
	 name = 'h' ,
	 antiname = 'h' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.Mh ,
	 width = Param.Wh ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'h' ,
	 antitexname = 'h' ) 
 
etI = Particle(pdg_code =36, 
	 name = 'etI' ,
	 antiname = 'etI' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MetI ,
	 width = Param.WetI ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'etI' ,
	 antitexname = 'etI' ) 
 
etR = Particle(pdg_code =35, 
	 name = 'etR' ,
	 antiname = 'etR' ,
	 spin = 1 ,
	 color = 1 ,
	 mass = Param.MetR ,
	 width = Param.WetR ,
	 GhostNumber = 0, 
	 line = 'dashed' ,
	 charge = 0 ,
	 texname = 'etR' ,
	 antitexname = 'etR' ) 
 
g = Particle(pdg_code =21, 
	 name = 'g' ,
	 antiname = 'g' ,
	 spin = 3 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'g' ,
	 antitexname = 'g' ) 
 
A = Particle(pdg_code =22, 
	 name = 'A' ,
	 antiname = 'A' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'A' ,
	 antitexname = 'A' ) 
 
Z = Particle(pdg_code =23, 
	 name = 'Z' ,
	 antiname = 'Z' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 0 ,
	 texname = 'Z' ,
	 antitexname = 'Z' ) 
 
Wp = Particle(pdg_code =24, 
	 name = 'Wp' ,
	 antiname = 'Wpc' ,
	 spin = 3 ,
	 color = 1 ,
	 mass = Param.MWp ,
	 width = Param.WWp ,
	 GhostNumber = 0, 
	 line = 'wavy' ,
	 charge = 1 ,
	 texname = 'Wp' ,
	 antitexname = 'Wpc' ) 
 
Wpc = Wp.anti() 
 
 
gG = Particle(pdg_code =999902, 
	 name = 'gG' ,
	 antiname = 'gGc' ,
	 spin = -1 ,
	 color = 8 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gG' ,
	 antitexname = 'gGc' ) 
 
gGc = gG.anti() 
 
 
gA = Particle(pdg_code =999903, 
	 name = 'gA' ,
	 antiname = 'gAc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.ZERO ,
	 width = Param.ZERO ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gA' ,
	 antitexname = 'gAc' ) 
 
gAc = gA.anti() 
 
 
gZ = Particle(pdg_code =999904, 
	 name = 'gZ' ,
	 antiname = 'gZc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MZ ,
	 width = Param.WZ ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 0 ,
	 texname = 'gZ' ,
	 antitexname = 'gZc' ) 
 
gZc = gZ.anti() 
 
 
gWp = Particle(pdg_code =999905, 
	 name = 'gWp' ,
	 antiname = 'gWpc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWp ,
	 width = Param.WWp ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = 1 ,
	 texname = 'gWp' ,
	 antitexname = 'gWpc' ) 
 
gWpc = gWp.anti() 
 
 
gWC = Particle(pdg_code =999906, 
	 name = 'gWC' ,
	 antiname = 'gWCc' ,
	 spin = -1 ,
	 color = 1 ,
	 mass = Param.MWp ,
	 width = Param.WWp ,
	 GhostNumber = 1, 
	 line = 'dotted' ,
	 charge = -1 ,
	 texname = 'gWC' ,
	 antitexname = 'gWCc' ) 
 
gWCc = gWC.anti() 
 
 
