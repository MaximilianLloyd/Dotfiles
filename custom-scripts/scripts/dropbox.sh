#/bin/bash
# rsync --delete -rtvzP ~/Dropbox/* root@omnimax.org:/var/www/omnimax/files/
rsync --delete -rtvzP /home/max/Dropbox/ root@omnimax.org:/var/www/omnimax/files/
