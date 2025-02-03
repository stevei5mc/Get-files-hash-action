targetFilesName="$1"
hashListFileName="$2"
hashListFilesSavePath="$3"
printHashListFilesHashToName="$4"
#-------------
hashListFiles="$hashListFilesSavePath"/"$hashListFileName".txt
echo ==================== Start get md5 ====================
sha256sum "$targetFilesName" | tee "$hashListFile".txt
if [ "$printHashListFilesHashToName" == "true" ]; then
   hashListFilesHash=$(sha256 "$hashListFiles"|awk '{print $1}')
   hashListFileName2="$hashListFilesName"-sha256-"$hashListFilesHash".txt
   hashListFile2="$hashListFilesSavePath"/"$hashListFilesName2".txt
   mv "$hashListFiles" "$hashListFiles2"
fi
echo ==================== Md5 get over ====================