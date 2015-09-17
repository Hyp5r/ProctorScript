ConsentBG:
{ Gui,ConsentBG:Color,000000
  Gui,ConsentBG:-Caption +ToolWindow
  Gui,ConsentBG:Show,H10000 W10000,ConsentBG
  WinSet,Transparent,200,ConsentBG
  }

Consent:
{ Gui,Consent:Color,FFFFFF
  Gui,Consent:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\0.png
  Gui,Consent:Add,Picture,X0 Y459 W900 H80 Center,%Install%\img\0.png
  Gui,Consent:Font,cWhite s26,Calibri Light
  Gui,Consent:Add,Text,X32 Y18 +BackgroundTrans,%CS_Title%
  Gui,Consent:Font,cBlack s10,Segoe UI
  Gui,Consent:Add,Text,H344 W736 X32 Y96 +BackgroundTrans,%CS_Content%
  Gui,Consent:Add,Button,X32 Y467 H32 Default gLauncher,I Agree
  Gui,Consent:Add,Button,X96 Y467 H32 gDisagree,I Disagree
  Gui,Consent:Show,H480 W800,%Title%
  Gui,Consent:+AlwaysOnTop -Caption +Border +Owner
  Return
  }