pushd .
cd ..

echo "--"
echo "Downloading _ebSuperBin.7z . . ."
wget https://earthbound.io/data/dist/_ebSuperBin.7z

sha256arr=( $(sha256sum ./_ebSuperBin.7z) )
checksum=5a530d2eccd420a1fb3e77e7f7dec5e3b57ffd75bdcb0b93b615ff231d3eb242

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