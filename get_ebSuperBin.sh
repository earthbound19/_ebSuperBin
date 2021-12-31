pushd .
cd ..

echo "--"
echo "Downloading _ebSuperBin.7z . . ."
wget https://earthbound.io/data/dist/_ebSuperBin.7z

sha256arr=( $(sha256sum ./_ebSuperBin.7z) )
checksum='962ed868f3b1084f72bc5b87f115017c5fe3e38f9137be541cc0fc90e43a0de4'

echo "Checking sha256 sum of downloaded archive for match of:"
echo "$checksum"
# because if you echo the variable name of an array it prints the first element, this works:
if [ "$sha256arr" == "$checksum" ]
then
	echo "Match. Will extract archive."
	7z x -y _ebSuperBin.7z
	echo "Archive extracted."
else
	echo "NO MATCH. Did not extract archive."
fi

rm ./_ebSuperBin.7z
echo "Destroyed archive."

popd