#!/bin/sh

#open like this
#scriptname gallery_id number_of_pages nh_id
#SAMPLE ./xtest.sh 530640 34 81391

#create "sandbox" dir
mkdir $3
cd $3

#DL
for I in `seq 1 $2`
do
    url="https://i.nhentai.net/galleries/$1/$I.jpg"
    curl ${url} -O
done

#create file to remark nid
echo "http://nhentai.net/g/$3/" > "$3.no"

#oneliner lmao https://stackoverflow.com/a/3672383
ls | awk '/^([0-9]+)\.jpg$/ { printf("%s %05d.jpg\n", $0, $1) }' | xargs -n2 mv

#PDFer
podofoimg2pdf "$3.pdf" -useimgsize *.jpg

#zip it
zip "$3.zip" *

#get pwd
_cwd="$PWD"
cd ..

#get top dir
_top="$pwd"
cd $_cwd

#move zip top dir
mv "$3.zip" ..

#remove dir
#rm -r "$_cwd"