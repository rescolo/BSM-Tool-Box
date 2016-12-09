
ParticleDefinitions[GaugeES] = {
    
    {HO,  {    PDG -> {0},
                Width -> 0,
                Mass -> Automatic,
                FeynArtsNr -> 1,
                LaTeX -> "H^0",
                OutputName -> "H0" }},
    
    {etO,  {   PDG -> {0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\eta^0",
	       FeynArtsNr -> 2,
               OutputName -> "et0" }},

    {Hp,  {    PDG -> {0},
               Width -> 0,
               Mass -> Automatic,
               FeynArtsNr -> 3,
               LaTeX -> "H^+",
               OutputName -> "Hp" }},

    {vu, { LaTeX -> "D_2^2",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 15,
	     OutputName -> "Nu"}},
    {eu, { LaTeX -> "D_2^1",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 16,
	     OutputName -> "eu"}},
    {vd, { LaTeX -> "D_1^1",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 17,
	     OutputName -> "Nd"}},
    {ed, { LaTeX -> "D_1^2",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 18,
	     OutputName -> "ed"}},
    {T0, { LaTeX -> "\\tau_2",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 19,
	     OutputName -> "T0"}}, 
    {Tp, { LaTeX -> "\\tau_1",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 20,
	     OutputName -> "Tp"}},  
    {Tm, { LaTeX -> "\\tau_3",
	     Width -> 0, 
	     Mass -> Automatic,
	     FeynArtsNr -> 21,
	     OutputName -> "Tm"}},  

    {SO, { LaTeX -> "\\Delta_0",
             Width -> 0, 
             Mass -> Automatic,
             FeynArtsNr -> 199,
             OutputName -> "S0"}}, 
   {Sp, { LaTeX -> "\\Delta^+",
             Width -> 0, 
             Mass -> Automatic,
             FeynArtsNr -> 209,
             OutputName -> "Sp"}},  
    {Sm, { LaTeX -> "\\Deta^-",
             Width -> 0, 
             Mass -> Automatic,
             FeynArtsNr -> 219,
             OutputName -> "Sm"}}, 

 
    {etp,  {    PDG -> {0},
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
                 Mass -> Automatic, 
                 PDG.IX -> {101000001} }}, 

      {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 FeynArtsNr -> 2,
                 LaTeX -> "G^0",
                 Width -> {0} }}, 
                 
    {etI   , { Description -> "CP-odd eta scalar",
	       PDG -> {1002},
               Mass -> LesHouches,
               FeynArtsNr -> 6,
               LaTeX -> "\\eta_I",
               ElectricCharge -> 0,
       	       OutputName -> "etI" }}, 
 
     {Hp,     { (*Description -> "Charged Higgs",*)
               PDG -> {0},
               LaTeX->"G^+",
               PDG.IX ->{0},
               Width -> {0},
               Mass -> {0},
	       FeynArtsNr -> 40,
               ElectricCharge -> +1,
	       OutputName -> "Hp" }},

     {XP,  {  Description -> "Charged eta scalar",
              PDG -> {1003,1004},
              FeynArtsNr -> 7,
              Mass -> {LesHouches, LesHouches},
              LaTeX->"\\kappa^+",
              ElectricCharge -> 1,
              OutputName -> "XP"  }},

     {XO,  { Description -> "CP-even eta scalar",
              PDG -> {1005,1006,1007},
              FeynArtsNr -> 5,
              Mass -> {LesHouches, LesHouches, LesHouches},
              LaTeX->"\\kappa^0",
              ElectricCharge -> 0,
              OutputName -> "XO"  }},
       
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
      {Fv,   { Description -> "Neutrinos" }},

      {Nv,  {  Description -> "Neutral fermions",
	     PDG -> {310000601,310000602,310000603},
	     LaTeX ->"N",
	     OutputName -> "Nv",
	     FeynArtsNr -> 9,
	     Mass -> {LesHouches,LesHouches,LesHouches},
	     ElectricCharge -> 0}},
 
     {Chi,  {  Description -> "Charged fermions",
	       PDG -> {210000601,210000602,210000603},
               LaTeX ->"\\chi",
	       OutputName -> "ci",
	       Mass ->  {LesHouches,LesHouches,LesHouches},
	       ElectricCharge -> -1,
	       FeynArtsNr -> 10 }}

     
        };    
        
        
        
 WeylFermionAndIndermediate = {
                 
   {H, {LaTeX -> "H"}},
   {Ah, {LaTeX -> "G^0"}},
   {etR, {LaTeX -> "H^0"}},
   {S0,     {LaTeX -> "S^0" }},
   {Et,    {LaTeX -> "\\eta"}},
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {l,      {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,      {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {VL,     {LaTeX -> "N_L" }}, 
   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   (* Vector-like fields *)
   {s1,     {LaTeX -> "N_L" }},
   {ch1,     {LaTeX -> "\\chi_1" }},
   {ch2,     {LaTeX -> "\\chi_2" }},
   {XO,     {LaTeX -> "X^0" }},
   {T,      {LaTeX -> "\\Sigma" }},  
   {n,      {LaTeX -> "N" }},
   {nR,     {LaTeX -> "\\nu_R"}},
   {esd,     {LaTeX -> "e_{sd}^+" }},
   {esu,     {LaTeX -> "e_{su}^-" }}


        };       



