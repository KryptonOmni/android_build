#!/bin/bash

export PATH="/opt/android-build:/opt/jdk1.6.0_45/bin:$PATH"
export USE_CCACHE=1
export CCACHE_DIR=/home/evuz/.ccache

ydate=$(date -d '1 day ago' +"%m/%d/%Y")
cdate=`date +"%m_%d_%Y"`
DATE=`date +"%Y%m%d"`
rdir=`pwd`

# Comienza a contar el tiempo
res1=$(date +%s.%N)

# Colores
red=$(tput setaf 1)             #  red
grn=$(tput setaf 2)             #  green
cya=$(tput setaf 6)             #  cyan
txtbld=$(tput bold)             #  Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgrn=${txtbld}$(tput setaf 2) #  green
bldylw=${txtbld}$(tput setaf 3) #  yellow
bldblu=${txtbld}$(tput setaf 4) #  blue
bldppl=${txtbld}$(tput setaf 5) #  purple
bldcya=${txtbld}$(tput setaf 6) #  cyan
txtrst=$(tput sgr0)             #  Reset

echo -e "Hora de comenzar la compilacion!"

# Comienza a compilar
echo -e "${bldblu}Iniciando entorno... ${txtrst}"
. build/envsetup.sh

# Device
#rm out/target/product/mako/system/build.prop
#rm out/target/product/mako/MinimalUI*.zip
#rm out/target/product/mako/MinimalUI*.zip.md5sum
echo -e ""
echo -e "${bldblu}Lunching mako ${txtrst}"
lunch "omni_mako-userdebug";
echo -e ""
echo -e "${bldblu}Starting to build ${txtrst}"
make otapackage -j6

# Tiempo total
res2=$(date +%s.%N)
echo "${bldgrn}Tiempo total utilizado: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutos ($(echo "$res2 - $res1"|bc ) segundos) ${txtrst}"

