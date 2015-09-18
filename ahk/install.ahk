FileCreateDir,%Install%
  FileInstall,README.md,%Install%\README.md,1
  FileInstall,ProctorScript.ini,%Install%\%INI%,1
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