
ParticleDefinitions[GaugeES] = {

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
                 PDG.IX -> {101000001} }}, 
                 
     {G0   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0} }},  

     {H0   ,  {  OutputName ->"H0",
                 PDG -> {35},
                 PDG.IX -> {101000001},
                 LaTeX -> "H" }}, 
                 
     {A0   ,  {  OutputName ->"A0",
                 PDG -> {36},
                 LaTeX -> "A^0" }},             
            
      
(*
      {hh   ,  {  Description -> "Higgs"                  }}, 
                 
      {Ah   ,  {  Description -> "Pseudo-Scalar Higgs" }},                       
  *)    
      
      {Hpm,  { Description -> "Charged Higgs"}},                                                   
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> G0}}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson" }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }}, 
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }}                                                              
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
                 
       {phid,   {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{d}",
                 OutputName -> "" }},                                                                       
   
   
       {phiu,   {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{u}",
                 OutputName -> "" }}, 
                                                                                       
    {sigmad,   {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{d}",
                 OutputName -> "" }},
                                                                                        
    {sigmau,   {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{u}",
                 OutputName -> "" }}


        };       


