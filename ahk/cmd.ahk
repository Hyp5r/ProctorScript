/*
Switches have been disabled for the testing branch as a rewrite will mess these up!

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
	If param = -skiplockdown
	{
		Gosub,Script_Read_Ini
		Gosub,Script_Verify_Ini
		Gosub,Launcher
		Return
	}
	If param = -actcompass
	{
		Gosub,Script_Read_Ini
		Gosub,Script_Verify_Ini
		Gosub,^+C
		Return
	}
	Else
	{
		MsgBox,4112,Launch Error,You've passed a switch that doesn't exist.
		Gosub,Exit
	}
}
*/