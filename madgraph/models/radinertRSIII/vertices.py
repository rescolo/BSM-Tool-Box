# ------------------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.9.1 
# SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223   
# (c) Florian Staub, 2013  
# -------------------------------------------------------------------------------  
# File created at 19:40 on 18.10.2016   
# ----------------------------------------------------------------------  
 
 
from object_library import all_vertices,Vertex 
import particles as P 
import couplings as C 
import lorentz as L 
 
 
V_1 = Vertex(name = 'V_1', 
	 particles = [P.Ah, P.Ah, P.h], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_1}) 
 
 
V_2 = Vertex(name = 'V_2', 
	 particles = [P.Ah, P.etI, P.etR], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_2}) 
 
 
V_3 = Vertex(name = 'V_3', 
	 particles = [P.etI, P.etI, P.h], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_3}) 
 
 
V_4 = Vertex(name = 'V_4', 
	 particles = [P.etI, P.etp, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_4}) 
 
 
V_5 = Vertex(name = 'V_5', 
	 particles = [P.etI, P.Hp, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_5}) 
 
 
V_6 = Vertex(name = 'V_6', 
	 particles = [P.etp, P.etR, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_6}) 
 
 
V_7 = Vertex(name = 'V_7', 
	 particles = [P.etp, P.h, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_7}) 
 
 
V_8 = Vertex(name = 'V_8', 
	 particles = [P.etR, P.etR, P.h], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_8}) 
 
 
V_9 = Vertex(name = 'V_9', 
	 particles = [P.etR, P.Hp, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_9}) 
 
 
V_10 = Vertex(name = 'V_10', 
	 particles = [P.h, P.h, P.h], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_10}) 
 
 
V_11 = Vertex(name = 'V_11', 
	 particles = [P.h, P.Hp, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.SSS1], 
	 couplings = {(0,0):C.GC_11}) 
 
 
V_12 = Vertex(name = 'V_12', 
	 particles = [P.Ah, P.Ah, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_12}) 
 
 
V_13 = Vertex(name = 'V_13', 
	 particles = [P.Ah, P.Ah, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_13}) 
 
 
V_14 = Vertex(name = 'V_14', 
	 particles = [P.Ah, P.Hp, P.Wpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_14}) 
 
 
V_15 = Vertex(name = 'V_15', 
	 particles = [P.Ah, P.Hp, P.Wpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_15}) 
 
 
V_16 = Vertex(name = 'V_16', 
	 particles = [P.Ah, P.Hpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_16}) 
 
 
V_17 = Vertex(name = 'V_17', 
	 particles = [P.Ah, P.Hpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_17}) 
 
 
V_18 = Vertex(name = 'V_18', 
	 particles = [P.etI, P.etI, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_18}) 
 
 
V_19 = Vertex(name = 'V_19', 
	 particles = [P.etI, P.etI, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_19}) 
 
 
V_20 = Vertex(name = 'V_20', 
	 particles = [P.etI, P.etp, P.Wpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_20}) 
 
 
V_21 = Vertex(name = 'V_21', 
	 particles = [P.etI, P.etp, P.Wpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_21}) 
 
 
V_22 = Vertex(name = 'V_22', 
	 particles = [P.etI, P.etpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_22}) 
 
 
V_23 = Vertex(name = 'V_23', 
	 particles = [P.etI, P.etpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_23}) 
 
 
V_24 = Vertex(name = 'V_24', 
	 particles = [P.etp, P.etR, P.Wpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_24}) 
 
 
V_25 = Vertex(name = 'V_25', 
	 particles = [P.etp, P.etR, P.Wpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_25}) 
 
 
V_26 = Vertex(name = 'V_26', 
	 particles = [P.etp, P.etpc, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_26}) 
 
 
V_27 = Vertex(name = 'V_27', 
	 particles = [P.etp, P.etpc, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_27}) 
 
 
V_28 = Vertex(name = 'V_28', 
	 particles = [P.etp, P.etpc, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_28}) 
 
 
V_29 = Vertex(name = 'V_29', 
	 particles = [P.etp, P.etpc, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_29}) 
 
 
V_30 = Vertex(name = 'V_30', 
	 particles = [P.etR, P.etR, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_30}) 
 
 
V_31 = Vertex(name = 'V_31', 
	 particles = [P.etR, P.etR, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_31}) 
 
 
V_32 = Vertex(name = 'V_32', 
	 particles = [P.etR, P.etpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_32}) 
 
 
V_33 = Vertex(name = 'V_33', 
	 particles = [P.etR, P.etpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_33}) 
 
 
V_34 = Vertex(name = 'V_34', 
	 particles = [P.h, P.h, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_34}) 
 
 
V_35 = Vertex(name = 'V_35', 
	 particles = [P.h, P.h, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_35}) 
 
 
V_36 = Vertex(name = 'V_36', 
	 particles = [P.h, P.Hp, P.Wpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_36}) 
 
 
V_37 = Vertex(name = 'V_37', 
	 particles = [P.h, P.Hp, P.Wpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_37}) 
 
 
V_38 = Vertex(name = 'V_38', 
	 particles = [P.h, P.Hpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_38}) 
 
 
V_39 = Vertex(name = 'V_39', 
	 particles = [P.h, P.Hpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_39}) 
 
 
V_40 = Vertex(name = 'V_40', 
	 particles = [P.Hp, P.Hpc, P.A, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_40}) 
 
 
V_41 = Vertex(name = 'V_41', 
	 particles = [P.Hp, P.Hpc, P.A, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_41}) 
 
 
V_42 = Vertex(name = 'V_42', 
	 particles = [P.Hp, P.Hpc, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_42}) 
 
 
V_43 = Vertex(name = 'V_43', 
	 particles = [P.Hp, P.Hpc, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSVV1], 
	 couplings = {(0,0):C.GC_43}) 
 
 
