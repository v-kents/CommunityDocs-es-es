## -------------- MAIN ---------------- ##
Get-ChildItem *.md -Exclude TOC.md | 
 ForEach-Object {Write-Output ("#"+$_.BaseName+"("+$_.BaseName+".md)")} | 
 Out-File "TOC.md"
