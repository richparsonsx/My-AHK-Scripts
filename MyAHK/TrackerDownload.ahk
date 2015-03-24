SetTitleMatchMode , Slow 
SetTitleMatchMode , 2
DetectHiddenText , On 
WinWait, Internet Explorer, Save &as
IfWinNotActive, Internet Explorer, Save &as 
{
	WinActivate, Internet Explorer, Save &as 
	WinWaitActive, Internet Explorer, Save &as
}
Send, !s
Sleep, 250
WinWait, http://10.26.230.225/Tracker/TrackerReports, 
IfWinNotActive, http://10.26.230.225/Tracker/TrackerReports, , WinActivate, http://10.26.230.225/Tracker/TrackerReports, 
WinWaitActive, http://10.26.230.225/Tracker/TrackerReports, 
WinClose
WinWaitClose
reload
;Gosub, flashing

flashing:
	DetectHiddenWindows, On
	Script_Hwnd := WinExist("ahk_class AutoHotkey ahk_pid " DllCall("GetCurrentProcessId"))
	DetectHiddenWindows, Off
	; Register shell hook to detect flashing windows.
	DllCall("RegisterShellHookWindow", "uint", Script_Hwnd)
	OnMessage(DllCall("RegisterWindowMessage", "str", "SHELLHOOK"), "ShellEvent")
	;...
	ShellEvent(wParam, lParam) {
		if (wParam = 0x8006) ; HSHELL_FLASH
		{   ; lParam contains the ID of the window which flashed:
			WinActivate, ahk_id %lParam%
			Gosub, ExcelClick
		}
	}
	
ExcelClick:
	WinWait, Microsoft Excel, The file you are trying to open
	IfWinNotActive, Microsoft Excel, The file you are trying to open
	{
		WinActivate, Microsoft Excel, The file you are trying to open
		WinWaitActive, Microsoft Excel, The file you are trying to open
	}
	Send, !y
	Reload