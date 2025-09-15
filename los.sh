# Don’t forget to Update!
sudo apt-get update && sudo apt-get upgrade -y

# Install required packages
sudo apt-get install git-core git-lfs gnupg flex bison build-essential zip curl zlib1g-dev libc6-dev-i386 x11proto-core-dev libx11-dev python3-protobuf lib32z1-dev libgl1-mesa-dev libssl-dev libxml2-utils xsltproc unzip fontconfig -y

# Install required software
sudo apt-get update
sudo apt-get install repo -y
repo version

# Configure Git
git lfs install

# Initialize the Repo client
mkdir lineage
cd lineage
repo init --git-lfs --no-use-superproject --partial-clone -b lineage-22.2 -u https://github.com/LineageOS/android
mkdir .repo/local_manifests
cd .repo/local_manifests
wget https://raw.githubusercontent.com/lge-timelm-dev/manifest/refs/heads/staging/lineage-22.2/timelm.xml
cd -
repo sync -c -j20 --force-sync
repo sync -c -j1 --fail-fast

# Set up your build environment
source build/envsetup.sh

# Choose a target
breakfast timelm

# Build the code
m bacon -j20

