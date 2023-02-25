#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2  ; A windows's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay 0  

WinWait("Windows ahk_class #32770 ahk_exe rundll32.exe","mshelp", 180)
ControlClick "Button1", "Windows ahk_class #32770 ahk_exe rundll32.exe"

ProcessWaitClose("vuescan.exe")