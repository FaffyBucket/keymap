/*
*************************************************************************************************
* keymap                                                                                       	*
*                                                                                              	*
* Version:             19.01                                                                   	*
* AutoHotkey Version:  2.0                                                                     	*
* Language:            English                                                                 	*
* Platform:            Windows 10                                                              	*
* Author:              www.twitter.com/matthiew                                                	*
*                                                                                              	*
* Script Function:                                                                             	*
* 1. Maps "Num Lock" key to open/activate/close the Windows calculator app.                    	*
* 2. Maps "Win+Shift+Left" shortcut to "Alt+`" so that moving a window to the next       		*
*    monitor can be done with just the left hand.                                              	*
* 3. Maps "Win+`" to maximise/restore the current window with just the left hand.            	*
* 4. Media playback shortcuts which can be used consistenly with any keyboard:                 	*
*    Assigns "Media_Next" to "Alt+.".                                                        	*
*    Assigns "Media_Prev" to "Alt+,".                                                        	*
*    Assigns "Media_Play_Pause" to "Alt+/".                                                		*
*    Assigns "Volume_Up" to "Alt+=".                                                         	*
*    Assigns "Volume_Down" to "Alt+-".                                                       	*
*    Assigns "Volume_Mute" to "Alt+0".                                                       	*
* 5. Maps "Ctrl+Alt+Shift+Del" to restart Explorer											    *
* 6. Text expansion.                                                                            *
* 7. Maps "Ctrl+`" to set/unset the active window as always on top.								*
* 8. Maps "Ctrl+Alt+`" to set/unset 50% transparency on the active window.						*
*************************************************************************************************
*/




#Requires AutoHotkey v2.0
#SingleInstance Force
SetTitleMatchMode 3
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
		Sleep 400
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




; 4. Media playback shortcuts which can be used consistenly with any keyboard

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




; 5. Restart Explorer with Ctrl+Alt+Shift+Del

^!+Del::
{
	ProcessClose "explorer.exe"
	return
}




; 6. Text expansion

::@ma::matthiew.marks@realtyassist.com.au
::@mm::mmarks@realtyassist.com.au
::@ra::@realtyassist.com.au
::admini::administrator
::atm::at the moment
::btww::by the way
::gfx::graphics card
::hddd::hard drive
::mins::minutes
::mss::Microsoft
::pcc::computer
::rra::RealtyAssist
::rn::right now
::secs::seconds




; 7. Always on top toggle - Ctrl+`

^`::
{
	WinSetAlwaysOnTop -1, "A"
	return
}




; 8. Transparency toggle - Ctrl+Alt+`

^!`::
{
	WinSetTransparent(WinGetTransparent('A') ? "" : 50, 'A')
}




/*
************************************************************************************************
keymap Known Issues:
F1 - Issues with Hyper-V. See keymap15.ahk for more details, and a workaround.



keymap Version History:
19.01 - Updated F1: Set title match mode to exactly match. This will now ignore other windows
	  - with "Calculator" in the title.
19.00 - Added F7: Recreated the "always on top" shortcut from keymap15.	
	  - Added F8: Recreated the transparency shortcut from keymap15.
18.00 - Added F6: Text expansion.
17.02 - F1: Increased sleep time to reduce errors detecting the Calculator window.
17.01 - F1: Increased sleep time to reduce errors detecting the Calculator window.
17.00 - Added F5: Recreated the Restart Explorer hotkey from keymap15 (F13).
16.01 - Updated documentation.
16.00 - First version of keymap for AHK2.0.
      - All functions removed.
	  - New icon.
      - F1: Recreated the Windows Calculator hotkey from keymap15 (F1).
      - F2: Recreated the "move to next window" shortcut from keymap15 (F4).
	  - F3: Recreated the maximise/restore shortcut from keymap15 (F5).
	  - F4: Recreated the media playback shortcuts from keymap15 (F9).
************************************************************************************************
*/