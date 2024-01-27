#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

ProcessWaitClose("WeaselDeployer.exe")

SetTitleMatchMode 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.

; Check for updates automatically
WinWait("Software Update",, 120)
WinActivate
ControlClick "Button2", winTitle,,,,"NA" ; Don't check