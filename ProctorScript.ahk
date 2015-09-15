/*
------------------------------------------------------------------

AHK VERSION:	Lexikos 1.1.22.00 Unicode 32-bit
AUTHOR:			William Quinn
TITLE:			TCAT-M "Proctor" Launcher
UUID:			c5f530c5-8dfe-4f08-bb49-d5ef43adbc92

------------------------------------------------------------------
*/

; ----------------------------------------------------------------
; BEGINNING VARIABLES
; These are standard starting variables for most AHK scripts.
; It's not needed to alter these.
; ----------------------------------------------------------------
#NoEnv
#Persistent
#SingleInstance,Force
SendMode,Input
SetWorkingDir,%A_ScriptDir%
FormatTime,Date,,yyyy/MM/dd
FormatTime,Time,,h:mm:ss tt

; ----------------------------------------------------------------
; PROGRAM-SPECIFIC VARIABLES
; These variables are specific to the application of this script.
; It's generally not needed to alter these.
; ----------------------------------------------------------------
Version		=	Rev.6 Private Test
Install		=	%A_WinDir%\..\c5f530c5-8dfe-4f08-bb49-d5ef43adbc92
INI		=	%A_ScriptDir%\setup.ini
INI_Error1	=	Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Enable' variables.  Please make sure all 'Enable' variables equal 0 or 1.
INI_Error2	=	Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Logoff' variables.  Please make sure all 'Logoff' variables equal 0 or 1.
INI_Error3	=	Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Title' variables.  Please make sure all 'Title' variables are not empty!
INI_Error4	=	Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Link' variables.  Please make sure all 'Link' variables are not empty!

; ----------------------------------------------------------------
; FILE INSTALLATIONS
; Standard images are copied to the temp directory.
; ----------------------------------------------------------------
Install_Temp:
{
FileCreateDir,%Install%
	FileCreateDir,%Install%\app
		FileInstall,app\qres.exe,%Install%\app\qres.exe,1
	FileCreateDir,%Install%\img
		FileInstall,img\0-000.png,%Install%\img\0-000.png,1
		FileInstall,img\1-000.png,%Install%\img\1-000.png,1
		FileInstall,img\1-001.png,%Install%\img\1-001.png,1
		FileInstall,img\2-000.png,%Install%\img\2-000.png,1
}

; ----------------------------------------------------------------
; SWITCHES
; ----------------------------------------------------------------
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
	If param = -source
	{
		FileCreateDir,src
			FileInstall,change.log,src\change.log,1
			FileInstall,proctorscript.ahk,src\proctorscript.ahk,1
			FileInstall,setup.ini,src\setup.ini,1
			FileCreateDir,src\app
				FileInstall,app\qres.exe,src\app\qres.exe,1
			FileCreateDir,src\img
				FileInstall,img\0-000.png,src\img\0-000.png,1
				FileInstall,img\1-000.png,src\img\1-000.png,1
				FileInstall,img\1-001.png,src\img\1-001.png,1		
				FileInstall,img\2-000.png,src\img\2-000.png,1
		MsgBox,4160,Source Dumped!,The source for the program has been extracted into the src folder.
		Gosub,Exit
	}
	Else
	{
		MsgBox,4112,Launch Error,You've passed a switch that doesn't exist.
		Gosub,Exit
	}
}
 
