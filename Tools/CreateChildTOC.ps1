## -------------- MAIN ---------------- ##

#cd c:\BUILD\Microsoft\ES-Community-Content\MSDN\web-dev\

Get-ChildItem *.md -Exclude TOC.md | 
 ForEach-Object {Write-Output ("#["+$_.BaseName+"]("+$_.BaseName+".md)")} | 
 Out-File "TOC.md"
