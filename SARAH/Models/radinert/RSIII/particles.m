

ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
        
        
      (* New Scalar Sector *)
      
      {et0, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^0",
                 OutputName -> "et0" }},

      {etp, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^+",
                 OutputName -> "etp" }}, 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
     {hh   ,  {  Description -> "Higgs",
                 PDG -> {25},
                 PDG.IX -> {101000001}  }}, 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0}  }},                       
     {Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 OutputName -> {"Hp","Hm"}  }},    
      
      
      (* New Scalar Sector *)
      
      {etR,   {  Description -> "CP-even eta scalar", 
		 PDG -> {35},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_R",
		 OutputName -> "etR"  }}, 
      {etI,   {  Description -> "CP-odd eta scalar", 
		 PDG -> {36},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_I",
		 OutputName -> "etI"  }}, 
      {etp,   {  Description -> "Charged eta scalar", 
		 PDG -> {37},
		 Mass -> LesHouches,
		 ElectricCharge -> 1,
		 LaTeX -> "\\eta^+",
                 OutputName -> "etp"  }},            
                 
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson", Goldstone -> Ah }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson", Goldstone -> Hp }},         
 
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }} ,
    
    
      (* New Fermion Sector *)
      
       {Ft0,  { PDG -> {6000057, 6000058, 6000059 },
              Width -> {External, External, External},
	      Mass -> {LesHouches, LesHouches, LesHouches}, 
              ElectricCharge -> 0,
              LaTeX -> "Ft0",
	      OutputName -> "Ft0" }},

      {Ftc,  { PDG -> {6000061, 6000062, 6000063},
              Width -> {External,External,External},
	      Mass -> {LesHouches,LesHouches,LesHouches},
	      ElectricCharge -> -1,
              LaTeX -> "Ftc",
	      OutputName -> "Ftc" }}
            
      };    
        
        
        
 WeylFermionAndIndermediate = {
     
   {H,     {LaTeX -> "H"}},
   {Et,     {LaTeX -> "\\eta"}},  

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {VL,     {LaTeX -> "V_L" }},
   
   {T,     {LaTeX -> "T^F" }},
   {t0,     {LaTeX -> "T^0" }},
   {tp,     {LaTeX -> "T^+" }},
   {tm,     {LaTeX -> "T^-" }}
 
    };       