; ----------------------------------------------------------------
; INI BUILD AND FORMAT
; Read the INI file and parse everything into variables.
; ----------------------------------------------------------------
Script_Read_Ini:
{
; Does setup.ini even exist?
IfNotExist,setup.ini
{
	FileInstall,setup.ini,setup.ini,1
	MsgBox,4160,Missing INI File,Welcome to ProctorScript!  Since this seems to be your first time using the script, an INI file has been placed in the directory where you ran the script.  This INI contains everything that the program needs to run successfully.  If you need help using the script`,please email wquinn@tcatmurfreesboro.edu.  Thanks for trying it out!`n`nProctorScript %Version%.
	ExitApp
}

; Initial
IniRead,Title,%INI%,Initial,Title
IniRead,EnableLog,%INI%,Initial,EnableLog
IniRead,LogFile,%INI%,Initial,LogFile

; Lockdown
IniRead,LD_Title,%INI%,Lockdown,LD_Title
IniRead,LD_Content,%INI%,Lockdown,LD_Content
Loop
{
	StringReplace,LD_Content,LD_Content,[BR],`n`n,UseErrorLevel
	If ErrorLevel=0
	Break
}

; Launcher
IniRead,LA_Title,%INI%,Launcher,Title
IniRead,LA_StatusBar,%INI%,Launcher,StatusBar

; Option 1
IniRead,LA_Option1Enable,%INI%,Option 1,Enable
IniRead,LA_Option1Title,%INI%,Option 1,Title
IniRead,LA_Option1Link,%INI%,Option 1,Link
IniRead,LA_Option1Logoff,%INI%,Option 1,Logoff

; Option 2
IniRead,LA_Option2Enable,%INI%,Option 2,Enable
IniRead,LA_Option2Title,%INI%,Option 2,Title
IniRead,LA_Option2Link,%INI%,Option 2,Link
IniRead,LA_Option2Logoff,%INI%,Option 2,Logoff

; Option 3
IniRead,LA_Option3Enable,%INI%,Option 3,Enable
IniRead,LA_Option3Title,%INI%,Option 3,Title
IniRead,LA_Option3Link,%INI%,Option 3,Link
IniRead,LA_Option3Logoff,%INI%,Option 3,Logoff

; Option 4
IniRead,LA_Option4Enable,%INI%,Option 4,Enable
IniRead,LA_Option4Title,%INI%,Option 4,Title
IniRead,LA_Option4Link,%INI%,Option 4,Link
IniRead,LA_Option4Logoff,%INI%,Option 4,Logoff

; Option 5
IniRead,LA_Option5Enable,%INI%,Option 5,Enable
IniRead,LA_Option5Title,%INI%,Option 5,Title
IniRead,LA_Option5Link,%INI%,Option 5,Link
IniRead,LA_Option5Logoff,%INI%,Option 5,Logoff

; Option 6
IniRead,LA_Option6Enable,%INI%,Option 6,Enable
IniRead,LA_Option6Title,%INI%,Option 6,Title
IniRead,LA_Option6Link,%INI%,Option 6,Link
IniRead,LA_Option6Logoff,%INI%,Option 6,Logoff

; Option 7
IniRead,LA_Option7Enable,%INI%,Option 7,Enable
IniRead,LA_Option7Title,%INI%,Option 7,Title
IniRead,LA_Option7Link,%INI%,Option 7,Link
IniRead,LA_Option7Logoff,%INI%,Option 7,Logoff

; ACT Compass
IniRead,ACT_LockdownBrowser,%INI%,ACT Compass,LockdownBrowser
IniRead,ACT_OriginalXRes,%INI%,ACT Compass,OriginalXRes
IniRead,ACT_OriginalYRes,%INI%,ACT Compass,OriginalYRes
IniRead,ACT_CompassXRes,%INI%,ACT Compass,CompassXRes
IniRead,ACT_CompassYRes,%INI%,ACT Compass,CompassYRes
IniRead,ACT_Logoff,%INI%,ACT Compass,Logoff
}

; ----------------------------------------------------------------
; INI FAILSAFE
; ----------------------------------------------------------------
Script_Verify_Ini:
{
If LA_Option1Enable != 0
{
	If LA_Option1Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 1]`nEnable=%LA_Option1Enable%
		Gosub,Exit
	}
	Else If (LA_Option1Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 1]`nTitle=%LA_Option1Title%
		Gosub,Exit
	}
	Else If (LA_Option1Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 1]`nLink=%LA_Option1Link%
		Gosub,Exit
	}
}
If LA_Option2Enable != 0
{
	If LA_Option2Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 2]`nEnable=%LA_Option2Enable%
		Gosub,Exit
	}
	Else If (LA_Option2Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 2]`nTitle=%LA_Option2Title%
		Gosub,Exit
	}
	Else If (LA_Option2Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 2]`nLink=%LA_Option2Link%
		Gosub,Exit
	}
}
If LA_Option3Enable != 0
{
	If LA_Option3Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 3]`nEnable=%LA_Option3Enable%
		Gosub,Exit
	}
	Else If (LA_Option3Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 3]`nTitle=%LA_Option3Title%
		Gosub,Exit
	}
	Else If (LA_Option3Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 3]`nLink=%LA_Option3Link%
		Gosub,Exit
	}
}
If LA_Option4Enable != 0
{
	If LA_Option4Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 4]`nEnable=%LA_Option4Enable%
		Gosub,Exit
	}
	Else If (LA_Option4Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 4]`nTitle=%LA_Option4Title%
		Gosub,Exit
	}
	Else If (LA_Option4Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 4]`nLink=%LA_Option4Link%
		Gosub,Exit
	}
}
If LA_Option5Enable != 0
{
	If LA_Option5Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 5]`nEnable=%LA_Option5Enable%
		Gosub,Exit
	}
	Else If (LA_Option5Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 5]`nTitle=%LA_Option5Title%
		Gosub,Exit
	}
	Else If (LA_Option5Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 5]`nLink=%LA_Option5Link%
		Gosub,Exit
	}
}
If LA_Option6Enable != 0
{
	If LA_Option6Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 6]`nEnable=%LA_Option6Enable%
		Gosub,Exit
	}
	Else If (LA_Option6Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 6]`nTitle=%LA_Option6Title%
		Gosub,Exit
	}
	Else If (LA_Option6Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 6]`nLink=%LA_Option6Link%
		Gosub,Exit
	}
}
If LA_Option7Enable != 0
{
	If LA_Option7Enable != 1
	{
		MsgBox,4112,Error,%INI_Error1%`n`n[Option 7]`nEnable=%LA_Option7Enable%
		Gosub,Exit
	}
	Else If (LA_Option7Title = "")
	{
		MsgBox,4112,Error,%INI_Error3%`n`n[Option 7]`nTitle=%LA_Option7Title%
		Gosub,Exit
	}
	Else If (LA_Option7Link = "")
	{
		MsgBox,4112,Error,%INI_Error4%`n`n[Option 7]`nLink=%LA_Option7Link%
		Gosub,Exit
	}
}
}

