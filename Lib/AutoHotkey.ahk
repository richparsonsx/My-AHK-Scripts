SetTitleMatchMode, 2
SetTitleMatchMode slow
SetKeyDelay, 50

;gosub, XMLPassword
+F1::AHKPanic(0,1,0,0)
#!r::
	Shutdown, 6
#!s::
	Shutdown, 5
^#!r::
	Send, ^s ; To save a changed script
	Sleep, 300 ; give it time to save the script
	Reload
	Return
^!n::
	IfWinExist Notepad++
		WinActivate
	else
		Run Notepad++
	return
#2::
	if WinExist("ahk_class Chrome_WidgetWin_1")
	{
		WinActivate
		WinMaximize
	}
	else
		Run Chrome.exe
	Return
$^PGUP::
	Gosub, prevTab
	Return
$^PGDN::
	Gosub, nextTab
	Return
prevTab:
	IfWinActive, Internet Explorer
	{
		Send, +^{TAB}
	}
	IfWinNotActive, Internet Explorer
	{
		Send, ^{Pgup}
	}
	return

nextTab:
	IfWinActive, Internet Explorer
	{
		Send, ^{TAB}
	}
	IfWinNotActive, Internet Explorer
	{
		Send, ^{Pgdn}
	}
	return

; XMLPassword:
	; WinWait, View XML - Windows Internet Explorer, 
	; IfWinNotActive, View XML - Windows Internet Explorer, , WinActivate, View XML - Windows Internet Explorer, 
	; WinWaitActive, View XML - Windows Internet Explorer, 
	; Sleep, 100
	; Click, left, 200, 200
	; Send, +{TAB}+{TAB}
	; Sleep, 250
	; SendRaw, g3$tc.1!
	; Sleep, 1000
	; Send, {TAB}{SPACE}
	; Sleep, 3000
	; Send, ^u
	; FormatTime, CurrentDateTime,, yyMMddHHmmss
	; WinWait, ] - Notepad++, 
	; IfWinNotActive, ] - Notepad++, , WinActivate, ] - Notepad++, 
	; WinWaitActive, ] - Notepad++, 
	; Send, +^!b
	; WinWait, ] - Notepad++, 
	; IfWinNotActive, ] - Notepad++, , WinActivate, ] - Notepad++, 
	; WinWaitActive, ] - Notepad++, 
	; Send, !f
	; Sleep, 250
	; Send, a
	; WinWait, Save As, 
	; IfWinNotActive, Save As, , WinActivate, Save As, 
	; WinWaitActive, Save As, 
	; MouseClick, left,  53,  154
	; Sleep, 100
	; Send, XML_%CurrentDateTime%.xml
	; Sleep, 250
	; Send, {ENTER}
	; WinWait, .xml - Notepad++, 
	; IfWinNotActive, .xml - Notepad++, , WinActivate, .xml - Notepad++, 
	; WinWaitActive, .xml - Notepad++, 
	; WinWait, FinalAXCData&TargetCou - Windows Internet Explorer, 
	; IfWinNotActive, FinalAXCData&TargetCou - Windows Internet Explorer, , WinActivate, FinalAXCData&TargetCou - Windows Internet Explorer, 
	; WinWaitActive, FinalAXCData&TargetCou - Windows Internet Explorer, 
	; ;Send, !{f4}
	; Reload