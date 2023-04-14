# DESCRIPTION
# Retrieves an archive of binaries associated with this repository (a supercollection of executable utilities etc), checks it for a hard-coded checksum match, and if a match if found, wipes and re-clones this repository and extracts the associated binaries archive over it.

# DEPENDENCIES
# git, wget


# CODE
pushd .
cd ..

echo "--"
echo "Downloading _ebSuperBin.7z . . ."
wget https://earthbound.io/data/dist/_ebSuperBin.7z

sha256arr=( $(sha256sum ./_ebSuperBin.7z) )
checksum='c80cf3314cfc957ae46202aec860089c68ae4a2ed25d8d92ea5ea4be27cc4592'

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