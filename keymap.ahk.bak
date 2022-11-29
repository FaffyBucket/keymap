/*
************************************************************************************************
* keymap                                                                                       *
*                                                                                              *
* Version:             15.07 (version history at the bottom of this script)                    *
* AutoHotkey Version:  1.1                                                                     *
* Language:            English                                                                 *
* Platform:            Windows 10                                                              *
* Author:              www.twitter.com/matthiew                                                *
*                                                                                              *
* Script Function:                                                                             *
* 1. Maps "Num Lock" key to open/activate/close calc.exe.                                      *
* 2. Maps "Pause Break" key to open/close optical disc drive.                                  *
* 3. Maps "Scroll Lock" key to switch playback device between first and second device in the   *
*    list (for Windows 7+).                                                                    *
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
* 10. Text expansion.                                                                          *
* 11. "Ctrl"+"Alt"+"F1" runs Windowed Game Control											   *
* 12. Maps "Ctrl"+"`" to set/unset the active window as always on top.                         *
* 13. Maps "Alt"+"Ctrl"+"Shift"+"Del" to restart Explorer.                                     *
************************************************************************************************
*/

if not A_IsAdmin
{
	Run *RunAs "%A_AhkPath%" keymap.ahk
	ExitApp
}


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, K.ico

#SingleInstance Force




toggle = 0




AppsKey::AppsKey




; 1. Maps Num Lock key to open/activate/close Calculator.exe

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
		Run calculator://
;		Run calc
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




/* Ended Function 3
************************************************************************************************
; 3. Maps Scroll lock key to switch playback device using PowerShell and AudioDeviceCmdlets.dll.

ScrollLock::
	if (toggle = 0)
	{
		Run, Powershell Set-AudioDevice -Index 1
		toggle = 1
	}
	else if (toggle = 1)
	{
		Run, Powershell Set-AudioDevice -Index 2
		toggle = 0
	}
	return
/*
/* Legacy Function 3
***********************************************************************************************
; 3. Maps Scroll lock key to switch playback device between second and third device in the list
;    (for Windows 7+).

ScrollLock::
	Run, mmsys.cpl
	WinWaitActive,Sound
	ControlSend,SysListView321,{Down 2}
	ControlGet, isEnabled, Enabled,,&Set Default
	if(!isEnabled)
	{
		ControlSend,SysListView321,{Down 3}
	}
	ControlClick,&Set Default
	Sleep, 500
	ControlClick,OK
	return
***********************************************************************************************
*/




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




; 9. Media shortcuts for keyboards that don't have media keys.

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




; 10. Text expansion

::admini::administrator
::atm::at the moment
:*:avv::AV set up complete
::btww::by the way
::fmp::FollowMePrint
::gfx::graphics card
::hddd::hard drive
:*:iff::If your maps app takes you to Cambridge St instead of Salvado Rd, you need to turn left at the lights, and left again at the next lights.
::mins::minutes
::mss::Microsoft
::pcc::computer
:*:rcc::Rollover complete
::rn::right now
:*:sbb::Surface Book
:*:sb2::Surface Book 2
:*:sb3::Surface Book 3
:*:seqta::SEQTA
:*:sgg::Surface Go
:*:sg2::Surface Go 2
:*:sg3::Surface Go 3
:*:sll::Surface Laptop
:*:sl2::Surface Laptop 2
:*:sl3::Surface Laptop 3
::secs::seconds
::sp3::Surface Pro 3
:*:sp4::Surface Pro 4
:*:sp5::Surface Pro 5
:*:sp6::Surface Pro 6
:*:zhh::
(
Helpdesk job:    Organisers:
Technician: matthiew

Request details:

)
:*:zjj::
(


Your account has not been hacked. They are trying to con you. Please report the messages by doing the following:
Right-click on the message.
Select Junk.
Select Report as Phishing.
Kind regards,

matthiew
)
:*:zrr::Password reset
:*:zuu::Upgrade complete




; 11. Launch Windowed Game Control with Ctrl+Shift+F1