V_44 = Vertex(name = 'V_44', 
	 particles = [P.Ah, P.h, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_44}) 
 
 
V_45 = Vertex(name = 'V_45', 
	 particles = [P.Ah, P.Hp, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_45}) 
 
 
V_46 = Vertex(name = 'V_46', 
	 particles = [P.Ah, P.Hpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_46}) 
 
 
V_47 = Vertex(name = 'V_47', 
	 particles = [P.etI, P.etp, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_47}) 
 
 
V_48 = Vertex(name = 'V_48', 
	 particles = [P.etI, P.etR, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_48}) 
 
 
V_49 = Vertex(name = 'V_49', 
	 particles = [P.etI, P.etpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_49}) 
 
 
V_50 = Vertex(name = 'V_50', 
	 particles = [P.etp, P.etR, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_50}) 
 
 
V_51 = Vertex(name = 'V_51', 
	 particles = [P.etp, P.etpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_51}) 
 
 
V_52 = Vertex(name = 'V_52', 
	 particles = [P.etp, P.etpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_52}) 
 
 
V_53 = Vertex(name = 'V_53', 
	 particles = [P.etR, P.etpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_53}) 
 
 
V_54 = Vertex(name = 'V_54', 
	 particles = [P.h, P.Hp, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_54}) 
 
 
V_55 = Vertex(name = 'V_55', 
	 particles = [P.h, P.Hpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_55}) 
 
 
V_56 = Vertex(name = 'V_56', 
	 particles = [P.Hp, P.Hpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_56}) 
 
 
V_57 = Vertex(name = 'V_57', 
	 particles = [P.Hp, P.Hpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SSV1], 
	 couplings = {(0,0):C.GC_57}) 
 
 
V_58 = Vertex(name = 'V_58', 
	 particles = [P.h, P.Wpc, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_58}) 
 
 
V_59 = Vertex(name = 'V_59', 
	 particles = [P.h, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_59}) 
 
 
V_60 = Vertex(name = 'V_60', 
	 particles = [P.Hp, P.Wpc, P.A], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_60}) 
 
 
V_61 = Vertex(name = 'V_61', 
	 particles = [P.Hp, P.Wpc, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_61}) 
 
 
V_62 = Vertex(name = 'V_62', 
	 particles = [P.Hpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_62}) 
 
 
V_63 = Vertex(name = 'V_63', 
	 particles = [P.Hpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.SVV1], 
	 couplings = {(0,0):C.GC_63}) 
 
 
V_64 = Vertex(name = 'V_64', 
	 particles = [P.d1bar, P.d1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_64,(0,1):C.GC_65}) 
 
 
V_65 = Vertex(name = 'V_65', 
	 particles = [P.d1bar, P.d2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_66,(0,1):C.GC_67}) 
 
 
V_66 = Vertex(name = 'V_66', 
	 particles = [P.d1bar, P.d3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_68,(0,1):C.GC_69}) 
 
 
V_67 = Vertex(name = 'V_67', 
	 particles = [P.d2bar, P.d1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_70,(0,1):C.GC_71}) 
 
 
V_68 = Vertex(name = 'V_68', 
	 particles = [P.d2bar, P.d2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_72,(0,1):C.GC_73}) 
 
 
V_69 = Vertex(name = 'V_69', 
	 particles = [P.d2bar, P.d3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_74,(0,1):C.GC_75}) 
 
 
V_70 = Vertex(name = 'V_70', 
	 particles = [P.d3bar, P.d1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_76,(0,1):C.GC_77}) 
 
 
V_71 = Vertex(name = 'V_71', 
	 particles = [P.d3bar, P.d2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_78,(0,1):C.GC_79}) 
 
 
V_72 = Vertex(name = 'V_72', 
	 particles = [P.d3bar, P.d3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_80,(0,1):C.GC_81}) 
 
 
V_73 = Vertex(name = 'V_73', 
	 particles = [P.e1bar, P.e1, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_82,(0,1):C.GC_83}) 
 
 
V_74 = Vertex(name = 'V_74', 
	 particles = [P.e1bar, P.e2, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_84,(0,1):C.GC_85}) 
 
 
V_75 = Vertex(name = 'V_75', 
	 particles = [P.e1bar, P.e3, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_86,(0,1):C.GC_87}) 
 
 
V_76 = Vertex(name = 'V_76', 
	 particles = [P.e2bar, P.e1, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_88,(0,1):C.GC_89}) 
 
 
V_77 = Vertex(name = 'V_77', 
	 particles = [P.e2bar, P.e2, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_90,(0,1):C.GC_91}) 
 
 
V_78 = Vertex(name = 'V_78', 
	 particles = [P.e2bar, P.e3, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_92,(0,1):C.GC_93}) 
 
 
V_79 = Vertex(name = 'V_79', 
	 particles = [P.e3bar, P.e1, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_94,(0,1):C.GC_95}) 
 
 
V_80 = Vertex(name = 'V_80', 
	 particles = [P.e3bar, P.e2, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_96,(0,1):C.GC_97}) 
 
 
V_81 = Vertex(name = 'V_81', 
	 particles = [P.e3bar, P.e3, P.Ah], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_98,(0,1):C.GC_99}) 
 
 
V_82 = Vertex(name = 'V_82', 
	 particles = [P.u1bar, P.u1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_100,(0,1):C.GC_101}) 
 
 
V_83 = Vertex(name = 'V_83', 
	 particles = [P.u1bar, P.u2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_102,(0,1):C.GC_103}) 
 
 
V_84 = Vertex(name = 'V_84', 
	 particles = [P.u1bar, P.u3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_104,(0,1):C.GC_105}) 
 
 
V_85 = Vertex(name = 'V_85', 
	 particles = [P.u2bar, P.u1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_106,(0,1):C.GC_107}) 
 
 
V_86 = Vertex(name = 'V_86', 
	 particles = [P.u2bar, P.u2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_108,(0,1):C.GC_109}) 
 
 