; ----------------------------------------------------------------
; TRAY MENU
; This just removes all options from the tray icon and adds
; the initial title to the right-click menu.
; ----------------------------------------------------------------
Menu,Tray,NoStandard

; ----------------------------------------------------------------
; GUI BUILD FOR INITIAL
; This is similar to a UAC prompt, where it will dim the entire
; screen until the user acknowledges the prompt in front. 
; ----------------------------------------------------------------
Gui,Initial:Color,000000
Gui,Initial:-Caption +ToolWindow
Gui,Initial:Show,H10000 W10000,Initial
WinSet,Transparent,200,Initial

; ----------------------------------------------------------------
; GUI BUILD FOR LOCKDOWN
; This is the actual popup screen that a user needs to
; acknowledge before being able to use the computer.
; ----------------------------------------------------------------
Gui,Lockdown:Color,FFFFFF
Gui,Lockdown:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\0-000.png
Gui,Lockdown:Add,Picture,X0 Y459 W900 H80 Center,%Install%\img\0-000.png
Gui,Lockdown:Font,cWhite s26,Calibri Light
Gui,Lockdown:Add,Text,X32 Y18 +BackgroundTrans,%LD_Title%
Gui,Lockdown:Font,cBlack s10,Segoe UI
Gui,Lockdown:Add,Text,H344 W736 X32 Y96 +BackgroundTrans,%LD_Content%
Gui,Lockdown:Add,Button,X32 Y467 H32 Default gLauncher,I Agree
Gui,Lockdown:Add,Button,X96 Y467 H32 gDisagree,I Disagree
Gui,Lockdown:Show,H480 W800,%Title%
Gui,Lockdown:+AlwaysOnTop -Caption +Border +Owner
Return

