; AHK VERSION: Lexikos 1.1.23.00 Unicode 32-bit
; AUTHOR: William Quinn (wquinn@outlook.com)
; TITLE: ProctorScript
; UUID: c5f530c5-8dfe-4f08-bb49-d5ef43adbc92

; Initialization Scripts
#NoEnv
#Persistent
#SingleInstance,Force
SendMode,Input
SetWorkingDir,%A_ScriptDir%
FormatTime,Date,,yyyy/MM/dd
FormatTime,Time,,h:mm:ss tt
; Retrieve common Windows variables
EnvGet,Temp,Temp
EnvGet,Tmp,Tmp
EnvGet,WinDir,WinDir
; Script Variables
Install = %A_MyDocuments%\c5f530c5-8dfe-4f08-bb49-d5ef43adbc92
ScriptName = ProctorScript
Version = 2.0.5
; INI Location
INI = ProctorScript.ini
; Possible Error Messages
INI_Error1 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Enable' variables.  Please make sure all 'Enable' variables equal 0 or 1.
INI_Error2 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Logoff' variables.  Please make sure all 'Logoff' variables equal 0 or 1.
INI_Error3 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Title' variables.  Please make sure all 'Title' variables are not empty!
INI_Error4 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Link' variables.  Please make sure all 'Link' variables are not empty!

FileCreateDir,%Install%
  FileInstall,README.md,%Install%\README.md,1
  FileInstall,ProctorScript.ini,%Install%\%INI%,1
  FileCreateDir,%Install%\bin
    FileInstall,bin\qres.exe,%Install%\bin\qres.exe,1
    FileInstall,bin\qres.htm,%Install%\bin\qres.htm,1
  FileCreateDir,%Install%\img
    FileInstall,img\icon.ico,%Install%\img\icon.ico,1
    FileInstall,img\cs_header.png,%Install%\img\cs_header.png,1
    FileInstall,img\cs_shadow.png,%Install%\img\cs_shadow.png,1
    FileInstall,img\cs_title.png,%Install%\img\cs_title.png,1
    FileInstall,img\launcher_header.png,%Install%\img\launcher_header.png,1
    FileInstall,img\launcher_shadow.png,%Install%\img\launcher_shadow.png,1
    FileInstall,img\launcher_title.png,%Install%\img\launcher_title.png,1
