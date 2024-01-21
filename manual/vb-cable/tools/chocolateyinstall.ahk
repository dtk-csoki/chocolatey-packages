#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay 20  
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

SetTitleMatchMode 2  ; A window's title can contain WinTitle anywhere inside it to be a match.
winTitle1 := "Windows ahk_exe rundll32.exe ahk_class #32770"
WinWait(winTitle1,, 60)
ControlClick "Button1",winTitle1