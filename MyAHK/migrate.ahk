F9::Reload
F10::Goto, addMigration
SetTitleMatchMode, 2
addMigration:
	InputBox, runCount, How many Returns to update?, How many Returns to Update? 
	loop, %runCount% {
		;WinWait, Excel, 
		;IfWinNotActive, Excel, , WinActivate, Excel, 
		;WinWaitActive, Excel, 
		Send, !{TAB}
		Sleep, 500
		Send, {DOWN}
		Sleep, 150
		Send ^c
		Clipwait
		WinWait, Data Migration Utility, 
		IfWinNotActive, Data Migration Utility, , WinActivate, Data Migration Utility, 
		WinWaitActive, Data Migration Utility, 
		Sleep, 250
		Send, !e
		Sleep, 100
		Send, {BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}
		sleep, 150
		send, ^v
		sleep, 150
		;MouseClick, left,  1348,  181
		Send, {TAB}{SPACE}
		sleep, 500
		Loop {
			Sleep, 500
			If A_Cursor != Wait
				Break
			}
		Sleep, 250
		MouseClick, left,  848,  556
		Sleep, 500
	}