; Does ProctorScript.ini even exist?
IfNotExist,%INI%
{ FileCopy,%Install%\%INI%,%A_ScriptDir%
  MsgBox,4160,Welcome to %ScriptName%!,Since this seems to be your first time using the script, an INI file has been placed in the directory where you ran the script.  This INI contains everything that the program needs to run successfully.  If you need help using the script`, please email wquinn@outlook.com or find Hyperdaemon on GitHub!  Thanks for trying it out!`n`n%ScriptName% %Version%.
  ExitApp
  }
; Log
IniRead,EnableLog,%INI%,Log,EnableLog
IniRead,LogFile,%INI%,Log,LogFile
; Consent
IniRead,CS_Enabled,%INI%,Consent,Enabled
IniRead,CS_Title,%INI%,Consent,Title
IniRead,CS_Content,%INI%,Consent,Content
Loop
{ StringReplace,CS_Content,CS_Content,[BR],`n`n,UseErrorLevel
  If ErrorLevel=0
  Break
  }
; Launcher

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;
;: New variables                                              :;
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;
; $ini
; @ps-title
; @ps-statusbar
; @ps-consent-enable
; @ps-consent-title
; @ps-consent-content
; @opt#-title
; @opt#-link
; @opt#-idlecheck
; @opt#-logoff
; @opt#-reschange-enable
; @opt#-reschange-X
; @opt#-reschange-Y
;

IniWrite,,$ini,

IniRead,LA_Title,%INI%,Launcher,Title
IniRead,LA_StatusBar,%INI%,Launcher,StatusBar
IniRead,LA_Option1Title,%INI%,Option 1,Title
IniRead,LA_Option1Link,%INI%,Option 1,Link
IniRead,LA_Option1Logoff,%INI%,Option 1,Logoff
IniRead,LA_Option2Title,%INI%,Option 2,Title
IniRead,LA_Option2Link,%INI%,Option 2,Link
IniRead,LA_Option2Logoff,%INI%,Option 2,Logoff
IniRead,LA_Option3Title,%INI%,Option 3,Title
IniRead,LA_Option3Link,%INI%,Option 3,Link
IniRead,LA_Option3Logoff,%INI%,Option 3,Logoff
IniRead,LA_Option4Title,%INI%,Option 4,Title
IniRead,LA_Option4Link,%INI%,Option 4,Link
IniRead,LA_Option4Logoff,%INI%,Option 4,Logoff
IniRead,LA_Option5Title,%INI%,Option 5,Title
IniRead,LA_Option5Link,%INI%,Option 5,Link
IniRead,LA_Option5Logoff,%INI%,Option 5,Logoff
IniRead,LA_Option6Title,%INI%,Option 6,Title
IniRead,LA_Option6Link,%INI%,Option 6,Link
IniRead,LA_Option6Logoff,%INI%,Option 6,Logoff
IniRead,LA_Option7Title,%INI%,Option 7,Title
IniRead,LA_Option7Link,%INI%,Option 7,Link
IniRead,LA_Option7Logoff,%INI%,Option 7,Logoff
IniRead,LA_Option8Title,%INI%,Option 8,Title
IniRead,LA_Option8Link,%INI%,Option 8,Link
IniRead,LA_Option8Logoff,%INI%,Option 8,Logoff
IniRead,LA_Option9Title,%INI%,Option 9,Title
IniRead,LA_Option9Link,%INI%,Option 9,Link
IniRead,LA_Option9Logoff,%INI%,Option 9,Logoff
IniRead,LA_Option10Title,%INI%,Option 10,Title
IniRead,LA_Option10Link,%INI%,Option 10,Link
IniRead,LA_Option10Logoff,%INI%,Option 10,Logoff
; Resolution Change Launcher
IniRead,RCL_Link,%INI%,Resolution Change Launcher,Link
IniRead,RCL_OriginalXRes,%INI%,Resolution Change Launcher,OriginalXRes
IniRead,RCL_OriginalYRes,%INI%,Resolution Change Launcher,OriginalYRes
IniRead,RCL_ChangeXRes,%INI%,Resolution Change Launcher,ChangeXRes
IniRead,RCL_ChangeYRes,%INI%,Resolution Change Launcher,ChangeYRes
IniRead,RCL_Logoff,%INI%,Resolution Change Launcher,Logoff

Loop,%0%
{ switch := %A_Index%
  If switch =
    break
  If switch = -cleanini
  { IfNotExist,%INI%
    { FileCopy,%Install%\%INI%,%A_ScriptDir%,1
      MsgBox,4160,ProctorScript,A clean INI file has been placed in the script directory.
	  }
    Gosub,Exit
    }
  If switch = -help
  { MsgBox,4160,ProctorScript,ProctorScript Switches`n`n-cleanini`n        Creates a fresh ProctorScript.ini in the script directory.`n`n-reslauncher`n        Automatically runs the Resolution Change Launcher with the`n        program defined in setup.ini.`n`n-skipconsent`n        Skips the consent screen and goes straight to the launcher.,
    Gosub,Exit
    }
  If switch = -reslauncher
  { Gosub,Resolution_Change_Launcher
    Return
    }
  If switch = -skipconsent
  { CS_Enabled = 0
    }
  Else
  { MsgBox,4112,ProctorScript,You've passed a switch that doesn't exist.
    Gosub,Exit
    }
  }

ConsentBG:
{ Sysget,VirtualScreenWidth,78
  Sysget,VirtualScreenHeight,79
  Gui,ConsentBG:Color,000000
  Gui,ConsentBG:-Caption +ToolWindow
  Gui,ConsentBG:Show,X0 Y0 W%VirtualScreenWidth% H%VirtualScreenHeight%,ConsentBG
  WinSet,Transparent,220,ConsentBG
  }
If (CS_Enabled="1" or CS_Enabled="Y" or CS_Enabled="Yes")
{ Consent:
  { Gui,Consent:Add,StatusBar,,%LA_StatusBar% - %Version%
    Gui,Consent:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\cs_title.png
    Gui,Consent:Add,Picture,X0 Y80 H40 W900,%Install%\img\cs_header.png
    Gui,Consent:Add,Picture,X0 Y80 H5 W900,%Install%\img\cs_shadow.png
    Gui,Consent:Font,CWhite S20,Segoe UI
    Gui,Consent:Add,Text,X16 Y18 +BackgroundTrans,%CS_Title%
    Gui,Consent:Font,CWhite S12 Q5 WBold,Segoe UI
    Gui,Consent:Add,Text,X16 Y90 +BackgroundTrans,PLEASE READ THE FOLLOWING
    Gui,Consent:Font,,
    Gui,Consent:Font,cBlack s10,Segoe UI
    Gui,Consent:Add,Edit,H212 W445 X16 Y128 R16 ReadOnly +BackgroundTrans,%CS_Content%
    Gui,Consent:Add,Button,X16 Y416 W300 Default gLauncher,I Agree
    Gui,Consent:Add,Button,X361 Y416 W100 gDisagree,I Disagree
    Gui,Consent:Show,H480 W477,%Title%
    Gui,Consent:+AlwaysOnTop -SysMenu
    Return
    }
  }

; Show icon in system tray, disable tray menu.
Menu,Tray,NoStandard
Launcher:
{ If EnableLog=1
    FileAppend,1`,,%LogFile%
  Gui,Launcher:Add,StatusBar,,%LA_StatusBar% - %Version%
  Gui,Launcher:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\launcher_title.png
  Gui,Launcher:Add,Picture,X0 Y80 H40 W900,%Install%\img\launcher_header.png
  Gui,Launcher:Add,Picture,X0 Y164 H40 W900,%Install%\img\launcher_header.png
  Gui,Launcher:Add,Picture,X0 Y80 H5 W900,%Install%\img\launcher_shadow.png
  Gui,Launcher:Font,CWhite S20 Q5,Segoe UI
  Gui,Launcher:Add,Text,X16 Y22 +BackgroundTrans,%LA_Title%
  Gui,Launcher:Font,CWhite S12 Q5 WBold,Segoe UI
  Gui,Launcher:Add,Text,X16 Y90 +BackgroundTrans,YOUR NAME
  Gui,Launcher:Add,Text,X16 Y174 +BackgroundTrans,WHAT ARE YOU HERE FOR?
  Gui,Launcher:Font,,
  Gui,Launcher:Font,CBlack S12 Q5,Calibri
  Gui,Launcher:Add,Edit,X16 Y128 W445 vName,
  Gui,Launcher:Add,ListBox,X16 Y212 W445 R10 vOptions AltSubmit Choose1,%LA_Option1Title%|%LA_Option2Title%|%LA_Option3Title%|%LA_Option4Title%|%LA_Option5Title%|%LA_Option6Title%|%LA_Option7Title%|%LA_Option8Title%|%LA_Option9Title%|%LA_Option10Title%
  Gui,Launcher:Add,Button,X16 Y416 W445 Default gSubmit,Let's Go!
  Gui,Launcher:Show,H480 W477,
  Gui,Launcher:+AlwaysOnTop -SysMenu
  Gui,Consent:Destroy
  Return
  }
