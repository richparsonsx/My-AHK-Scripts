loop, 2865 {
WinWait, IPOAnalysis, 
IfWinNotActive, IPOAnalysis, , WinActivate, IPOAnalysis, 
WinWaitActive, IPOAnalysis, 
Sleep, 100
Send, {DOWN}{ALTDOWN}FM{ALTUP}{ENTER}
Sleep, 100
Send, ^c
Sleep, 100
Send, {ENTER}{ENTER}
WinWait, 0 
IfWinNotActive, 0 , WinActivate, 0 
WinWaitActive, 0 
Send, {SHIFTDOWN}j{SHIFTUP}
MouseClick, left,  475,  205
Sleep, 300
WinWait, Add Attachment, 
IfWinNotActive, Add Attachment, , WinActivate, Add Attachment, 
WinWaitActive, Add Attachment, 
Send, ^v
Sleep, 300
Send, .xlsx{ENTER}
Sleep, 650
MouseClick, left,  284,  302
Send, {ENTER}
WinWait, 0 
IfWinNotActive, 0 , WinActivate, 0 
WinWaitActive, 0 
Send, {ALTDOWN}{F4}{ALTUP}
WinWait, Adobe Acrobat, 
IfWinNotActive, Adobe Acrobat, , WinActivate, Adobe Acrobat, 
WinWaitActive, Adobe Acrobat, 
Send, {SPACE}
WinWait, IPOAnalysis, 
IfWinNotActive, IPOAnalysis, , WinActivate, IPOAnalysis, 
WinWaitActive, IPOAnalysis, 
}