SetTitleMatchMode, Slow 
SetTitleMatchMode, 2
	Loop
	{
		IfWinExist, Organizer/Workpapers 2012-2013 - Windows Internet Explorer
		{
			IfWinNotActive, Organizer/Workpapers 2012-2013 - Windows Internet Explorer 
			{
				WinWaitActive, Organizer/Workpapers 2012-2013 - Windows Internet Explorer, , 2
				if ErrorLevel {
					reload
				}
				else {
					Send, ^0
					Sleep, 100
					Send, ^-
					reload
				}
			}
		}
	}