Submit:
{ Gui,Launcher:Submit,NoHide
  If Name =
    { MsgBox,4112,%ScriptName%,Your name must be entered before you can continue.
	  Return
	  }
  Loop,parse,Options,`,
  { LaunchTitle := % LA_Option%A_LoopField%Title
    LaunchLink := % LA_Option%A_LoopField%Link
  	LaunchLogoff := % LA_Option%A_LoopField%Logoff
	}
  If LaunchTitle =
    { MsgBox,4112,%ScriptName%,A legitimate option must be selected before you can continue.
      Return
      }
  Gui,Launcher:Destroy
  Gui,ConsentBG:Destroy
  If (LaunchLink="Resolution Change Launcher")
    Gosub,Resolution_Change_Launcher
  If (LaunchLink="0" or LaunchLink="")
    Gosub,Exit
  Else
  { If EnableLog=1
    { Gosub,Log
      FileAppend,%LaunchTitle%`,`n,%LogFile%
      }
    If (LaunchLogoff="1" or LaunchLogoff="Y" or LaunchLogoff="Yes")
    { RunWait,%LaunchLink%,,UseErrorLevel
      If ErrorLevel=ERROR
      { MsgBox,4112,Error,An unexpected error occurred when launching the application.
        Gosub,Exit
        }
      Gosub,Logoff
      }
    Else
    { Run %LaunchLink%,,UseErrorLevel
      If ErrorLevel=ERROR
      { MsgBox,4112,Error,An unexpected error occurred when launching the application.
        Gosub,Exit
        }
      Gosub,Exit
      }
    }
  }
Disagree:
{ Suspend,On
  Gui,Consent:Destroy
  MsgBox,4112,%Title%,You will be logged out of the system.
  Gosub,Logoff
  }

Resolution_Change_Launcher:
If EnableLog=1
{ Gosub,Log
  FileAppend,Resolution Change Launcher`,`n,%LogFile%
  }
; Give some coffee to keep the computer alive
SetTimer,Caffiene,60000
; Confirm the resolution change.
MsgBox,4132,Resolution Change,Your computer's resolution will change to %RCL_ChangeXRes% by %RCL_ChangeYRes%.  Press Yes to Continue, or press No to log out.
If MsgBox, No
{ RunWait,%Install%\bin\qres.exe /x:%RCL_OriginalXRes% /y:%RCL_OriginalYRes%
Gosub,Logoff
}
; First Resolution Change
RunWait,%Install%\bin\qres.exe /x:%RCL_ChangeXRes% /y:%RCL_ChangeYRes%
Sleep,2500
; Run Application
RunWait,%RCL_Link%,,UseErrorLevel
  If ErrorLevel=ERROR
    { MsgBox,4112,Error,An unexpected error occurred when launching the application.
      Gosub,Exit
      }
; Second Resolution Change
RunWait,%Install%\bin\qres.exe /x:%RCL_OriginalXRes% /y:%RCL_OriginalYRes%
Sleep,2500
; Stop giving the computer coffee
SetTimer,Caffiene,Off
If RCL_Logoff=1
Gosub,Logoff
Gosub,Exit

Caffiene:
{ SendInput,{F15}
Return
}
Log:
{ FileAppend,%Name%`,%Date%`,%Time%`,%A_ComputerName%`,%A_OSVersion%`,%A_IPAddress1%`,%A_IPAddress2%`,%A_IPAddress3%`,%A_IPAddress4%`,,%LogFile%
  Return
  }
ConsentBGGuiClose:
ConsentGuiClose:
LauncherGuiClose:
Exit:
{ Gui,ConsentBG:Destroy
  Gui,Consent:Destroy
  Gui,Launcher:Destroy
  FileRemoveDir,%Install%,1
  ExitApp
  }
Logoff:
{ Gui,ConsentBG:Destroy
  Gui,Consent:Destroy
  Gui,Launcher:Destroy
  FileRemoveDir,%Install%,1
  Shutdown,0
  }
; Hotkeys Disabled
!F4::return
!Tab::return
#Tab::return
