#F10::GoSub, createHyperlink
createHyperlink:
	SetTitleMatchMode, 2
	WinGetTitle, title, A
	findStr := " - Tax"
	IfInString, title, %findStr%
	{
		findPos := " - "
		StringGetPos, pos, title, %findPos%
		if pos >= 0 
		{
			StringLeft, returnID, title, %pos%
			hyLink := "oip://return/" . returnID
			Clipboard = %hyLink%
		}
	}
	Reload
	;Return