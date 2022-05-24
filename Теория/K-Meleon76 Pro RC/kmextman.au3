; AutoIt Version: 3.2.12.1 or later
; Language:       english by default with support to localizations
; Platform:       Win9x/NT
; Authors:         desga, playwin2, alain(jujuland) & disrupted
; Locales: gunter, siria, desga, alex tarantul, alain aupeix, matt, xgrind(michael)
; Modifications for version 2.0:  desga2
; modifications for version 3.0: playwin2
;KEM VERSION 7.2 adds better support for vista/7
;(k-meleon extensions manager +keith)

#Include <File.au3>
#Include <Array.au3>
#Include <Misc.au3>
#Include <GUIConstantsEx.au3>
#Include <GUIComboBox.au3>
#include <WindowsConstants.au3>

#NoTrayIcon

; Only one instance allowed
If _Singleton("KME", 0)=0 Then
	Exit
EndIf

if fileexists(@scriptdir & "\k-meleon.exe") then
FileSetAttrib (@scriptdir & "\macros","-RS", 1)
FileSetAttrib (@scriptdir & "\chrome","-RS", 1)
FileSetAttrib (@scriptdir & "\components","-RS", 1)
FileSetAttrib (@scriptdir & "\locales","-RS", 1)
FileSetAttrib (@scriptdir & "\plugins","-RS", 1)
FileSetAttrib (@scriptdir & "\kplugins","-RS", 1)
FileSetAttrib (@scriptdir & "\skins","-RS", 1)
FileSetAttrib (@scriptdir & "\styles","-RS", 1)
FileSetAttrib (@scriptdir & "\scripts","-RS", 1)
FileSetAttrib (@scriptdir & "\kmextensions","-RS", 1)
FileSetAttrib (@scriptdir & "\defaults","-RS", 1)
FileSetAttrib (@scriptdir & "\defkmfiles","-RS", 1)
FileSetAttrib (@scriptdir & "\modules","-RS", 1)
endif

; Setting dialogs strings
Dim $txt[20]
$txt[0]=19 ; Totals strings
$txt[1]="K-Meleon Extensions Manager Error"
$txt[2]="Only execute the manager from inside K-Meleon."
$txt[3]="K-Meleon Extensions Manager"
$txt[4]="Uninstall"
$txt[5]="Edit macro"
$txt[6]="Run installer"
$txt[7]="Note: K-Meleon will be restarted on an uninstall/install"
$txt[8]="Can't uninstall: malformed ini, please reinstall this extension or contact the author."
$txt[9]="The extension: "
$txt[10]=" has been uninstalled"
$txt[11]="Macro editor mode: When done remember to save and restart K-Meleon for changes to take effect."
$txt[12]="This extension does not include a macro."
$txt[13]="You don't have any installed extensions. Would you like to download extensions?"
$txt[14]="Installed extensions:"
$txt[15]="Install date:"
$txt[16]="Info:"
$txt[17]="KEU: uninstall complete"
$txt[18]="Do you want delete this empty or malformed ini file?"
$txt[19]="N/A"

; Check if exist command line parameters
If $cmdline[0]<2 or processexists("k-meleon.exe")=0 Then
	;MsgBox(48, $txt[1], $txt[2])
	exit
	;else
	;FileSetAttrib ($cmdline[1],"-RS", 1)
EndIf

; Setting paths
$KEITH=@ScriptDir & "\tools\keith\keith.exe"
$KMBIN=@ScriptDir & "\k-meleon.exe"
$DEL1=@ScriptDir & "\components\xpti.dat"
$DEL2=@ScriptDir & "\components\compreg.dat"
$kmexthome="http://kmext.sourceforge.net"
$openhome=$KMBIN & " " & $kmexthome
$medit=@ScriptDir & "\tools\keith\notepad2.exe"
$locales=@ScriptDir & "\locales\"
; Settings other default strings
$inini=@ScriptDir & "\kmextensions"
$kmunext="*.ini"
$inipath="" ;"pending"
$kmprefs=$CmdLine[1] & "\prefs.js"
$kmprof=$CmdLine[1] & "\"
;$testrun="c:\windows\notepad.exe"
$localepath=@ScriptDir & "\locales\" & $cmdline[2] & "\kmextman.ini"

