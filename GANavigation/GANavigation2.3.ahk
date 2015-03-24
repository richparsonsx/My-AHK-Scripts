SetTitleMatchMode , Slow 
SetTitleMatchMode , 2
DetectHiddenText , On
global orgCount := 0 , orgCountOld := 0 , orgCount2 := 0 , orgCount3 := 0
global trackerCount := 0 , trackerCountOld := 0
global ieCount := 0 , ieCountOld := 0

; set ShowMessages = 0 for no debug
; set ShowMessages = 1 for complete debug
; set ShowMessages = 2 for subroutine debug only
global showMessages := 0

Loop ,
{
	If stop = 1
		Break
	Else
	{
		WinGet , saveCount , Count, Internet Explorer, Save &as
		If saveCount > 0
			isSaveAs()
		WinGet , trackerCount, Count, Tracker - Internet Explorer, , , Your Tracker session is about to be timed out
		WinGet , ieCount, Count, Internet Explorer, , , Your Tracker session is about to be timed out
		WinGet , orgCount2, Count, Organizer/Workpapers 201
		WinGet , orgCount3 , Count, Organizer
		orgCount := orgCount2 + orgCount3
		ieCount:= ieCount - orgCount - trackerCount
		IfEqual, showMessages, 1, msgbox, ieCount %ieCount% and ieCountOld %ieCountOld% `r orgCount %orgCount% and %orgCountOld% `r trackerCount %trackerCount% and %trackerCountOld%
		organizerTimeout()
		trackerTimeout()
		IfNotEqual, orgCount, orgCountOld
			isOrganizer()
		IfNotEqual, trackerCount, trackerCountOld
			isTracker()
		IfNotEqual, ieCount, ieCountOld
			notOrganizer()
	}
}
return
isSaveAs()
{
	IfWinNotActive, Internet Explorer, Save &as 
	{
		WinActivate, Internet Explorer, Save &as 
		WinWaitActive, Internet Explorer, Save &as
	}
	Send, !s
	Sleep, 250
	WinWait, /Tracker/TrackerReports, 
	IfWinNotActive, /Tracker/TrackerReports, , WinActivate, /Tracker/TrackerReports, 
	WinWaitActive, /Tracker/TrackerReports, 
	WinClose
	WinWaitClose
	Return
}
isOrganizer()
{
	if (orgCount > orgCountOld)
	{
		WinActivate, Organizer/Workpapers 201
		IfGreaterOrEqual, showMessages, 1, msgbox, I got to isOrganizer
		IfEqual, showMessages, 1, MsgBox, Combined Org Count  %orgCount% `n Org Count 2         %orgCount2% `n Org Count 3         %orgCount3% `n Org Count Old       %orgCountOld%
		WinWaitActive , Organizer/Workpapers 201, , 1
		if ErrorLevel {
			ieCountOld:= ieCount
			Return
		}
		StatusBarWait , Session time out in approx, , , Organizer/Workpapers 201
		Sleep , 100
		Send , ^0
		Sleep , 100
		Send , ^-
		WinMaximize
	}
	orgCountOld:= orgCount
	Return
}
isTracker()
{
	if (trackerCount > trackerCountOld)
	{
		IfGreaterOrEqual, showMessages, 1, msgbox, I got to isTracker
		WinActivate, Tracker - Internet Explorer
		WinWaitActive , Tracker - Internet Explorer, , 1, , Your Tracker session is about to be timed out
		if ErrorLevel {
			trackerCountOld:= trackerCount
			Return
		}
		StatusBarWait , Session time out in approx, , , Tracker - Internet Explorer
		Sleep , 100
		WinActivate
		WinWaitActive
		WinMaximize
		Sleep, 150
		Send , ^0
	}
	trackerCountOld:= trackerCount
	return
}
notOrganizer()
{
	if (ieCount > ieCountOld)
	{
		IfGreaterOrEqual, showMessages, 1, msgbox, I got to notOrganizer
		WinWaitActive , Internet Explorer, , 1, Organizer
		if ErrorLevel {
			IfGreaterOrEqual, showMessages, 1, msgbox, Error Reached
			ieCountOld:= ieCount
			return
		}
		Sleep , 150
		Send, ^0
	}
	ieCountOld:= ieCount
	Return
}
organizerTimeout()
{
	OrgTitle := "Organizer/Workpapers 201"
	OrgTest := "Session time out in approx: 04:"
	OrgTest2 := "Session time out in approx: 29:"
	IfWinExist, %OrgTitle%
	{
		StatusBarGetText, RetrievedText, 1, %OrgTitle%
		IfInString, RetrievedText, %OrgTest%
		{
			IfGreaterOrEqual, showMessages, 1, msgbox, I got to organizerTimeout
			BlockInput,on
			WinGet, windowState, MinMax
			WinGetActiveTitle, activeWindow
			WinActivate, %OrgTitle%
			WinGetPos, Xcorner, yCorner, Xpos, Ypos, %OrgTitle%
			sleep, 150
			xClick := Xpos * .503094
			yClick := Ypos * .574492
			ControlClick, x%xClick% y%yClick%, %OrgTitle%
			if windowState = "0"
			{
				WinMinimize
			}
			WinActivate, %activeWindow%
			Loop
			{
				StatusBarGetText, RetrievedText2, 1, %OrgTitle%
				IfInString, RetrievedText2, %OrgTest2%
					Break
				Sleep, 100
			}
			BlockInput,Off
		}
	}
	Return
}
trackerTimeout()
{
	IfWinExist,  Tracker - Internet Explorer, Your Tracker session is about to be timed out
	{
		IfGreaterOrEqual, showMessages, 1, msgbox, I got to trackerTimeout
		BlockInput,on
		WinActivate
		WinWaitActive
		Sleep, 100
		Send, {TAB}
		Sleep, 100
		Send, {SPACE}
		WinWaitClose
		BlockInput, Off
	}
	return
}