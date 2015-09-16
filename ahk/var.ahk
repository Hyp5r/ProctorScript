#NoEnv
#Persistent
#SingleInstance,Force
SendMode,Input
SetWorkingDir,%A_ScriptDir%
FormatTime,Date,,yyyy/MM/dd
FormatTime,Time,,h:mm:ss tt

; Script Variables
Install = %A_MyDocuments%\c5f530c5-8dfe-4f08-bb49-d5ef43adbc92
Version = 1.0.0a

; INI Location
INI = %A_ScriptDir%\setup.ini

; Possible Error Messages
INI_Error1 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Enable' variables.  Please make sure all 'Enable' variables equal 0 or 1.
INI_Error2 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Logoff' variables.  Please make sure all 'Logoff' variables equal 0 or 1.
INI_Error3 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Title' variables.  Please make sure all 'Title' variables are not empty!
INI_Error4 = Unfortunately`, there's something wrong with the INI file.`n`nIn this instance`, something is wrong with one of the 'Link' variables.  Please make sure all 'Link' variables are not empty!
