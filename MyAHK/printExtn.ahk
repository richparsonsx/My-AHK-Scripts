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
WinWait, Print First Extensions, 
IfWinNotActive, Print First Extensions, , WinActivate, Print First Extensions, 
WinWaitActive, Print First Extensions, 
MouseClick, left,  582,  46
Sleep, 100
Send, {CTRLDOWN}a{CTRLUP}
Sleep, 100
Send, {CTRLDOWN}v{CTRLUP}{ENTER}
Sleep, 100
WinWait, Microsoft Excel, 
IfWinNotActive, Microsoft Excel, , WinActivate, Microsoft Excel, 
WinWaitActive, Microsoft Excel, 