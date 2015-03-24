SetTitleMatchMode, Slow 
SetTitleMatchMode, 2
	Loop
	{
		WinWait, Save PDF File As, 
		IfWinNotActive, Save PDF File As, , WinActivate, Save PDF File As, 
		WinWaitActive, Save PDF File As, 
		Sleep, 100
		Send, {ENTER}
		WinWait, Adobe Acrobat Pro, 
		IfWinNotActive, Adobe Acrobat Pro, , WinActivate, Adobe Acrobat Pro, 
		WinWaitActive, Adobe Acrobat Pro, 
		Sleep, 100
		Send, {ALTDOWN}f{ALTUP}x
	}