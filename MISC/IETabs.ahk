SetTitleMatchMode, 2
$^PGUP::
	Gosub, prevTab
	Return
$^PGDN::
	Gosub, nextTab
	Return

prevTab:
	IfWinActive, Internet Explorer
	{
		Send, +^{TAB}
	}
	IfWinActive, Chrome
	{
		Send, ^{Pgup}
	}
	return

nextTab:
	IfWinActive, Internet Explorer
	{
		Send, ^{TAB}
	}
	IfWinActive, Chrome
	{
		Send, ^{Pgdn}
	}
	return