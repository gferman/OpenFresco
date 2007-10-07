# File: OneBayFrame_Server1b.tcl (use with OneBayFrame_Client1.tcl)
#
# $Revision: $
# $Date: $
# $URL: $
#
# Written: Andreas Schellenberg (andreas.schellenberg@gmx.net)
# Created: 11/06
# Revision: A
#
# Purpose: this file contains the tcl input to perform
# a distributed hybrid simulation of a one bay frame
# with two experimental twoNodeLink elements.
# The specimen is simulated using the SimUniaxialMaterials
# controller.
# The experimental setups are on the server sides.


# ------------------------------
# Start of model generation
# ------------------------------
# create ModelBuilder (with two-dimensions and 2 DOF/node)
model BasicBuilder -ndm 2 -ndf 2

# Define materials
# ----------------
# uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4
uniaxialMaterial Elastic 1  5.6;  # UC Berkeley Cantilever Column [kip/in]
#uniaxialMaterial Elastic 1 16.0;  # UBC Cantilever Column [kN/cm]
#uniaxialMaterial Elastic 1 ????;  # Kyoto University Cantilever Column [??/??]

# Define experimental control
# ---------------------------
# expControl SimUniaxialMaterials $tag $matTags
expControl SimUniaxialMaterials 1 1
#expControl xPCtarget 1 1 "192.168.2.20" 22222 HybridControllerPoly3_1Act "D:/PredictorCorrector/RTActualTestModels/c&mAPI-xPCTarget-STS"

# Define experimental setup
# -------------------------
# expSetup OneActuator $tag <-control $ctrlTag> $dir <-ctrlDispFact $f> ...
expSetup OneActuator 1 -control 1 1;  # UC Berkeley setup
#expSetup OneActuator 1 -control 1 1 -ctrlDispFact 2.54 -daqDispFact 2.54 -daqForceFact 4.4482;  # UBC setup with units conversion
#expSetup OneActuator 1 -control 1 1 -ctrlDispFact ??? -daqDispFact ??? -daqForceFact ???;  # Kyoto University with units conversion

# Define experimental site
# ------------------------
# expSite ActorSite $tag -setup $setupTag $ipPort <-ssl>
expSite ActorSite 2 -setup 1 8091
# ------------------------------
# End of model generation
# ------------------------------


# ------------------------------
# Start the server process
# ------------------------------
# startLabServer $siteTag
startLabServer  2
# --------------------------------
# End of analysis
# --------------------------------
