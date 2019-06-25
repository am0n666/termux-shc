#!/data/data/com.termux/files/usr/bin/bash
# FILE: install.sh
# DATE: 25.06.2019
# Last Modified Date: 25.06.2019
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get  --assume-yes upgrade 
apt-get  --assume-yes install coreutils gnupg wget
# Make the sources.list.d directory
[ ! -d $PREFIX/etc/apt/sources.list.d ] && mkdir $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if [ ! -f "$PREFIX/etc/apt/sources.list.d/rendiix.list" ]; then
echo "deb https://rendiix.github.io/ stable main" > $PREFIX/etc/apt/sources.list.d/rendiix.list

echo -e "\ngetting the repo key...\n"
wget https://rendiix.github.io/rendiix.gpg -q --show-progress
apt-key add rendiix.gpg
apt-get update
else
echo -e "\nrepo already installed\n"
fi

if [ "$?" = 0 ]; then
	apt-get --assume-yes install shc
	echo -e "\nDone! shc succesfully installed"
else
	echo -e "\nSometing wrong, please re run this script"
	exit 1
fi
