; AHK VERSION: Lexikos 1.1.22.06 Unicode 32-bit
; AUTHOR: William Quinn (wquinn@outlook.com)
; TITLE: ProctorScript
; UUID: c5f530c5-8dfe-4f08-bb49-d5ef43adbc92

#Include ahk\var.ahk ; Defines all variables
#Include ahk\install.ahk ; Installs all files
#Include ahk\cmd.ahk ; Adds command-line switches
#Include ahk\consent.ahk ; Similar to Windows UAC, shows INI variables

Menu,Tray,NoStandard

Launcher:
{
	If EnableLog=1
		FileAppend,1`,,%LogFile%
	; Gui,ConsentBG:Destroy
	Gui,Consent:Destroy
	Gui,Launcher:Color,FFFFFF
	Gui,Launcher:Add,StatusBar,,%LA_StatusBar% - %Version%
	Gui,Launcher:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\1.png
	Gui,Launcher:Add,Picture,X500 Y140 H256 W256,%Install%\img\3.png
	Gui,Launcher:Font,cWhite s26,Calibri Light
	Gui,Launcher:Add,Text,X32 Y18 +BackgroundTrans,%LA_Title%
	Gui,Launcher:Font,CBlack s12,Segoe UI
	Gui,Launcher:Add,Edit,X32 Y370 W200 vFirstName,
	Gui,Launcher:Add,Edit,X242 Y370 W200 vLastName,
	Gui,Launcher:Add,Radio,X32 Y96 -Wrap vOption1,%LA_Option1Title%
	Gui,Launcher:Add,Radio,X32 Y128 -Wrap vOption2,%LA_Option2Title%
	Gui,Launcher:Add,Radio,X32 Y160 -Wrap vOption3,%LA_Option3Title%
	Gui,Launcher:Add,Radio,X32 Y192 -Wrap vOption4,%LA_Option4Title%
	Gui,Launcher:Add,Radio,X32 Y224 -Wrap vOption5,%LA_Option5Title%
	Gui,Launcher:Add,Radio,X32 Y256 -Wrap vOption6,%LA_Option6Title%
	Gui,Launcher:Add,Radio,X32 Y288 -Wrap vOption7,%LA_Option7Title%
	Gui,Launcher:Add,Button,X32 Y410 Default gSubmit,Let's Go!
	Gui,Launcher:Font,CBlack s10 Bold,Segoe UI
	Gui,Launcher:Add,Text,X32 Y350,First Name
	Gui,Launcher:Add,Text,X242 Y350,Last Name
	Gui,Launcher:Show,H480 W800,%Title%
	Gui,Launcher:+AlwaysOnTop -Caption +Border -SysMenu

	If LA_Option1Enable=0
		GuiControl,Launcher:Hide,Option1
		Else
		Gui,Launcher:Add,Picture,X0 Y122 W300 H1,%Install%\img\2.png
	If LA_Option2Enable=0
		GuiControl,Launcher:Hide,Option2
		Else
		Gui,Launcher:Add,Picture,X0 Y154 W300 H1,%Install%\img\2.png
	If LA_Option3Enable=0
		GuiControl,Launcher:Hide,Option3
		Else
		Gui,Launcher:Add,Picture,X0 Y186 W300 H1,%Install%\img\2.png
	If LA_Option4Enable=0
		GuiControl,Launcher:Hide,Option4
		Else
		Gui,Launcher:Add,Picture,X0 Y218 W300 H1,%Install%\img\2.png
	If LA_Option5Enable=0
		GuiControl,Launcher:Hide,Option5
		Else
		Gui,Launcher:Add,Picture,X0 Y250 W300 H1,%Install%\img\2.png
	If LA_Option6Enable=0
		GuiControl,Launcher:Hide,Option6
		Else
		Gui,Launcher:Add,Picture,X0 Y282 W300 H1,%Install%\img\2.png
	If LA_Option7Enable=0
		GuiControl,Launcher:Hide,Option7
		Else
		Gui,Launcher:Add,Picture,X0 Y314 W300 H1,%Install%\img\2.png
	Return
}

Submit:
{
	Gui,Launcher:Submit,NoHide
	If Option1 = 0
	If Option2 = 0
	If Option3 = 0
	If Option4 = 0
	If Option5 = 0
	If Option6 = 0
	If Option7 = 0
	{
		MsgBox,4112,%Title%,You need to select an option!
		Return
	}

	/* 
		Code sourced from http://www.autohotkey.com/board/topic/99352-required-fields-to-submit/?p=623781
	*/

	Fields := "FirstName,LastName"
	Empty_Fields := ""
	Loop, Parse, Fields, `,
	If (!StrLen(%A_LoopField%))
	empty_fields .= (StrLen(empty_fields) ? "," : "") A_LoopField
	If (StrLen(empty_fields))
	{
		MsgBox,4112,%Title%,Please input your name.
		Return
	}

	/*
		End code sourced from http://www.autohotkey.com/board/topic/99352-required-fields-to-submit/?p=623781
	*/
	
	Gui,Launcher:Destroy

	If (Option1 = 1)
	{
		If LA_Option1Link=ACT Compass
			Gosub,ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
			}
			RunWait %LA_Option1Link%
			If Option1Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}

	If (Option2 = 1)
	{
		If LA_Option2Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option2Title%`,`n,%LogFile%
			}
			RunWait %LA_Option2Link%
			If Option2Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}

	If (Option3 = 1)
	{
		If LA_Option3Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option3Title%`,`n,%LogFile%
			}
			RunWait %LA_Option3Link%
			If Option3Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}

	If (Option4 = 1)
	{
		If LA_Option4Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option4Title%`,`n,%LogFile%
			}
			RunWait %LA_Option4Link%
			If Option4Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}
	
	If (Option5 = 1)
	{
		If LA_Option5Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option5Title%`,`n,%LogFile%
			}
			RunWait %LA_Option5Link%
			If Option5Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}
	
	If (Option6 = 1)
	{
		If LA_Option6Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option6Title%`,`n,%LogFile%
			}
			RunWait %LA_Option6Link%
			If Option6Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}
	
	If (Option7 = 1)
	{
		If LA_Option7Link=ACT Compass
			Gosub ACT_Compass
		Else
		{
			If EnableLog=1
			{
				Gosub,Log
				FileAppend,%LA_Option7Title%`,`n,%LogFile%
			}
			RunWait,%LA_Option7Link%,,UseErrorLevel
			If ErrorLevel=ERROR
				{}
			If Option7Logoff=1
				Gosub,Logoff
			Gosub,Exit
		}
	}
}

