; AHK VERSION: Lexikos 1.1.22.06 Unicode 32-bit
; AUTHOR: William Quinn (wquinn@outlook.com)
; TITLE: ProctorScript
; UUID: c5f530c5-8dfe-4f08-bb49-d5ef43adbc92

; Initialization Scripts
#Include ahk\var.ahk ; Defines all variables.
#Include ahk\install.ahk ; Installs all files.
#Include ahk\cmd.ahk ; Adds command-line switches.
#Include ahk\consent.ahk ; Similar to Windows UAC, shows INI variables.

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
  Goto,Logoff
  }
Resolution_Change_Launcher:
  #Include ahk\reschange.ahk
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
  ExitApp
  Shutdown,0
  }
; Hotkeys Disabled
!F4::return
!Tab::return