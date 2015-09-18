; AHK VERSION: Lexikos 1.1.22.06 Unicode 32-bit
; AUTHOR: William Quinn (wquinn@outlook.com)
; TITLE: ProctorScript
; UUID: c5f530c5-8dfe-4f08-bb49-d5ef43adbc92

; Initialization Scripts
#Include ahk\var.ahk ; Defines all variables.
#Include ahk\install.ahk ; Installs all files.

; DISABLE CMD AND CONSENT DURING DEVELOPMENT
; #Include ahk\cmd.ahk ; Adds command-line switches.
 #Include ahk\consent.ahk ; Similar to Windows UAC, shows INI variables.

; Show icon in system tray, disable tray menu.
Menu,Tray,NoStandard
Launcher: 
{ If EnableLog=1
    FileAppend,1`,,%LogFile%
; Gui,Launcher:Color,FFFFFF
  Gui,Launcher:Add,StatusBar,,%LA_StatusBar% - %Version%
  Gui,Launcher:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\1.png
  Gui,Launcher:Add,Picture,X0 Y80 H40 W900,%Install%\img\2.png
  Gui,Launcher:Add,Picture,X0 Y164 H40 W900,%Install%\img\2.png
  Gui,Launcher:Add,Picture,X0 Y80 H5 W900,%Install%\img\4.png
  Gui,Launcher:Add,Picture,X500 Y140 H256 W256,%Install%\img\3.png
  Gui,Launcher:Font,CWhite S20 Q5,Segoe UI
  Gui,Launcher:Add,Text,X16 Y22 +BackgroundTrans,%LA_Title%
  Gui,Launcher:Font,CWhite S12 Q5 WBold,Segoe UI
  Gui,Launcher:Add,Text,X16 Y90 +BackgroundTrans,YOUR NAME
  Gui,Launcher:Add,Text,X16 Y174 +BackgroundTrans,WHAT ARE YOU HERE FOR?
  Gui,Launcher:Font,,
  Gui,Launcher:Font,CBlack S12 Q5,Calibri
  Gui,Launcher:Add,Edit,X16 Y128 W445 vName,
  Gui,Launcher:Add,ListBox,X16 Y212 W445 H200 vOptions,%LA_Option1Title%|%LA_Option2Title%|%LA_Option3Title%|%LA_Option4Title%|%LA_Option5Title%|%LA_Option6Title%|%LA_Option7Title%
  Gui,Launcher:Add,Button,X16 Y416 W445 Default gSubmit,Let's Go!
  Gui,Launcher:Show,H480 W477,
  Gui,Launcher:+AlwaysOnTop -SysMenu -MinimizeBox
  Gui,Consent:Destroy
  Return
  }
Submit:
{ Gui,Launcher:Submit,NoHide
  If Options =
    { MsgBox,4112,%Title%,An option must be selected before you can continue.
      Return
      }	  
; Code sourced from http://www.autohotkey.com/board/topic/99352-required-fields-to-submit/?p=623781
  Fields := "Name"
  Empty_Fields := ""
  Loop, Parse, Fields, `,
  If (!StrLen(%A_LoopField%))
  empty_fields .= (StrLen(empty_fields) ? "," : "") A_LoopField
  If (StrLen(empty_fields))
    { MsgBox,4112,%Title%,Your name must be entered before you can continue.
      Return
      }
  Gui,Launcher:Destroy
  Gui,ConsentBG:Destroy
  If Options = %LA_Option1Title%
  { If LA_Option1Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option1Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option1Title%`,`n,%LogFile%
        }
      If Option1Logoff=1
      { RunWait,%LA_Option1Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option1Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If Options = %LA_Option2Title%
  { If LA_Option2Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option2Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option2Title%`,`n,%LogFile%
        }
      If Option2Logoff=1
      { RunWait,%LA_Option2Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option2Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If (Option3 = 1)
  { If LA_Option3Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option3Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option3Title%`,`n,%LogFile%
        }
      If Option3Logoff=1
      { RunWait,%LA_Option3Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option3Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If (Option4 = 1)
  { If LA_Option4Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option4Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option4Title%`,`n,%LogFile%
        }
      If Option4Logoff=1
      { RunWait,%LA_Option4Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option4Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If (Option5 = 1)
  { If LA_Option5Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option5Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option5Title%`,`n,%LogFile%
        }
      If Option5Logoff=1
      { RunWait,%LA_Option5Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option5Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If (Option6 = 1)
  { If LA_Option6Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option6Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option6Title%`,`n,%LogFile%
        }
      If Option6Logoff=1
      { RunWait,%LA_Option6Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option6Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
      }
    }
  If (Option7 = 1)
  { If LA_Option7Link=Resolution Change Launcher
      Gosub,Resolution_Change_Launcher
    If LA_Option7Link=0
      Gosub,Exit
    Else
    { If EnableLog=1
      { Gosub,Log
        FileAppend,%LA_Option7Title%`,`n,%LogFile%
        }
      If Option7Logoff=1
      { RunWait,%LA_Option7Link%,,UseErrorLevel
        If ErrorLevel=ERROR
          { MsgBox,4112,Error,An unexpected error occurred when launching the application.
            Gosub,Exit
            }
        Gosub,Logoff
        }
      Else
      { Run %LA_Option7Link%,,UseErrorLevel
        If ErrorLevel=ERROR
        { MsgBox,4112,Error,An unexpected error occurred when launching the application.
          Gosub,Exit
          }
        Gosub,Exit
        }
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
{ FileAppend,%FirstName%`,%LastName%`,%Date%`,%Time%`,%A_ComputerName%`,%A_OSVersion%`,%A_IPAddress1%`,%A_IPAddress2%`,%A_IPAddress3%`,%A_IPAddress4%`,,%LogFile%
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
; Shutdown,0
  }
; Hotkeys Disabled
; !F4::return
; !Tab::return