#!/bin/sh

station=IDCJDW6061

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
#echo $month
#echo $yr
#echo $count
#echo $lm

wget http://www.bom.gov.au/climate/dwo/$yr${lm}/text/${station}.$yr${lm}.csv
