/*
************************************************************************************************
* MediaPlayPause                                                                               *
*                                                                                              *
* Version:              1.2 (Version History at the bottom of this script)                     *
* AutoHotkey Version:   1.1                                                                    *
* Language:             English                                                                *
* Platform:             Windows 7, 8                                                           *
* Author:               www.twitter.com/matthiew                                               *
*                                                                                              *
* Script Function:                                                                             *
* This script is designed to replace the functionality of Media_Play_Pause in Windows when     *
* Explorer is active and a file is selected. When a file is selected in Explorer, Windows will *
* try to play the file instead of sending the Play/Pause command, and it often fails. This     *
* script will then change the selection in the Explorer window, and then send the              *
* Media_Play_Pause command successfully.                                                       *
* So instead of code such as "Send {Media_Play_Pause}", or "x::Media_Play_Pause", this  script *
* can be run.                                                                                  *
************************************************************************************************
*/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoTrayIcon
#SingleInstance




Send {Tab}
Send {Media_Play_Pause}




/*
************************************************************************************************
MediaPlayPause Known Issues:
1. The {Tab} command that is sent may affect the user's workflow.
2. If this script is being invoked multiple key shortcut, it cannot be repeated until all keys
   are released. For example, "!x::Media_Play_Pause" can be repeatedly executed by holding
   "Alt" and tapping "x". However if you run this script instead of sending "Media_Play_Pause",
   then holding "Alt" and tapping "x" will only work the first time "x" is pressed. Both "Alt"
   and "x" have to be released and pressed again to send the "Media_Play_Pause" command
   repeatedly using this script.


MediaPlayPause Version History:
1.2 - Added #SingleInstande.
1.1 - Compiled MediaPlayPause.
1.0 - Created MediaPlayPause.ahk.
************************************************************************************************
*/