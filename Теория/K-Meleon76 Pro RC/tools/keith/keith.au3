; AutoIt Version: 3.3.0
; Language: blahblah
; Platform: Win9x/NT
; Author: yanni
; Script Function: kmeleon extension installer turbo helper (online/offline installer)

#NoTrayIcon
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#include <ProgressConstants.au3>
#Include <String.au3>
#Include <File.au3>
#Include <Array.au3>
#include <Misc.au3>

if _Singleton("KEIH",0) = 0 Then
exit
endif

$kmpath=StringTrimRight (@scriptdir, 12)

$deletable1 = ($kmpath & "\components\compreg.dat")
$deletable2 = ($kmpath & "\components\xpti.dat")
$kmbinary=($kmpath & "\k-meleon.exe")

if $CmdLine[0] = 0 Then
$extpath = FileOpenDialog("Select Extension", @WorkingDir & "", "K-Meleon Compressed Extensions (*.7z)", 1)
$extgname1=StringInStr($extpath , "\", 0, -1)
$extgname2=StringTrimLeft ($extpath, $extgname1)
$kextname=stringreplace($extgname2,".7z", "")
checker()
ElseIf $CmdLine[0] = 1 Then
$extpath =$CmdLine[1]
extsite()
EndIf

Func extsite()
$onlinecheck=StringRegExp($extpath, "(?i)http://")
if $onlinecheck=1 Then
isvalid()
Else
checker()
Endif
Endfunc

Func isvalid()
$valid=StringRegExp($extpath, "(?i)http://kmext.s")
if $valid=1 Then
onlinechecker()
Else
MsgBox(48, "KEM Error", "Invalid website. K-Meleon extensions can only be downloaded from K-Meleon's extensions websites", 8)
Endif
Endfunc

Func checker()
$checkfucker=StringRegExp($extpath, "(?i)7z")
if $checkfucker=0 Then
exit
Else
installshit()
Endif
Endfunc

Func onlinechecker()
$checkfucker=StringRegExp($extpath, "(?i)7z")
if $checkfucker=0 Then
MsgBox(48, "KEM Error", "Unrecognised extension format. aborting.", 8)
Else
onlineinstaller()
Endif
Endfunc



func installshit()
If FileExists($kmbinary) Then
ProgressOn("KEM: installing extension, please wait..", "initalising..", "0 percent", -1, -1, 16)
For $i = 10 to 100 step 10
ProgressSet( $i, $i & " percent")
$kmbinary=($kmpath & "\k-meleon.exe")
;ProgressSet(5, "6 percent", "extracting files")
$7zpath =(@ScriptDir & "\7z\7z.exe")
$pend = FileGetShortName($kmpath)
;ProgressSet(15, "15 percent", "extracting..")
$pendparm1 = _StringInsert($pend, "-o", 0)
$pendparm2 = ($pendparm1 & " -y")
$pendparm3 = _StringInsert($pendparm2, " ", 0)
$pendparm7z=("""" & $extpath & """")
$extparm = ("x " & $pendparm7z)
;ProgressSet(25, "25 percent", "extraction completed")
$overparm = ($extparm & $pendparm3)
$finalparam =($7zpath & " " & $overparm)
;shellexecute($7zpath, $overparm)
run($finalparam, "", @SW_HIDE)
;ProgressSet(65, "65 percent", "extraction completed")
;MsgBox(4096, "Test", $finalparam)
;ProgressSet(85, "85 percent", "registering components")
setkm()
;ProgressSet(94, "94 percent", "finalising..")
next
checkloader()

ProgressSet(100 ,"installed successfully" , $kextname)
Winwaitactive("[CLASS:KMeleon Browser Window]", "", 5)

sleep(3888)
ProgressOff()
;MsgBox(64, "K-Meleon Extension Installer Helper", "Extension was installed successfully.  ")
exit
Else
MsgBox(48, "Error", "Invalid directory. Make sure to select K-Meleon's Install folder ")
Endif
endfunc

Func setkm()
FileDelete($deletable1)
sleep(40)
FileDelete($deletable2)
endFunc

Func checkloader()
if processexists("loader.exe") Then
fireloader()
else
firekm()
endIf
EndFunc

func fireloader()
$kmLoader=($kmpath & "\loader.exe")
ProcessClose("loader.exe")
sleep(20)
ProcessClose("k-meleon.exe")
sleep(88)
Run($kmbinary)
sleep(4888)
Run($kmLoader)
EndFunc

Func firekm()
While ProcessExists("k-meleon.exe")
       WinClose("[CLASS:KMeleon Browser Window]", "");
       sleep(400);
       If WinActive("K-Meleon") Then
       Send("{Enter}")
       EndIf
Wend
sleep(1400)
Run($kmbinary)
endFunc

Func onlineinstaller()
$getextname1=StringInStr($cmdline[1], "/" , 0, -1)
$getextname2=stringtrimleft($cmdline[1], $getextname1)
$kextname=stringreplace($getextname2, ".7z", "")
$penddownload=(@tempdir & "\kmextpend.7z")


$FileURL=$CmdLine[1]
    $FileSaveLocation = $penddownload
    $FileSize = InetGetSize($FileURL)
    $FileDownload = InetGet($FileURL, $FileSaveLocation, 0, 1)
ProgressOn("KEM  Online Installer", "downloading:" & $kextname)
    Do
        $Percentage = InetGetInfo($FileDownload, 0) * 100 / $FileSize
        ProgressSet($Percentage, Round($Percentage, 0) & "%  [ progress: " & Round(InetGetInfo($FileDownload, 0) / 1048576, 2) & " of " & Round($FileSize / 1048576, 2) & " MB ]", "downloading:  " & $kextname)
        Sleep(250)
    Until InetGetInfo($FileDownload, 2)
    
    
ProgressSet(10, "extracting and installing..", $kextname)
For $i = 10 to 100 step 10
ProgressSet( $i, $i & " percent")
$7zpath =(@ScriptDir & "\7z\7z.exe")
$pend = FileGetShortName($kmpath)
;ProgressSet(80, "80 percent", "extracting..")
$pendparm1 = _StringInsert($pend, "-o", 0)
$pendparm2 = ($pendparm1 & " -y")
$pendparm3 = _StringInsert($pendparm2, " ", 0)
$pendparm7z=("""" & $penddownload & """")
$extparm = ("x " & $pendparm7z)
;ProgressSet(85, "85 percent", "extraction complete..")
$overparm = ($extparm & $pendparm3)
$finalparam =($7zpath & " " & $overparm)
;shellexecute($7zpath, $overparm)
run($finalparam, "", @SW_HIDE)
;ProgressSet(90, "90 percent", "installing..")
;MsgBox(4096, "Test", $finalparam)
;ProgressSet(90, "95 percent", "registering components")
;ProgressSet(95, "95 percent", "finalising..")
next
ProgressSet(100 , "extension installed successfully", $kextname)
setkm()
;
checkloader()

Winwaitactive("[CLASS:KMeleon Browser Window]", "", 5)
sleep(888)
;MsgBox(64, "K-Meleon Extension Installer Helper", "Extension was installed successfully.  ")
ProgressOff()
exit

EndFunc