# DESCRIPTION
# Retrieves an archive of binaries associated with this repository (a supercollection of executable utilities etc), checks it for a hard-coded checksum match, and if a match is found, wipes and re-clones this repository and extracts the associated binaries archive over it.

# DEPENDENCIES
# git, wget

# USAGE
# From a bash terminal in the same directory as this script, run it:
#    ./get_ebSuperBin.sh


# CODE
# WORKING PATH CHECK
# Check for calling this script from anywhere else if it is in the PATH (re https://stackoverflow.com/a/179231); get full path to script minus file name, then refuse to run if the current path is not the same as the path this script is in.
thisScriptsPath=$(dirname $(readlink -f $0))
workingPath=$(pwd)
if [ "$thisScriptsPath" != "$workingPath" ]; then echo "PROBLEM: working path may not be the same as script. Try again from the same directory as this script, as ./get_ebSuperBin.sh. Exit."; exit 1; fi

# MAIN FUNCTIONALITY
pushd .
cd ..

echo "--"
echo "Downloading _ebSuperBin.7z . . ."
wget https://earthbound.io/data/dist/_ebSuperBin.7z

sha256arr=( $(sha256sum ./_ebSuperBin.7z) )
checksum='f4b1446284bee0141d27e459b89c233e6e1817b7851ccc204e883a9f5473722f'

echo "Checking sha256 sum of downloaded archive for match of:"
echo "$checksum"
# because if you echo the variable name of an array it prints the first element, this works:
if [ "$sha256arr" == "$checksum" ]
then
	echo "Match. Will wipe and recreate git repository and extract associated binary archive."
	rm -rf _ebSuperBin
	git clone https://github.com/earthbound19/_ebSuperBin
	7z x -y _ebSuperBin.7z
	echo "Archive extracted."
else
	echo "NO MATCH. No repository wipe and refresh or archive extract operations performed."
fi

rm ./_ebSuperBin.7z
echo "Destroyed archive."

popd