V_87 = Vertex(name = 'V_87', 
	 particles = [P.u2bar, P.u3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_110,(0,1):C.GC_111}) 
 
 
V_88 = Vertex(name = 'V_88', 
	 particles = [P.u3bar, P.u1, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_112,(0,1):C.GC_113}) 
 
 
V_89 = Vertex(name = 'V_89', 
	 particles = [P.u3bar, P.u2, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_114,(0,1):C.GC_115}) 
 
 
V_90 = Vertex(name = 'V_90', 
	 particles = [P.u3bar, P.u3, P.Ah], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_116,(0,1):C.GC_117}) 
 
 
V_91 = Vertex(name = 'V_91', 
	 particles = [P.Ftc1bar, P.e1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_118}) 
 
 
V_92 = Vertex(name = 'V_92', 
	 particles = [P.Ftc1bar, P.e2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_119}) 
 
 
V_93 = Vertex(name = 'V_93', 
	 particles = [P.Ftc1bar, P.e3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_120}) 
 
 
V_94 = Vertex(name = 'V_94', 
	 particles = [P.Ftc2bar, P.e1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_121}) 
 
 
V_95 = Vertex(name = 'V_95', 
	 particles = [P.Ftc2bar, P.e2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_122}) 
 
 
V_96 = Vertex(name = 'V_96', 
	 particles = [P.Ftc2bar, P.e3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_123}) 
 
 
V_97 = Vertex(name = 'V_97', 
	 particles = [P.Ftc3bar, P.e1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_124}) 
 
 
V_98 = Vertex(name = 'V_98', 
	 particles = [P.Ftc3bar, P.e2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_125}) 
 
 
V_99 = Vertex(name = 'V_99', 
	 particles = [P.Ftc3bar, P.e3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_126}) 
 
 
V_100 = Vertex(name = 'V_100', 
	 particles = [P.Ft01, P.nu1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_127,(0,1):C.GC_128}) 
 
 
V_101 = Vertex(name = 'V_101', 
	 particles = [P.Ft01, P.nu2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_129,(0,1):C.GC_130}) 
 
 
V_102 = Vertex(name = 'V_102', 
	 particles = [P.Ft01, P.nu3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_131,(0,1):C.GC_132}) 
 
 
V_103 = Vertex(name = 'V_103', 
	 particles = [P.Ft02, P.nu1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_133,(0,1):C.GC_134}) 
 
 
V_104 = Vertex(name = 'V_104', 
	 particles = [P.Ft02, P.nu2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_135,(0,1):C.GC_136}) 
 
 
V_105 = Vertex(name = 'V_105', 
	 particles = [P.Ft02, P.nu3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_137,(0,1):C.GC_138}) 
 
 
V_106 = Vertex(name = 'V_106', 
	 particles = [P.Ft03, P.nu1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_139,(0,1):C.GC_140}) 
 
 
V_107 = Vertex(name = 'V_107', 
	 particles = [P.Ft03, P.nu2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_141,(0,1):C.GC_142}) 
 
 
V_108 = Vertex(name = 'V_108', 
	 particles = [P.Ft03, P.nu3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_143,(0,1):C.GC_144}) 
 
 
V_109 = Vertex(name = 'V_109', 
	 particles = [P.e1bar, P.Ftc1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_145}) 
 
 
V_110 = Vertex(name = 'V_110', 
	 particles = [P.e1bar, P.Ftc2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_146}) 
 
 
V_111 = Vertex(name = 'V_111', 
	 particles = [P.e1bar, P.Ftc3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_147}) 
 
 
V_112 = Vertex(name = 'V_112', 
	 particles = [P.e2bar, P.Ftc1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_148}) 
 
 
V_113 = Vertex(name = 'V_113', 
	 particles = [P.e2bar, P.Ftc2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_149}) 
 
 
V_114 = Vertex(name = 'V_114', 
	 particles = [P.e2bar, P.Ftc3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_150}) 
 
 
V_115 = Vertex(name = 'V_115', 
	 particles = [P.e3bar, P.Ftc1, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_151}) 
 
 
V_116 = Vertex(name = 'V_116', 
	 particles = [P.e3bar, P.Ftc2, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_152}) 
 
 
V_117 = Vertex(name = 'V_117', 
	 particles = [P.e3bar, P.Ftc3, P.etI], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_153}) 
 
 
V_118 = Vertex(name = 'V_118', 
	 particles = [P.Ft01, P.e1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_154}) 
 
 
V_119 = Vertex(name = 'V_119', 
	 particles = [P.Ft01, P.e2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_155}) 
 
 
V_120 = Vertex(name = 'V_120', 
	 particles = [P.Ft01, P.e3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_156}) 
 
 
V_121 = Vertex(name = 'V_121', 
	 particles = [P.Ft02, P.e1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_157}) 
 
 
V_122 = Vertex(name = 'V_122', 
	 particles = [P.Ft02, P.e2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_158}) 
 
 
V_123 = Vertex(name = 'V_123', 
	 particles = [P.Ft02, P.e3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_159}) 
 
 
V_124 = Vertex(name = 'V_124', 
	 particles = [P.Ft03, P.e1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_160}) 
 
 
V_125 = Vertex(name = 'V_125', 
	 particles = [P.Ft03, P.e2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_161}) 
 
 
V_126 = Vertex(name = 'V_126', 
	 particles = [P.Ft03, P.e3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_162}) 
 
 
V_127 = Vertex(name = 'V_127', 
	 particles = [P.nu1, P.Ftc1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_163}) 
 
 
V_128 = Vertex(name = 'V_128', 
	 particles = [P.nu1, P.Ftc2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_164}) 
 
 
V_129 = Vertex(name = 'V_129', 
	 particles = [P.nu1, P.Ftc3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_165}) 
 
 
