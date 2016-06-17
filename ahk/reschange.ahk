#Persistent
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
