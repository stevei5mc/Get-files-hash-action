targetFilesName="$1"
hashListFileName="$2"
hashListFilesSavePath="$3"
printHashListFilesHashToName="$4"
#-------------
hashListFile="$hashListFilesSavePath"/"$hashListFileName".txt
echo ==================== Start get md5 ====================
md5sum "$targetFilesName" | tee "$hashListFile".txt
if [ "$printHashListFilesHashToName" == "true" ]; then
   hashListFilesHash=$(md5sum "$hashListFiles"|awk '{print $1}')
   hashListFileName2="$hashListFilesName"-md5-"$hashListFilesHash".txt
   hashListFile2="$hashListFilesSavePath"/"$hashListFilesName2".txt
   mv "$hashListFiles" "$hashListFiles2"
fi
echo ==================== Md5 get over ====================