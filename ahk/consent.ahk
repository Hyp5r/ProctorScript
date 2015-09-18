ConsentBG:
{ Sysget,VirtualScreenWidth,78
  Sysget,VirtualScreenHeight,79
  Gui,ConsentBG:Color,000000
  Gui,ConsentBG:-Caption +ToolWindow
  Gui,ConsentBG:Show,X0 Y0 W%VirtualScreenWidth% H%VirtualScreenHeight%,ConsentBG
  WinSet,Transparent,220,ConsentBG
  }
If (CS_Enabled="1" or CS_Enabled="Y" or CS_Enabled="Yes")
{ Consent:
  { Gui,Consent:Add,StatusBar,,%LA_StatusBar% - %Version%
    Gui,Consent:Add,Picture,X0 Y0 W900 H80 Center,%Install%\img\cs_title.png
    Gui,Consent:Add,Picture,X0 Y80 H40 W900,%Install%\img\cs_header.png
    Gui,Consent:Add,Picture,X0 Y80 H5 W900,%Install%\img\cs_shadow.png
    Gui,Consent:Font,CWhite S20,Segoe UI
    Gui,Consent:Add,Text,X16 Y18 +BackgroundTrans,%CS_Title%
    Gui,Consent:Font,CWhite S12 Q5 WBold,Segoe UI
    Gui,Consent:Add,Text,X16 Y90 +BackgroundTrans,PLEASE READ THE FOLLOWING
    Gui,Consent:Font,,
    Gui,Consent:Font,cBlack s10,Segoe UI
    Gui,Consent:Add,Edit,H212 W445 X16 Y128 R16 ReadOnly +BackgroundTrans,%CS_Content%
    Gui,Consent:Add,Button,X16 Y416 W300 Default gLauncher,I Agree
    Gui,Consent:Add,Button,X361 Y416 W100 gDisagree,I Disagree
    Gui,Consent:Show,H480 W477,%Title%
    Gui,Consent:+AlwaysOnTop -SysMenu
    Return
    }
  }