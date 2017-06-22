import pyslha #pip install pyslha --upgrade
import numpy as np
import commands
import os
class SM(object):
    pdg=__import__('pdg')
    G_F    =1.166370E-05    # G_F,Fermi constant
    alpha_s=1.187000E-01    #(MZ) SM MSbar
    M_Z    =9.118870E+01    # Z-boson pole mass'
    m_b    =4.180000E+00    # m_b(mb) SM MSbar
    m_top  =1.735000E+02    # m_top(pole)
    mtau   =1.776690E+00    # m_tau(pole)
    m_h0   =125. #Higg mass
    #FIX pdgs
    pdg.h0=25;pdg.H0=35;pdg.A0=36;pdg.Hp=37;pdg.Hm=-37
    def phys_to_gen(self,v=2.38711864E+02):
        self.lambda_sm=self.m_h0**2/v**2
        perturbativity=True
        if np.abs(self.lambda_sm).max()>8*np.pi:
            perturbativity=False
        return perturbativity
    
    def init_lha_blocks(self,LHA):
        #initialization
        if LHA.blocks.has_key('MODSEL'):
            LHA.blocks['MODSEL'][1]='0              #  1/0: High/low scale input'
            LHA.blocks['MODSEL'][2]='1              # Boundary Condition'
            LHA.blocks['MODSEL'][6]='1              # Generation Mixing'
            LHA.blocks['MODSEL'][12]='1000.          # Renormalization scale'
        else:
            print "Use hep.buildSLHA to include proper blocks" 
                
        self.LHA=LHA
        return self.LHA
    
