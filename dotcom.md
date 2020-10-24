# Api endpoints

## endpoints
 ${id} = the name in the url of the doujin itself  
 
### normal api
- important metadata
https://nhentai.com/api/comics/${id}?nsfw=false  

### image + metadata api
- image link collection (relevant for downloading further explanation down below)
- important metadata  
https://nhentai.com/api/comics/${id}/images?nsfw=false  


## image baselink
${gallery_id} = the gallery id you get from the api  
${image_number} = number of the image (e.g. 1 if you want the first)  
${file_extension} = file extentsion (png, jpg...)  
https://cdn.nhentai.com/assets/images/${gallery_id}/${image_number}.${file_extension}

### why use link collections
for one you can simply pass the collection from the resonse object   
but than there is the issue that nhentai dot com sometimes has the untranslated images  
on the same gallery id just with a diffrent file extension.  
Be sure to use the image + metadata api if you wanna download the doujin as it's visible on the site