V_130 = Vertex(name = 'V_130', 
	 particles = [P.nu2, P.Ftc1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_166}) 
 
 
V_131 = Vertex(name = 'V_131', 
	 particles = [P.nu2, P.Ftc2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_167}) 
 
 
V_132 = Vertex(name = 'V_132', 
	 particles = [P.nu2, P.Ftc3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_168}) 
 
 
V_133 = Vertex(name = 'V_133', 
	 particles = [P.nu3, P.Ftc1, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_169}) 
 
 
V_134 = Vertex(name = 'V_134', 
	 particles = [P.nu3, P.Ftc2, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_170}) 
 
 
V_135 = Vertex(name = 'V_135', 
	 particles = [P.nu3, P.Ftc3, P.etp], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_171}) 
 
 
V_136 = Vertex(name = 'V_136', 
	 particles = [P.Ftc1bar, P.e1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_172}) 
 
 
V_137 = Vertex(name = 'V_137', 
	 particles = [P.Ftc1bar, P.e2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_173}) 
 
 
V_138 = Vertex(name = 'V_138', 
	 particles = [P.Ftc1bar, P.e3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_174}) 
 
 
V_139 = Vertex(name = 'V_139', 
	 particles = [P.Ftc2bar, P.e1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_175}) 
 
 
V_140 = Vertex(name = 'V_140', 
	 particles = [P.Ftc2bar, P.e2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_176}) 
 
 
V_141 = Vertex(name = 'V_141', 
	 particles = [P.Ftc2bar, P.e3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_177}) 
 
 
V_142 = Vertex(name = 'V_142', 
	 particles = [P.Ftc3bar, P.e1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_178}) 
 
 
V_143 = Vertex(name = 'V_143', 
	 particles = [P.Ftc3bar, P.e2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_179}) 
 
 
V_144 = Vertex(name = 'V_144', 
	 particles = [P.Ftc3bar, P.e3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_180}) 
 
 
V_145 = Vertex(name = 'V_145', 
	 particles = [P.Ft01, P.nu1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_181,(0,1):C.GC_182}) 
 
 
V_146 = Vertex(name = 'V_146', 
	 particles = [P.Ft01, P.nu2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_183,(0,1):C.GC_184}) 
 
 
V_147 = Vertex(name = 'V_147', 
	 particles = [P.Ft01, P.nu3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_185,(0,1):C.GC_186}) 
 
 
V_148 = Vertex(name = 'V_148', 
	 particles = [P.Ft02, P.nu1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_187,(0,1):C.GC_188}) 
 
 
V_149 = Vertex(name = 'V_149', 
	 particles = [P.Ft02, P.nu2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_189,(0,1):C.GC_190}) 
 
 
V_150 = Vertex(name = 'V_150', 
	 particles = [P.Ft02, P.nu3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_191,(0,1):C.GC_192}) 
 
 
V_151 = Vertex(name = 'V_151', 
	 particles = [P.Ft03, P.nu1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_193,(0,1):C.GC_194}) 
 
 
V_152 = Vertex(name = 'V_152', 
	 particles = [P.Ft03, P.nu2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_195,(0,1):C.GC_196}) 
 
 
V_153 = Vertex(name = 'V_153', 
	 particles = [P.Ft03, P.nu3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_197,(0,1):C.GC_198}) 
 
 
V_154 = Vertex(name = 'V_154', 
	 particles = [P.e1bar, P.Ftc1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_199}) 
 
 
V_155 = Vertex(name = 'V_155', 
	 particles = [P.e1bar, P.Ftc2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_200}) 
 
 
V_156 = Vertex(name = 'V_156', 
	 particles = [P.e1bar, P.Ftc3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_201}) 
 
 
V_157 = Vertex(name = 'V_157', 
	 particles = [P.e2bar, P.Ftc1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_202}) 
 
 
V_158 = Vertex(name = 'V_158', 
	 particles = [P.e2bar, P.Ftc2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_203}) 
 
 
V_159 = Vertex(name = 'V_159', 
	 particles = [P.e2bar, P.Ftc3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_204}) 
 
 
V_160 = Vertex(name = 'V_160', 
	 particles = [P.e3bar, P.Ftc1, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_205}) 
 
 
V_161 = Vertex(name = 'V_161', 
	 particles = [P.e3bar, P.Ftc2, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_206}) 
 
 
V_162 = Vertex(name = 'V_162', 
	 particles = [P.e3bar, P.Ftc3, P.etR], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_207}) 
 
 
V_163 = Vertex(name = 'V_163', 
	 particles = [P.d1bar, P.d1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_208,(0,1):C.GC_209}) 
 
 
V_164 = Vertex(name = 'V_164', 
	 particles = [P.d1bar, P.d2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_210,(0,1):C.GC_211}) 
 
 
V_165 = Vertex(name = 'V_165', 
	 particles = [P.d1bar, P.d3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_212,(0,1):C.GC_213}) 
 
 
V_166 = Vertex(name = 'V_166', 
	 particles = [P.d2bar, P.d1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_214,(0,1):C.GC_215}) 
 
 
V_167 = Vertex(name = 'V_167', 
	 particles = [P.d2bar, P.d2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_216,(0,1):C.GC_217}) 
 
 
V_168 = Vertex(name = 'V_168', 
	 particles = [P.d2bar, P.d3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_218,(0,1):C.GC_219}) 
 
 
V_169 = Vertex(name = 'V_169', 
	 particles = [P.d3bar, P.d1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_220,(0,1):C.GC_221}) 
 
 
V_170 = Vertex(name = 'V_170', 
	 particles = [P.d3bar, P.d2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_222,(0,1):C.GC_223}) 
 
 
V_171 = Vertex(name = 'V_171', 
	 particles = [P.d3bar, P.d3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_224,(0,1):C.GC_225}) 
 
 
V_172 = Vertex(name = 'V_172', 
	 particles = [P.u1bar, P.d1, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_226,(0,1):C.GC_227}) 
 
 
