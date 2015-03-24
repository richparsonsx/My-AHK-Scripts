SetTitleMatchMode, 2
returnid=nothing
runid=nothing
Loop, 15
{
	WinWait, DT In Use report.xlsx, 
	IfWinNotActive, DT In Use report.xlsx, , WinActivate, DT In Use report.xlsx, 
	WinWaitActive, DT In Use report.xlsx, 
	Sleep, 100
	PauseTime=8000
	Send, {DOWN}^c
	Sleep, 500
	returnid1=%Clipboard%
	var:=StrLen(returnid1)-2
	StringLeft, returnid, returnid1, %var%
	runid=oip://return/%returnid%
	run, %runid%
	WinWait, Tax, , 3
	IfWinExist, Tax
	{
		IfWinNotActive, Tax, , WinActivate, Tax, 
		WinWaitActive, Tax,
		Sleep, 250
		Send, !o
		PauseTime=15000
	}
	WinWait, Return In-Use, , 2
	IfWinExist, Return In-Use
	{
		IfWinNotActive, Return In-Use, , WinActivate, Return In-Use, 
		WinWaitActive, Return In-Use,
		Sleep, 250
		Send, !a
	}
	WinWait, %returnid%
	Sleep, %PauseTime%
	IfWinNotActive, %returnid%, , WinActivate, %returnid%, 
	WinWaitActive, %returnid%,
	Sleep, 400
    WinClose
	WinWaitClose
	Sleep, 400
}