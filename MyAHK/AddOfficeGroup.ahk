F9::Reload
f10::Gosub, addOfficeGroup

addOfficeGroup:
SetTitleMatchMode,2
loop, 7
{
	WinWait, Microsoft Excel, 
	IfWinNotActive, Microsoft Excel, , WinActivate, Microsoft Excel, 
	WinWaitActive, Microsoft Excel, 
	Sleep, 250
	Send, {ESC}
	Sleep, 100
	Send, {f2}
	Sleep, 100
	Send, +{Home}
	Sleep, 100
	Send, ^c
	Sleep, 100
	Send, {ENTER}
	WinWait, Select Clients, 
	IfWinNotActive, Select Clients, , WinActivate, Select Clients, 
	WinWaitActive, Select Clients, 
	Sleep, 100
	SetKeyDelay, 50
	SendInput, %Clipboard%
	Sleep, 500
	Click, 477, 160
	sleep, 1000
	Click, 81, 86
	Sleep, 250
	Send, {Shift Up}
	sleep, 100
	Send, {RShift Up}
	sleep, 100
	Send, {LShift Up}
	sleep, 100
	Send, {Home}
	sleep, 100
}