V_173 = Vertex(name = 'V_173', 
	 particles = [P.u1bar, P.d2, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_228,(0,1):C.GC_229}) 
 
 
V_174 = Vertex(name = 'V_174', 
	 particles = [P.u1bar, P.d3, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_230,(0,1):C.GC_231}) 
 
 
V_175 = Vertex(name = 'V_175', 
	 particles = [P.u2bar, P.d1, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_232,(0,1):C.GC_233}) 
 
 
V_176 = Vertex(name = 'V_176', 
	 particles = [P.u2bar, P.d2, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_234,(0,1):C.GC_235}) 
 
 
V_177 = Vertex(name = 'V_177', 
	 particles = [P.u2bar, P.d3, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_236,(0,1):C.GC_237}) 
 
 
V_178 = Vertex(name = 'V_178', 
	 particles = [P.u3bar, P.d1, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_238,(0,1):C.GC_239}) 
 
 
V_179 = Vertex(name = 'V_179', 
	 particles = [P.u3bar, P.d2, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_240,(0,1):C.GC_241}) 
 
 
V_180 = Vertex(name = 'V_180', 
	 particles = [P.u3bar, P.d3, P.Hp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_242,(0,1):C.GC_243}) 
 
 
V_181 = Vertex(name = 'V_181', 
	 particles = [P.nu1, P.e1, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_244}) 
 
 
V_182 = Vertex(name = 'V_182', 
	 particles = [P.nu1, P.e2, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_245}) 
 
 
V_183 = Vertex(name = 'V_183', 
	 particles = [P.nu1, P.e3, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_246}) 
 
 
V_184 = Vertex(name = 'V_184', 
	 particles = [P.nu2, P.e1, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_247}) 
 
 
V_185 = Vertex(name = 'V_185', 
	 particles = [P.nu2, P.e2, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_248}) 
 
 
V_186 = Vertex(name = 'V_186', 
	 particles = [P.nu2, P.e3, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_249}) 
 
 
V_187 = Vertex(name = 'V_187', 
	 particles = [P.nu3, P.e1, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_250}) 
 
 
V_188 = Vertex(name = 'V_188', 
	 particles = [P.nu3, P.e2, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_251}) 
 
 
V_189 = Vertex(name = 'V_189', 
	 particles = [P.nu3, P.e3, P.Hp], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_252}) 
 
 
V_190 = Vertex(name = 'V_190', 
	 particles = [P.e1bar, P.e1, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_253,(0,1):C.GC_254}) 
 
 
V_191 = Vertex(name = 'V_191', 
	 particles = [P.e1bar, P.e2, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_255,(0,1):C.GC_256}) 
 
 
V_192 = Vertex(name = 'V_192', 
	 particles = [P.e1bar, P.e3, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_257,(0,1):C.GC_258}) 
 
 
V_193 = Vertex(name = 'V_193', 
	 particles = [P.e2bar, P.e1, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_259,(0,1):C.GC_260}) 
 
 
V_194 = Vertex(name = 'V_194', 
	 particles = [P.e2bar, P.e2, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_261,(0,1):C.GC_262}) 
 
 
V_195 = Vertex(name = 'V_195', 
	 particles = [P.e2bar, P.e3, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_263,(0,1):C.GC_264}) 
 
 
V_196 = Vertex(name = 'V_196', 
	 particles = [P.e3bar, P.e1, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_265,(0,1):C.GC_266}) 
 
 
V_197 = Vertex(name = 'V_197', 
	 particles = [P.e3bar, P.e2, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_267,(0,1):C.GC_268}) 
 
 
V_198 = Vertex(name = 'V_198', 
	 particles = [P.e3bar, P.e3, P.h], 
	 color = ['1'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_269,(0,1):C.GC_270}) 
 
 
V_199 = Vertex(name = 'V_199', 
	 particles = [P.e1bar, P.Ft01, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_271}) 
 
 
V_200 = Vertex(name = 'V_200', 
	 particles = [P.e1bar, P.Ft02, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_272}) 
 
 
V_201 = Vertex(name = 'V_201', 
	 particles = [P.e1bar, P.Ft03, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_273}) 
 
 
V_202 = Vertex(name = 'V_202', 
	 particles = [P.e2bar, P.Ft01, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_274}) 
 
 
V_203 = Vertex(name = 'V_203', 
	 particles = [P.e2bar, P.Ft02, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_275}) 
 
 
V_204 = Vertex(name = 'V_204', 
	 particles = [P.e2bar, P.Ft03, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_276}) 
 
 
V_205 = Vertex(name = 'V_205', 
	 particles = [P.e3bar, P.Ft01, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_277}) 
 
 
V_206 = Vertex(name = 'V_206', 
	 particles = [P.e3bar, P.Ft02, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_278}) 
 
 
V_207 = Vertex(name = 'V_207', 
	 particles = [P.e3bar, P.Ft03, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_279}) 
 
 
V_208 = Vertex(name = 'V_208', 
	 particles = [P.u1bar, P.u1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_280,(0,1):C.GC_281}) 
 
 
V_209 = Vertex(name = 'V_209', 
	 particles = [P.u1bar, P.u2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_282,(0,1):C.GC_283}) 
 
 
V_210 = Vertex(name = 'V_210', 
	 particles = [P.u1bar, P.u3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_284,(0,1):C.GC_285}) 
 
 
V_211 = Vertex(name = 'V_211', 
	 particles = [P.u2bar, P.u1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_286,(0,1):C.GC_287}) 
 
 
V_212 = Vertex(name = 'V_212', 
	 particles = [P.u2bar, P.u2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_288,(0,1):C.GC_289}) 
 
 
V_213 = Vertex(name = 'V_213', 
	 particles = [P.u2bar, P.u3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_290,(0,1):C.GC_291}) 
 
 
