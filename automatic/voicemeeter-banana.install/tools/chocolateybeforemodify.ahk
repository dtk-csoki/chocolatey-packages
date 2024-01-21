#NoTrayIcon
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

winTitle1 := "VB-Audio Voicemeeter Installation"              
WinWait(winTitle1,, 30)
WinActivate
ControlSend "{Enter}","",winTitle1

SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
winTitle2 := "REBOOT YOUR SYSTEM"
WinWait(winTitle2,, 60)
WinActivate
Sleep 1000
SetControlDelay -1
ControlClick "Button1",winTitle2,,,,"NA"