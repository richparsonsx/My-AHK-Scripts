InputBox, runCount, How many Returns to unlock?, How many Returns to unlock? 
loop, %runCount%
{
	WinWait, Return Manager, 
	IfWinNotActive, Return Manager, , WinActivate, Return Manager, 
	WinWaitActive, Return Manager, 
	Sleep, 100
	Send, {TAB}{TAB}
	Sleep, 500
	Send, {DOWN}
	Sleep, 1000
	Send, !h
	Sleep, 250
	Send, li
	WinWait, CCH Axcess Tax, , 10
	IfWinNotActive, CCH Axcess Tax, , WinActivate, CCH Axcess Tax, 
	WinWaitActive, CCH Axcess Tax, , 5
	Send, {SPACE}
	Sleep, 5000
}