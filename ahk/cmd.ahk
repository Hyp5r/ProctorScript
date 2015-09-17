; SWITCHES
; Command-line switches allowed with the script.

; Only one switch at a time!
If ( NumberOfParameters > 1 )
{
	MsgBox,4112,Launch Error,You've passed too many switches to ProctorScript.
	Gosub,Exit
}

Parameter:
Loop, %0%
{
	param := %A_Index%
	If param = -help
	{
		MsgBox,4160,Coming Soon!,The -help command is coming soon.  Sorry about that!
		Gosub,Exit
	}
	If param = -skipconsent
	{
		Gosub,ConsentBG
		Gosub,Launcher
		Return
	}
	If param = -reslauncher
	{
		Gosub,Resolution_Change_Launcher
		Return
	}
	Else
	{
		MsgBox,4112,Launch Error,You've passed a switch that doesn't exist.
		Gosub,Exit
	}
}