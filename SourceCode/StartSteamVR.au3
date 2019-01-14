#include <File.au3>
#include <Misc.au3>


Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $WindowName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")

_Start_Home_APP()

_Exit()

Func _Start_Home_APP()
	If ProcessExists("cefclient.exe") Then
		While ProcessExists("cefclient.exe")
			WinClose("cefclient.exe")
			If ProcessExists("cefclient.exe") Then ProcessClose("cefclient.exe")
		WEnd
	EndIf
	If Not ProcessExists("vrmonitor.exe") Then ShellExecute("steam://rungameid/250820")
	Sleep(1000)
	If $WindowName <> "SteamVR Home" Then ShellExecute($Home_Path)
EndFunc


Func _Exit()
	Exit
EndFunc