V_214 = Vertex(name = 'V_214', 
	 particles = [P.u3bar, P.u1, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_292,(0,1):C.GC_293}) 
 
 
V_215 = Vertex(name = 'V_215', 
	 particles = [P.u3bar, P.u2, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_294,(0,1):C.GC_295}) 
 
 
V_216 = Vertex(name = 'V_216', 
	 particles = [P.u3bar, P.u3, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_296,(0,1):C.GC_297}) 
 
 
V_217 = Vertex(name = 'V_217', 
	 particles = [P.d1bar, P.u1, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_298,(0,1):C.GC_299}) 
 
 
V_218 = Vertex(name = 'V_218', 
	 particles = [P.d1bar, P.u2, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_300,(0,1):C.GC_301}) 
 
 
V_219 = Vertex(name = 'V_219', 
	 particles = [P.d1bar, P.u3, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_302,(0,1):C.GC_303}) 
 
 
V_220 = Vertex(name = 'V_220', 
	 particles = [P.d2bar, P.u1, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_304,(0,1):C.GC_305}) 
 
 
V_221 = Vertex(name = 'V_221', 
	 particles = [P.d2bar, P.u2, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_306,(0,1):C.GC_307}) 
 
 
V_222 = Vertex(name = 'V_222', 
	 particles = [P.d2bar, P.u3, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_308,(0,1):C.GC_309}) 
 
 
V_223 = Vertex(name = 'V_223', 
	 particles = [P.d3bar, P.u1, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_310,(0,1):C.GC_311}) 
 
 
V_224 = Vertex(name = 'V_224', 
	 particles = [P.d3bar, P.u2, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_312,(0,1):C.GC_313}) 
 
 
V_225 = Vertex(name = 'V_225', 
	 particles = [P.d3bar, P.u3, P.Hpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFS1,L.FFS2], 
	 couplings = {(0,0):C.GC_314,(0,1):C.GC_315}) 
 
 
V_226 = Vertex(name = 'V_226', 
	 particles = [P.e1bar, P.nu1, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_316}) 
 
 
V_227 = Vertex(name = 'V_227', 
	 particles = [P.e1bar, P.nu2, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_317}) 
 
 
V_228 = Vertex(name = 'V_228', 
	 particles = [P.e1bar, P.nu3, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_318}) 
 
 
V_229 = Vertex(name = 'V_229', 
	 particles = [P.e2bar, P.nu1, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_319}) 
 
 
V_230 = Vertex(name = 'V_230', 
	 particles = [P.e2bar, P.nu2, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_320}) 
 
 
V_231 = Vertex(name = 'V_231', 
	 particles = [P.e2bar, P.nu3, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_321}) 
 
 
V_232 = Vertex(name = 'V_232', 
	 particles = [P.e3bar, P.nu1, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_322}) 
 
 
V_233 = Vertex(name = 'V_233', 
	 particles = [P.e3bar, P.nu2, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_323}) 
 
 
V_234 = Vertex(name = 'V_234', 
	 particles = [P.e3bar, P.nu3, P.Hpc], 
	 color = ['1'], 
	 lorentz = [L.FFS1], 
	 couplings = {(0,0):C.GC_324}) 
 
 
V_235 = Vertex(name = 'V_235', 
	 particles = [P.Ftc1bar, P.nu1, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_325}) 
 
 
V_236 = Vertex(name = 'V_236', 
	 particles = [P.Ftc1bar, P.nu2, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_326}) 
 
 
V_237 = Vertex(name = 'V_237', 
	 particles = [P.Ftc1bar, P.nu3, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_327}) 
 
 
V_238 = Vertex(name = 'V_238', 
	 particles = [P.Ftc2bar, P.nu1, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_328}) 
 
 
V_239 = Vertex(name = 'V_239', 
	 particles = [P.Ftc2bar, P.nu2, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_329}) 
 
 
V_240 = Vertex(name = 'V_240', 
	 particles = [P.Ftc2bar, P.nu3, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_330}) 
 
 
V_241 = Vertex(name = 'V_241', 
	 particles = [P.Ftc3bar, P.nu1, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_331}) 
 
 
V_242 = Vertex(name = 'V_242', 
	 particles = [P.Ftc3bar, P.nu2, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_332}) 
 
 
V_243 = Vertex(name = 'V_243', 
	 particles = [P.Ftc3bar, P.nu3, P.etpc], 
	 color = ['1'], 
	 lorentz = [L.FFS2], 
	 couplings = {(0,0):C.GC_333}) 
 
 
V_244 = Vertex(name = 'V_244', 
	 particles = [P.d1bar, P.d1, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_334,(0,0):C.GC_335}) 
 
 
V_245 = Vertex(name = 'V_245', 
	 particles = [P.d2bar, P.d2, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_336,(0,0):C.GC_337}) 
 
 
V_246 = Vertex(name = 'V_246', 
	 particles = [P.d3bar, P.d3, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_338,(0,0):C.GC_339}) 
 
 
V_247 = Vertex(name = 'V_247', 
	 particles = [P.d1bar, P.d1, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_340,(0,0):C.GC_341}) 
 
 
V_248 = Vertex(name = 'V_248', 
	 particles = [P.d2bar, P.d2, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_342,(0,0):C.GC_343}) 
 
 
V_249 = Vertex(name = 'V_249', 
	 particles = [P.d3bar, P.d3, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_344,(0,0):C.GC_345}) 
 
 
V_250 = Vertex(name = 'V_250', 
	 particles = [P.u1bar, P.d1, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_346}) 
 
 
V_251 = Vertex(name = 'V_251', 
	 particles = [P.u1bar, P.d2, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_347}) 
 
 
V_252 = Vertex(name = 'V_252', 
	 particles = [P.u1bar, P.d3, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_348}) 
 
 
V_253 = Vertex(name = 'V_253', 
	 particles = [P.u2bar, P.d1, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_349}) 
 
 
