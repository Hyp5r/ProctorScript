If EnableLog=1
  { Gosub,Log
	FileAppend,Resolution Change Launcher`,`n,%LogFile%
	}
IfNotExist,%RCL_Link%
  { MsgBox,4112,Error,The application that is set in the INI file cannot be found.  Please check the INI file and make sure the location is correct.
	Gosub,Exit
	}
	; First Resolution Change
	RunWait,%Install%\bin\qres.exe /x:%RCL_ChangeXRes% /y:%RCL_ChangeYRes%
	Sleep,2500

	; Run Application
	RunWait,%RCL_Link%,,UseErrorLevel
	If ErrorLevel = ERROR
	{
		MsgBox,4112,Error,An unexpected error occurred when launching the application.  Please contact your system administrator.
		Gosub,Exit
	}

	; Second Resolution Change
	RunWait,%Install%\bin\qres.exe /x:%RCL_OriginalXRes% /y:%RCL_OriginalYRes%
	Sleep,2500
	If RCL_Logoff=1
		Gosub,Logoff
	Gosub,Exit