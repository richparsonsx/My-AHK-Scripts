SetTitleMatchMode, Fast 
SetTitleMatchMode, 2
	Loop
	{
		IfWinExist, Windows Internet Explorer, , Organizer
		{
			IfWinNotActive, Windows Internet Explorer
			{
				WinWaitActive, Windows Internet Explorer, , 2
				if ErrorLevel {
					reload
				}
				else {
					Send, ^0
					Sleep, 150
					Send, ^{HOME}
					Sleep, 150
					reload
				}
			}
		}
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