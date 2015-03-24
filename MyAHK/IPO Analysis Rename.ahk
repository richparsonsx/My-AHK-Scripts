Loop, 2000 {
	WinWait, IPO Analysis of Comp, 
	IfWinNotActive, IPO Analysis of Comp, , WinActivate, IPO Analysis of Comp, 
	WinWaitActive, IPO Analysis of Comp, 
	Sleep, 100
	Send, {DOWN}{ENTER}
	WinWait, Analysis_of_Tax_Statements 
	IfWinNotActive, Analysis_of_Tax_Statement , WinActivate, Analysis_of_Tax_Statements 
	WinWaitActive, Analysis_of_Tax_Statements
	WinMaximize, Analysis
	sleep, 150
	MouseClick, left,  454, 310, 2
	clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.
	sleep, 200
	Send, {ALTDOWN}e{ALTUP}c
	sleep, 200
	Send, {CTRLDOWN}{SHIFTDOWN}s{SHIFTUP}{CTRLUP}
	WinWait, Save As, 
	IfWinNotActive, Save As, , WinActivate, Save As, 
	WinWaitActive, Save As, 
	Send, {CTRLDOWN}v{CTRLUP}{ENTER}
	WinWait, 0
	IfWinNotActive, 0 , WinActivate, 0 
	WinWaitActive, 0
	Send, {ALTDOWN}{F4}{ALTUP}
}