class hep(SM):
    '''
    Configure and run specific HEP tools. See self.config for details
    '''
    config={}
    config['SPHENO_PATH']='/home/restrepo/prog/toolbox/toolbox/SPHENO/bin'
    config['SPHENO_COMMAND']='' #Empty string for default SARAH-Toolbox SPHENO commnand
    config['SPHENO_LHA_INPUT']='' #Empty string for default SARAH-Toolbox SPHENO LHA input
    convert={'USAGE': "(N [A])*1=(N [A])*convert[B/A] -> (N [B])"}
    convert['m/(1/GeV)']=1.973269718E-16 # m/GeV^{-1}
    convert['s/(1/GeV)']=6.58211899E-25 # s/GeV^{-1}
    convert['m^2/pb']=1E-40 #m^2/pb       m^2/b*(1E-12b/pb) 
    convert['pb/(1/GeV^2)']=(convert['m/(1/GeV)']**2)/convert['m^2/pb'] # $1m^2/(GeV^{-2})/(m^2/pb)=pb/GeV^{-2}
    def __init__(self):
        self.MODEL='radinert'
        self.Gamma={} #Widths
        self.Br={} #branchings
        
    def buildSLHA(self,blocks=['modsel','sminputs'],ignorenobr=True,ignorenomass=True):
        spcskel=''
        for b in blocks:
            spcskel=spcskel+'block '+b+"\n"
        LHA=pyslha.readSLHA(spcskel,ignorenobr=ignorenobr,ignorenomass=ignorenomass)
        if LHA.blocks.has_key('SMINPUTS'):
            LHA.blocks['SMINPUTS'][2]='%.8E    # G_F,Fermi constant'   %self.G_F
            LHA.blocks['SMINPUTS'][3]='%.8E    # alpha_s(MZ) SM MSbar' %self.alpha_s
            LHA.blocks['SMINPUTS'][4]='%.8E    # Z-boson pole mass'    %self.M_Z 
            LHA.blocks['SMINPUTS'][5]='%.8E    # m_b(mb) SM MSbar'     %self.m_b 
            LHA.blocks['SMINPUTS'][6]='%.8E    # m_top(pole)'          %self.m_top 
            LHA.blocks['SMINPUTS'][7]='%.8E    # m_tau(pole)'          %self.mtau
        if LHA.blocks.has_key('SPHENOINPUT'):
            LHA.blocks['SPHENOINPUT'][  1]='-1              # error level'
            LHA.blocks['SPHENOINPUT'][  2]=' 0              # SPA conventions'
            LHA.blocks['SPHENOINPUT'][ 11]='1               # calculate branching ratios'
            LHA.blocks['SPHENOINPUT'][ 13]='1               # 3-Body decays: none (0), fermion (1), scalar (2), both (3)'
            LHA.blocks['SPHENOINPUT'][ 14]='0               # Run couplings to scale of decaying particle'
            LHA.blocks['SPHENOINPUT'][ 12]='1.000E-15       # write only branching ratios larger than this value'
            LHA.blocks['SPHENOINPUT'][ 15]='1.000E-40       # write only decay if width larger than this value'
            LHA.blocks['SPHENOINPUT'][ 31]='-1              # fixed GUT scale (-1: dynamical GUT scale)'
            LHA.blocks['SPHENOINPUT'][ 32]='0               # Strict unification'
            LHA.blocks['SPHENOINPUT'][ 34]='1.000E-04       # Precision of mass calculation'
            LHA.blocks['SPHENOINPUT'][ 35]='40              # Maximal number of iterations'
            LHA.blocks['SPHENOINPUT'][ 37]='1               # Set Yukawa scheme'
            LHA.blocks['SPHENOINPUT'][ 38]='2               # 1- or 2-Loop RGEs'
            LHA.blocks['SPHENOINPUT'][ 50]='1               # Majorana phases: use only positive masses'
            LHA.blocks['SPHENOINPUT'][ 51]='0               # Write Output in CKM basis'
            LHA.blocks['SPHENOINPUT'][ 52]='1               # Write spectrum in case of tachyonic states'
            LHA.blocks['SPHENOINPUT'][ 55]='0               # Calculate one loop masses'
            LHA.blocks['SPHENOINPUT'][ 57]='0               # Calculate low energy constraints'
            LHA.blocks['SPHENOINPUT'][ 65]='0               # Solution tadpole equation'
            LHA.blocks['SPHENOINPUT'][ 75]='1               # Write WHIZARD files'
            LHA.blocks['SPHENOINPUT'][ 76]='1               # Write HiggsBounds file'
            LHA.blocks['SPHENOINPUT'][ 86]='0.              # Maximal width to be counted as invisible in Higgs decays; -1: only LSP'
            LHA.blocks['SPHENOINPUT'][510]='0.              # Write tree level values for tadpole solutions'
            LHA.blocks['SPHENOINPUT'][515]='0               # Write parameter values at GUT scale'
            LHA.blocks['SPHENOINPUT'][525]='0.              # Write loop contributions to diphoton decay of Higgs'
    
        return LHA

    def runSPheno(self,LHA,DEBUG=False):
        """
        Set self.config for PATHS. 
        Using defatull SARAH Toolbox SPHENO command. 
        Return back a pyslha.Doc object for LHA model.
        Designed to change for other MODEL easily
        Set self.config['SPHENO_PATH']. 
        Self self.config['SPHENO_COMMAND'] if not using 
        default SARAH SPHENO executable
        """
        if self.config['SPHENO_LHA_INPUT']=='':
            inputLHA='LesHouches.in.%s_low' %self.MODEL
        else:
            inputLHA=self.config['SPHENO_LHA_INPUT']
        if self.config['SPHENO_COMMAND']=='':
            SPheno_bin_command='SPheno'+self.MODEL #Default SARAH toolbox command
        else:
            SPheno_bin_command=self.config['SPHENO_COMMAND']
        #writeLHAinFile(xdict,inputLHA)
        pyslha.writeSLHAFile(inputLHA,LHA)
        a=commands.getoutput('%s/%s %s' %(self.config['SPHENO_PATH'],SPheno_bin_command,inputLHA))
        if DEBUG:
            print(a)
        assert os.path.isfile('SPheno.spc.%s' %self.MODEL)
        #print a
        if a.find('Problem')==-1:
            return pyslha.readSLHAFile('SPheno.spc.%s' %self.MODEL)
        else:
            return False
        
    def branchings(self,SPCdecays):
        "Convert decays blocks into widhts and branchings: Input: SPC.decays"
        for i in SPCdecays.keys():
            self.Br[i]={}
            self.Gamma[i]=SPCdecays[i].totalwidth
            for j in range( len(SPCdecays[i].decays) ):
                self.Br[i][tuple(SPCdecays[i].decays[j].ids)]=SPCdecays[i].decays[j].br
        return SPCdecays.keys()
    
