; AutoIt Version: 3.3.0
; Language:       Englisch
; Platform:       Win9x/NT
; Author:         yanni
;refiejspage=shell.run("\"G:\\applications-x\\KMplus\\k-meleon.exe\" \"" + "chrome://coralietab/content/container.html?url=0," + external.menuArguments.document.URL + "\"");

;refiejspage=shell.run("\"G:\\applications-x\\KMplus\\k-meleon.exe\" \"" + "chrome://coralietab/content/container.html?url=0," + location + "\"");

#NoTrayIcon
#Include <File.au3>
#Include <String.au3>

$ietablink=(@scriptdir & "\ietablink.html")
$ietabpage=(@scriptdir & "\ietabpage.html")
$kmlink=(@scriptdir & "\kmlink.html")
$kmpage=(@scriptdir & "\kmpage.html")
$iechrome=("chrome://coralietab/content/container.html?url=0,")


$findkmpend=StringTrimRight(@scriptdir ,14)
$getkm=($findkmpend & "k-meleon.exe")

$jsvalidate=StringReplace($getkm, "\", "\\")

$kmjspage=("shell.run(" & """" & "\" & """" & $jsvalidate & "\" & """" & " \" & """" & """" & " + external.menuArguments.document.URL + " & """" & "\" & """" & """" & ");")

$kmjslink=("shell.run(" & """" & "\" & """" & $jsvalidate & "\" & """" & " \" & """" & """" & " + location + " & """" & "\" & """" & """" & ");")

$iejspage=("shell.run(" & """" & "\" & """" & $jsvalidate & "\" & """" & " \" & """" & """" & " + " & """" & $iechrome & """" & " + external.menuArguments.document.URL + " & """" & "\" & """" & """" & ");")

$iejslink=("shell.run(" & """" & "\" & """" & $jsvalidate & "\" & """" & " \" & """" & """" & " + " & """" & $iechrome & """" & " + location + " & """" & "\" & """" & """" & ");")

;MsgBox(4096, "Test", $iejspage)
$fcheck=FileExists($getkm)

if $fcheck=1 then
_FileWriteToLine($ietablink, 5, $iejslink, 1)
_FileWriteToLine($ietabpage, 4, $iejspage, 1)
_FileWriteToLine($kmlink, 5, $kmjslink, 1)
_FileWriteToLine($kmpage, 4, $kmjspage, 1)
resume()
else
MsgBox(48, "error", "there seems to be a problem. can't find k-meleon binary. make sure to extract this extension in its proper folders. ")
endif

func resume()
if $CmdLine[0]=0 Then
removesups()
Else
chkcommand()
EndIf
Exit
endfunc

func chkcommand()
if $cmdline[1]=("extramenus") then
addsups()
elseif $cmdline[1]=("disscript") then
disscript()
else
morecommands()
endif
endfunc


Func removesups()
RegDelete("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>IEtab")
RegDelete("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>KMtab")
RegDelete("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>IEtab")
RegDelete("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>KMtab")
exit
endfunc

Func addsups()
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>IEtab", "", "REG_SZ", $ietablink)
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>IEtab", "contexts", "REG_DWORD", "34")
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>KMtab", "", "REG_SZ", $kmlink)
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Link>KMtab", "contexts", "REG_DWORD", "34")
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>IEtab", "", "REG_SZ", $ietabpage)
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>IEtab", "contexts", "REG_DWORD", "1")
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>KMtab", "", "REG_SZ", $kmpage)
RegWrite("HKCU\Software\Microsoft\Internet Explorer\MenuExt\Open Page>KMtab", "contexts", "REG_DWORD", "1")
exit
endfunc

func disscript()
RegWrite("HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1400", "REG_DWORD", "3")
exit
endfunc

func morecommands()
if $cmdline[1]=("enscript") then
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1400", "REG_DWORD", "0")
elseif $cmdline[1]=("clear") then
$iecache=(@scriptdir & "\iecache\iecache.exe /DELETE")
run($iecache, "", @sw_hide)
else
exit
endif
exit
endfunc

