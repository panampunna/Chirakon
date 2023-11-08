
sudo apt update
sudo apt install -y  nginx

sudo cp   /home/ubuntu/Chirakon/Folder_A/index.html   /var/www/html
sudo  mkdir -p /ssl
sudo cp  /home/ubuntu/Chirakon/Folder_A/server.crt   /ssl
sudo cp  /home/ubuntu/Chirakon/Folder_A/server.csr   /ssl
sudo cp  /home/ubuntu/Chirakon/Folder_A/server.key   /ssl
sudo cp  /home/ubuntu/Chirakon/Folder_A/nginx.conf    /ssl    ##   /etc/nginx/nginx.conf   path need to move  ## good to have a copy in /ssl 

sudo cp  /ssl/nginx.conf   /etc/nginx/nginx.conf
sudo service nginx restart