V_254 = Vertex(name = 'V_254', 
	 particles = [P.u2bar, P.d2, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_350}) 
 
 
V_255 = Vertex(name = 'V_255', 
	 particles = [P.u2bar, P.d3, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_351}) 
 
 
V_256 = Vertex(name = 'V_256', 
	 particles = [P.u3bar, P.d1, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_352}) 
 
 
V_257 = Vertex(name = 'V_257', 
	 particles = [P.u3bar, P.d2, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_353}) 
 
 
V_258 = Vertex(name = 'V_258', 
	 particles = [P.u3bar, P.d3, P.Wp], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_354}) 
 
 
V_259 = Vertex(name = 'V_259', 
	 particles = [P.d1bar, P.d1, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_355,(0,0):C.GC_356}) 
 
 
V_260 = Vertex(name = 'V_260', 
	 particles = [P.d2bar, P.d2, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_357,(0,0):C.GC_358}) 
 
 
V_261 = Vertex(name = 'V_261', 
	 particles = [P.d3bar, P.d3, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_359,(0,0):C.GC_360}) 
 
 
V_262 = Vertex(name = 'V_262', 
	 particles = [P.nu1, P.e1, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_361}) 
 
 
V_263 = Vertex(name = 'V_263', 
	 particles = [P.nu1, P.e2, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_362}) 
 
 
V_264 = Vertex(name = 'V_264', 
	 particles = [P.nu1, P.e3, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_363}) 
 
 
V_265 = Vertex(name = 'V_265', 
	 particles = [P.nu2, P.e1, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_364}) 
 
 
V_266 = Vertex(name = 'V_266', 
	 particles = [P.nu2, P.e2, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_365}) 
 
 
V_267 = Vertex(name = 'V_267', 
	 particles = [P.nu2, P.e3, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_366}) 
 
 
V_268 = Vertex(name = 'V_268', 
	 particles = [P.nu3, P.e1, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_367}) 
 
 
V_269 = Vertex(name = 'V_269', 
	 particles = [P.nu3, P.e2, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_368}) 
 
 
V_270 = Vertex(name = 'V_270', 
	 particles = [P.nu3, P.e3, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_369}) 
 
 
V_271 = Vertex(name = 'V_271', 
	 particles = [P.e1bar, P.e1, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_370,(0,0):C.GC_371}) 
 
 
V_272 = Vertex(name = 'V_272', 
	 particles = [P.e2bar, P.e2, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_372,(0,0):C.GC_373}) 
 
 
V_273 = Vertex(name = 'V_273', 
	 particles = [P.e3bar, P.e3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_374,(0,0):C.GC_375}) 
 
 
V_274 = Vertex(name = 'V_274', 
	 particles = [P.e1bar, P.e1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_376,(0,0):C.GC_377}) 
 
 
V_275 = Vertex(name = 'V_275', 
	 particles = [P.e2bar, P.e2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_378,(0,0):C.GC_379}) 
 
 
V_276 = Vertex(name = 'V_276', 
	 particles = [P.e3bar, P.e3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_380,(0,0):C.GC_381}) 
 
 
V_277 = Vertex(name = 'V_277', 
	 particles = [P.Ft01, P.Ftc1, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_382,(0,0):C.GC_383}) 
 
 
V_278 = Vertex(name = 'V_278', 
	 particles = [P.Ft02, P.Ftc2, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_384,(0,0):C.GC_385}) 
 
 
V_279 = Vertex(name = 'V_279', 
	 particles = [P.Ft03, P.Ftc3, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_386,(0,0):C.GC_387}) 
 
 
V_280 = Vertex(name = 'V_280', 
	 particles = [P.Ftc1bar, P.Ft01, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_388,(0,0):C.GC_389}) 
 
 
V_281 = Vertex(name = 'V_281', 
	 particles = [P.Ftc2bar, P.Ft02, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_390,(0,0):C.GC_391}) 
 
 
V_282 = Vertex(name = 'V_282', 
	 particles = [P.Ftc3bar, P.Ft03, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_392,(0,0):C.GC_393}) 
 
 
V_283 = Vertex(name = 'V_283', 
	 particles = [P.Ftc1bar, P.Ftc1, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_394,(0,0):C.GC_395}) 
 
 
V_284 = Vertex(name = 'V_284', 
	 particles = [P.Ftc2bar, P.Ftc2, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_396,(0,0):C.GC_397}) 
 
 
V_285 = Vertex(name = 'V_285', 
	 particles = [P.Ftc3bar, P.Ftc3, P.A], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_398,(0,0):C.GC_399}) 
 
 
V_286 = Vertex(name = 'V_286', 
	 particles = [P.Ftc1bar, P.Ftc1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_400,(0,0):C.GC_401}) 
 
 
V_287 = Vertex(name = 'V_287', 
	 particles = [P.Ftc2bar, P.Ftc2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_402,(0,0):C.GC_403}) 
 
 
V_288 = Vertex(name = 'V_288', 
	 particles = [P.Ftc3bar, P.Ftc3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_404,(0,0):C.GC_405}) 
 
 
V_289 = Vertex(name = 'V_289', 
	 particles = [P.u1bar, P.u1, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_406,(0,0):C.GC_407}) 
 
 
V_290 = Vertex(name = 'V_290', 
	 particles = [P.u2bar, P.u2, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_408,(0,0):C.GC_409}) 
 
 
