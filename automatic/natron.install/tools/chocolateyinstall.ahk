#NoTrayIcon
SendMode "Input"		; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2     ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1

winTitle := "Natron Setup ahk_class QWidget"

WinWait(winTitle,, 180) ; Welcome
Sleep 700
ControlClick "x355 y363", winTitle,,,, "NA" ; Next

Sleep 700
ControlClick "x355 y363", winTitle,,,, "NA" ; Installation folder

Sleep 700
ControlClick "x355 y363", winTitle,,,, "NA" ; Select Components

Sleep 2500
ControlClick "x41 y301", winTitle%,,, "NA"  ; License agreement - I accept the license
Sleep 1700
ControlClick "x355 y363", winTitle,,,, "NA" ; Select Components

Sleep 1700
ControlClick "x355 y363", winTitle,,,, "NA" ; Start Menu shortcuts

Sleep 1700
ControlClick "x355 y363", winTitle,,,, "NA" ; Ready to install

Sleep 75000 ; As-is Windows Spy does not catch any QWidget controls
ControlClick "x437 y364", winTitle,,,, "NA" ; Completing the Natron Wizard - Finish