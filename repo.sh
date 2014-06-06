#!/bin/bash

ydate=$(date -d '1 day ago' +"%m/%d/%Y")
cdate=`date +"%m_%d_%Y"`
DATE=`date +"%Y%m%d"`
rdir=`pwd`

PATH=~/bin:$PATH

# Comienza a contar el tiempo
res1=$(date +%s.%N)

repo sync -f

# Tiempo total
res2=$(date +%s.%N)
echo "${bldgrn}Tiempo total utilizado: ${txtrst}${grn}$(echo "($res2 - $res1) / 60"|bc ) minutos ($(echo "$res2 - $res1"|bc ) segundos) ${txtrst}"
