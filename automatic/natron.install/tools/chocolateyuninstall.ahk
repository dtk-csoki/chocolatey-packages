#NoTrayIcon
SendMode "Input" 	 ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1

winTitle := "Maintain Natron ahk_class QWidget"

WinWait(winTitle,, 30) ; Setup - Natron
Sleep 350
ControlClick "x362 y362", winTitle,,,, "NA" ; Next

Sleep 350
ControlClick "x362 y362", winTitle,,,, "NA" ; Uninstall

loop
{
	ControlClick "x436 y362", winTitle,,,, "NA" ; Completing the Natron Wizard - Finish
	Sleep 2000
}