# doujin_downloader
linux/posix complient download script for doujins

#open like this
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
