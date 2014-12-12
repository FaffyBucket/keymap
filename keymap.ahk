/*
************************************************************************************************
* keymap                                                                                       *
*                                                                                              *
* Version:             9.2 (version history at the bottom of this script)                      *
* AutoHotkey Version:  1.1                                                                     *
* Language:            English                                                                 *
* Platform:            7, 8                                                                    *
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


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, K.ico


AppsKey::AppsKey




; 1. Maps Num Lock key to open/activate/close calc.exe

SetNumLockState, AlwaysOn
NumLock::
	SetNumLockState, AlwaysOn
	IfWinNotExist, ahk_exe vmconnect.exe
		{
		#MaxHotkeysPerInterval 70
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
		}
	else
		#MaxHotkeysPerInterval 2000
		IfWinActive, ahk_exe vmconnect.exe
			{
;			Do nothing while Hyper-V Virtual Machine Connection is active because
;			it will send hundreds of Num Lock key presses.
			}
	return




; 2. Maps Pause Break key to open/close optical disc drive.

;Drive, Label, A:, ADrive
;Drive, Label, B:, BDrive

;Pause::
;	Drive, Eject, ADrive
;	if A_TimeSinceThisHotkey < 1000
;		Drive, Eject, ADrive, 1
;	Drive, Eject
;	if A_TimeSinceThisHotkey < 1000
;		Drive, Eject, Drive, 1
;	return
;+Pause::
;	Drive, Eject, BDrive
;	if A_TimeSinceThisHotkey < 1000
;		Drive, Eject, BDrive, 1
;	return




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
!/::Media_Play_Pause    ; Assigns "Media_Play_Pause" to "Alt"+"/".
!=::Volume_Up    ; Assigns "Volume_Up" to "Alt"+"=".
!-::Volume_Down    ; Assigns "Volume_Down" to "Alt"+"-".
!0::Volume_Mute    ; Assigns "Volume_Mute" to "Alt"+"0".




/*
************************************************************************************************
keymap version history:
9.2 - Updated Function 8 to resolve a conflict with Firefox's built-in autocomplete.
    - Removed Windows Vista as a supported platform. It probably works, but is no longer used.
9.1 - Updated Function 1.
9.0 - Added media key shortcuts.
************************************************************************************************
*/