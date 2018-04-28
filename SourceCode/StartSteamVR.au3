#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Compile_Icons\Play_Starten.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <Misc.au3>

$dll_1 = DllOpen("xinput9_1_0.dll")
$dll_2 = DllOpen("user32.dll")

Opt("GUIOnEventMode", 1)

Global $Config_INI = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $WindowName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")

_Start_Home_APP()

_Exit()



Func _Start_Home_APP()
	If Not ProcessExists("vrmonitor.exe") Then ShellExecute("steam://rungameid/250820")
	Sleep(1000)
	If $WindowName <> "SteamVR Home" Then ShellExecute($Home_Path)

EndFunc


Func _Exit()
	DllClose($dll_1)
	DllClose($dll_2)
	Exit
EndFunc

