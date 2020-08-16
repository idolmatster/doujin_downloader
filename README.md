# doujin_downloader
gnu/linux compatible download script for doujins

# requirements
if you use a debian based distro that uses the apt packagemanager you can use the install.sh  
otherwise you will need to install the dependencies by yourself
- wget
- zip 
- libpodofo-utils
- imagemagick and imagemagick-doc for good measure

# open like this
scriptname gallery_id number_of_pages nh_id  
SAMPLE ./xtest.sh 530640 34 81391

# how to get the IDs
1. nh_id = the number after /g/ in the link  
  https://nhentai.net/g/ZZZZZZ/1/ the ZZZZZZ number is your nh id
2. gallery_id = open a picture in the doujin and you will see a link like this  
  https://i.nhentai.net/galleries/XXXXXX/Y.jpg the number XXXXXX is the gallery id

# batch processing
create a file called "continuefile"  
no file extension  
structure it like this  
gallary_id page_count nhentai_id ;  
sample (random numbers here)  
9032423 90 23444 ;  
use the file called massruner.sh to start the process  