^+F1::
	Run "D:\Install Files\AutoHotkey\Windowed-Game-Control\Windowed Game Control.ahk"
	return




; 12. Toggle Always On Top with Ctrl+`

^`::
	Winset, Alwaysontop, , A
	return




; 13. Restart Explorer with Ctrl+Alt+Shift+Del

^!+Del::
	Process, Close, explorer.exe
	return




; 14. Transparency toggle with Ctrl+Alt+`

^!`::
	if (toggle = 0)
	{
		WinSet, Transparent, 127, A
		toggle = 1
	}
	else if (toggle = 1)
	{
		WinSet, Transparent, 255, A
		toggle = 0
	}
	return




/*
************************************************************************************************
keymap Known Issues:



keymap Version History:
15.07 - F10: Added "iff".
15.06 - F10: Added SG3 text expansion.
15.04 - F11: Changed shortcut to Ctrl+Shift+F1.
15.04 - F10: Adjusted "Surface Pro 3" text expansion.
15.03 - F10: Added multiple text expansions for Surface devices.
15.02 - F14: Changed transparency level to 127.
15.01 - Added returns to functions that were missing them, to prevent muliple functions being
		triggered.
15.00 - Added Function 14: Transparency toggle.
14.00 - Removed Function 3.
13.05 - F3: Updated because Windows changed the order again.
13.04 - Updated Function 3 because Windows Update changed the order.
13.03 - F1: Updated to launch calculator://
13.02 - F13: Added Function 13.
	  - Corrected version counting.
13.01 - F12: Fixed error with mapping.
13.00 - Maps "Ctrl"+"`" to set/unset the active window as always on top.
12.02 - F10: Added "seqta".
12.01 - F10: Edited grammar.
12.00 - F3: Recreated Function 3 using PowerShell and AudioDeviceCmdlets.dll.
11.30 - F3: Modified which sound devices to switch bewteen.
11.29 - F10: Added "sp6".
11.28 - F10: Added "sl2".
11.27 - F10: Added "mss".
11.26 - F11: Updated shortcut to Windowed Game Control.
11.25 - F1: Updated to run calc again.
11.24 - F10: Added "zjj".
11.23 - F10: Added "sp5".
11.22 - F10: Added "sb2".
11.21 - F10: Added "sll".
11.20 - F10: Changed "hdd" to "hddd".
11.19 - F10: Updated "pc" for compatibility with Firefox.
11.18 - F10: Changed "btw" to "btww".
11.17 - F10: Updated "sbb".
11.16 - F10: Changed "sb" to "sbb".
11.15 - F1: Updated to launch Calculator.exe (Win 10) instead of calc.exe (legacy).
11.14 - F10: Added "sp4".
11.13 - F10: Changed "rrr" shortcut to "zrr"; Changed "zzz" shortcut to "zhh".
11.12 - F10: Updated "Rollover complete." and "Upgrade complete." text expansion.
11.11 - F10: Added "rcc" and "uuu" text expansion.
11.10 - Updated Function 10.
11.9 - Updated Function 1 to run calc again.
11.8 - Updated Function 10.
11.7 - Added 500ms pause to Function 3 so the change is clearly visible.
11.6 - Updated Function 1 to run calc1.
	 - Updated Function 10.
11.5 - Re-enabled Function 3.
11.4 - Updated Function 10.
11.3 - Updated Function 10.
11.2 - Updated Function 10.
11.1 - Added to Function 10.
11.0 - Added Function 11.
10.6 - Added to Function 10.
10.5 - Added to Function 10.
10.4 - Added to Function 10.
10.3 - Added to Function 10.
10.2 - Updated Function 10.
10.1 - Added to Function 10.
10.0 - Added Function 10.
9.9.07 - Returned run as Administrator section. Those changes in 9.9.05 don't work.
9.9.06 - Updated documentation.
9.9.05 - Removed run as Administrator. I'm not sure why I put that in, and it should be set in
		 the shortcut to avoid UAC prompts.
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