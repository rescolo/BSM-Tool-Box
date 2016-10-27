modname = LRmodelsTRDM  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables
name = ../lib/libSPhenoLRmodelsTRDM.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoLRmodelsTRDM:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoLRmodelsTRDM.o 
	 ${F90} -o SPhenoLRmodelsTRDM ${LFlagsB} SPhenoLRmodelsTRDM.o ../lib/libSPhenoLRmodelsTRDM.a ../lib/libSPheno.a
	 mv SPhenoLRmodelsTRDM ../bin
	 rm SPhenoLRmodelsTRDM.o  
${name}:  ${name}(Model_Data_LRmodelsTRDM.o)  \
 ${name}(RGEs_LRmodelsTRDM.o)   \
 ${name}(Couplings_LRmodelsTRDM.o) ${name}(TreeLevelMasses_LRmodelsTRDM.o) ${name}(TadpoleEquations_LRmodelsTRDM.o) \
 ${name}(LoopCouplings_LRmodelsTRDM.o) ${name}(CouplingsForDecays_LRmodelsTRDM.o) \
 ${name}(TreeLevel_Decays_LRmodelsTRDM.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  ${name}(Fv.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(LoopMasses_LRmodelsTRDM.o) \
 ${name}(BranchingRatios_LRmodelsTRDM.o) ${name}(HiggsCS_LRmodelsTRDM.o) ${name}(RunSM_LRmodelsTRDM.o) \
 ${name}(LowEnergy_LRmodelsTRDM.o) \
${name}(FlavorKit_LFV_LRmodelsTRDM.o) ${name}(FlavorKit_QFV_LRmodelsTRDM.o) ${name}(FlavorKit_Observables_LRmodelsTRDM.o)\
${name}(InputOutput_LRmodelsTRDM.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
