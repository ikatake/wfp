#!/bin/bash
cd $(cd $(dirname $0);pwd)
ymd=`date '+%Y%m%d'`
oldir=./old/${ymd}

##0 make dir 
if [ ! -e ${oldir} ]; then
  mkdir ${oldir}
fi
cp -p wfp.json ${oldir}/wfp.0.json

##1 get rss
/usr/local/bin/ruby getrss.rb
cp -p wfp${ymd}.yaml ${oldir}/wfp${ymd}.1.yaml

##2 compaire dairy_rss vs store_json
/usr/local/bin/ruby compdairy.rb
cp -p wfp${ymd}.yaml ${oldir}/wfp${ymd}.2.yaml

##3 getpictures
/usr/local/bin/ruby getpic.rb
cp -p wfp${ymd}.yaml ${oldir}/wfp${ymd}.3.yaml

##4 write json
/usr/local/bin/ruby writejson.rb
cp ./wfp.json /home/ikatake/www/wetsteam/wfp/.
cp -p ./pic/*.* /home/ikatake/www/wetsteam/wfp/pic/.
rm ./pic/*.*
cp -p wfp.json ${oldir}/wfp.9.json
mv wfp${ymd}.yaml ${oldir}/wfp${ymd}.9.yaml
