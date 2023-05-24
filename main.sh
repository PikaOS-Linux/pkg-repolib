# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
### WTF ###
#git clone https://github.com/pop-os/repolib
#rm -rvf ./repolib/debian
### WTF ###
cp -rvf ./python3-repolib.install ./debian/
cp -rvf ./debian ./repolib/
cd ./repolib

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