; Load localization strings from local ini file
If FileExists($localepath) Then
	For $index=1 To $txt[0]
		$txt[$index]=IniRead($localepath, "kmextman", $index, $txt[$index])
	Next
EndIf 

; Load extensions installed
$FileList=_FileListToArray($inini, $kmunext)

;************ CHANGE by playwin2 ******************************
;prev code: If @error=1 Or $FileList=0 Then
If @error=1 Then
	openkmext()
	;MsgBox(64, "K-meleon Extensions Manager", "You don't have any installed extensions.")
Else
	;************ CHANGE by playwin2 ******************************
	;<new code>
	If $FileList=0 Then
		;no ext found :(
		$num = 0
	Else
		$num = $FileList[0]
	EndIf
	;****************************************************************
	; Setting string of extensions installed
	$pentrim=_ArrayToString($FileList, "|", 1)
	$remini=StringReplace($pentrim, ".ini", "")
	$first=StringInStr($remini, "|" , "", 1)
	$initial=StringMid($remini, 1, $first-1)
	;MsgBox(0, "test", $initial)
	; Build the GUI dialog
	$hGUI=GUICreate($txt[3], 310, 200)
	;************ CHANGE by playwin2 ******************************
	;prev code: $Label1=GUICtrlCreateLabel($txt[14] & " " & $FileList[0], 10, 3, 160, 15)
	$Label1=GUICtrlCreateLabel($txt[14] & " " & $num, 10, 3, 160, 15)
	$hCombo=GUICtrlCreateCombo("", 10, 20, 180, 100,BitOr($CBS_DROPDOWNLIST, $WS_VSCROLL))
	$update=GUICtrlSetData($hCombo, $remini, $initial)
	$hButton=GUICtrlCreateButton($txt[4], 200, 20, 100) ; Uninstall button
	$mButton=GUICtrlCreateButton($txt[5], 200, 65, 100) ; Edit macro button
	$iButton=GUICtrlCreateButton($txt[6], 200, 100, 100) ; Run installer button
	$eButton=GUICtrlCreateButton("kmext.sf.net", 200, 130, 100) ; Web site button
	$Label2=GUICtrlCreateLabel($txt[7], 10, 165, 290, 30)
	$inipath=$inini & "\" & $initial & ".ini" ;GUICtrlRead($hCombo) & ".ini" ;$FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1]
	$findinfo=IniRead($inipath, "info", "1", $txt[19])
	; Check if is a malformed ini file and warning about it
	If $findinfo="" Then $findinfo=$txt[8]
	$a_date=FileGetTime($inipath, 1)
	;$a_date[0]=year (four digits)
	;$a_date[1]=month (range 01 - 12)
	;$a_date[2]=day (range 01 - 31)
	;$a_date[3]=hour (range 00 - 23)
	;$a_date[4]=min (range 00 - 59)
	;$a_date[5]=sec (range 00 - 59)
	
	;************ CHANGE by playwin2 ******************************
	;<new code>
	$date = $txt[19]
	If Not @error Then 
		$date=$a_date[0] & "/" & $a_date[1] & "/" & $a_date[2] & " " & $a_date[3] & ":" & $a_date[4] & ":" & $a_date[5]
	;   $date=yyyy/mm/dd hh:mm:ss
	EndIf
	$extinstdate=GUICtrlCreateLabel($txt[15] & " " & $date, 11, 50, 180, 12)
	;$setdata=GUICtrlCreateLabel($date, 100, 44, 150, 12)
	$info=GUICtrlCreateLabel($txt[16], 11, 70, 180, 12)
	$desc=GUICtrlCreateLabel($findinfo, 11, 85, 180, 70)
	
	;************ CHANGE by playwin2 ******************************
	;<new code>
	If $num=0 Then
		;disable combo and 1st. two buttons
		GUICtrlSetState($hCombo, $GUI_DISABLE)
		GUICtrlSetState($hButton, $GUI_DISABLE)
		GUICtrlSetState($mButton, $GUI_DISABLE)
	EndIf
	;**************************************************************
	
	GUISetState() ;@SW_SHOW
	WinActivate($txt[3])
	;WinSetOnTop($txt[3], "", 1)
	runman()
EndIf

Func runman()
While 1
$msg=GUIGetMsg()
Select
	Case $msg=$GUI_EVENT_CLOSE
	Exit

	Case $msg=$hCombo ; Extension selection from combo list
	$inipath=$inini & "\" & GUICtrlRead($hCombo) & ".ini" ;$FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1]
	$findinfo=IniRead($inipath, "info", "1", $txt[19])
	; Check if is a malformed ini file and warning about it
	If $findinfo="" Then $findinfo=$txt[8]
	$a_date=FileGetTime($inipath,1)
	If Not @error Then
		$date=$a_date[0] & "/" & $a_date[1] & "/" & $a_date[2] & " " & $a_date[3] & ":" & $a_date[4] & ":" & $a_date[5]
	;   $date=yyyy/mm/dd hh:mm:ss
	EndIf
	GUICtrlSetData($desc, $findinfo)
	GUICtrlSetData($extinstdate, $txt[15] & " " & $date)

	Case $msg=$hButton ; Uninstall button
	;MsgBox(64, "K-meleon Extensions Manager", $testrun & " " & $inini & "\" & $FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1]) ;GUICtrlRead($hCombo) & ".ini"
	;$commandtest=$testrun & " " & $inini & "\" & $FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1] ;GUICtrlRead($hCombo) & ".ini"
	$inipath=$inini & "\" & GUICtrlRead($hCombo) & ".ini" ;$FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1]
	If FileExists($inipath) Then
		;MsgBox(64, "K-meleon Extensions Manager", $inipath)
		;$inisections=""
		$inisections=IniReadSectionNames($inipath) ; element[0] is the total number of sections in ini file.
		If @error Or $inisections="" Or $inisections[0]=0 Then
			IniError()
		Else
			; Check integrity of ini file, no empty keys
			$badini=0
			For $i_sec=1 To $inisections[0]
				$section=IniReadSection($inipath, $inisections[$i_sec])
				If @error Then ContinueLoop
				For $i_key=1 To $section[0][0]
					; Security folder checked, only delete under KM folder
					If FileExists($KMBIN) And $section[$i_key][1]="" Then
						IniError()
						$badini=1
						ExitLoop 2
					EndIf
				Next
			Next
			If $badini=1 Then ContinueLoop
			ProcessClose("loader.exe") ; Loader and K-Meleon will be now closed, are you sure to continue?
			ProcessClose("k-meleon.exe")
			While ProcessExists("k-meleon.exe")
				ProcessClose("k-meleon.exe") ; For kill multiples instances
			WEnd
			; DISABLE controls:
			GUICtrlSetState($hCombo, $GUI_DISABLE)
			GUICtrlSetState($hButton, $GUI_DISABLE)
			GUICtrlSetState($mButton, $GUI_DISABLE)
			GUICtrlSetState($iButton, $GUI_DISABLE)
			;GUICtrlSetState($eButton, $GUI_DISABLE)
			;GUISetState(@SW_DISABLE, $hGUI) ; Or disable the window
			ProcessWaitClose("loader.exe") ;Sleep(500)
			ProcessWaitClose("k-meleon.exe")
			; Load ini file section arrays using IniReadSection("filename", "section") function:
			; Element[n][0] is the key and element[n][1] is the value, element[0][0] is the total number of elements in section.
			For $i_sec=1 To $inisections[0]
				Switch $inisections[$i_sec]
				Case "macros"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "macros" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "chrome"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "chrome" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "components"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "components" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "kplugins"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "kplugins" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "plugins"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "plugins" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "pref"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "defaults\pref" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "locales"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "locales" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "tools"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "tools" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "scripts"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "scripts" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "skins"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "skins\default" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "stylesheets"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "styles" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
								Case "xpi"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "browser\extensions" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
						next
														Case "pref2"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "defaults\preferences" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "profile"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=$CmdLine[1] & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
				Case "root"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], "\") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
					
					
;update 5.7 write back default prefs when applicable
				Case "defaultpref"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
					FileWriteLine($kmprefs, $section[$i_key][1])
					Next
					
;update 5.9 restores original k-meleon files where applicable
				Case "defkmfiles"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
					$defsrc=@scriptdir & "\defkmfiles\" & $section[$i_key][1]
					if fileexists($defsrc) then
					Filecopy($defsrc, @scriptdir & "\" & $section[$i_key][1], 1)
					sleep(44)
					FileDelete($defsrc)
					endif
					Next
					
;lupdate 7.3 for kmeleon 1.6-gecko1.9 adds support for modules
									Case "modules"
					$section=IniReadSection($inipath, $inisections[$i_sec])
					If @error Then ContinueLoop
					For $i_key=1 To $section[0][0]
						$delfile=@ScriptDir & "\" & "modules" & "\" & $section[$i_key][1]
						; Security folder checked, only delete under KM folder
						If FileExists($KMBIN) And $section[$i_key][1]<>"" And $section[$i_key][1]<>"." And Not(StringInStr($section[$i_key][1], ";") Or StringInStr($section[$i_key][1], "/") Or StringInStr($section[$i_key][1], "..") Or StringInStr($section[$i_key][1], ":") Or StringInStr($section[$i_key][1], "%") Or StringInStr($section[$i_key][1], "*") Or StringInStr($section[$i_key][1], "?")) And FileExists($delfile) Then
							$f_attrib=FileGetAttrib($delfile)
							If StringInStr($f_attrib, "D") Then
								DirRemove($delfile, 1)
							Else
								FileDelete($delfile)
							EndIf
						EndIf
					Next
					
					
				EndSwitch
			Next
			$findextname=GUICtrlRead($hCombo) ;StringTrimRight($findmacro, 4)
			$message=$txt[9] & $findextname & $txt[10]
			GUIDelete()
			ProgressOn($txt[3], $findextname)
			For $i = 10 to 100 step 40

			Sleep(100)
			FileDelete($inipath)
			FileDelete($DEL1)
			FileDelete($DEL2)

			$cleanclose='user_pref("kmeleon.plugins.sessions.cleanShutdown", true);'
			FileWriteLine($kmprefs, $cleanclose)
			Sleep(100)
			ProgressSet( $i, $i & " percent")
			Next
			Run($KMBIN)
			WinWaitActive("[CLASS:KMeleon Browser Window]", "", 5)
			Sleep(1000)

			ProgressSet(100 , $message, $txt[17])
			sleep(4000)
			ProgressOff()

			;MsgBox(64, $txt[17], $message, 10)
			;ReloadExt()
			; ENABLE controls:
			;GUICtrlSetState($hCombo, $GUI_ENABLE)
			;GUICtrlSetState($hButton, $GUI_ENABLE)
			;GUICtrlSetState($mButton, $GUI_ENABLE)
			GUICtrlSetState($iButton, $GUI_ENABLE)
			;GUICtrlSetState($eButton, $GUI_ENABLE)
			;GUISetState(@SW_ENABLE, $hGUI) ; Or enable the window
			;WinActivate($txt[3])
			Exit
		EndIf
	Else
		GUICtrlSetData($desc, $txt[8])
	EndIf

	Case $msg=$mButton ; Edit macro button
	$findmacro=IniRead($inipath, "macros", "1", "supercalafragelisticexpialido.ciaus")
	$macropath=@scriptdir &"\macros\" & $findmacro
	If FileExists($macropath) Then
		$editcmd=$medit & " " & $macropath
		GUICtrlSetData($desc, $txt[11])
		;WinSetOnTop($txt[3], "", 0)
		Run($editcmd)
	Else
		GUICtrlSetData($desc, $txt[12])
	EndIf
	
	Case $msg=$iButton ; Run installer button
	Run($KEITH)
	Exit

	Case $msg=$eButton ; Web site button
	Run($openhome)
	Exit
EndSelect
WEnd
EndFunc

Func openkmext()
	$ask=MsgBox(32+4, $txt[3], $txt[13])
	If $ask=7 Then
		Exit
	Else
		Run($openhome)
	EndIf
EndFunc

Func ReloadExt()
	$FileList=_FileListToArray($inini, $kmunext)
	If @error=1 Or $FileList=0 Then
		; DISABLE controls:
		GUICtrlSetState($hCombo, $GUI_DISABLE)
		GUICtrlSetState($hButton, $GUI_DISABLE)
		GUICtrlSetState($mButton, $GUI_DISABLE)
		; Update labels and combobox control
		$update=GUICtrlSetData($hCombo, "", "")
		GUICtrlSetData($extinstdate, $txt[15])
		GUICtrlSetData($desc, $txt[13])
		GUICtrlSetData($Label1, $txt[14] & " 0")
		;MsgBox(64, "K-meleon Extensions Manager", "You don't have any installed extensions.")
	Else
		; Setting string of extensions installed
		$pentrim=_ArrayToString($FileList, "|", 1)
		$remini=StringReplace($pentrim, ".ini", "")
		$first=StringInStr($remini, "|" , "", 1)
		$initial=StringMid($remini, 1, $first-1)
		; Update labels and combobox control
		$update=GUICtrlSetData($hCombo, "", "") ; First is needed clean the combo of elements
		$update=GUICtrlSetData($hCombo, $remini, $initial)
		GUICtrlSetData($Label1, $txt[14] & " " & $FileList[0])
		$inipath=$inini & "\" & GUICtrlRead($hCombo) & ".ini" ;$FileList[_GUICtrlComboBox_GetCurSel($hCombo)+1]
		$findinfo=IniRead($inipath, "info", "1", $txt[19])
		; Check if is a malformed ini file and warning about it
		If $findinfo="" Then $findinfo=$txt[8]
		$a_date=FileGetTime($inipath,1)
		If Not @error Then
			$date=$a_date[0] & "/" & $a_date[1] & "/" & $a_date[2] & " " & $a_date[3] & ":" & $a_date[4] & ":" & $a_date[5]
		;   $date=yyyy/mm/dd hh:mm:ss
		EndIf
		GUICtrlSetData($desc, $findinfo)
		GUICtrlSetData($extinstdate, $txt[15] & " " & $date)
		; ENABLE controls:
		GUICtrlSetState($hCombo, $GUI_ENABLE)
		GUICtrlSetState($hButton, $GUI_ENABLE)
		GUICtrlSetState($mButton, $GUI_ENABLE)
	EndIf
EndFunc

Func IniError()
	$ask=MsgBox(32+4, $txt[3], $txt[8] & @CRLF & $txt[18])
	If $ask=6 Then
		If FileExists($KMBIN) Then ; Security folder checked, only delete under KM folder
			FileDelete($inipath)
		EndIf
	Else
		; Rename inifile to .bad
		If FileExists($KMBIN) Then ; Security folder checked, only delete under KM folder
			FileMove($inipath, StringReplace($inipath, ".ini", ".bad", 1), 1)
		EndIf
	EndIf
	ReloadExt()
EndFunc
