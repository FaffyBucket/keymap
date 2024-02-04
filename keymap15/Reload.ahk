﻿/*
*********************************************************************************
* Reload																		*
*                                                                               *
* Version:              1.0                                                     *
* AutoHotkey Version:   1.1                                                     *
* Language:       		English                                                 *
* Platform:       		Windows 7, 8                                            *
* Author:         		www.twitter.com/matthiew                                *
*                                                                               *
* Script Function: Waits for vmconnect.exe to exit, then launches Keymap.ahk    *
*********************************************************************************
*/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#NoTrayIcon
#SingleInstance


loopIndex := 1
While loopIndex == 1
{
	IfWinNotExist, ahk_exe vmconnect.exe
		loopIndex := 0
}
Run keymap.ahk
ExitApp


/*
*********************************************************************************
Reload Known Issues:
 - none




Reload Version History:
1.0 -  It begins...
*********************************************************************************
*/