#!/bin/dash

exit_here(){
    echo "this doujin seems to not exist, if it exists leave an issue on github or message Zhāng Jūn 张军#8497 on Discord"
    exit 0
}

exit_exists(){
    echo "you already have this in your collection"
    exit 0
}


id=$1
[ -f "${id}.zip" ] && exit_exists

if echo "$id" | grep -qE '^[0-9]+$'; then
    # when is a number
    # than it's a dot net request

    #gather doujin info
    doujin=$(wget -qO- "https://nhentai.net/api/gallery/$id")
    media_id=$(echo $doujin | jq -r '.media_id' || echo "please install jq")
    [ "${media_id}" = "null" ] && exit_here
    page_count=$(echo $doujin | jq '.images.pages | length ')

    name=$(echo $doujin | jq -r '.title.pretty')

    #create "doujin folder" dir
    mkdir $id
    cd $id

    echo "downloading ${id}"

    #DL
    for I in `seq 1 $page_count`
    do
        url="https://i.nhentai.net/galleries/$media_id/$I.jpg"
        alturl="https://i.nhentai.net/galleries/$media_id/$I.png"
        wget -q ${url} || wget -q ${alturl}
        printf "."
    done

else
    # when it's nan
    # than it's dot com
    
    #gather doujin info
    doujin=$(wget -qO- "https://nhentai.com/api/comics/${id}?nsfw=false")
    media_id=$(echo $doujin | jq -r '.id' || echo "please install jq")
    echo $media_id
    [ "${media_id}" = "null" ] && exit_here
    page_count=$(echo $doujin | jq '.pages')

    name=$(echo $doujin | jq -r '.title')

    #create "doujin folder" dir
    mkdir $id
    cd $id

    echo "downloading ${id}"

    #DL
    for I in `seq 1 $page_count`
    do
        url="https://cdn.nhentai.com/assets/images/$media_id/$I.png"
        alturl="https://cdn.nhentai.com/assets/images/$media_id/$I.jpg"
        wget -q ${url} || wget -q ${alturl}
        printf "."
    done

fi

echo ""

#oneliner lmao https://stackoverflow.com/a/3672383
ls | awk '/^([0-9]+)\.jpg$/ { printf("%s %05d.jpg\n", $0, $1) }' | xargs -n2 mv
ls | awk '/^([0-9]+)\.png$/ { printf("%s %05d.png\n", $0, $1) }' | xargs -n2 mv

#convert pictures
convert(){
    mogrify -format jpg *.*
    podofoimg2pdf "$id.pdf" -useimgsize *.jpg
    [ -f *.png ] && rm *.png
}

#PDFer
podofoimg2pdf "$id.pdf" -useimgsize *.* || convert

#create file to remark nid
echo "http://nhentai.net/g/$id/" > "$id.no"
echo $name >> "$id.no"

#zip it
zip "$id.zip" *

#get pwd
_cwd="$PWD"
cd ..

#get top dir
_top="$PWD"
cd $_cwd

#move zip top dir
mv "$id.zip" ..
