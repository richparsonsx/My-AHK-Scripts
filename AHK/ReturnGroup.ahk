CoordMode, Mouse, Screen  
loop, 212 {
MouseClick, left,  2286,  16
Sleep, 150
WinWait, Microsoft Excel - Book3, 
IfWinNotActive, Microsoft Excel - Book3, , WinActivate, Microsoft Excel - Book3, 
WinWaitActive, Microsoft Excel - Book3, 
Send, {Down}
Sleep, 100
Send, {CTRLDOWN}c{CTRLUP}
Sleep, 100
MouseClick, left,  743,  8
sleep, 250
MouseClick, left,  367,  83
Sleep, 100
Send, {CTRLDOWN}v{CTRLUP}
Sleep, 300
Send, {ENTER}
Sleep, 200
}
Esc::ExitApp