V_291 = Vertex(name = 'V_291', 
	 particles = [P.u3bar, P.u3, P.g], 
	 color = ['T(3,2,1)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_410,(0,0):C.GC_411}) 
 
 
V_292 = Vertex(name = 'V_292', 
	 particles = [P.u1bar, P.u1, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_412,(0,0):C.GC_413}) 
 
 
V_293 = Vertex(name = 'V_293', 
	 particles = [P.u2bar, P.u2, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_414,(0,0):C.GC_415}) 
 
 
V_294 = Vertex(name = 'V_294', 
	 particles = [P.u3bar, P.u3, P.A], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_416,(0,0):C.GC_417}) 
 
 
V_295 = Vertex(name = 'V_295', 
	 particles = [P.u1bar, P.u1, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_418,(0,0):C.GC_419}) 
 
 
V_296 = Vertex(name = 'V_296', 
	 particles = [P.u2bar, P.u2, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_420,(0,0):C.GC_421}) 
 
 
V_297 = Vertex(name = 'V_297', 
	 particles = [P.u3bar, P.u3, P.Z], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_422,(0,0):C.GC_423}) 
 
 
V_298 = Vertex(name = 'V_298', 
	 particles = [P.d1bar, P.u1, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_424}) 
 
 
V_299 = Vertex(name = 'V_299', 
	 particles = [P.d1bar, P.u2, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_425}) 
 
 
V_300 = Vertex(name = 'V_300', 
	 particles = [P.d1bar, P.u3, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_426}) 
 
 
V_301 = Vertex(name = 'V_301', 
	 particles = [P.d2bar, P.u1, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_427}) 
 
 
V_302 = Vertex(name = 'V_302', 
	 particles = [P.d2bar, P.u2, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_428}) 
 
 
V_303 = Vertex(name = 'V_303', 
	 particles = [P.d2bar, P.u3, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_429}) 
 
 
V_304 = Vertex(name = 'V_304', 
	 particles = [P.d3bar, P.u1, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_430}) 
 
 
V_305 = Vertex(name = 'V_305', 
	 particles = [P.d3bar, P.u2, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_431}) 
 
 
V_306 = Vertex(name = 'V_306', 
	 particles = [P.d3bar, P.u3, P.Wpc], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_432}) 
 
 
V_307 = Vertex(name = 'V_307', 
	 particles = [P.nu1, P.nu1, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_433,(0,0):C.GC_434}) 
 
 
V_308 = Vertex(name = 'V_308', 
	 particles = [P.nu2, P.nu2, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_435,(0,0):C.GC_436}) 
 
 
V_309 = Vertex(name = 'V_309', 
	 particles = [P.nu3, P.nu3, P.Z], 
	 color = ['1'], 
	 lorentz = [L.FFV2,L.FFV3], 
	 couplings = {(0,1):C.GC_437,(0,0):C.GC_438}) 
 
 
V_310 = Vertex(name = 'V_310', 
	 particles = [P.e1bar, P.nu1, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_439}) 
 
 
V_311 = Vertex(name = 'V_311', 
	 particles = [P.e1bar, P.nu2, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_440}) 
 
 
V_312 = Vertex(name = 'V_312', 
	 particles = [P.e1bar, P.nu3, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_441}) 
 
 
V_313 = Vertex(name = 'V_313', 
	 particles = [P.e2bar, P.nu1, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_442}) 
 
 
V_314 = Vertex(name = 'V_314', 
	 particles = [P.e2bar, P.nu2, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_443}) 
 
 
V_315 = Vertex(name = 'V_315', 
	 particles = [P.e2bar, P.nu3, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_444}) 
 
 
V_316 = Vertex(name = 'V_316', 
	 particles = [P.e3bar, P.nu1, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_445}) 
 
 
V_317 = Vertex(name = 'V_317', 
	 particles = [P.e3bar, P.nu2, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_446}) 
 
 
V_318 = Vertex(name = 'V_318', 
	 particles = [P.e3bar, P.nu3, P.Wpc], 
	 color = ['1'], 
	 lorentz = [L.FFV3], 
	 couplings = {(0,0):C.GC_447}) 
 
 
V_319 = Vertex(name = 'V_319', 
	 particles = [P.g, P.g, P.g], 
	 color = ['f(1,2,3)'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_448}) 
 
 
V_320 = Vertex(name = 'V_320', 
	 particles = [P.Wpc, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_449}) 
 
 
V_321 = Vertex(name = 'V_321', 
	 particles = [P.Wpc, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVV1], 
	 couplings = {(0,0):C.GC_450}) 
 
 
V_322 = Vertex(name = 'V_322', 
	 particles = [P.g, P.g, P.g, P.g], 
	 color = ['f(-1,1,4)*f(-1,2,3)', 'f(-1,1,3)*f(-1,2,4)', 'f(-1,1,2)*f(-1,3,4)'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_451,(1,0):C.GC_452,(0,1):C.GC_453,(2,1):C.GC_454,(1,2):C.GC_455,(2,2):C.GC_456}) 
 
 
V_323 = Vertex(name = 'V_323', 
	 particles = [P.Wpc, P.A, P.A, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_457,(0,1):C.GC_458,(0,2):C.GC_459}) 
 
 
V_324 = Vertex(name = 'V_324', 
	 particles = [P.Wpc, P.A, P.Wp, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_460,(0,1):C.GC_461,(0,2):C.GC_462}) 
 
 
V_325 = Vertex(name = 'V_325', 
	 particles = [P.Wpc, P.Wpc, P.Wp, P.Wp], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_463,(0,1):C.GC_464,(0,2):C.GC_465}) 
 
 
V_326 = Vertex(name = 'V_326', 
	 particles = [P.Wpc, P.Wp, P.Z, P.Z], 
	 color = ['1'], 
	 lorentz = [L.VVVV1,L.VVVV2,L.VVVV3], 
	 couplings = {(0,0):C.GC_466,(0,1):C.GC_467,(0,2):C.GC_468}) 
 
 
V_327 = Vertex(name = 'V_327', 
	 particles = [P.A, P.A, P.h], 
	 color = ['1'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_469}) 
 
 
V_328 = Vertex(name = 'V_328', 
	 particles = [P.g, P.g, P.h], 
	 color = ['Identity(1,2)'], 
	 lorentz = [L.VVS99], 
	 couplings = {(0,0):C.GC_470}) 
 
 
