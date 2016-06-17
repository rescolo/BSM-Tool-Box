#!/usr/bin/env bash
if [ ! "$1" ];then
  echo "$0 Model [PARTICLE NAME (madGRAPH)]"
  echo   if PARTICLE NAME is given the process 
  echo PARTICLE NAME > all all 
  exit
fi
if [ "$2" ];then
  mdgpart=$2
fi
if [ "$3" = "--full" ];then
  full=True
fi

MODEL=$1
cd SPHENO/$MODEL
if [ -f SPheno.spc.$MODEL ];then 
  cp SPheno.spc.$MODEL SPheno.spc.${MODEL}_bak
fi
if [ -f ../../SARAH/Models/$MODEL/LesHouches.in.${MODEL}_low ];then
  cp -f ../../SARAH/Models/$MODEL/LesHouches.in.${MODEL}_low . 
  echo taking input file from ../../SARAH/Models/$MODEL
fi
../bin/SPheno$MODEL LesHouches.in.${MODEL}_low
diff SPheno.spc.$MODEL SPheno.spc.${MODEL}_bak
echo "<enter> to continue with micrOMEGAS"
read continue
cp SPheno.spc.$MODEL ../../micromegas/$MODEL
cd ../../micromegas/$MODEL
./CalcOmega SPheno.spc.$MODEL
echo  "import model $MODEL -modelname
generate z > all all
output MY_FIRST_MG5_RUN" > /tmp/mgp$USER
if [ "$full" = True ];then
  echo "import model $MODEL -modelname
define new = ss re1 re2 rv1 rv2 re1bar re2bar rv1bar rv2bar
define p = g u1 u2 d1 d2 u1bar u2bar d1bar d2bar
check p p > new new" >> /tmp/mgpfull$USER
fi

echo "<enter> to continue with madGRAPH and exec:"
echo "============================"
echo "mg5> help:"
echo "mg5> import model $MODEL"
echo "mg5> generate p p > t t~"
echo "mg5>output MY_FIRST_MG5_RUN"
echo "============================"
read continue
cd ../../madgraph/bin
./mg5 -f /tmp/mgp$USER
if [ "$full" = True ];then
    ./mg5 -f /tmp/mgpfull$USER > /tmp/kk$USER
    cat /tmp/kk$USER | grep passed
fi




