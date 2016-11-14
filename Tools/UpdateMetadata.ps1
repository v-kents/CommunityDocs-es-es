
## --- Functions ---

# read the header and store values in variables to be reused in the new header
function ReadMetadata($text) {

# metadata should look like this (at the very top of the .md file)    
# ---
# title: Backup e DataSync con SQL Azure e SQL Server
# description: Backup e DataSync con SQL Azure e SQL Server
# author: MSCommunityPubService
# ms.date: 08/01/2016
# ms.topic: how-to-article
# ms.service: cloud
# ms.custom: CommunityDocs
# ---

	$global:Title = ""
	$global:Description = ""
	$global:Author = ""
	$global:MS_Manager = ""
	$global:MS_Topic = ""
	$global:MS_Service = ""
	$global:MS_Custom = ""
    $global:MS_Author = ""
    $global:MS_Date = ""
    $global:MS_Prod = ""
    $global:MS_Technology = ""

#	isolating header only
	$header = ($text -split "---",3)[1]
	

	if ($text -Match "title: *") {
		$global:Title = (($text -split "title: ", 2)[1] -split "\n")[0].Trim()
	}
	
	if ($text -Match "description: *") {
		$global:Description = (($text -split "description: ", 2)[1]  -split "\n")[0].Trim()
	}
	
	if ($text -Match "ms.service: *") {
		$global:MS_Service = (($text -split "ms.service: ", 2)[1]  -split "\n")[0].Trim()
	}
	# github author handle
	if ($text -Match "author: *") {
		$global:Author = (($text -split "author: ", 2)[1]  -split "\n")[0].Trim()
	}
	
	if ($text -Match "ms.manager: *") {
		$global:MS_Manager = (($text -split "ms.manager: ", 2)[1]  -split "\n")[0].Trim()
	}
	# try manager if ms.manager is not there
    if ($text -Match "manager: *") {
		$global:MS_Manager = (($text -split "manager: ", 2)[1]  -split "\n")[0].Trim()
	}
	
	if ($text -Match "ms.topic: *") {
		$global:MS_Topic = (($text -split "ms.topic: ", 2)[1]  -split "\n")[0].Trim()
	}
    # MS alias for person responsible
    if ($text -Match "ms.author: *") {
		$global:MS_Author = (($text -split "ms.author: ", 2)[1]  -split "\n")[0].Trim()
	}
    
    if ($text -Match "ms.date: *") {
		$global:MS_Date = (($text -split "ms.date: ", 2)[1]  -split "\n")[0].Trim()
	}
    
    if ($text -Match "ms.custom: *") {
		$global:MS_Custom = (($text -split "ms.custom: ", 2)[1]  -split "\n")[0].Trim()
	}
    
    if ($text -Match "ms.prod: *") {
		$global:MS_Prod = (($text -split "ms.prod: ", 2)[1]  -split "\n")[0].Trim()
	}
    if ($text -Match "ms.technology: *") {
		$global:MS_Technology = (($text -split "ms.technology: ", 2)[1]  -split "\n")[0].Trim()
	}
	return $text
}

# -- remove the old properties / tags sections
function RemoveOldHeaders($text) {
    #need to make sure that if there's an article without metadata section

    # splitting in 3 parts - 0 is empty / 1 contains the whole metadata section / 2 the rest of the article except the metadata
	$text = ($text -split "---",3)[2]

	return $text
}

function AddNewHeader($text) {
	$Title = $Title.Replace(":","-")
	$Description = $Description.Replace(":","-")
	
	$NewHeader = "---"+$NEWLINE
	# $NewHeader += "# Sample for CSI"+$NEWLINE
	# $NewHeader += "# required metadata"+$NEWLINE
	$NewHeader += "title: "+$Title+$NEWLINE
	$NewHeader += "description: "+$Description +$NEWLINE
	#$NewHeader += "keywords: "+$Keywords+$NEWLINE
	if (($Author -eq "") -or ($Author -eq "andygonusa") -or ($Author -eq "aldonetti") -or ($Author -eq "walterosR1") -or ($Author -eq "terrysheng")) {
		$NewHeader += "author: MSCommunityPubService"+$NEWLINE
	} else {
		$NewHeader += "author: "+$Author +$NEWLINE
	}
	
    #fixing it for italian
    $NewHeader += "ms.author: andygon"+$NEWLINE
    
    # per Gigel - Manager is not mandatory anymore
    # $NewHeader += "manager: csiism"+$NEWLINE
    
	$NewHeader += "ms.date: "+$MS_Date+$NEWLINE
    
    #forcing it to be a valid topic type
	$NewHeader += "ms.topic: article"+$NEWLINE
    
	
	$NewHeader += "ms.service: "+$MS_Service+$NEWLINE

	    # this should be something but has to be manually set
	$NewHeader += "ms.prod: "+$NEWLINE
	$NewHeader += "ms.technology:"+$NEWLINE

	#$NewHeader += "ms.assetid: "+$NEWLINE
	#$NewHeader += "# optional metadata"+$NEWLINE
	#$NewHeader += "#ROBOTS: "+$NEWLINE
	#$NewHeader += "#audience:"+$NEWLINE
	#$NewHeader += "#ms.devlang: "+$NEWLINE
	#$NewHeader += "#ms.reviewer: "+$NEWLINE
	#$NewHeader += "#ms.suite: "+$NEWLINE
	#$NewHeader += "#ms.tgt_pltfrm:"+$NEWLINE
	

	
    $NewHeader += "ms.custom: CommunityDocs"+$NEWLINE
	
    $NewHeader += "---"+$NEWLINE+$NEWLINE
	
	$text = $NewHeader + $text.Trim()
	
	return $text
}


## -------------- MAIN ---------------- ##
$FileText = ""

$NEWLINE = "`r`n"

#this is just to test it on MSDN
cd 'C:\BUILD\Microsoft\CommunityDocs-es-es\MSDN'

Get-ChildItem *.md -Exclude TOC.md -Recurse |  ForEach-Object {
	$FileText = ""
	
    $Title = ""
    $Description = ""
    $Author = ""
    $MS_Author = ""
    $MS_Date = ""
    $MS_Manager = ""
    $MS_Topic = ""
    $MS_Service = ""
    $MS_Custom = ""


	Get-Content $_.FullName -Raw -Encoding UTF8 | % {$FileText += $_ + "NEWLINE"}

	$Title = ""
	ReadMetadata($FileText)
    
	if( $Title -ne "" )  {
		$FileText = RemoveOldHeaders($FileText)
		$FileText = AddNewHeader($FileText)
		}
    
    #remove the originally added NEWLINE text
	#$FileText.Replace("NEWLINE","`r`n")  | Out-File $_.FullName -Force -Encoding UTF8
	$FileText = $FileText.Replace("NEWLINE","`r`n")  
	
	$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
	[System.IO.File]::WriteAllLines($_.Fullname,$FileText, $Utf8NoBomEncoding)
	} 


#Get-ChildItem -Path C:\logs\ -Filter "*.txt" | % {
#    $text = ""
#    Get-Content $_.FullName | % {$text += $_ + "NEWLINE"}
#    $text = $text -Replace "<Default*DefaultValue>",""
#    $text.Replace("NEWLINE","`r`n") | Out-File $_.FullName -Force
#}

