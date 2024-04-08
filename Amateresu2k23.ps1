# BART 2023 # 

#BackupGeter
$p = Get-Date -UFormat %d-%m-%y
#$p1 = '{0:dd-MM-yy}' -f (Get-Date).AddDays(-1)
$foldernew = "E:\BackupsDB\Backup-SQL-$p"  # DESTINO
$folderbkp = "\\Wakanda\BackupF"           # ORIGEN 1
$folderWakanda = "\\Wakanda\Backup"        # ORIGEN 2
#$PATHBURN="C:\Program Files (x86)\CDBurnerXP\"


if (!(Test-Path -path $foldernew)){
New-Item $foldernew -type directory
}

#Ve y busca la info al server # ORIGEN 1
Get-ChildItem $folderbkp -recurse -File | Where{$_.LastWriteTime -gt (Get-Date).AddDays(-2)} | foreach {
#$echo mv $_.FullName $foldernew
Move-Item -Path $_.FullName -Destination $foldernew
}


#Ve y busca la info al server # ORIGEN 2
Get-ChildItem $folderWakanda -recurse -File | Where{$_.LastWriteTime -gt (Get-Date).AddDays(-2)} | foreach {
#$echo mv $_.FullName $foldernew2
Move-Item -Path $_.FullName -Destination $foldernew
}
#Terminate de buca la info?



ENCRIPTA
cd $foldernew
Get-ChildItem $foldernew -recurse -File | foreach {
if ($_.Extension -eq ".7z") {
echo "existe"
}else
{
c:\7Zip\7z.exe a -p@7okf5yhQSVw3q7qNsOc -scrcSHA256 $_.BaseName $_.FullName
Remove-Item -Exclude "*.7z" $_.FullName
}
}
#END ENCRIPTA#