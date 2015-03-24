SetTitleMatchMode, 1
myVar1 = startBatch
myVar2 = searchID
myVar3 = printFiles
SysGet, Monitor, Monitor, 1
xVar := MonitorRight - 400
	
IfInString, myVar1, %1%, Gosub, 1
IfInString, myVar2, %1%, Gosub, 2
IfInString, myVar3, %1%, Gosub, 3
ExitApp
1: ;open new instance of Axcess and pull up Batch Manager
{
	IfWinExist, Return Manager
	{
		WinMinimize
		Sleep, 250
	}
	Progress, w300 h150 X%xVar% Y30, Opening Dashboard, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	IfWinNotExist, Batch Manager
	{
		Run, "C:\Program Files (x86)\WK\ProSystem fx Suite\Smart Client\SaaS\CCH.CommonUIFramework.Shell.exe" DashboardProfile
		WinWait, Dashboard, 
		IfWinNotActive, Dashboard, , WinActivate, Dashboard, 
		WinWaitActive, Dashboard, 
		ResizeWin(860, 600)
		Sleep, 1000
		Progress, 20, Selecting Applications, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
		Sleep, 1500
		MouseClick, left,  39,  95
		Sleep, 1000
		Loop { 
			PixelGetColor, color, 500, 60
			If (color="0xFFFFFF")
				Break 
			MouseClick, left,  39,  95
			sleep, 2000
		}
		sleep, 500
		SetKeyDelay, 25
		Send, {TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{TAB}{ENTER}
		Sleep, 500
		Progress, 40, Opening Batch Manager, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
		Sleep, 2000
	}
	WinWait, Batch Manager, 
	IfWinNotActive, Batch Manager, , WinActivate, Batch Manager, 
	WinWaitActive, Batch Manager, 
	MouseMove, 50, 50
	Sleep, 250
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
	Sleep, 2500
	Progress, 60, Initiating Extension Job Request, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	Sleep, 1000
	Send, !h
	Sleep, 750
	Send, nee
	SetKeyDelay, 10
	WinWait, e-File Extensions, 
	IfWinNotActive, e-File Extensions, , WinActivate, e-File Extensions, 
	WinWaitActive, e-File Extensions, 
	sleep, 500
	Progress, 70, Waiting for Window to Populate, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	Loop { 
		PixelGetColor, color, 450, 70
		If (color!="0xFFFFFF")
			Break 
		sleep, 2000
	}
	Sleep, 500
	Progress, 80, Applying Selections, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	ResizeWin(1200, 632)
	Sleep, 250
	;Uncomment if you want Upload and Release
	MouseClick, left,  384,  161
	Sleep, 100
	Send, {DOWN}{ENTER}
	Sleep, 250
	MouseClick, left,  821,  161
	Sleep, 100
	Send, {HOME}{ENTER}
	Sleep, 100
	SendRaw, %2%
	Sleep, 100
	MouseClick, left,  535,  210
	Sleep, 100
	;Send, {HOME}{DOWN}{DOWN}{DOWN}{ENTER}
	Send, {HOME}{ENTER}
	Sleep, 250
	Send, !g
	Progress, 90, Querying Results, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	Sleep, 250
	WinWait, Tax, 
	IfWinNotActive, Tax, , WinActivate, Tax, 
	WinWaitActive, Tax, 
	WinWaitClose
	Sleep, 100
	Progress, 100, Phase 1 Complete - ready to process new batch, Create New Batch Manager Instance, CCH Axcess - Batch Extensions - Batch %3% of %4%
	Sleep, 500
	Progress, Off
	Return
}
2: ;search batch manager
{
	#Persistent
	blockinput, on
	Progress, R0-%4% p%3% w300 h150 X%xVar% Y30, Processing file %3% of %4%, Process Batch of Returns, CCH Axcess - Batch Extensions - Batch %5% of %6%
	WinWait, e-File Extensions, 
	IfWinNotActive, e-File Extensions, , WinActivate, e-File Extensions, 
	WinWaitActive, e-File Extensions, 
	SetControlDelay -1
	MouseClick, left, 981, 41
	Sleep, 100
	Send, ^a
	Sleep, 250
	SendRaw, %2%
	Sleep, 250
	MouseMove, 850, 41
	Send, {ENTER}
	Sleep, 2000
	Loop { 
			Sleep, 1000 
			MouseMove, 25, 20, 5, R
			If A_Cursor = Arrow
			{
				MouseMove, -25, -20, 5, R
				Break
			}
			MouseMove, -25, -20, 5, R
		}
	ifWinActive, Batch Manager
	{
		WinGetPos, X, Y, Width, Height, Batch Manager
		if Width < 350
		{
			Send, !o
			fileappend, %2%`n, %A_Temp%\ExtnLog.txt
			Sleep, 250
		}
	}
	blockinput,off
	Return
}
3: ;initiate batch request for batch set
{
	WinWait, e-File Extensions, 
	IfWinNotActive, e-File Extensions, , WinActivate, e-File Extensions, 
	WinWaitActive, e-File Extensions, 
	Sleep, 100
	MouseClick, left,  1060,  601
	Sleep, 6000
	MouseClick, left,  363,  164
	WinWait, Electronic Filing Extensions Options, 
	IfWinNotActive, Electronic Filing Extensions Options, , WinActivate, Electronic Filing Extensions Options, 
	WinWaitActive, Electronic Filing Extensions Options, 
	Sleep, 250
	Send, !p
	Sleep, 250
	Send, {HOME}{DOWN}
	Sleep, 250
	Send, !s
	Sleep, 15000
	Return
}
#NoEnv
ResizeWin(Width = 0,Height = 0)
{
	WinGetPos,X,Y,W,H,A
	if %Width% = 0
		Width := W
	If %Height% = 0
		Height := H
	WinMove,A,,%X%,%Y%,%Width%,%Height%
	Return
}
#p::Pause
Pause
Suspend, Toggle
return
^f12::
FileAppend, KILLAPPLICATION, %A_Desktop%\kill.txt
ExitApp