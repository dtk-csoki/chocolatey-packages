#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2  ; A window's title can contain WinTitle anywhere inside it to be a match
SetControlDelay 0  

; Remove VueScan
WinTitle := "VueScan ahk_class #32770 ahk_exe vuescan.exe"
WinWait(WinTitle,, 30) ; Do you want to remove VueScan?
ControlClick "Button1", WinTitle ; Yes