ParameterDefinitions = { 

 (*---- EW PARAMETERS------- *)
   
{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},  
{AlphaS,    {Description -> "Alpha Strong"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
{e,         { Description -> "electric charge"}}, 
{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]] }},  
{v,         { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
               DependenceSPheno -> None }},           

    (*---- YUKAWA PARAMETERS------- *)

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}}, 

    (*---- NEW YUKAWA PARAMETERS------- *)

 {A, { OutputName  -> "A",  
       LesHouches -> Pi1,
       Real -> True,
       LaTeX -> "\\Pi_1"}},
 {B, { OutputName  -> "B",  
       LesHouches -> Pi2,
       Real -> True,
       LaTeX -> "\\Pi_2"}}, 
 {Yf, { OutputName  -> "Yf",  
        LesHouches -> f,
       Real -> True,
        LaTeX -> "f"}}, 
 {Y3, {  OutputName  -> "Y3",  
         LesHouches -> rho,
       Real -> True,
      LaTeX -> "\\rho"}},
{Yn, { OutputName  -> eta,
       LesHouches -> eta,
      Real -> True,
       LaTeX -> "\\eta"}},

(*----- Doublet and triplet Vector Like Fermion----- *)

{MTF, { OutputName  -> MTF,
       LesHouches -> MTF,
      Real -> True,
       LaTeX -> "M_T"}},
{MDF,  { LaTeX -> "M_D",
         OutputName -> MDF,
      Real -> True,
         LesHouches -> MDF}},

(* fermions mixing *) 
 
{Q1,{LaTeX -> "O",
      LesHouches -> NEUTRALMIX,
      OutputName-> O }},
{Q2,{LaTeX -> "Q_{L}",
      LesHouches -> FERMIONMIXL,
      OutputName-> Q2 }},
{Q3,{LaTeX -> "Q_{R}",
      LesHouches -> FERMIONMIXR,
      OutputName-> Q3 }},

(*scalars mixing*)

{ZXP, { LaTeX -> "Z^{\\eta^+}",
      LesHouches -> ZXPMIX,
      OutputName-> ZXP }},
{ZX0, { OutputName  -> ZX0,
       LesHouches -> ZXMIX,
       LaTeX -> "Z^{\\eta^0}"}},    
 
(*---- SM fermions MATRIX------- *)
 
{Vu,{Description ->"Left-Up-Mixing-Matrix",
      LaTeX -> "V^u_L"}},
 {Vd,{Description ->"Left-Down-Mixing-Matrix",
      LaTeX -> "V^d_L"}},
 {Ve,{Description ->"Left-Lepton-Mixing-Matrix",
      LaTeX -> "V^e_L"}},
 {Vv,{Description ->"Neutrino-Mixing-Matrix",
      LesHouches -> NEUTRINOMIX,
      LaTeX -> "V^{\\nu}_L",
      OutputName-> Vv}},
 {Uu,{Description ->"Right-Up-Mixing-Matrix",
      LaTeX -> "V^u_R"}},
 {Ud,{Description ->"Right-Down-Mixing-Matrix",
      LaTeX -> "V^d_R"}},
 {Ue,{Description ->"Right-Lepton-Mixing-Matrix",
     LaTeX -> "V^e_R"}},

(*EW gauge mixing*)

 {ZZ, {Description -> "Photon-Z Mixing Matrix"}},
 {ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {I,-I}} }},

 (*---- SCALAR SECTOR------- *)
    
{mH2, { Description -> "SM Higgs Mass Parameter", Real -> True }},
{mEt2,    { LaTeX -> "\\mu_{\\eta}^2",
            OutputName -> mEt2,
            Real -> True,
            LesHouches -> {HDM,1}}},
{mu3, { LaTeX -> "\\mu_{\\Delta}^2",
        OutputName -> mu3,
        Real -> True,
        LesHouches -> {HDM,2}}},
{lambda1, { LaTeX -> "\\lambda_1",
            OutputName -> "lam1",
            Real -> True,
            LesHouches -> {HDM,3} }},
{lambda2, { LaTeX -> "\\lambda_2",
            OutputName ->"lam2",
            Real -> True,
            LesHouches -> {HDM,4}}},
{lambda3, { LaTeX -> "\\lambda_3",
            OutputName ->"lam3",
            Real -> True,
            LesHouches -> {HDM,5}}},
{lambda4, { LaTeX -> "\\lambda_4",
            OutputName ->"lam4",
            Real -> True,
            LesHouches -> {HDM,6}}},
{lambda5, { LaTeX -> "\\lambda_5",
            OutputName ->"lam5",
            Real  -> True,
            LesHouches -> {HDM,7}}},
{lambda6, { LaTeX -> "\\lambda_{\\Delta}",
            OutputName -> lam6,
            Real -> True,
            LesHouches -> {HDM,8}}},
{lambda7,   { LaTeX -> "\\lambda_{\\Delta H_1}",
              OutputName -> lam7,
              Real -> True,
              LesHouches -> {HDM,9}}}, 
{lambda8, { LaTeX -> "\\lambda_{\\Delta H_2}",
            OutputName -> lam8,
            Real -> True,
            LesHouches -> {HDM,10}}},
{mu,      {  LaTeX -> "\\mu'",
             OutputName -> mu,
             Real -> True,
             LesHouches -> {HDM,11}}},
    
{MSF,   {(*Description -> "Triplet-Mass",*)
         LaTeX -> "M_F",
	 Real -> True;
         OutputName->MFS,
         LesHouches-> {HDM,1} }},


{Ys, { LaTeX -> "Y_S",Real->True,LesHouches -> YS, OutputName-> Ys }}
    
                   
}; 
 

