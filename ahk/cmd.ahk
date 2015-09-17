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
  { Gosub,ConsentBG
    Gosub,Launcher
    Return
    }
  Else
  { MsgBox,4112,ProctorScript,You've passed a switch that doesn't exist.
    Gosub,Exit
    }
  }