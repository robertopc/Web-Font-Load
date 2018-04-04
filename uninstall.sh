#!/bin/bash
#OS detect 
osdetect=$(uname)
file_path="unknown"
if [[ "$osdetect" == 'Linux' ]]; then
    file_path='sudo rm /usr/local/share/fonts/'
elif [[ "$osdetect" == 'Darwin' ]]; then
    file_path='rm /Library/Fonts/'
elif [[ "$osdetect" == 'Arch Linux' ]]; then
    file_path='sudo rm /usr/share/fonts/'
fi

clear
echo "Un-Installing all Google Web Fonts onto your System"
echo "Downloading font list..."
cd ~/Documents/

curl -L https://raw.githubusercontent.com/qrpike/Web-Font-Load/master/list-of-fonts.txt -o list-of-fonts.txt

while read font; do
  $file_path$font
done <list-of-fonts.txt

rm -rf list-of-fonts.txt
echo "All done! All Google Web Fonts removed."
