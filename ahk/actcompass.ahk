; The ACT Compass program requires a screen resolution of 800x600 for it to function properly.  This function sets the resolution via the INI file and sets it back to the default once the exam has been closed.
	If EnableLog=1
	{
		Gosub,Log
		FileAppend,ACT Compass`,`n,%LogFile%
	}
	IfNotExist,%ACT_ConsentBrowser%
	{
		MsgBox,4112,Error,ACT Compass wasn't found.  Please check the INI file and make sure the location is correct.
		Gosub,Exit
	}
	; First Resolution Change
	RunWait,%Install%\app\qres.exe /x:%ACT_CompassXRes% /y:%ACT_CompassYRes%
	Sleep,2500

	; Run Application
	RunWait,%ACT_ConsentBrowser%,,UseErrorLevel
	If ErrorLevel = ERROR
	{
		MsgBox,4112,ACT Compass,An unexpected error occurred when launching the Consent Browser.  Please contact your system administrator.
		Gosub,Exit
	}

	; Second Resolution Change
	RunWait,%Install%\app\qres.exe /x:%ACT_OriginalXRes% /y:%ACT_OriginalYRes%
	Sleep,2500
	If ACT_Logoff=1
		Gosub,Logoff
	Gosub,Exit