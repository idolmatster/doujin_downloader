# doujin_downloader
debain compatible donloader for nhentai doujins.
This also creates a pdf from the pictures for easier reading.

# requirements
if you use a debian based distro that uses the apt packagemanager you can use the install.sh  
otherwise you will need to install the dependencies by yourself
- wget
- zip 
- libpodofo-utils
- imagemagick and imagemagick-doc for good measure
- curl
- jq

# open like this (starting version 2.0)
scriptname nh_id  
SAMPLE ./xtest.sh 81391

# batch processing
create a file called "continuefile"  
no file extension for this
structure it like this  
nhentai_id ;  
sample (with random numbers here)  
23444 ;  
use the file called massruner.sh to start the process  

# branches

## main / master
up to date with current development

## less_bloat
contains a version with minimum bloat ontop