; ----------------------------------------------------------------
; GUI BUILD FOR LAUNCHER
; ----------------------------------------------------------------
Launcher:
{
	If EnableLog=1
		FileAppend,1`,,%LogFile%
	Gui,Initial:Destroy
	Gui,Lockdown:Destroy
	Gui,Launcher:Color,FFFFFF
	Gui,Launcher:Add,StatusBar,,%LA_StatusBar%
	Gui,Launcher:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\1-000.png
	Gui,Launcher:Add,Picture,X500 Y140 H256 W256,%Install%\img\2-000.png
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
	Gui,Launcher:+AlwaysOnTop +Caption +Border -SysMenu

	If LA_Option1Enable=0
		GuiControl,Launcher:Hide,Option1
		Else
		Gui,Launcher:Add,Picture,X0 Y122 W300 H1,%Install%\img\1-001.png
	If LA_Option2Enable=0
		GuiControl,Launcher:Hide,Option2
		Else
		Gui,Launcher:Add,Picture,X0 Y154 W300 H1,%Install%\img\1-001.png
	If LA_Option3Enable=0
		GuiControl,Launcher:Hide,Option3
		Else
		Gui,Launcher:Add,Picture,X0 Y186 W300 H1,%Install%\img\1-001.png
	If LA_Option4Enable=0
		GuiControl,Launcher:Hide,Option4
		Else
		Gui,Launcher:Add,Picture,X0 Y218 W300 H1,%Install%\img\1-001.png
	If LA_Option5Enable=0
		GuiControl,Launcher:Hide,Option5
		Else
		Gui,Launcher:Add,Picture,X0 Y250 W300 H1,%Install%\img\1-001.png
	If LA_Option6Enable=0
		GuiControl,Launcher:Hide,Option6
		Else
		Gui,Launcher:Add,Picture,X0 Y282 W300 H1,%Install%\img\1-001.png
	If LA_Option7Enable=0
		GuiControl,Launcher:Hide,Option7
		Else
		Gui,Launcher:Add,Picture,X0 Y314 W300 H1,%Install%\img\1-001.png
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
	
	Gui,LoadingBar:Color,FFFFFF
	Gui,LoadingBar:Font,s9,Segoe UI
	Gui,LoadingBar:Add,Progress,vProgressBar w400 h3 c399AE7 Range0-125
	Gui,LoadingBar:-Caption +AlwaysOnTop +Border
	Gui,LoadingBar:Show
	Loop,125
	{
		GuiControl,LoadingBar:,ProgressBar,+1
		Sleep,10
	}
	Gui,LoadingBar:Destroy
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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
				FileAppend,%LA_Option1Title%`,`n,%LogFile%
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

; ----------------------------------------------------------------
; DISAGREE
; If the user doesn't agree, log them off of the machine.
; ----------------------------------------------------------------
Disagree:
{
	Suspend,On
	Gui,Lockdown:Destroy
	MsgBox,4112,%Title%,You will be logged out of the system.
	Goto,Exit
}

; ----------------------------------------------------------------
; SPECIAL FUNCTIONS
; These are special commands that the launcher can take.
; ----------------------------------------------------------------
ACT_Compass:
{
	If EnableLog=1
	{
		Gosub,Log
		FileAppend,ACT Compass`,`n,%LogFile%
	}
	IfNotExist,%ACT_LockdownBrowser%
	{
		MsgBox,4112,Error,ACT Compass wasn't found.  Please check the INI file and make sure the location is correct.
		Gosub,Exit
	}
	RunWait,%Install%\app\qres.exe /x:%ACT_CompassXRes% /y:%ACT_CompassYRes%
	Sleep,2500
	RunWait,%ACT_LockdownBrowser%,,UseErrorLevel
	If ErrorLevel = ERROR
	{
		MsgBox,4112,ACT Compass,An unexpected error occurred when launching the Lockdown Browser.  Please contact your system administrator.
		Gosub,Exit
	}
	RunWait,%Install%\app\qres.exe /x:%ACT_OriginalXRes% /y:%ACT_OriginalYRes%
	Sleep,2500
	If ACTCompassForceLogoff=1
		Gosub,Logoff
	Gosub,Exit
}

; ----------------------------------------------------------------
; EXIT
; This is the exit function of the script.
; ----------------------------------------------------------------
Log:
{
	FileAppend,%FirstName%`,%LastName%`,%Date%`,%Time%`,%A_ComputerName%`,%A_OSVersion%`,%A_IPAddress1%`,%A_IPAddress2%`,%A_IPAddress3%`,%A_IPAddress4%`,,%LogFile%
	Return
}

InitialGuiClose:
LockdownGuiClose:
LauncherGuiClose:
Exit:
{
	Gui,Initial:Destroy
	Gui,Lockdown:Destroy
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

!F4::Gosub,Exit
^+C::
{
	Gui,Lockdown:Destroy
	Gui,Initial:Destroy
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
