SetTitleMatchMode, Slow 
SetTitleMatchMode, 3
IfWinExist, Batch Manager,
{
	WinActivate, Batch Manager,
	sleep, 100
	MouseClick, left,  266,  106
	sleep, 200
}
SetTitleMatchMode, 2
WinWait, e-File Extensions, 
IfWinNotActive, e-File Extensions, , WinActivate, e-File Extensions, 
WinWaitActive, e-File Extensions, 
MouseClick, left,  582,  46
Sleep, 100
Send, {CTRLDOWN}a{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}v{CTRLUP}{ENTER}
Sleep, 100
WinWait, Microsoft Excel, 
IfWinNotActive, Microsoft Excel, , WinActivate, Microsoft Excel, 
WinWaitActive, Microsoft Excel, 