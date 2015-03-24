SetTitleMatchMode, 2
SetKeyDelay, 10
;MsgBox, Arg 1 = %1%
;MsgBox, Arg 2 = %2%
;MsgBox, Arg 3 = %3%
;MsgBox, Arg 4 = %4%
Loop, 1
{
	WinWait, Return Manager, 
	IfWinNotActive, Return Manager, , WinActivate, Return Manager, 
	WinWaitActive, Return Manager, 
	Sleep, 100
	Send, !u
	Sleep, 100
	Send, r
	WinWait, Restore Tax Return Files, 
	IfWinNotActive, Restore Tax Return Files, , WinActivate, Restore Tax Return Files, 
	WinWaitActive, Restore Tax Return Files, 
	Send, !B
	WinWait, Open, 
	IfWinNotActive, Open, , WinActivate, Open, 
	WinWaitActive, Open, 
	Send, %1%
	Sleep, 100
	Send, {ENTER}
	WinWait, Restore Tax Return Files, 
	IfWinNotActive, Restore Tax Return Files, , WinActivate, Restore Tax Return Files, 
	WinWaitActive, Restore Tax Return Files, 
	Send, !n
	Sleep, 250
	WinWait, Restore Tax Return Files, 
	IfWinNotActive, Restore Tax Return Files, , WinActivate, Restore Tax Return Files, 
	WinWaitActive, Restore Tax Return Files, 
	sleep, 100
	MouseClick, left, 33, 242
	Sleep, 250
	Send, !r
	Sleep, 750
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
	WinWait, Restore Tax Returns, , 2
	IfWinExist, Restore Tax Returns
	{
		IfWinNotActive, Restore Tax Returns, , WinActivate, Restore Tax Returns, 
		WinWaitActive, Restore Tax Returns, 
		Send, !c
		Sleep, 500
		Send, ^a
		SendRaw, %2%
		Sleep, 500
		Send, !r
		Sleep, 12000
		Send, unilever
		Sleep, 1000
		Send, !o
		Sleep, 250
		Send, ges
		Sleep, 250
		Send, !n
		Sleep, 2000
		Loop { 
				PixelGetColor, color, 37, 234
				If (color="0xFFFFFF")
					break
				sleep, 1000
			}
		sleep, 500
		send, !f
		WinWait, Restore Tax Return Report, 
		IfWinNotActive, Restore Tax Return Report, , WinActivate, Restore Tax Return Report, 
		WinWaitActive, Restore Tax Return Report, 
		Sleep, 250
		Send, !{F4}
		Sleep, 1000
	}
	else
	{
		sleep, 500
		send, !f
		WinWait, Restore Tax Return Report, 
		IfWinNotActive, Restore Tax Return Report, , WinActivate, Restore Tax Return Report, 
		WinWaitActive, Restore Tax Return Report, 
		Sleep, 250
		Send, !{F4}
		Sleep, 1000
		FileAppend, %2%`n, C:\users\riparsons\desktop\unilever\unilever.txt
	}
}