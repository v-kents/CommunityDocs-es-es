
## --- Functions ---

# read the header and store values in variables to be reused in the new header
function ReadHeaderOldTags($text) {
	
	$Title = ""
	$Description = ""
	$Author = ""
	$Manager = ""
	$Topic = ""
	$Service = ""
	$Workload = ""


	if ($text -Match "pageTitle=`"*`"") {
		$Title = (($text -split "pageTitle=`"", 2)[1] -split "`"")[0]
	}
	
	if ($text -Match "description=`"*`"") {
		$Description = (($text -split "description=`"", 2)[1] -split "`"")[0]
	}
	
	if ($text -Match "services=`"*`"") {
		$Service = (($text -split "services=`"", 2)[1] -split "`"")[0]
	}
	
	if ($text -Match "authors=`"*`"") {
		$Author = (($text -split "authors=`"", 2)[1] -split "`"")[0]
	}
	
	if ($text -Match "managers=`"*`"") {
		$Manager = (($text -split "managers=`"", 2)[1] -split "`"")[0]
	}
	
	if ($text -Match "ms.topic=`"*`"") {
		$Topic = (($text -split "ms.topic=`"", 2)[1] -split "`"")[0]
	}
	return $text
}

# -- remove the old propoerties / tags sections
function RemoveOldHeaders($text) {

	$text = $text -Replace "<properties*/>",""
	$text = $text -Replace "<tags*/>",""

	return $text
}

function AddNewHeader($text) {
	
	$NewHeader = "---"+$NEWLINE
	$NewHeader += "# Sample for CSI"+$NEWLINE
	$NewHeader += "# required metadata"+$NEWLINE
	$NewHeader += "title: "+$Title+$NEWLINE
	$NewHeader += "description: "+$Description +$NEWLINE
	$NewHeader += "keywords: "+$Keywords+$NEWLINE
	$NewHeader += "author: "+$Author +$NEWLINE
	$NewHeader += "manager: "+$Manager+$NEWLINE
	$NewHeader += "ms.date: 06/01/2016"+$NEWLINE
	$NewHeader += "ms.topic: "+$Topic+$NEWLINE
	$NewHeader += "ms.prod: "+$NEWLINE
	$NewHeader += "ms.service: "+$Service+$NEWLINE
	$NewHeader += "ms.assetid: "+$NEWLINE
	$NewHeader += "# optional metadata"+$NEWLINE
	$NewHeader += "#ROBOTS: "+$NEWLINE
	$NewHeader += "#audience:"+$NEWLINE
	$NewHeader += "#ms.devlang: "+$NEWLINE
	$NewHeader += "#ms.reviewer: "+$NEWLINE
	$NewHeader += "#ms.suite: "+$NEWLINE
	$NewHeader += "#ms.tgt_pltfrm:"+$NEWLINE
	$NewHeader += "#ms.technology:"+$NEWLINE
	$NewHeader += "ms.custom: CommunityDocs"+$NEWLINE
	$NewHeader += "---"+$NEWLINE+$NEWLINE
	
	$text = $NewHeader + $text
	
	return $text
}


## -------------- MAIN ---------------- ##
$FileText = ""

$Title = ""
$Description = ""
$Author = ""
$Manager = ""
$Topic = ""
$Service = ""
$Workload = ""
$NEWLINE = "`r`n"

#this is just to test it on MSDN
cd 'c:\BUILD\Microsoft\ES-Community-Content\MSDN\win-dev'

Get-ChildItem *.md -Exclude TOC.md -Recurse |  ForEach-Object {
	$FileText = ""
	
	Get-Content $_.FullName -Encoding UTF8 -Raw | % {$FileText += $_ + "NEWLINE"}

	$Title = ""
	ReadHeaderOldTags($FileText)
	if( $Title -ne "" )  {
		RemoveOldHeaders($FileText)
		AddNewHeader($FileText)
		}
    
    #remove the originally added NEWLINE text
	$text.Replace("NEWLINE","`r`n")  | Out-File $_.FullName -Force
	} 


#Get-ChildItem -Path C:\logs\ -Filter "*.txt" | % {
#    $text = ""
#    Get-Content $_.FullName | % {$text += $_ + "NEWLINE"}
#    $text = $text -Replace "<Default*DefaultValue>",""
#    $text.Replace("NEWLINE","`r`n") | Out-File $_.FullName -Force
#}

