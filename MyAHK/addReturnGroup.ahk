CoordMode, Mouse, Screen
F9::Reload
F10::Gosub addGroups

addGroups:
loop, 48 {
	;WinWait, Microsoft Excel - Book2, 
	;IfWinNotActive, Microsoft Excel - Book2, , WinActivate, Microsoft Excel - Book2, 
	;WinWaitActive, Microsoft Excel - Book2, 
	WinWait, Microsoft Excel - Brussels Organizations.xlsx  [Read-Only], 
	IfWinNotActive, Microsoft Excel - Brussels Organizations.xlsx  [Read-Only], , WinActivate, Microsoft Excel - Brussels Organizations.xlsx  [Read-Only], 
	WinWaitActive, Microsoft Excel - Brussels Organizations.xlsx  [Read-Only], 
	Send, {ESC}
	Sleep, 100
	Clipboard = ""
	Send, {DOWN}
	Sleep, 200
	Send, ^c
	ClipWait
	MouseClick, left,  224,  91
	Sleep, 200
	MouseClick, left,  224,  91
	Sleep, 200
	Send, %clipboard%
	Sleep, 500
	Send, {ENTER}
	Sleep, 200
	Send, ^c
	Sleep, 1000
	Loop { 
		Sleep, 1000 
		If A_Cursor != Wait 
			Break 
	}
}