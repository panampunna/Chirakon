#!/bin/bash
dd=$(date +"%d-%m-%Y  %H:%M")
echo -e "Welcome John V ,  Today Date is ::  $dd  "
sudo apt update 
sudo apt  install virtualbox-guest-additions-iso
sudo apt install -y   chromium-browser  git vim
mkdir -p  /home/john/Vimal
echo -e " https://github.com/panampunna/2023-ubuntu/ "

cd /home/john/Vimal
pwd 
echo "ghp_kgMcHPSxxxxxxxxxxxxxxxxxxE0xxxxxxxxxxxx"

git clone https://github.com/panampunna/2023-ubuntu.git

git branch

##git checkout develop

git pull

echo "ghp_kgMcHPSkfyOUXxxxxxxxxxxxxxxxxxxxx " 

ls

touch  /home/john/.bash_aliases
cat /home/john/Vimal/2023-ubuntu/base.bash_aliases   > /home/john/.bash_aliases 


###################3333333#####2





