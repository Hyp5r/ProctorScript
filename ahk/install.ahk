FileCreateDir,%Install%
  FileInstall,README.md,%Install%\README.md,1
  FileInstall,setup.ini,%Install%\setup.ini,1
  FileCreateDir,%Install%\bin
    FileInstall,bin\qres.exe,%Install%\bin\qres.exe,1
    FileInstall,bin\qres.htm,%Install%\bin\qres.htm,1
  FileCreateDir,%Install%\ahk
    FileInstall,ahk\cmd.ahk,%Install%\ahk\cmd.ahk,1
    FileInstall,ahk\consent.ahk,%Install%\ahk\consent.ahk,1
    FileInstall,ahk\install.ahk,%Install%\ahk\install.ahk,1
    FileInstall,ahk\reschange.ahk,%Install%\ahk\reschange.ahk,1
    FileInstall,ahk\var.ahk,%Install%\ahk\var.ahk,1
  FileCreateDir,%Install%\img
    FileInstall,img\icon.ico,%Install%\img\icon.ico,1
    FileInstall,img\0.png,%Install%\img\0.png,1
    FileInstall,img\1.png,%Install%\img\1.png,1
    FileInstall,img\2.png,%Install%\img\2.png,1
    FileInstall,img\3.png,%Install%\img\3.png,1
; Does setup.ini even exist?
IfNotExist,setup.ini
{ FileCopy,%Install%\setup.ini,%A_ScriptDir%
  MsgBox,4160,Welcome to ProctorScript!,Since this seems to be your first time using the script, an INI file has been placed in the directory where you ran the script.  This INI contains everything that the program needs to run successfully.  If you need help using the script`,please email wquinn@outlook.com or find Hyperdaemon on GitHub!  Thanks for trying it out!`n`nProctorScript %Version%.
  ExitApp
  }
; Log
IniRead,EnableLog,%INI%,Log,EnableLog
IniRead,LogFile,%INI%,Log,LogFile
; Consent
IniRead,CS_Title,%INI%,Consent,Title
IniRead,CS_Content,%INI%,Consent,Content
Loop
{ StringReplace,CS_Content,CS_Content,[BR],`n`n,UseErrorLevel
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
; Resolution Change Launcher
IniRead,RCL_Link,%INI%,Resolution Change Launcher,Link
IniRead,RCL_OriginalXRes,%INI%,Resolution Change Launcher,OriginalXRes
IniRead,RCL_OriginalYRes,%INI%,Resolution Change Launcher,OriginalYRes
IniRead,RCL_ChangeXRes,%INI%,Resolution Change Launcher,ChangeXRes
IniRead,RCL_ChangeYRes,%INI%,Resolution Change Launcher,ChangeYRes
IniRead,RCL_Logoff,%INI%,Resolution Change Launcher,Logoff
; Verify that specific variables in the INI file are set properly.
If LA_Option1Enable != 0
{ If LA_Option1Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 1]`nEnable=%LA_Option1Enable%
    Gosub,Exit
    }
  Else If (LA_Option1Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 1]`nTitle=%LA_Option1Title%
    Gosub,Exit
    }
  Else If (LA_Option1Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 1]`nLink=%LA_Option1Link%
    Gosub,Exit
    }
  }
If LA_Option2Enable != 0
{ If LA_Option2Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 2]`nEnable=%LA_Option2Enable%
    Gosub,Exit
    }
  Else If (LA_Option2Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 2]`nTitle=%LA_Option2Title%
    Gosub,Exit
	}
  Else If (LA_Option2Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 2]`nLink=%LA_Option2Link%
    Gosub,Exit
    }
  }
If LA_Option3Enable != 0
{ If LA_Option3Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 3]`nEnable=%LA_Option3Enable%
    Gosub,Exit
    }
  Else If (LA_Option3Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 3]`nTitle=%LA_Option3Title%
    Gosub,Exit
    }
  Else If (LA_Option3Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 3]`nLink=%LA_Option3Link%
    Gosub,Exit
    }
  }
If LA_Option4Enable != 0
{ If LA_Option4Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 4]`nEnable=%LA_Option4Enable%
    Gosub,Exit
    }
  Else If (LA_Option4Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 4]`nTitle=%LA_Option4Title%
    Gosub,Exit
    }
  Else If (LA_Option4Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 4]`nLink=%LA_Option4Link%
	Gosub,Exit
    }
  }
If LA_Option5Enable != 0
{ If LA_Option5Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 5]`nEnable=%LA_Option5Enable%
    Gosub,Exit
    }
  Else If (LA_Option5Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 5]`nTitle=%LA_Option5Title%
    Gosub,Exit
    }
  Else If (LA_Option5Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 5]`nLink=%LA_Option5Link%
    Gosub,Exit
    }
  }
If LA_Option6Enable != 0
{ If LA_Option6Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 6]`nEnable=%LA_Option6Enable%
    Gosub,Exit
    }
  Else If (LA_Option6Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 6]`nTitle=%LA_Option6Title%
    Gosub,Exit
    }
  Else If (LA_Option6Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 6]`nLink=%LA_Option6Link%
    Gosub,Exit
    }
  }
If LA_Option7Enable != 0
{ If LA_Option7Enable != 1
  { MsgBox,4112,Error,%INI_Error1%`n`n[Option 7]`nEnable=%LA_Option7Enable%
    Gosub,Exit
    }
  Else If (LA_Option7Title = "")
  { MsgBox,4112,Error,%INI_Error3%`n`n[Option 7]`nTitle=%LA_Option7Title%
    Gosub,Exit
    }
  Else If (LA_Option7Link = "")
  { MsgBox,4112,Error,%INI_Error4%`n`n[Option 7]`nLink=%LA_Option7Link%
    Gosub,Exit
    }
  }