#!/bin/bash

# OS detect 
osdetect=$(uname)
file_path="unknown"
if [[ "$osdetect" == 'Linux' ]]; then
    file_path="sudo mv fonts/* /usr/local/share/fonts/"
elif [[ "$osdetect" == 'Darwin' ]]; then
    file_path="mv fonts/* /Library/Fonts/"
elif [[ "$osdetect" == 'Arch Linux' ]]; then
    file_path="sudo mv fonts/* /usr/share/fonts/"
fi

clear
echo "Installing all Google Web Fonts onto your System"
echo "Downloading the fonts..."
cd ~/Documents/
curl -L https://github.com/google/fonts/tarball/master -o master.tar.gz
echo "Extracting the fonts..."
mkdir -p goog-fonts/fonts
tar -zxf master.tar.gz -C goog-fonts/fonts
cd goog-fonts
cd fonts
find . -mindepth 2 -type f -print -exec mv {} . \;
rm -R -- */
rm *.txt
rm *.json
rm *.csv
rm *.md
rm *.html
rm *.py
rm AUTHORS
rm CONTRIBUTORS
cd ..
$file_path

echo "Fonts installed; Cleaning up files..."
cd ~/Documents/
rm -f master.tar.gz
rm -rf goog-fonts
echo "All done! All Google Fonts installed."
