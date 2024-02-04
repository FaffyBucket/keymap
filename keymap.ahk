/*
************************************************************************************************
* keymap                                                                                       *
*                                                                                              *
* Version:             16.00 (version history at the bottom of this script)                    *
* AutoHotkey Version:  2.0                                                                     *
* Language:            English                                                                 *
* Platform:            Windows 10                                                              *
* Author:              www.twitter.com/matthiew                                                *
*                                                                                              *
* Script Function:                                                                             *
* 1. Maps "Num Lock" key to open/activate/close the Windows calculator app.                    *
* 2. Maps "Win"+"Shift"+"Left" shortcut to "Alt"+"`" so that moving a window to the next       *
*    monitor can be done with just the left hand.                                              *
* 3. Maps "Win"+"`" to maximise/restore the current window with just the left hand.            *
* 4. Media playback shortcuts which can be used consistenly with any keyboard:                 *
*    Assigns "Media_Next" to "Alt"+".".                                                        *
*    Assigns "Media_Prev" to "Alt"+",".                                                        *
*    Assigns "Media_Play_Pause" to "Alt"+"/".                                                  *
*    Assigns "Volume_Up" to "Alt"+"=".                                                         *
*    Assigns "Volume_Down" to "Alt"+"-".                                                       *
*    Assigns "Volume_Mute" to "Alt"+"0".                                                       *
************************************************************************************************
*/




#Requires AutoHotkey v2.0
#SingleInstance Force
TraySetIcon ("map.ico")




; 1. Maps Num Lock key to open/activate/close Calculator.exe

SetNumLockState "AlwaysOn"
NumLock::
{
	if WinExist("Calculator")
	{
		if WinActive("Calculator")
		{
			WinClose "Calculator"
		}
		else
		{
			WinActivate "Calculator"
		}
	}
	else
	{
		Run "calculator://"
		Sleep 200
		WinActivate "Calculator"
	}
	return
}




; 2. Maps Win+Shift+Left shortcut to Alt+` so that moving a window to the next monitor can be
;    done with just the left hand. The Win+Shift+Left shortcut was introduced in Windows 7, so
;    this won't work in previous versions.

!`::
{
	Send "#+{Right}"
	return
}




; 3. Maps Win+` to maximise/restore the current window with just the left hand.

#`::
{
	MinMax := WinGetMinMax("A")
	if (MinMax = 1)
	{
		WinRestore "A"
	}
	else
	{
		WinMaximize "A"
	}
	return
}




; * 4. Media playback shortcuts which can be used consistenly with any keyboard

!.::Media_Next    ; Assigns "Media_Next" to "Alt"+".".
!,::Media_Prev    ; Assigns "Media_Prev" to "Alt"+",".
!/::    		  ; Assigns "Media_Play_Pause" to "Alt"+"/".
{
	ActiveProcess := WinGetProcessName("A")
	if (ActiveProcess = "explorer.exe")
	{
		Send "{Tab}"
		Send "{Media_Play_Pause}"
	}
	else
	{
		Send "{Media_Play_Pause}"
	}
	return
}
!=::Volume_Up     ; Assigns "Volume_Up" to "Alt"+"=".
!-::Volume_Down   ; Assigns "Volume_Down" to "Alt"+"-".
!0::Volume_Mute   ; Assigns "Volume_Mute" to "Alt"+"0".




/*
************************************************************************************************
keymap Known Issues:
F1 - Issues with Hyper-V. See keymap15.ahk for more details, and a workaround.



keymap Version History:
16.00 - First version of keymap for AHK2.0.
      - All functions removed.
	  - New icon.
      - F1: Recreated the Windows Calculator hotkey from keymap15 (F1).
      - F2: Recreated the "move to next window" shortcut from keymap15 (F4).
	  - F3: Recreated the maximise/restore shortcut from keymap15 (F5).
	  - F4: Recreated the media playback shortcuts from keymap15 (F9).
************************************************************************************************
*/