; DISAGREE
; If the user doesn't agree, log them off of the machine.
Disagree:
{
	Suspend,On
	Gui,Consent:Destroy
	MsgBox,4112,%Title%,You will be logged out of the system.
	Goto,Exit
}

; SPECIAL FUNCTIONS
; These are special commands that the launcher can take.

ACT_Compass:
  #Include ahk\actcompass.ahk


; EXIT
; This is the exit function of the script.
Log:
{
	FileAppend,%FirstName%`,%LastName%`,%Date%`,%Time%`,%A_ComputerName%`,%A_OSVersion%`,%A_IPAddress1%`,%A_IPAddress2%`,%A_IPAddress3%`,%A_IPAddress4%`,,%LogFile%
	Return
}

ConsentBGGuiClose:
ConsentGuiClose:
LauncherGuiClose:
Exit:
{
	Gui,ConsentBG:Destroy
	Gui,Consent:Destroy
	Gui,Launcher:Destroy
	FileRemoveDir,%Install%,1
	Gosub,Close
}

Logoff:
{
	Gosub,Exit
	Shutdown,0
}

Close:
ExitApp

^+C::
{
	Gui,Consent:Destroy
	Gui,ConsentBG:Destroy
	Gui,ACTCompassOverride:Color,FFFFFF
	Gui,ACTCompassOverride:Font,s9,Segoe UI
	Gui,ACTCompassOverride:Add,Progress,vACTCompassOverrideProgress w400 h3 c399AE7 Range0-125
	Gui,ACTCompassOverride:Add,Text,,ACT Compass override activated.  Launching ACT Compass...
	Gui,ACTCompassOverride:-Caption +AlwaysOnTop +Border
	Gui,ACTCompassOverride:Show
	Loop,125
	{
		GuiControl,ACTCompassOverride:,ACTCompassOverrideProgress,+1
		Sleep,100
	}
	Gui,ACTCompassOverride:Destroy
	Gosub,ACT_Compass
}

; Hotkeys Disabled
!F4::return
!Tab::return
