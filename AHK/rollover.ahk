SetTitleMatchMode, 2
SetKeyDelay, 10
Loop, 46
{
	WinWait, Microsoft Excel, 
	IfWinNotActive, Microsoft Excel, , WinActivate, Microsoft Excel, 
	WinWaitActive, Microsoft Excel, 
	Sleep, 100
	Send, {DOWN}{CTRLDOWN}c{CTRLUP}
	WinWait, Roll Forward Returns, 
	IfWinNotActive, Roll Forward Returns, , WinActivate, Roll Forward Returns, 
	WinWaitActive, Roll Forward Returns, 
	MouseClick, left,  1005,  45
	Sleep, 100
	Send, ^a
	Sleep, 250
	SendRaw, %clipboard%
	Sleep, 250
	Send, {ENTER}
	Sleep, 2000
	Loop { 
			Sleep, 1000 
			MouseMove, -25,-50, 5, R
			If A_Cursor = Arrow
			{
				MouseMove, 25, 50, 5, R
				Break
			}
			MouseMove, 25, 50, 5, R
		}
}