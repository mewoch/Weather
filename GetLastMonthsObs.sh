#!/bin/sh
#
# This script collects daily last month's daily weather obsernations
# for a given Australian BOM station.
#
# usage : ./GetLastMonthsObs.sh
#
# Depends: wget

#If yau don't have a very current OSX then you'll need to get wget
#depending on how you do this it might end up in somewhere other 
#than /usr/bin

os=`uname`

if [$os = 'Darwin' ]
 then PATH=/bin:/usr/bin:/usr/local/bin
 elif PATH=/bin:/usr/bin
fi

#Defining some variables
station=IDCJDW6061
#see this list: https://www.seegrid.csiro.au/subversion/ASRDC/BOM/SIMS/data/anzlic_20110825.txt 

#get this month
month=`date +%m`  #Comment this line for testing different months
#month=06         #Uncomment this line for testing different months

#get this year
yr=`date +%Y`

#If month 01, then last month is 12 not 0
if [ $month = '01' ]
 then lm=12  yr=`expr $yr - 1`
 else lm=`expr $month - 1`
fi

#We need 07 not just plain 7
count=${#lm}

if [ $count = 1 ]
 then lm=0$lm
fi

#To test workings uncomment these lines
#echo os
#echo $month
#echo $yr
#echo $count
#echo $lm

wget http://www.bom.gov.au/climate/dwo/$yr${lm}/text/${station}.$yr${lm}.csv
