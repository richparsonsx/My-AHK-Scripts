SetTitleMatchMode , Slow 
SetTitleMatchMode , 2
DetectHiddenText , On
#p::Pause
global orgCount , orgCountOld := 0
global trackerCount , trackerCountOld := 0
global ieCount , ieCountOld := 0

Loop ,
{
	If stop = 1
		Break
	Else
	{
		WinGet , orgCount, Count, Organizer/Workpapers 2012-2013 - Windows Internet Explorer
		WinGet , trackerCount, Count, Tracker - Windows Internet Explorer, , , Your Tracker session is about to be timed out
		WinGet , ieCount, Count, Windows Internet Explorer
		ieCount:= ieCount - orgCount - trackerCount
		TrackerTimeOut()

		if (orgCount <> orgCountOld)
		{
			IsOrganizer()
		}
		if (trackerCount <> trackerCountOld)
		{
			;msgbox, Old tracker count = %trackerCountOld%  and tracker count = %trackerCount%
			IsTracker()
		}
		if (ieCountOld <> ieCount)
		{
			NotOrganizer()
		}
	}
}
return

TrackerTimeOut()
{
	IfWinExist,  Tracker - Windows Internet Explorer, Your Tracker session is about to be timed out
	{
		Sleep , 250
		WinActivate ,  Tracker - Windows Internet Explorer, Your Tracker session is about to be timed out
		ControlClick , X289 Y225,Tracker - Windows Internet Explorer
		Sleep , 200
	}
	return
}

NotOrganizer()
{
	WinWaitActive , Windows Internet Explorer, , 1, Organizer
	if ErrorLevel {
		return
	}
	else {
		Sleep , 150
		Send , ^0
		ieCountOld:= ieCount
	}
}

IsOrganizer()
{
	WinWaitActive , Organizer/Workpapers 2012-2013 - Windows Internet Explorer, , 1
	if ErrorLevel {
		if (orgCount = 0)
		{
			orgCountOld = 0
		}
		return
	}
	else {
		StatusBarWait , Session time out in approx, , , Organizer/Workpapers 2012-2013 - Windows Internet Explorer
		Sleep , 100
		Send , ^0
		Sleep , 100
		Send , ^-
		WinMaximize
		orgCountOld:= orgCount
		return
	}
}

IsTracker()
{
	WinWaitActive , Tracker - Windows Internet Explorer, , 1, , Your Tracker session is about to be timed out
	if ErrorLevel {
		if (trackerCount = 0)
		{
			trackerCountOld = 0
		}
		return
	}
	else {
		StatusBarWait , Session time out in approx, , , Tracker - Windows Internet Explorer
		Sleep , 100
		WinMaximize
		trackerCountOld:= trackerCount
		return
	}
}