class THDM(SM):
    '''
    All parameters in the several basis with functions to get the missing ones
    th=THDM()
    self.general -> dict with general
    '''
    MESSAGE="THDM-III implementation based on https://2hdmc.hepforge.org/"
    import numpy as np
    def __init__(self):  
        #general
        self.lambdas=np.zeros(8)
        self.m22_2=0.
        #Physical
        self.m_h0=125.;self.m_H0=300.;self.m_A0=400.;self.m_Hp=500.
        self.tanb=1;self.lambdas[6]=0.1;self.lambdas[7]=0.1;self.m12_2=1E6
        self.sab=0.1
        self.lambdaL=0.01
        
    def __call__(self):
        print lambdas
        print("call")
    def phys_to_gen(self,v=2.38711864E+02):
        '''based on  https://2hdmc.hepforge.org/ src: THDM.cpp:  '''
        #GF = eval(LHA.blocks['SMINPUTS'][2])
        beta=np.arctan(self.tanb);
        sb = np.sin(beta)
        sb2 = sb*sb            
        cb = np.cos(beta);    
        cb2 = cb*cb;            
        tb = np.tan(beta);    
        ctb = 1./tb;                                    
        alpha = -np.arcsin(self.sab)+beta;
        sa  = np.sin(alpha);       
        sa2 = sa*sa;            
        ca  = np.cos(alpha);       
        ca2 = ca*ca;                                    
        cab = np.sqrt(1.-self.sab*self.sab); 
        v2=v**2 #1./(np.sqrt(2.)*GF);

        self.lambdas[1]=( (self.m_H0*self.m_H0*ca2+self.m_h0*self.m_h0*sa2-self.m12_2*tb)/v2/cb2\
              -1.5*self.lambdas[6]*tb+0.5*self.lambdas[7]*tb*tb*tb )/2.
        self.lambdas[2]=( (self.m_H0*self.m_H0*sa2+self.m_h0*self.m_h0*ca2-self.m12_2*ctb)/v2/sb2\
              +0.5*self.lambdas[6]*ctb*ctb*ctb-1.5*self.lambdas[7]*ctb )/2.
        self.lambdas[3]=((self.m_H0*self.m_H0-self.m_h0*self.m_h0)*ca*sa+2.*self.m_Hp*self.m_Hp*sb*cb\
              -self.m12_2)/v2/sb/cb-0.5*self.lambdas[6]*ctb-0.5*self.lambdas[7]*tb
        self.lambdas[4]=((self.m_A0*self.m_A0-2.*self.m_Hp*self.m_Hp)*cb*sb+self.m12_2)/v2/sb/cb\
              -0.5*self.lambdas[6]*ctb-0.5*self.lambdas[7]*tb;
        self.lambdas[5]=(self.m12_2-self.m_A0*self.m_A0*sb*cb)/v2/sb/cb-0.5*self.lambdas[6]*ctb\
              -0.5*self.lambdas[7]*tb;
        m22_2 = -0.5/sb*(self.m_h0**2*ca*self.sab+self.m_H0**2*sa*cab)+self.m12_2*ctb
        sinba = self.sab
        perturbativity=True
        if np.abs(self.lambdas).max()>8*np.pi:
            perturbativity=False
        return perturbativity
    
    def test_phys_to_gen(self):
        pass    
    
    def higgs_to_phys(self,v=2.38711864E+02):
        v2=v**2
        beta=0;
        self.m22_2=self.m_Hp*self.m_Hp-0.5*v2*self.lambdas[3];
        self.m11_2=-0.5*lambdas[1]*v2
        self.m12_2=0.5*lambdas[6]*v2

        m_A2 = self.m_Hp*self.m_Hp-0.5*v2*(self.lambdas[5]-self.lambdas[4]);
  
        s2ba = -2.*self.lambdas[6]*v2;
        c2ba = -(m_A2+(self.lambdas[5]-self.lambdas[1])*v2);
        #Handle special case with degenerate masses
        #if np.abs(s2ba)>sqrt(DBL_EPSILON))||(abs(c2ba)>sqrt(DBL_EPSILON))) {
        bma  =  0.5*np.atan2(s2ba,c2ba);
        self.sinba = sin(bma);
        if m_A2>0:
            self.m_A0 = np.sqrt(m_A2)
        else:
            self.m_A0=1j*np.sqrt(np.abs(m_A2))
     
        if np.abs(self.lambdas).max()>8*np.pi:
            perturbativity=False
        return perturbativity
    def idm(self,v=246.2):
        #self.m_Hp=2090.99
        #self.m_A0=2100.26
        #self.m_H0=2088.3
        #self.m_h0=125.
        
        self.lambdas[1]=self.m_h0**2/v2
        self.lambdas[3]=2.*(self.m_Hp**2-self.m_H0**2+self.lambdaL*v2)/v2
        self.lambdas[4]=(self.m_H0**2+self.m_A0**2-2.*self.m_Hp**2)/v2
        self.lambdas[5]=(self.m_H0**2-self.m_A0**2)/v2
        self.lambdas[6]=0.
        self.lambdas[7]=0.
        self.m12_2=0.
        self.m22_2=self.m_H0**2 - self.lambdaL*v2
        self.m11_2=-self.m_h0**2/2
        
    def init_lha_blocks(self,LHA):
        #initialization
        super(THDM,self).init_lha_blocks(LHA) #GET SM init blocks
        if self.LHA.blocks.has_key('EPSUIN'):
            for bly in ['EPSUIN','EPSDIN','EPSEIN']:
                for i in range(1,4):
                    for j in range(1,4):
                        self.LHA.blocks['%s' %bly][i,j]="%.8E      #%s(%d,%d)" %(0,bly,i,j)
        else:
            print "Use hep.buildSLHA to include proper blocks" 
                
        return self.LHA
    def test_higgs_to_phys(self):
        pass    
     