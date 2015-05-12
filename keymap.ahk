/*
************************************************************************************************
* keymap                                                                                       *
*                                                                                              *
* Version:             9.9.05 (version history at the bottom of this script)                   *
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

/* if not A_IsAdmin
 * {
 * 	Run *RunAs "%A_AhkPath%" keymap.ahk
 * 	ExitApp
 * }
 */

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, K.ico

#SingleInstance Force




AppsKey::AppsKey




; 1. Maps Num Lock key to open/activate/close calc.exe

SetNumLockState, AlwaysOn
NumLock::
	IfWinExist, ahk_exe vmconnect.exe
	{
		Run, Reload.ahk
		ExitApp
	}
	#MaxHotkeysPerInterval 70
	SetNumLockState, AlwaysOn
	IfWinExist, Calculator
		{
		IfWinActive, Calculator
			{
			WinClose, Calculator
			}
		else
			{
			WinActivate, Calculator
			}
		}
	else
		{
		Run calc
		WinActivate, Calculator
		}		
	return




; 2. Maps Pause Break key to open/close optical disc drive.

Pause::
	Drive, Eject
	if A_TimeSinceThisHotkey < 1000
		Drive, Eject, , 1
	return
	
/* For multiple optical drives
*****************************************
Drive, Label, A:, ADrive
Drive, Label, B:, BDrive

Pause::
	Drive, Eject, ADrive
	if A_TimeSinceThisHotkey < 1000
		Drive, Eject, ADrive, 1

+Pause::
	Drive, Eject, BDrive
	if A_TimeSinceThisHotkey < 1000
		Drive, Eject, BDrive, 1
	return
*****************************************
*/




; 3. Maps Scroll lock key to switch playback device between first and second device in the list
;    (for Windows 7).

;ScrollLock::
;	Run, mmsys.cpl
;	WinWaitActive,Sound
;	ControlSend,SysListView321,{Down}
;	ControlGet, isEnabled, Enabled,,&Set Default
;	if(!isEnabled)
;	{
;		ControlSend,SysListView321,{Down}
;		ControlSend,SysListView321,{Down 2}
;	}
;	ControlClick,&Set Default
;	ControlClick,OK
;	return




; 4. Maps Win+Shift+Left shortcut to Alt+` so that moving a window to the next monitor can be
;    done with just the left hand. The Win+Shift+Left shortcut was introduced in Windows 7, so
;    this won't work in previous versions.

!`::
	Send #+{Left}
	return




; 5. Maps Win+` to maximise/restore the current window with just the left hand.

#`::
	WinGet, isMax, MinMax, A
	if isMax
		WinRestore, A
	else
		WinMaximize, A
	return




; 6. For laptops that don't have an RWin key. Assigns Win+L to AppsKey+L to make it easier to
;    lock Windows with one hand.

AppsKey & L::
	DllCall("LockWorkStation")
	return
	
	
	
	
; 7. For laptops that don't have an RWin key. Assigns RWin to AppsKey+Ctrl for right-handed use.

AppsKey & Ctrl::
	Send {RWin}
	return
	
	
	

; 8. Maps Ctrl+Shift+/ to autocomplete URLs that end with ".com.au".

^+/::
	Send {Delete}
	Send ^a
	Send ^x
	Send www.^v.com.au
	Send {Enter}
	return
	
	
	

; 9. For keyboards that don't have media keys.

!.::Media_Next    ; Assigns "Media_Next" to "Alt"+".".
!,::Media_Prev    ; Assigns "Media_Prev" to "Alt"+",".
!/::    		  ; Assigns "Media_Play_Pause" to "Alt"+"/".
    IfWinActive, ahk_exe explorer.exe
    {
        ;Run MediaPlayPause.exe
        Run MediaPlayPause.ahk
    }
    else
    {
        Send {Media_Play_Pause}
    }
    return

!=::Volume_Up     ; Assigns "Volume_Up" to "Alt"+"=".
!-::Volume_Down   ; Assigns "Volume_Down" to "Alt"+"-".
!0::Volume_Mute   ; Assigns "Volume_Mute" to "Alt"+"0".




/*
************************************************************************************************
keymap Known Issues:



keymap Version History:
9.9.05 - Removed run as Administrator. I'm not sure why I put that in, and it should be set in
		 the launcher.
	   - Updated Singleinstance. Added Force.
9.9.04 - Updated Function 1 to improve compatibility with vmconnect.
9.9.03 - Updated Function 2 to increase compatibility with any optical drive.
	   - Updated MediaPlayPause.ahk.
9.9.02 - Adjusted Function 1 to improve compatibility with vmconnect.
9.9.01 - Run with elevated permissions.
	   - Function 1: Increased #MaxHotkeysPerInterval to 3000.
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