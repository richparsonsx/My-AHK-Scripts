SetTitleMatchMode, Slow 
SetTitleMatchMode, 2
	Loop
	{
		IfWinExist,  Tracker - Windows Internet Explorer, Your Tracker session is about to be timed out
		{
		Sleep, 1000
		WinActivate,  Tracker - Windows Internet Explorer, Your Tracker session is about to be timed out
		ControlClick , X289 Y225,Tracker - Windows Internet Explorer
		Sleep, 1000
		Reload
		}
	}
