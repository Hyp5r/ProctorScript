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
  Gui,Launcher:Show,H480 W800,
  Gui,Launcher:+AlwaysOnTop -Caption +Border -SysMenu
  Gui,Consent:Destroy

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
{ Gui,Launcher:Submit,NoHide
  If Option1 = 0
  If Option2 = 0
  If Option3 = 0
  If Option4 = 0
  If Option5 = 0
  If Option6 = 0
  If Option7 = 0
    { MsgBox,4112,%Title%,An option must be selected before you can continue.
      Return
      }
	  
; Code sourced from http://www.autohotkey.com/board/topic/99352-required-fields-to-submit/?p=623781
  Fields := "FirstName,LastName"
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

  If (Option1 = 1)
    { If LA_Option1Link=Resolution Change Launcher
        Gosub,Resolution_Change_Launcher
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

  If (Option2 = 1)
    { If LA_Option2Link=Resolution Change Launcher
        Gosub,Resolution_Change_Launcher
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
  Goto,Exit
  }

Resolution_Change_Launcher:
  #Include ahk\reschange.ahk

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
	ExitApp
}

Logoff:
{
	Gui,ConsentBG:Destroy
	Gui,Consent:Destroy
	Gui,Launcher:Destroy
	FileRemoveDir,%Install%,1
	Shutdown,0
}

; Hotkeys Disabled
!F4::return
!Tab::return
