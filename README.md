/*
************************************************************************************************
* keymap                                                                                       *
*                                                                                              *
* Version:             9.9 (version history at the bottom of this script)                      *
* AutoHotkey Version:  1.1                                                                     *
* Language:            English                                                                 *
* Platform:            Windows 7, 8                                                            *
* Author:              www.twitter.com/matthiew                                                *
*                                                                                              *
* Script Function:                                                                             *
* 1. Maps "Num Lock" key to open/activate/close calc.exe.                                      *
* 2. Maps "Pause Break" key to open/close optical disc drive.                                  *
* 3. Maps "Scroll Lock" key to switch playback device between first and second device in the   *
*    list (for Windows 7).                                                                     *
* 4. Maps "Win"+"Shift"+"Left" shortcut to "Alt"+"`" so that moving a window to the next       *
*    monitor can be done with just the left hand.                                              *
* 5. Maps "Win"+"`" to maximise/restore the current window with just the left hand.            *
* 6. For laptops that don't have an "RWin" key. Assigns "Win"+"L" to "AppsKey"+"L" to make it  *
*    easier to lock Windows with one hand.                                                     *
* 7. For laptops that don't have an "RWin" key. Assigns "RWin" to "AppsKey"+"Ctrl"             *
*    for right-handed use.                                                                     *
* 8. Maps "Ctrl"+"Shift"+"/" to autocomplete URLs that end with ".com.au".                     *
* 9. For keyboards that don't have media keys.                                                 *
*    Assigns "Media_Next" to "Alt"+".".                                                        *
*    Assigns "Media_Prev" to "Alt"+",".                                                        *
*    Assigns "Media_Play_Pause" to "Alt"+"/".                                                  *
*    Assigns "Volume_Up" to "Alt"+"=".                                                         *
*    Assigns "Volume_Down" to "Alt"+"-".                                                       *
*    Assigns "Volume_Mute" to "Alt"+"0".                                                       *
************************************************************************************************
*/




/*
************************************************************************************************
keymap Known Issues:
Function 9 - When a Windows Explorer window is active, and an icon is selected, the
             Media_Play_Pause command doesn't work. Seems to be a bug in AHK, not this script.
			 Noticed in Windows 8.1 Enterprise x64.


keymap Version History:
9.9 - Added #SingleInstance.
9.8 - Re-enabled Function 2.
9.7 - Imported new versions of AltMediaControl and MediaPlayPause for Function 9.
	- Removed duplicate image file.
	- Corrected some file names.
	- Updated documentation.
9.6 - Updated documentation.
9.5 - Updated Function 9 to workaround a problem with the Media_Play_Pause command and Explorer.
    - Added MediaPlayPause.ahk for the new workaround in Function 9.
9.4 - Reorganised file struction. Created new, optimised "A icon.psd"
9.3 - Added known issues.
    - Added TO DO.
9.2 - Updated Function 8 to resolve a conflict with Firefox's built-in autocomplete.
    - Removed Windows Vista as a supported platform. It probably works, but is no longer used.
9.1 - Updated Function 1.
9.0 - Added media key shortcuts.
************************************************************************************************
*/