# [privatebin.info](https://privatebin.info)

This repository hosts the files used to generate Privatebin's website, hosted
at https://privatebin.info .

The files are generated with [Pelican](https://blog.getpelican.com/).

## Setup

**Requirements :** You will need Pelican and the markdown parser :
```
pip install pelican markdown
```

Then type `make html` to generate the html files in the `output` directory.

Other options are available, you can get more information about them by simply
typing `make`:

```
   make html                           (re)generate the web site          
   make clean                          remove the generated files         
   make regenerate                     regenerate files upon modification 
   make publish                        generate using production settings 
   make serve [PORT=8000]              serve site at http://localhost:8000
   make serve-global [SERVER=0.0.0.0]  serve (as root) to :80    
   make devserver [PORT=8000]          start/restart develop_server.sh    
   make stopserver                     stop local server                  
   make ssh_upload                     upload the web site via SSH        
   make rsync_upload                   upload the web site via rsync+ssh  
   make dropbox_upload                 upload the web site via Dropbox    
   make ftp_upload                     upload the web site via FTP        
   make s3_upload                      upload the web site via S3         
   make cf_upload                      upload the web site via Cloud Files
   make github                         upload the web site via gh-pages   
```
