$md5hash = @{name="MD5_Hash";expression={(Get-FileHash -Algorithm MD5 $_.FullName).hash}}
$sha1hash = @{name="SHA1_Hash";expression={(Get-FileHash -Algorithm SHA1 $_.FullName).hash}}

get-ChildItem -Recurse -File  * | Select-Object -Property Name,Length,Directory,Extension, $md5hash, $sha1hash | Export-CSV Index.csv -NoTypeInformation
