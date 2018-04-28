#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Compile_Icons\InfoWindow.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#RequireAdmin
#include <GuiToolbar.au3>
#include <GuiButton.au3>
#include <FontConstants.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <EventLog.au3>
#include <GuiEdit.au3>
#include <buttonconstants.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>
#include <File.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GuiHeader.au3>
#include <GuiTreeView.au3>
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <StaticConstants.au3>
#include <EditConstants.au3>
#include <ListViewConstants.au3>
#include <TabConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstants.au3>
#include <GDIPlus.au3>
#include <Inet.au3>

#include <IE.au3>
#include <MsgBoxConstants.au3>

#include <GuiSlider.au3>




Opt("GUIOnEventMode", 1)

#Region Set Global
Global $GUI_Loading, $GUI_Loading_2, $AddGame2Library_GUI, $Settings_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $iStylesEx, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group, $Playlist_GUI, $POS_X_PlaylistButton, $WebPage_Title
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item6, $RM_Item7,$RM_Item8,$RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12
Global $Checkbox_Add_break, $Combo_Add_break
Global $Array_tools_vrmanifest_File, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows
Global $WMR_Keyname
#endregion

Global $font = "arial"
Global $font_arial = "arial"

#Region Declare Variables/Const 1
Global $Version = "2.0"
Global $config_ini = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $Install_Web_DIR = @ScriptDir & "\Webpage\"
Global $Local_StartPage = $Install_Web_DIR & "StartPage.html"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $Install_DIR & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPageTemp.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
Global $StartPage_DIR = "steamapps\common\VRToolbox\utils\"
Global $Toolbox_Check = "steamapps\common\VRToolbox\bin\VRToolbox.exe"
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")

Global $gfx = @ScriptDir & "\" & "gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath") & "\"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")


Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
Global $Steam_tools_local_backup = $Install_DIR & "Backups\tools.vrmanifest.bak"

Global $OS_Version = @OSVersion
Global $OS_Build = @OSBuild

IniWrite($config_ini, "Settings", "Version", $Version)

_First_Start_Empty_Check_1()

#EndRegion


If $First_Start = "true" Then
	MsgBox($MB_ICONWARNING, "Welcome to the Steam Shortcuts Loader for VR Toolbox.", '                     Steam Shortcuts Loader for VRToolbox     ' & @CRLF & @CRLF & _
								'This is a simplified version of Home Loader, by CogentRifter:  https://github.com/CogentHub/HomeLoader' & @CRLF & @CRLF & _
								"This Utility can create web pages of shortcuts to your Steam Games, allowing you to organize and launch your games from within VR Toolbox, WindowsMR -if you're meet the specs, or from any desktop browser. " & @CRLF & _
								'*Note that it will pick up your 2d games as well.  Remove them by right clicking and delete.' & @CRLF & @CRLF & _
								'You can also change your SteamVR Home to VRToolbox, Virtual Desktop or Bigscreen beta.' & @CRLF & @CRLF & _
								"If you're using VRToolbox, you can make individual shortcut pages that you can attach to objects like TV's and Picture Frames to create Custom GameLaunch Objects." & @CRLF & @CRLF & _
								'To start, click "Scan Steam Libraries" to scan your games into the Library.  Click it anytime you get new games to add them to the list.' & @CRLF & @CRLF & _
								'Click "Set Steam Folders" to add additional Steam Library folders.  If you changed the default installation path for Steam, you can change it here as well.' & @CRLF & @CRLF & _
								'For more information, press the "Instructions" button.')


IniWrite($Config_INI, "Settings", "First_Start", "False")
	If Not FileExists($Steam_tools_local_backup) Then
		FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_local_backup)
	EndIf

$First_Start = False


EndIf



#region Declare Names
$TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
$TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
$TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Steam Library"
If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam_Appl"
If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"
#endregion


#region Create GUI
If $First_Start <> "True" Then
	Local $hGUI, $hGraphic, $hPen
	Local $GUI, $aSize, $aStrings[5]
	Local $btn, $chk, $rdo, $Msg
	Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	Local $DesktopWidth = "840"
	Local $DesktopHeight = @DesktopHeight - 185

	; Creating the GUI
	$GUI = GUICreate("Steam Games Library", 1010, $DesktopHeight, 4, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; PROGRESS
	Global $Display_Progressbar_2 = GUICtrlCreateProgress(0, 864, $DesktopWidth + 170, 5)
	Global $Display_Progressbar = GUICtrlCreateProgress(0, 857, $DesktopWidth + 5, 5)

	;Status Bar $Display Statusbar
	Global $Statusbar = _GUICtrlStatusBar_Create($GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'Version " & $Version & "'")

	GUISetState()



	; Toolbar above
	GUICtrlCreateLabel("Games Library", 260, 5, 350, 38)
	GUICtrlSetFont(-1, 24, 600, 7, "arial")

	Global $Combo_SteamLibrary = GUICtrlCreateCombo("", 310, 50, 155, 25, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "ALL|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", $Steam_Library)
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Set Library to be Displayed")

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 15, 5, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GuiCtrlSetTip(-1, "Add  a non-Steam game to the Games Library." & @CRLF)

	Global $TVCuts_Page = GUICtrlCreateButton("TVCuts Page", 125, 5, 127, 45, $BS_BITMAP)
	_GUICtrlButton_SetImage($TVCuts_Page, $gfx & "Create_TVCuts.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Creates a Page of Individual Shortcuts to be used" & @CRLF & _
					  'with objects to create "Object Shortcuts."' & @CRLF & _
					  'See "Instructions" for more detail.')

Global $Instructions = GUICtrlCreateButton("Instructions", 125, 55, 125, 29)
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GUICtrlSetColor(-1, $COLOR_RED)
	GuiCtrlSetTip(-1, "Instructions -click me-")

	GUICtrlCreateGroup("         Use Once", 488, 5, 115, 80, $WS_THICKFRAME)
	Global $TextWMR = GUICtrlCreateLabel(" To enable Shortcuts", 494, 25, 100)
	Global $TextWMR1 = GUICtrlCreateLabel("  in Edge while in VR", 494, 40, 100)
;	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")

	Global $Button_WindowsMR = GUICtrlCreateButton("WindowsMR", 494, 56, 102, 24, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_WindowsMR, $gfx & "WIndowsMR.bmp")
	GuiCtrlSetTip(-1, "This will only work on the Spring 2018 build of Windows10, or above." & @CRLF & _
						'This will check to see if your version of Windows is current enough.' & @CRLF & _
						'Note that you need to have started this program with Admin rights' & @CRLF & _
						'     in order to actually write the needed Registry Key.' & @CRLF & _
						'               See "Instructions" for more detail.')

	GUICtrlCreateGroup("         Use Once", 609, 5, 125, 108, $WS_THICKFRAME)
;	GUICtrlSetFont(-1, 16, 600, 4, "Times New Roman")

	Global $TextToAccess = GUICtrlCreateLabel(" To access your new", 618, 22, 100)
	;GUICtrlSetFont(-1, 8)
	Global $TextGamePages = GUICtrlCreateLabel("      GamePages in", 618, 37, 100)
	Global $TextVRToolbox = GUICtrlCreateLabel("    VRToolbox, click", 618, 52, 100)
;	GUICtrlSetFont(-1, 12)

	Global $TextGamePages1 = GUICtrlCreateLabel("      GamePages", 618, 35, 100)
	Global $TextAndMore = GUICtrlCreateLabel("    and more, click", 618, 50, 100)


;	Global $Button_LightPage = GUICtrlCreateButton("Create StartPage", 616, 27, 112, 39, $BS_BITMAP)
;	_GUICtrlButton_SetImage($Button_LightPage, $gfx & "Create_StartPage.bmp")
;	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
;	GuiCtrlSetTip(-1, "This creates a new StartPage for VRToolbox,' & @CRLF & _




	Global $Button_Change_StartPage = GUICtrlCreateButton("Change StartPage", 616, 67, 112, 39, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Change_StartPage, $gfx & "Change_StartPage.bmp")
	GuiCtrlSetTip(-1, "This replaces the StartPage in VRToolbox," & @CRLF & _
						'providing access to your new Game Pages.' & @CRLF & _
						'See "Instructions" for more detail.')

Global $Button_Create_MasterPage = GUICtrlCreateButton("Create MasterPage", 616, 67, 112, 39, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_MasterPage, $gfx & "Create_MasterPage.bmp")
	GuiCtrlSetTip(-1, "This Creates a 'MasterPage' that has links," & @CRLF & _
						'to your new Game Pages and more.' & @CRLF & _
						'See "Instructions" for more detail.')

	GUICtrlCreateGroup("SteamVRHome", 737, 5, 108, 108, $WS_THICKFRAME)
;	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlSetFont(-1, 11, 400, 0, "Times New Roman")

		Global $_Radio_1 = GUICtrlCreateRadio("SteamVR", 745, 25, 75, 20) ; SteamVR Home
		GuiCtrlSetTip(-1, "Sets the default SteamVR Home App.")
		If $WinName = "SteamVR Home" Then GUICtrlSetState($_Radio_1, $GUI_CHECKED)
		GUICtrlSetOnEvent($_Radio_1, "_Radio_1")

		Global $_Radio_2 = GUICtrlCreateRadio("VR Toolbox", 745, 45, 75, 20) ; VR Toolbox
		GuiCtrlSetTip(-1, "Sets VR Toolbox as the SteamVR Home App.")
		If $WinName = "VR Toolbox" Then GUICtrlSetState($_Radio_2, $GUI_CHECKED)
		GUICtrlSetOnEvent($_Radio_2, "_Radio_2")

		Global $_Radio_3 = GUICtrlCreateRadio("Virtual Desktop", 745, 65, 90, 20) ; Virtual Desktop
		GuiCtrlSetTip(-1, "Sets Virtual Desktop as the SteamVR Home App.")
		If $WinName = "Virtual Desktop" Then GUICtrlSetState($_Radio_3, $GUI_CHECKED)
		GUICtrlSetOnEvent($_Radio_3, "_Radio_3")

		Global $_Radio_4 = GUICtrlCreateRadio("BigScreen", 745, 85, 86, 20) ; Big Screen
		GuiCtrlSetTip(-1, "Sets BigScreen beta as the SteamVR Home App.")
		If $WinName = "BigScreen" Then GUICtrlSetState($_Radio_4, $GUI_CHECKED)
		GUICtrlSetOnEvent($_Radio_4, "_Radio_4")

;		Global $_Radio_5 = GUICtrlCreateRadio("JanusVR", 745, 89, 86, 20) ; JanusVR
;		GuiCtrlSetTip(-1, "Sets JanusVR as the SteamVR Home App.")
;		If $WinName = "Big Screen" Then GUICtrlSetState($_Radio_5, $GUI_CHECKED)
;		GUICtrlSetOnEvent($_Radio_5, "_Radio_5")



	; Toolbar below







;  SideBar



GUICtrlCreateGroup("Steam Library Setup" , 848, 5, 159, 262, $WS_THICKFRAME)
GUICtrlSetFont(-1, 11, 600, 0,"Times New Roman")


	Global $Button_Settings = GUICtrlCreateButton("Set Steam Folders", 856, 35, 144, 105, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Settings, $gfx & "Set_Steam_Folders.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Set Steam Library Folders" & @CRLF & _
					'Click this when you run the program for the first time or' & @CRLF & _
					'whenever you add a new Drive or Directory to your Steam Library')

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Steam Library", 856, 153, 144, 105, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Scan Steam Libraries." & @CRLF & _
					'Click this when you run the program for the first time or' & @CRLF & _
					'whenever you add new Games to any of your Steam Libraries' & @CRLF)

	Global $Cover1 = GUICtrlCreatePic("gfx\Bite1.bmp", 853, 35, 149, 227)



GUICtrlCreateGroup("For EveryDay Usage", 848, 275, 159, 405, $WS_THICKFRAME)
GUICtrlSetFont(-1, 12, 600, 0, "Times New Roman")

  Local $All_Box = GUICtrlCreatePic($gfx & "all_box.bmp", 856, 302, 144, 200, $BS_BITMAP)
;  GUISetState(@SW_SHOW)

	$Checkbox_CreatePage = GUICtrlCreateLabel("", 898, 467, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 920, 466, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")


	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 877, 510, 115, 15, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Choose the Tab to add your selected games to")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	EndIf

	Global $Text2 = GUICtrlCreateLabel("#2", 855, 516, 18)
	GUICtrlSetFont(-1, 12)

	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 875, 542, 117, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	EndIf
	GuiCtrlSetTip(-1, "Add your selected games to your Custom TAB")

	Global $Text3 = GUICtrlCreateLabel("#3", 855, 552, 18)
	GUICtrlSetFont(-1, 12)


	Global $TextSelect = GUICtrlCreateLabel("Select your tab", 868, 578, 130)
	GUICtrlSetFont(-1, 14)

	Global $TextAnd = GUICtrlCreateLabel("and then", 890, 598, 100)
	GUICtrlSetFont(-1, 14)

	Global $TextClick = GUICtrlCreateLabel("click", 910, 618, 75)
	GUICtrlSetFont(-1, 14)

	Global $Text4 = GUICtrlCreateLabel("#4", 855, 623, 20)
	GUICtrlSetFont(-1, 12)

	Global $TextThen = GUICtrlCreateLabel("Then", 890, 555, 80, 40)
	GUICtrlSetFont(-1, 24)

	Global $Text2a = GUICtrlCreateLabel("#2", 855, 638, 20)
	GUICtrlSetFont(-1, 12)

	Global $Button_Create_GamePage = GUICtrlCreateButton("Create Game Page", 855, 640, 146, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_GamePage, $gfx & "Create_GamePage1.bmp")
	GuiCtrlSetTip(-1, "Create your Game Page!" & @CRLF & _
						"This will create a page of your selected games")

	Global $Button_Start_SteamVR = GUICtrlCreateButton("Start SteamVR", 858, 686, 140, 57, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Start_SteamVR, $gfx & "steamvr_logo.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Starts SteamVR")

	Global $Button_Master_Page = GUICtrlCreateButton("Open MasterPage", 857, 746, 140, 44, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Master_Page, $gfx & "MasterPage.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Open your MasterPage")


	Global $Button_Start_Page = GUICtrlCreateButton("Open StartPage", 857, 746, 140, 44, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Start_Page, $gfx & "StartPage.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Open your StartPage")



;	Global $Button_Restart = GUICtrlCreateButton("Restart", 858, 790, 65, 65, $BS_BITMAP) ;
;	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
;	GuiCtrlSetTip(-1, "Restart")

	Global $Button_Open_Page = GUICtrlCreateButton("OpenPage", 858, 792, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Open_Page, $gfx & "OpenPage.bmp")
	GuiCtrlSetTip(-1, "Open Game Page." & @CRLF & _
					'Note that pages created while SteamVR Home is set' & @CRLF & _
					'to VRToolbox will not work outside of VRToolbox')

	Global $Button_Exit = GUICtrlCreateButton("Exit", 932, 792, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GuiCtrlSetTip(-1, "Close")




	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 3, 90, 100)
	Global $ButtonTAB_Non_Steam_Appl = GUICtrlCreateButton($TAB2_Label, 103, 90, 100)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB3_Label, 203, 90, 100)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB4_Label, 303, 90, 100)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB5_Label, 403, 90, 100)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB6_Label, 503, 90, 100)


	If $ButtonTAB_State = "1" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
		GUICtrlSetState($Text2, $GUI_SHOW)
		GUICtrlSetState($Text3, $GUI_SHOW)
		GUICtrlSetState($TextSelect, $GUI_SHOW)
		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Text4, $GUI_SHOW)
		GUICtrlSetState($TextThen, $GUI_HIDE)
		GUICtrlSetState($Text2a, $GUI_HIDE)
		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Cover1, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "2" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Text2, $GUI_SHOW)
		GUICtrlSetState($Text3, $GUI_SHOW)
		GUICtrlSetState($TextSelect, $GUI_SHOW)
		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Text4, $GUI_SHOW)
		GUICtrlSetState($TextThen, $GUI_HIDE)
		GUICtrlSetState($Text2a, $GUI_HIDE)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "3" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Text2, $GUI_HIDE)
		GUICtrlSetState($Text3, $GUI_HIDE)
		GUICtrlSetState($TextSelect, $GUI_HIDE)
		GUICtrlSetState($TextAnd, $GUI_HIDE)
		GUICtrlSetState($TextClick, $GUI_HIDE)
		GUICtrlSetState($Text4, $GUI_HIDE)
		GUICtrlSetState($TextThen, $GUI_SHOW)
		GUICtrlSetState($Text2a, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "4" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Text2, $GUI_HIDE)
		GUICtrlSetState($Text3, $GUI_HIDE)
		GUICtrlSetState($TextSelect, $GUI_HIDE)
		GUICtrlSetState($TextAnd, $GUI_HIDE)
		GUICtrlSetState($TextClick, $GUI_HIDE)
		GUICtrlSetState($Text4, $GUI_HIDE)
		GUICtrlSetState($TextThen, $GUI_SHOW)
		GUICtrlSetState($Text2a, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "5" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Text2, $GUI_HIDE)
		GUICtrlSetState($Text3, $GUI_HIDE)
		GUICtrlSetState($TextSelect, $GUI_HIDE)
		GUICtrlSetState($TextAnd, $GUI_HIDE)
		GUICtrlSetState($TextClick, $GUI_HIDE)
		GUICtrlSetState($Text4, $GUI_HIDE)
		GUICtrlSetState($TextThen, $GUI_SHOW)
		GUICtrlSetState($Text2a, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "6" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Text2, $GUI_HIDE)
		GUICtrlSetState($Text3, $GUI_HIDE)
		GUICtrlSetState($TextSelect, $GUI_HIDE)
		GUICtrlSetState($TextAnd, $GUI_HIDE)
		GUICtrlSetState($TextClick, $GUI_HIDE)
		GUICtrlSetState($Text4, $GUI_HIDE)
		GUICtrlSetState($TextThen, $GUI_SHOW)
		GUICtrlSetState($Text2a, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf


	If $WinName = "VR Toolbox" Then
		GUICtrlSetState($TextGamePages, $GUI_SHOW)
		GUICtrlSetState($TextVRToolbox, $GUI_SHOW)
		GUICtrlSetState($Button_Change_StartPage, $GUI_SHOW)
		GUICtrlSetState($Button_Start_Page, $GUI_SHOW)
		GUICtrlSetState($TextGamePages1, $GUI_HIDE)
		GUICtrlSetState($TextAndMore, $GUI_HIDE)
		GUICtrlSetState($Button_Create_MasterPage, $GUI_HIDE)
		GUICtrlSetState($Button_Master_Page, $GUI_HIDE)

	Else
		GUICtrlSetState($TextGamePages, $GUI_HIDE)
		GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
		GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
		GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
		GUICtrlSetState($TextGamePages1, $GUI_SHOW)
		GUICtrlSetState($TextAndMore, $GUI_SHOW)
		GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
		GUICtrlSetState($Button_Master_Page, $GUI_SHOW)
	EndIf



	_Create_ListView_1()
	_Create_ListView_2()
	_Create_ListView_3()
	_Create_ListView_4()
	_Create_ListView_5()
	_Create_ListView_6()



	If $ButtonTAB_State = "1" Then GUICtrlSetState($listview, $GUI_SHOW)
	If $ButtonTAB_State = "2" Then GUICtrlSetState($listview_2, $GUI_SHOW)
	If $ButtonTAB_State = "3" Then GUICtrlSetState($listview_3, $GUI_SHOW)
	If $ButtonTAB_State = "4" Then GUICtrlSetState($listview_4, $GUI_SHOW)
	If $ButtonTAB_State = "5" Then GUICtrlSetState($listview_5, $GUI_SHOW)
	If $ButtonTAB_State = "6" Then GUICtrlSetState($listview_6, $GUI_SHOW)




	Global $POS_X_Label = 10000


#endregion

_Loading_GUI()



#Region Function Links

	GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
;	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Beenden")
	GUICtrlSetOnEvent($Button_Settings, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")

	GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")
	GUICtrlSetOnEvent($TVCuts_Page, "_TV_Cuts")
	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")
	GUICtrlSetOnEvent($Button_WindowsMR, "_WMR_Reg_Op")
	GUICtrlSetOnEvent($Instructions, "_Instructions")
	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2 , "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3 , "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4 , "_ButtonTAB_Custom_4")

;	GUICtrlSetOnEvent($Button_LightPage, "_Button_Create_GamePage_all")
	GUICtrlSetOnEvent($Button_Start_SteamVR, "_Button_Start_SteamVR")

	GUICtrlSetOnEvent($Button_Master_Page, "_Button_MasterPage")
 	GUICtrlSetOnEvent($Button_Start_Page, "_Button_StartPage")
	GUICtrlSetOnEvent($Button_Change_StartPage, "_Change_StartPage")
	GUICtrlSetOnEvent($Button_Create_MasterPage, "_Create_MasterPage")

	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")
	GUICtrlSetOnEvent($Button_Create_GamePage, "_Button_Create_GamePage_selected")
	GUICtrlSetOnEvent($Button_Open_Page, "_Open_Page")
	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")
;	GUICtrlSetOnEvent($Button_Start_VRToolbox, "_Button_Start_VRToolbox")

	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")

	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")


#endregion

	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	_Read_from_INI_ADD_2_ListView()

	Sleep(500)
	GUICtrlSetData($Display_Progressbar, 0)

	GUIRegisterMsg($WM_notify, "_ClickOnListView")
	;_Tab()
	GUIDelete($GUI_Loading)

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndIf


#Region While 1
While 1
	Sleep(100)
    Global $nMsg = GUIGetMsg()

    Switch $nMsg

        Case $GUI_EVENT_CLOSE
            Exit

	EndSwitch
WEnd
#endregion


#Region First Start And Empty Check

Func _First_Start_Empty_Check_1()
	Global $Install_Folder_Steam_Search_Folder

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	If $Install_Folder_Steam_1 = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')

		If $Install_Folder_Steam_Search_Folder <> "" Then
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Search_Folder & "\")
		Else
			MsgBox($MB_ICONINFORMATION, "Steam folder", "Steam folder was not found." & @CRLF & _
							"Choose the folder before continuing." & @CRLF)

			Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", $Install_Folder_Steam_Search_Folder & "\")
			If $FileSelectFolder <> "" Then
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct one will contain the File 'Steam.dll' and the 'SteamApps' folder.")
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
				_Restart()
			EndIf
		EndIf
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	EndIf


	If $default_vrsettings_File = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
		$default_vrsettings_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"

		If Not FileExists($default_vrsettings_File) Then
			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File & "\")
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				$default_vrsettings_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
			EndIf

			If Not FileExists($default_vrsettings_File) Then
				MsgBox($MB_ICONINFORMATION, "Default.vrsettings File", "Default.vrsettings File not found." & @CRLF & _
					"Choose the File before continuing." & @CRLF)

				Local $FileSelect = FileOpenDialog("Default.vrsettings File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
				If $FileSelect <> "" Then
					IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $FileSelect)
				Else
					MsgBox($MB_ICONWARNING, "Attention!", "Default.vrsettings File" & @CRLF & @CRLF & "Search the for the File and manually write the path in the config.ini file or try again.")
					IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
					_Restart()
				EndIf
			EndIf
		EndIf
	EndIf


	If $Steam_tools_vrmanifest_File = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
		$Steam_tools_vrmanifest_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
		$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"

		If Not FileExists($Steam_tools_vrmanifest_File) Then
			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
			EndIf

			If Not FileExists($Steam_tools_vrmanifest_File) Then
				MsgBox($MB_ICONINFORMATION, "Tools.vrmanifest File", "Tools.vrmanifest File not found." & @CRLF & _
					"Choose the File before continuing." & @CRLF)

				Local $FileSelect = FileOpenDialog("Tools.vrmanifest File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
				If $FileSelect <> "" Then
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $FileSelect)
				Else
					MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File" & @CRLF & @CRLF & "Search for the File and manually write the path in the config.ini file or try again.")
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
					_Restart()
				EndIf
			EndIf
		EndIf
	EndIf




EndFunc
#endregion



#Region  Functions



#Region Func Main

Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, ($DesktopWidth / 2) - 152, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Loading...", 66, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Loading...please wait...", "", $WINDOWS_ONTOP)
EndFunc




Func _Radio_1() ; SteamVR Home
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR Home")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	GUICtrlSetState($TextGamePages, $GUI_HIDE)
	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
	GUICtrlSetState($TextAndMore, $GUI_SHOW)
	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_2() ; VR Toolbox
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	MsgBox(48, "Warning", "Make sure that you switch back to SteamVR BEFORE" & @CRLF & _
						  'you move or delete the program!' & @CRLF & @CRLF & _
						  'Your original "tools.manifest" file has been saved to:' & @CRLF & _
						  'SteamVR\tools\tools.vrmanifest.bak')

	GUICtrlSetState($TextGamePages, $GUI_SHOW)
	GUICtrlSetState($TextVRToolbox, $GUI_SHOW)
	GUICtrlSetState($Button_Change_StartPage, $GUI_SHOW)
	GUICtrlSetState($Button_Start_Page, $GUI_SHOW)
	GUICtrlSetState($TextGamePages1, $GUI_HIDE)
	GUICtrlSetState($TextAndMore, $GUI_HIDE)
	GUICtrlSetState($Button_Create_MasterPage, $GUI_HIDE)
	GUICtrlSetState($Button_Master_Page, $GUI_HIDE)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_3() ; Virtual Desktop
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/382110")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Virtual Desktop")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	MsgBox(48, "Warning", "Make sure that you switch back to SteamVR BEFORE" & @CRLF & _
						  'you move or delete the program!' & @CRLF & @CRLF & _
						  'Your original "tools.manifest" file has been saved to:' & @CRLF & _
						  'SteamVR\tools\tools.vrmanifest.bak')

	GUICtrlSetState($TextGamePages, $GUI_HIDE)
	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
	GUICtrlSetState($TextAndMore, $GUI_SHOW)
	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_4() ; BigScreen
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/457550")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "BigScreen")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	MsgBox(48, "Warning", "Make sure that you switch back to SteamVR BEFORE" & @CRLF & _
						  'you move or delete the program!' & @CRLF & @CRLF & _
						  'Your original "tools.manifest" file has been saved to:' & @CRLF & _
						  'SteamVR\tools\tools.vrmanifest.bak')

	GUICtrlSetState($TextGamePages, $GUI_HIDE)
	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
	GUICtrlSetState($TextAndMore, $GUI_SHOW)
	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc


Func _Radio_5() ; Janus
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/602090")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "JanusVR")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")
	MsgBox(48, "Warning", "Make sure that you switch back to SteamVR BEFORE" & @CRLF & _
						  'you move or delete the program!' & @CRLF & _
						  'Your original "tools.manifest" file has been saved to:' & @CRLF & _
						  'SteamVR\tools\tools.vrmanifest.bak')

	_Change_SteamVR_Home_default()
EndFunc


Func _WMR_Reg_Op()

Local $TextKey1, $TextKey2, $ButtonOver, $ButtonDel, $WriteDelGUI, $TimerMsg, $RegWrite, $RegWrite2, $Holo_Proto_REG, $Holo_Proto_DEL, $tempholder

If StringInStr("Win_10", @OSVersion) Then

		If @OSBuild >= 17000 Then
			If IsAdmin() = True Then
				$RegWrite = MsgBox(4, "OSVersion", "Congratulations!"  & @CRLF & @CRLF & _
						'You have the Spring build of Windows or newer!' & @CRLF & @CRLF & _
						'Would you like to write the needed Registry Key?')
				If $RegWrite = 6 Then
					If @OSArch = "x64" Then
						$Holo_Proto_REG = "HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\SupportedProtocols\Steam"
						$Holo_Proto_DEL = "HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\SupportedProtocols"
					Else
						$Holo_Proto_REG = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\SupportedProtocols\Steam"
						$Holo_Proto_DEL = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Holographic\SupportedProtocols"
					EndIf

					RegRead($Holo_Proto_REG, "")
						If @Error > 0 Then
							RegWrite($Holo_Proto_REG)
							MsgBox(0, "KeyCheck", "The Registry Key has been written:" & @CRLF & @CRLF & _
										'Shortcuts should now work in Edge while in VR!')
						Else
 							$RegWrite2 = MsgBox(1, "KeyCheck", "Your Registry already has this Key" & @CRLF & @CRLF & _
											'Would you like to Delete it?')
							If $RegWrite2 = 1 Then
								RegDelete($Holo_Proto_DEL)
								MsgBox(0, "KeyCheck", "The Registry Key has been removed")
							Else
								MsgBox(0, "KeyCheck", "The Key existed: Registry action aborted by User")
							EndIf
						EndIf

				EndIf
			Else
				MsgBox(0, "Admin Check", "Congratulations! You have the Spring build of Windows or newer!" & @CRLF & @CRLF & _
							'Unfortunately, you need to be running SSLoader as Administrator in' & @CRLF & _
							'order to write the needed Registry Key.' & @CRLF & @CRLF & _
							'Close the program, then right click on "SSLoader.exe" and' & @CRLF & _
							'select "Run as Administrator".' & @CRLF & @CRLF & _
							'This is the only time this program will need to be run as Administrator' & @CRLF & _
							'and you only need to write the Key once.')
			EndIf
		Else
			MsgBox(0,"Sorry","Correct Operating System, but wrong Build.  You need the Windows10 Spring Build or newer." & @CRLF & _
					'You are running Ver: ' & @OSBuild & '   You need Ver 17xxx')
		EndIf
Else
		MsgBox(0, "Wrong OS", "Sorry, but you must be running Windows10")
EndIf

EndFunc




Func _Change_StartPage()

_Button_Create_GamePage_all()

If $Local_StartPage <> "" Then

Local $StartPage_DIR_Temp = ""
Local $StartPage_DIR_Temp_1 = ""
Local $StartPage_DIR_Temp_2 = ""
Local $StartPage_DIR_Temp_3 = ""
Local $StartPage_DIR_Temp_4 = ""
Local $Test_Box = ""
Local $testing = ""
Local $StartPage_BAK = ""
Local $StartPage_DIR_Full = ""
Local $StartPage_DIR_File = ""

$StartPage_DIR_Temp = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
$StartPage_DIR_Temp_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
$StartPage_DIR_Temp_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
$StartPage_DIR_Temp_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
$StartPage_DIR_Temp_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

$StartPage_DIR_Temp = $StartPage_DIR_Temp & $StartPage_DIR
$StartPage_DIR_Temp_1 = $StartPage_DIR_Temp_1 & $StartPage_DIR
$StartPage_DIR_Temp_2 = $StartPage_DIR_Temp_2 & $StartPage_DIR
$StartPage_DIR_Temp_3 = $StartPage_DIR_Temp_3 & $StartPage_DIR
$StartPage_DIR_Temp_4 = $StartPage_DIR_Temp_4 & $StartPage_DIR


$Test_Box = FileExists($StartPage_DIR_Temp)
$Test_Box_1 = FileExists($StartPage_DIR_Temp_1)
$Test_Box_2 = FileExists($StartPage_DIR_Temp_2)
$Test_Box_3 = FileExists($StartPage_DIR_Temp_3)
$Test_Box_4 = FileExists($StartPage_DIR_Temp_4)



	If $Test_Box Then
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", $StartPage_DIR_Temp)
	ElseIf $Test_Box_1 Then
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", $StartPage_DIR_Temp_1)
	ElseIf $Test_Box_2 Then
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", $StartPage_DIR_Temp_2)
	ElseIf $Test_Box_3 Then
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", $StartPage_DIR_Temp_3)
	ElseIf $Test_Box_4 Then
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", $StartPage_DIR_Temp_4)
	Else
		IniWrite($Config_INI, "Folders", "VRToolbox_utils_Folder", "")
	EndIf


$StartPage_DIR_Full = IniRead($Config_INI, "Folders", "VRToolbox_utils_Folder", "")
$StartPage_BAK = $StartPage_DIR_Full & "StartPage.BAK"
$StartPage_DIR_File = $StartPage_DIR_Full & "StartPage.html"


	If Not FileExists($StartPage_BAK) Then
		If $StartPage_DIR_File <> "" Then FileCopy($StartPage_DIR_File, $StartPage_BAK)
	EndIf

FileCopy($Local_StartPage, $StartPage_DIR_File, $FC_OVERWRITE)
	MsgBox(1, "Success", "File copied successfully.")
Else
	MsgBox(48, "Whoops!", "Something went wrong, file not created or changed!")
EndIf



EndFunc




Func _Change_SteamVR_Home_default()

	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	$Install_DIR_StringReplace = StringReplace($Install_DIR, '\', '/')
	$NewHomePath = StringTrimRight($Install_DIR_StringReplace, 1) & "/StartSteamVR.exe"
	_FileReadToArray($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File)

	If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
	FileDelete($Steam_tools_vrmanifest_File)

    For $LOOP_vrmanifest = 1 To $Array_tools_vrmanifest_File[0]
		$ReadLine_tools_vrmanifest = $Array_tools_vrmanifest_File[$LOOP_vrmanifest]
		If $ReadLine_tools_vrmanifest = '			"app_key": "openvr.tool.steamvr_environments",' Then
			Local $Line_NR_binary_path_windows = $LOOP_vrmanifest + 3
		EndIf

		If $LOOP_vrmanifest = $Line_NR_binary_path_windows Then
			$NewLine = '			"binary_path_windows" : "' & $NewHomePath & '",'
			If $WinName = "SteamVR Home" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
			FileWriteLine($Steam_tools_vrmanifest_File, $NewLine)
		Else
			FileWriteLine($Steam_tools_vrmanifest_File, $Array_tools_vrmanifest_File[$LOOP_vrmanifest])
		EndIf
    Next
EndFunc




Func _Settings_GUI()

		Global $HEIGHT_GUI = 375
		Global $POS_Y_Button_Exit_Settings_GUI = 335
		Global $POS_X_Input_Icon_Folder_1 = 10000
		Global $POS_X_IconFolders_Group = 10000


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$Settings_GUI = GUICreate("Settings", 540, $HEIGHT_GUI, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

#Region Folders
	GUICtrlCreateGroup("Steam Library Folders", 5, 5, 531, 325)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library Folder 1:", 10, 42, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_1 = GUICtrlCreateInput($Install_Folder_Steam_1, 10, 65, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_1 = GUICtrlCreateButton("...", 430, 66, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_1_open = GUICtrlCreateButton("Open", 465, 66, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_1_save = GUICtrlCreateButton("Save", 500, 66, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 2:", 10, 97, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_2 = GUICtrlCreateInput($Install_Folder_Steam_2, 10, 120, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_2 = GUICtrlCreateButton("...", 430, 119, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_2_open = GUICtrlCreateButton("Open", 465, 119, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_2_save = GUICtrlCreateButton("Save", 500, 119, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 3:", 10, 152, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_3 = GUICtrlCreateInput($Install_Folder_Steam_3, 10, 175, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_3 = GUICtrlCreateButton("...", 430, 174, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_3_open = GUICtrlCreateButton("Open", 465, 174, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_3_save = GUICtrlCreateButton("Save", 500, 174, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 4:", 10, 207, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_4 = GUICtrlCreateInput($Install_Folder_Steam_4, 10, 230, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_4 = GUICtrlCreateButton("...", 430, 229, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_4_open = GUICtrlCreateButton("Open", 465, 229, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_4_save = GUICtrlCreateButton("Save", 500, 229, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 5:", 10, 262, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_5 = GUICtrlCreateInput($Install_Folder_Steam_5, 10, 285, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_5 = GUICtrlCreateButton("...", 430, 284, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_5_open = GUICtrlCreateButton("Open", 465, 284, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Install_Folder_Steam_5_save = GUICtrlCreateButton("Save", 500, 284, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_save, $gfx & "Save_small.bmp")
#endregion


#Region Icon Folders
	GUICtrlCreateGroup("Icon Folders", $POS_X_IconFolders_Group, 335, 531, 215)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Local $Label_Icon_Path_1 = "Custom 1:"
	If $Icon_Folder_1 = $Install_DIR & "WebPage\images\" Then
		$Label_Icon_Path_1 = "HTML Icon folder:"
	EndIf

	Local $Label_Icon_Path_2 = "Custom 2:"


	GUICtrlCreateLabel($Label_Icon_Path_1, $POS_X_Input_Icon_Folder_1, 372, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_1 = GUICtrlCreateInput($Icon_Folder_1, $POS_X_Input_Icon_Folder_1, 395, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_1 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 396, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_1_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 396, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_1_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 396, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_1_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel($Label_Icon_Path_2, $POS_X_Input_Icon_Folder_1, 427, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_2 = GUICtrlCreateInput($Icon_Folder_2, $POS_X_Input_Icon_Folder_1, 450, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_2 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 451, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_2_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 451, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_2_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 451, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Custom 3:", $POS_X_Input_Icon_Folder_1, 482, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Icon_Folder_3 = GUICtrlCreateInput($Icon_Folder_3, $POS_X_Input_Icon_Folder_1, 505, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Icon_Folder_3 = GUICtrlCreateButton("...", $POS_X_Input_Icon_Folder_1 + 420, 506, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Icon_Folder_3_open = GUICtrlCreateButton("Open", $POS_X_Input_Icon_Folder_1 + 455, 506, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_3_open")
	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
	$Button_Icon_Folder_3_save = GUICtrlCreateButton("Save", $POS_X_Input_Icon_Folder_1 + 490, 506, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Icon_Folder_2_save")
	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_open, $gfx & "Folder_small.bmp")
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_save, $gfx & "Save_small.bmp")
#endregion



	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
	$Game_ID = ""


EndFunc


Func _AddGame2Library_GUI()
	$AddGame2Library_GUI = GUICreate("Add Game to Library", 349, 305 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; Darstellung Icon Preview Rahmen
	Global $Frame_up = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_down = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 243, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_right = GUICtrlCreatePic($gfx & "Frame.jpg", 330, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_left = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Icon_Preview = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 223, 193, 107, 50)

	GUICtrlCreateGroup("Properties", 5, 5, 340, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library:", 10, 40, 170, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $DROPDOWN_Library = GUICtrlCreateCombo("", 130, 39, 203, 35)
	GUICtrlSetOnEvent(- 1, "_DROPDOWN_Library")
	GUICtrlSetData(-1, "Non_Steam_Appl", "Non_Steam_Appl")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 80, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder = GUICtrlCreateButton("Select File", 130, 76, 99, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_GamePath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")
	Global $BUTTON_Use_SteamID= GUICtrlCreateButton("Use Steam ID", 234, 76, 100, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_Use_SteamID")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Enter Steam ID.")
	Global $Input_GamePath_Folder = GUICtrlCreateInput("", 130, 108, 203, 30)
	GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Appl. Name:", 10, 153, 150, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Name = GUICtrlCreateInput("", 130, 149, 203, 30)
	GUICtrlSetOnEvent(- 1, "_Input_Name")
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")

	GUICtrlCreateLabel("Icon Path:", 10, 207, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_IconPath_Folder = GUICtrlCreateButton("Select Icon", 130, 203, 85, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_IconPath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")

	GUICtrlCreateGroup("Drop Field", 350, 5, 130, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Button_SAVE_APP = GUICtrlCreateButton("Save", 5, 265, 300, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_SAVE_APP")
	_GUICtrlButton_SetImage(- 1, $gfx & "Create_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_Exit_AddGame2Library_GUI = GUICtrlCreateButton("Exit", 310, 265, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_AddGame2Library_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")
	GUISetState()

	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
EndFunc


Func _Update_StatusBar()
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $rTM_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
	Local $ssS_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
	Local $aSF_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")

	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "RTM: " & $rTM_value & " / " & "SSS: " & $ssS_value &  " / " & "ASF: " & $aSF_value & @TAB & "'Version " & $Version & "'")
EndFunc

Func _Search_Files()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "ALL" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

	If $Combo <> "ALL" Then
		If $Combo = "Steam Library 1" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $Combo = "Steam Library 2" Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $Combo = "Steam Library 3" Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $Combo = "Steam Library 4" Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $Combo = "Steam Library 5" Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
		If $Combo = "" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		Local $FileList = _FileListToArray($s_LocalFolder , "*.acf" , 1)
		Global $Application_NR = 1

		If $FileList <> "" Then
			FileDelete($ApplicationList_INI)
			For $NR = 1 To $FileList[0]
				Global $FileList_NR = $FileList[0]
				Global $File_Name = $FileList[$NR]
				Global $File_Path = $s_LocalFolder & $File_Name
				Global $ProcessBar_Status = $NR * 100 / $FileList[0]
				$ProcessBar_Status = $ProcessBar_Status ; - 15
				GUICtrlSetData($Display_Progressbar, $ProcessBar_Status)
				If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
					_ApplicationList_Update()
					$Application_NR = $Application_NR + 1
				EndIf
				$File_Path =  ""
			Next
			Sleep(500)
		EndIf
	EndIf

	If $Combo = "ALL" Then
			If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
			If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
			If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
			If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
			If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

			Local $FileList = _FileListToArray($s_LocalFolder , "*.acf" , 1)
			Global $Application_NR = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "") + 1

			If $FileList <> "" Then
				For $NR_temp2 = 1 To $FileList[0]
					Global $FileList_NR = $FileList[0]
					Global $File_Name = $FileList[$NR_temp2]
					Global $File_Path = $s_LocalFolder & $File_Name
					Global $ProcessBar_Status = $NR_temp2 * 100 / $FileList[0]
					$ProcessBar_Status = $ProcessBar_Status ; - 15
					GUICtrlSetData($Display_Progressbar, $ProcessBar_Status)
					If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
						_ApplicationList_Update()
						$Application_NR = $Application_NR + 1
					EndIf
					$File_Path =  ""
				Next
				Sleep(500)
			EndIf
			$FileList = ""
	EndIf
	_Read_from_INI_ADD_2_ListView()
EndFunc



Func _ApplicationList_Update()

	Global $File = $File_Path
	Local $Install_Drive = ""

	Global $Line_Value = ""

	If $File <> "" Then
			For $iCount_1 = 1 To 10
				Local $Complete_Value_Line = FileReadLine($File, $iCount_1)

				Local $iPosition = StringInStr($Complete_Value_Line, "appid")
				If $iPosition <> 0 Then
					Global $appid = StringReplace($Complete_Value_Line, '	"appid"		"', '')
					$appid = StringReplace($appid, '"', '')
				EndIf



				Local $iPosition = StringInStr($Complete_Value_Line, "name")
				If $iPosition <> 0 Then
					$name = StringReplace($Complete_Value_Line, '	"name"		"', '')
					$name = StringReplace($name, '"', '')
				EndIf



				Local $iPosition = StringInStr($Complete_Value_Line, "installdir")
				If $iPosition <> 0 Then
					Global $installdir = StringReplace($Complete_Value_Line, '	"installdir"		"', '')
					$installdir = StringReplace($installdir, '"', '')
				EndIf



				Local $iPosition = StringInStr($Complete_Value_Line, "SizeOnDisk")
				If $iPosition <> 0 Then
					Global $SizeOnDisk = StringReplace($Complete_Value_Line, '	"SizeOnDisk"		"', '')
					$SizeOnDisk = StringReplace($SizeOnDisk, '"', '')
					$SizeOnDisk = Round($SizeOnDisk, -6)
					$SizeOnDisk = StringTrimRight($SizeOnDisk, 6)
					$SizeOnDisk = _AddComma($SizeOnDisk)
					$SizeOnDisk = $SizeOnDisk & " Mb"
				EndIf


			Next


		$Install_Drive = StringMid($File, 1, 3)
		$Install_Drive = StringUpper($Install_Drive)


			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "InstallDrive", $Install_Drive)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "SizeOnDisk", $SizeOnDisk)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "InstallDrive", $Install_Drive)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "SizeOnDisk", $SizeOnDisk)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "installdir", $installdir)

			If $appid <> "" Then
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
			Else
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
			EndIf

			If Not FileExists($Icons & "steam.app." & $appid & ".jpg") Then
				_Download_Icon_for_SteamGameID()
			EndIf

			If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_32x32()
			EndIf

			If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".bmp") Then
				_Get_SteamGame_Icon_256x256()
			EndIf


		$Install_Drive = ""

	EndIf
EndFunc



Func _AddComma($v_num, $i_decimail_precision = 0)

	;Function courtesy of GaryFrost (w/edit by gafrost) from the AutoItscript forums!

    Local $new_num, $frac = "", $result = ""
    If (Not StringIsInt($v_num)) And (Not StringIsFloat($v_num)) Then
        SetError(1)
        Return "Non-numerical value passed into _AddComma"
    EndIf
    If $i_decimail_precision < 0 Then $i_decimail_precision = 0
    If StringInStr($v_num, '.') Then
        $v_num = StringSplit($v_num, '.')
        $new_num = $v_num[1]
        If $i_decimail_precision Then $frac = '.' & $v_num[2]
    Else
        $new_num = $v_num
    EndIf
    While StringLen($new_num) > 3
        $result = ',' & StringStripWS(StringRight($new_num, 3), 3) & $result
        $new_num = StringTrimRight($new_num, 3)
    WEnd
    If $i_decimail_precision Then
        If StringLen($frac) < $i_decimail_precision + 1 Then
            If Not StringLen($frac) Then $frac = '.'
            For $x = 1 To ($i_decimail_precision + 1) - StringLen($frac)
                $frac = $frac & '0'
            Next
        ElseIf StringLen($frac) > $i_decimail_precision + 1 Then
            $frac = StringTrimRight($frac, StringLen($frac) - ($i_decimail_precision + 1))
        EndIf
    EndIf
    $new_num = StringFormat('%s%s%s', $new_num, $result, $frac)

    Return $new_num
EndFunc  ;==>_AddComma



Func _Get_SteamGame_Icon_32x32()
	Global $Steam_AppId = $appid

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $appid & '/info/')

	Local $iPosition_1 = StringInStr($sHTML, 'clienttga</td>', $STR_CASESENSE, 1, 1000)
	Local $iPosition_2 = StringInStr($sHTML, '.jpg" rel="nofollow">', $STR_CASESENSE, 1, 1000)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1
	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)

	Local $iPosition_1_2 = StringInStr($sString, '<td class="span3">icon</td>', $STR_CASESENSE, 1, 1)
	Local $iPosition_2_2 = StringLen($sString) + 1
	Local $iPosition_3_2 = $iPosition_2_2 - $iPosition_1_2
	Local $sString_2 = StringMid($sString, $iPosition_1_2, $iPosition_3_2)

	Global $HTML_IconLink = StringReplace($sString_2, '<td class="span3">icon</td>', '')
	$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

	If $HTML_IconLink <> "" Then
		Local $URL = $HTML_IconLink & ".jpg"
		Local $Download = InetGet($URL, $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg", 16, 0)
		If $Download = 0 Then FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp", $FC_OVERWRITE)
		If $Download <> 0 Then _Convert_Icon_32x32()
		FileDelete($Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg")
	EndIf

	$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp"
	If Not FileExists($ImageList_Icon) Then
		FileCopy($gfx & "Icon_Preview_32x32.jpg", $ImageList_Icon)
	EndIf
EndFunc

Func _Get_SteamGame_Icon_256x256()
	Global $Steam_AppId = $appid

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $Steam_AppId & '/info/')

	Local $iPosition_1 = StringInStr($sHTML, 'clienticon</td>')
	Local $iPosition_2 = StringInStr($sHTML, '.ico" rel="nofollow')
	Local $iPosition_3 = $iPosition_2 - $iPosition_1

	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)

	Global $HTML_IconLink = StringReplace($sString, 'clienticon</td>', '')
	$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

	If $HTML_IconLink <> "" Then
		Local $URL = $HTML_IconLink & ".ico"
		InetGet($URL, $Icons & "256x256\" & "steam.app." & $Steam_AppId & ".ico", 16, 0)
	EndIf
EndFunc

Func _Convert_Icon_32x32()
	_GDIPlus_Startup()

	Local $sFile = $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".jpg"

    If @error Or Not FileExists($sFile) Then Return

    Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)

    Local $iWidth = 600
    Local $iHeight = _GDIPlus_ImageGetHeight($hImage) * 600 / _GDIPlus_ImageGetWidth($hImage)

    Local $tPalette = _GDIPlus_PaletteInitialize(16, $GDIP_PaletteTypeFixedHalftone27, 16, False, $hImage)
    _GDIPlus_BitmapConvertFormat($hImage, "", $GDIP_DitherTypeDualSpiral8x8, $GDIP_PaletteTypeFixedHalftone27, $tPalette)

	_GDIPlus_ImageSaveToFile($hImage, $Icons & "32x32\" & "steam.app." & $Steam_AppId & ".bmp")

    _GDIPlus_ImageDispose($hImage)
    _GDIPlus_Shutdown()
EndFunc

Func _Download_Icon_for_SteamGameID()
	Local $Application_appid = $appid
	Local $Download_Icon_path_jpg = $Icons & "steam.app." & $Application_appid & '.jpg'

	Local $URL = 'http://cdn.akamai.steamstatic.com/steam/apps/' & $Application_appid & '/header.jpg'
	InetGet($URL, $Download_Icon_path_jpg, 16, 0)
EndFunc






#EndRegion


#Region Func MAIN GUI    ;  line1457



Func _Button_Exit_HTML_GUI()    ;  line2428
	GUIDelete($HTML_GUI)
EndFunc


Func _Instructions()

			$GamePage_path_tbx = $Install_DIR & "Readme.html"
			If FileExists($GamePage_path_tbx) Then
				ShellExecute($GamePage_path_tbx)
			Else
				MsgBox(1,"Oops!", "Someone has moved the Readme.html file!")
			EndIf
EndFunc


Func _Button_MasterPage()
		$MasterPage_path = $Install_Web_DIR & "MasterPage.html"
			If FileExists($MasterPage_path) Then
				ShellExecute($MasterPage_path)
			Else
				MsgBox(0,"Oops!", "Oops! You need to create it first!  See the 'Create MasterPage' button on top.")
			EndIf
EndFunc


Func _Button_StartPage()
		$StartPage_path1 = IniRead($Config_INI, "Folders", "VRToolbox_utils_Folder", "")
		$StartPage_path = $StartPage_path1 & "Startpage.html"

			If FileExists($StartPage_path) Then
				ShellExecute($StartPage_path)
			Else
				MsgBox(0,"Oops!", "Oops! You need to create it first!  See the 'Change VRToolbox StartPage' button on top.")
			EndIf
EndFunc


Func _Button_Start_SteamVR()
		ShellExecute("steam://rungameid/250820")
EndFunc

Func _Button_Start_VRToolbox()
		ShellExecute("steam://rungameid/488040")
EndFunc


Func _Open_Folder()
		Run("C:\WINDOWS\EXPLORER.EXE /n,/e," & $Install_Web_DIR)
EndFunc


Func _Create_ListView_1()
	$listview = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview, "NR", 60)
	_GUICtrlListView_AddColumn($listview, "App ID", 90)
	_GUICtrlListView_AddColumn($listview, "Name", 470)
	_GUICtrlListView_AddColumn($listview, "Drive", 45)
	_GUICtrlListView_AddColumn($listview, "SizeOnDisk@TimeOfInstall", 157)
;	_GUICtrlListView_AddColumn($listview, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
;	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;   $RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
;	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;   $RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_2()    ;   line1496=
	$listview_2 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_2, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_2, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_2, "NR", 60)
	_GUICtrlListView_AddColumn($listview_2, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_2, "Name", 470)
	_GUICtrlListView_AddColumn($listview_2, "Drive", 45)
	_GUICtrlListView_AddColumn($listview_2, "SizeOnDisk@TimeOfInstall", 160)
;	_GUICtrlListView_AddColumn($listview_2, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_2)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_2, $GUI_HIDE)
EndFunc

Func _Create_ListView_3()
	$listview_3 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_3, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_3, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_3, "NR", 60)
	_GUICtrlListView_AddColumn($listview_3, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_3, "Name", 470)
	_GUICtrlListView_AddColumn($listview_3, "Drive", 45)
	_GUICtrlListView_AddColumn($listview_3, "SizeOnDisk@TimeOfInstall", 160)
;	_GUICtrlListView_AddColumn($listview_3, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_3)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_3, $GUI_HIDE)
EndFunc

Func _Create_ListView_4()
	$listview_4 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_4, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_4, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_4, "NR", 60)
	_GUICtrlListView_AddColumn($listview_4, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_4, "Name", 470)
	_GUICtrlListView_AddColumn($listview_4, "Drive", 45)
	_GUICtrlListView_AddColumn($listview_4, "SizeOnDisk@TimeOfInstall", 160)
;	_GUICtrlListView_AddColumn($listview_4, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_4)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_4, $GUI_HIDE)
EndFunc

Func _Create_ListView_5()
	$listview_5 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_5, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_5, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_5, "NR", 60)
	_GUICtrlListView_AddColumn($listview_5, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_5, "Name", 470)
	_GUICtrlListView_AddColumn($listview_5, "Drive", 45)
	_GUICtrlListView_AddColumn($listview_5, "SizeOnDisk@TimeOfInstall", 160)
;	_GUICtrlListView_AddColumn($listview_5, "Online", 95, 2)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	$contextmenu = GUICtrlCreateContextMenu($listview_5)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
EndFunc

Func _Create_ListView_6()
	$listview_6 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_6, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_6, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_6, "NR", 60)
	_GUICtrlListView_AddColumn($listview_6, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_6, "Name", 470)
	_GUICtrlListView_AddColumn($listview_6, "Drive", 45)
	_GUICtrlListView_AddColumn($listview_6, "SizeOnDisk@TimeOfInstall", 160)
;	_GUICtrlListView_AddColumn($listview_6, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_6)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item5 = GUICtrlCreateMenuItem("Create Supersampling Shortcut", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview_6, $GUI_HIDE)
EndFunc





Func _Read_from_INI_ADD_2_ListView()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	For $NR = 0 To $NR_Applications + 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_Drive = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "InstallDrive", "")
		Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "SizeOnDisk", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR; - 1

			$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			$ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_Temp, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_Drive, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_SizeOnDisk, 4)
;			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 4)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_Temp)

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")

		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"

			If Not FileExists($ListView_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)

			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview_Temp, $NR2, $NR2)
	Next

	_GUICtrlListView_EndUpdate($listview_Temp)
	_GUICtrlStatusBar_SetText($Statusbar, "Application added to other section" & @TAB & @TAB & "'Version " & $Version & "'")
EndFunc





Func _Update_ListView_Icons()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($ListView)
	_GUICtrlListView_DeleteAllItems($ListView)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")



	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_Drive = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "InstallDrive", "")
		Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "SizeOnDisk", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")
		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR
			Local $ImageList_Icon_new = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon_new) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon_new)
			EndIf

			$ListView_Icon = $ImageList_Icon_new
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_Temp, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_Drive, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_SizeOnDisk, 4)
;			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 4)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_Temp)
EndFunc





Func _ADD_Icons_32x32_to_ListView()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($ListView)
	_GUICtrlListView_DeleteAllItems($ListView)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR; - 1

			$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			$ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_Favorite_Image, $ListView_Icon)
			_GUICtrlListView_SetImageList($ListView, $ListView_Favorite_Image, 1)
		EndIf
	Next

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If Not FileExists($ListView_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview, $NR2, $NR2)
	Next
	_GUICtrlListView_EndUpdate($ListView)
EndFunc





#Region  Right Mouse Menus




Func _RM_Menu_Item_8()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Drive_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "InstallDrive", "")
	$GetItem_SizeOnDisk_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "SizeOnDisk", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	$GetItem_Drive_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "InstallDrive", "")
	$GetItem_SizeOnDisk_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "SizeOnDisk", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "InstallDrive", $GetItem_Drive_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "SizeOnDisk", $GetItem_SizeOnDisk_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "InstallDrive", $GetItem_Drive_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "SizeOnDisk", $GetItem_SizeOnDisk_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc




Func _RM_Menu_Item_9() ; RM_DOWN    line2062
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_Drive_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "InstallDrive", "")
	$GetItem_SizeOnDisk_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "SizeOnDisk", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	$GetItem_Drive_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "InstallDrive", "")
	$GetItem_SizeOnDisk_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "SizeOnDisk", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "InstallDrive", $GetItem_Drive_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "SizeOnDisk", $GetItem_SizeOnDisk_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "InstallDrive", $GetItem_Drive_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "SizeOnDisk", $GetItem_SizeOnDisk_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc



Func _RM_Menu_Item11() ; Delete ListView item    line2139
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	$GameNR = $ListView_Selected_Row_Nr
	$GameNR_next = $ListView_Selected_Row_Nr + 1
	$GetItem_appid_delete = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")

	$ApplicationList_NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	$GetItem_NR_1 = ""
	$GetItem_appid_1 = ""
	$GetItem_name_1 = ""
	$GetItem_Drive_1 = ""
	$GetItem_SizeOnDisk_1 = ""
	$GetItem_IconPath_1 = ""
	$GetItem_right_now_1 = ""
	$GetItem_24h_peak_1 = ""
	$GetItem_all_time_peak_1 = ""
	$GetItem_renderTargetMultiplier_1 = ""
	$GetItem_supersampleScale_1 = ""
	$GetItem_allowSupersampleFiltering_1 = ""

	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "InstallDrive", $GetItem_Drive_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "SizeOnDisk", $GetItem_SizeOnDisk_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", $GetItem_IconPath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", $GetItem_right_now_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", $GetItem_24h_peak_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", $GetItem_all_time_peak_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $ApplicationList_NR_Applications - 1)

	For $Loop_Temp = $GameNR_next To $ApplicationList_NR_Applications
		$GameName_before = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
		$GameName_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
		If $GameName_next <> "" Then
			$GetItem_NR_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "NR", "")
			$GetItem_appid_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "appid", "")
			$GetItem_name_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
			$GetItem_Drive_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "InstallDrive", "")
			$GetItem_SizeOnDisk_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "SizeOnDisk", "")
			$GetItem_IconPath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "IconPath", "")
			$GetItem_right_now_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "right_now", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_all_time_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "all_time_peak", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_renderTargetMultiplier_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "renderTargetMultiplier", "")
			$GetItem_supersampleScale_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "supersampleScale", "")
			$GetItem_allowSupersampleFiltering_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "allowSupersampleFiltering", "")

			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "InstallDrive", $GetItem_Drive_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "SizeOnDisk", $GetItem_SizeOnDisk_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "IconPath", $GetItem_IconPath_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "right_now", $GetItem_right_now_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "24h_peak", $GetItem_24h_peak_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "all_time_peak", $GetItem_24h_peak_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "supersampleScale", $GetItem_supersampleScale_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_next)
		EndIf
		If $Loop_Temp = $ApplicationList_NR_Applications Then
			IniDelete($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete)
			IniDelete($ApplicationList_TEMP, "Application_" & $Loop_Temp)
		EndIf
	Next
	_Update_ListView_Icons()
	_Read_from_INI_ADD_2_ListView()

EndFunc

#EndRegion

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
    Local $tagNMHDR, $event, $hwndFrom, $code
    $tagNMHDR = DllStructCreate("int;int;int", $lParam)
    If @error Then Return
    $event = DllStructGetData($tagNMHDR, 3)
    If $wParam = $ListView Then
        If $event = $NM_CLICK Then
			_Change_Preview_Icon_ListView()
;			If WinExists("Steam VR Settings Menu") Then _Update_VRSettings_GUI_Items()
			_Update_StatusBar()
        EndIf

        If $event = $NM_DBLCLK Then
			_DB_Click_Listview()
        EndIf
    EndIf

    $tagNMHDR = 0
    $event = 0
    $lParam = 0
EndFunc



Func _DB_Click_Listview()
	Sleep(200)
	_Create_HTMLView_GUI()
	Sleep(200)
EndFunc



Func _Change_Preview_Icon_ListView()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local  $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppID = _GUICtrlListView_GetItemText($ListView, $ListView_Selected_Row_Nr - 1, 1)
	Local $CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"

	If $ButtonTAB_State = 1 Then
		$CheckImagePath = $Icons & "steam.app." & $Check_AppID & ".jpg"
	EndIf

	If $ButtonTAB_State = 2 Then
		$CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 3 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 4 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $CheckImagePath = "" or $CheckImagePath = $Icons & "" & ".jpg" or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview.jpg"
;	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)  ;
EndFunc






Func _Create_HTMLView_GUI()
	Local $Button_Exit_HTML_GUI, $TreeView_Steam_app_PO_right_now, $TreeView_Steam_app_PO_24h_peak, $TreeView_Steam_app_PO_all_time_peak, $Text_SplitNR
	Local $Handle_2, $Text_2


	Switch $ButtonTAB_State
		Case 1
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
		Case 2
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_2)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_2, $ListView_Selected_Row_Index)
		Case 3
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_3)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_3, $ListView_Selected_Row_Index)
		Case 4
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_4)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_4, $ListView_Selected_Row_Index)
		Case 5
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_5)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_5, $ListView_Selected_Row_Index)
		Case 6
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_6)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_6, $ListView_Selected_Row_Index)
	EndSwitch



	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $oIE = ObjCreate("Shell.Explorer.2")

	Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 1010, 590, (@DesktopWidth - 920) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUICtrlCreateObj($oIE, 0, 0, 1010, 550)

	Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 973, 553, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_HTML_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Close_small.bmp")
	GuiCtrlSetTip(-1, "Closes HTML GUI.")

	Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
	$oIE.navigate($IE_Adresse)

	GUISetState()
	$Game_ID = ""
EndFunc



Func _Checkbox_all()
	$CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc

Func _Checkbox_CheckUncheck()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Local $Status_Checkbox = GUICtrlRead($Checkbox_CreatePage)

	If $Status_Checkbox = "a" Then
		_GUICtrlListView_SetItemChecked($listview_Temp, -1)
	EndIf

	If $Status_Checkbox <> "a" Then
		Local $NR_GameNames = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		For $LOOP_Checkbox = 0 To $NR_GameNames
			_GUICtrlListView_SetItemChecked($listview_Temp, $LOOP_Checkbox, false)
		Next
	EndIf
EndFunc






Func _Button_Create_GamePage_all()

Local $Light_File = $Install_Web_DIR & "StartPage.html"

	If FileExists($Light_File) Then FileDelete($Light_File)

	FileWrite($Light_File, '<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'  <title>LightVR Start Page</title>' & @CRLF & _
								'  <link href="css/lightvr.css" rel="stylesheet" type="text/css">' & @CRLF & _
								"  <link href='http://fonts.googleapis.com/css?family=Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>" & @CRLF & _
								'</head>' & @CRLF & _
								'<body>' & @CRLF & _
								'<script>' & @CRLF & _
								'function LightVROpen() {' & @CRLF & _
								'	var addr = document.getElementById("URL").value;' & @CRLF & _
								'	if (addr.includes("://") || addr.includes("www")) {' & @CRLF & _
								'		window.location.href = addr;' & @CRLF & _
								'	} else {' & @CRLF & _
								'		window.location.href = "https://www.google.com/search?hl=en&q=" + addr;' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								' ' & @CRLF & _
								'function LightVRKeyDown() {' & @CRLF & _
								'	if (event.keyCode == 13) {' & @CRLF & _
								'		LightVROpen();' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								'</script>' & @CRLF & _
								'  <div class="navigation-bar w-container">' & @CRLF & _
								'	  <a href="http://lightvr.co/"><img src="images/toolbox_logo_black.png" width="300" /></a>' & @CRLF & _
								'  </div>' & @CRLF & _
								'  <div class="content w-container">' & @CRLF & _
								'	<div class="content-wrapper" style="background-attachment: fixed;">' & @CRLF & _
								'	  <div class="url-field w-row">' & @CRLF & _
								'		<div class="w-col w-col-11">' & @CRLF & _
								'		  <input class="url-field w-input" id="URL" maxlength="256" placeholder="Enter Address or Search String..." type="text" onkeydown="LightVRKeyDown()"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'		<div class="w-col w-col-1">' & @CRLF & _
								'		  <input class="w-button yellow-button" style="margin-top: 0px" type="submit" value="GO" onclick="LightVROpen();"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'	  </div>' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	</div>' & @CRLF & _
								'  </div>' & @CRLF & _
								'<div class="icons">' & @CRLF)

								FileWriteLine($Light_File, '     <div class="tooltip"><a href="https://www.youtube.com/"> <img class="icon" src="images/youtube.png" width="65" /> <span class="tooltiptext">YouTube</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://www.youtube.com/channel/UCzuqhhs6NWbgTzMuM09WKDQ"><img class="icon" src="images/yt360.png" width="65" /><span class="tooltiptext">YouTube 360</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.twitch.tv"><img class="icon" src="images/twitch.png" width="65" /><span class="tooltiptext">Twitch</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.facebook.com/"><img class="icon" src="images/facebook.png" width="65" /><span class="tooltiptext">FaceBook</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://www.twitter.com"><img class="icon" src="images/twitter.png" width="65" /><span class="tooltiptext">Twitter</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.google.com/finance"><img class="icon" src="images/google_finance.png" width="65" /><span class="tooltiptext">Google Finance</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/"><img class="icon" src="images/reddit.png" width="65" /><span class="tooltiptext">Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://web.skype.com/"><img class="icon" src="images/skype.png" width="65" /><span class="tooltiptext">Skype</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://docs.google.com/document/"><img class="icon" src="images/google_docs.png" width="65" /><span class="tooltiptext">Google Docs</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://images.google.com/"><img class="icon" src="images/images.png" width="65" /><span class="tooltiptext">Google Images</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.google.com/search?site=&tbm=isch&source=hp&biw=1920&bih=979&q=cats+wallpapers"><img class="icon" src="images/cats.png" width="65" /><span class="tooltiptext">Cat Images</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.google.com/search?site=&tbm=isch&source=hp&biw=1920&bih=979&q=baby+chicken+wallpapers"><img class="icon" src="images/chick.png" width="65" /> <span class="tooltiptext">Chicken Images</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.instagram.com/"><img class="icon" src="images/instagram.png" width="65" /><span class="tooltiptext">Instagram</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://awwapp.com/"><img class="icon" src="images/whiteboard.png" width="65" /><span class="tooltiptext">Whiteboard</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Light_File, '  <div class="icons">' & @CRLF & _
															  '	 	<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_ALL.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Games_All.png" width="65" /><span class="tooltiptext">All Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_Non-Steam_Appl.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Non_Steam_Apps.png" width="65" /><span class="tooltiptext">Non-Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_Custom_1.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Games_One.png" width="65" /><span class="tooltiptext">Favorites</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_Custom_2.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Games_Two.png" width="65" /><span class="tooltiptext">Custom Tab 2</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_Custom_3.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Games_Three.png" width="65" /><span class="tooltiptext">Custom Tab 3</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_VRTbx_Custom_4.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Games_Four.png" width="65" /><span class="tooltiptext">Custom Tab 4</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'TVCuts_VRTbx.html"><img class="icon" src="'& $Install_Web_DIR & 'images\TVCuts.png" width="95" /><span class="tooltiptext">TVCuts</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Light_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'Clock.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Clock.png" width="65" /><span class="tooltiptext">Clock</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'Clock1.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Clock1.png" width="65" /><span class="tooltiptext">Clock1</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'Date.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Date.png" width="65" /><span class="tooltiptext">Date</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'Day.html"><img class="icon" src="'& $Install_Web_DIR & 'images\Day.png" width="65" /><span class="tooltiptext">Day</span></a></div>' & @CRLF & _
															  '  </div>')





	FileWriteLine($Light_File, '</body>')
	FileWriteLine($Light_File, '</html>')

EndFunc





;Func _Create_Page()
;	Local $Page_Type

;	$Page_Type = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
;	If $Page_Type = "SteamVR" Then

;	_Button_Create_GamePage_selected()
;EndFunc


;Func _Create_Page_Generic()
;	$WinName = "Generic"
;	_Button_Create_GamePage_selected()
;EndFunc




Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page..." & @TAB & @TAB & "'Version " & $Version & "'")

	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $WinName = "VR Toolbox" Then
		If $ButtonTAB_State = "1" Then $WebPage_Title = "All SteamVR Games for VRToolbox"
		If $ButtonTAB_State = "2" Then $WebPage_Title = "Non-Steam Titles for VRToolbox"
		If $ButtonTAB_State = "3" Then $WebPage_Title = "Favorites for VRToolbox"
		If $ButtonTAB_State = "4" Then $WebPage_Title = "Custom 2 for VRToolbox"
		If $ButtonTAB_State = "5" Then $WebPage_Title = "Custom 3 for VRToolbox"
		If $ButtonTAB_State = "6" Then $WebPage_Title = "Custom 4 for VRToolbox"
	Else
		If $ButtonTAB_State = "1" Then $WebPage_Title = "All SteamVR Games"
		If $ButtonTAB_State = "2" Then $WebPage_Title = "Non-Steam Titles"
		If $ButtonTAB_State = "3" Then $WebPage_Title = "Favorites"
		If $ButtonTAB_State = "4" Then $WebPage_Title = "Custom 2"
		If $ButtonTAB_State = "5" Then $WebPage_Title = "Custom 3"
		If $ButtonTAB_State = "6" Then $WebPage_Title = "Custom 4"
	EndIf
	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If $WinName = "VR Toolbox" Then
		If $ButtonTAB_State = "1" Then
			If $Combo = "ALL" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_ALL.html"
			If $Combo = "Steam Library 1" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Steam_Library_1.html"
				$WebPage_Title = "Selected Games for VRToolbox: Library 1"
			EndIf
			If $Combo = "Steam Library 2" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Steam_Library_2.html"
				$WebPage_Title = "Selected Games for VRToolbox: Library 2"
			EndIf
			If $Combo = "Steam Library 3" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Steam_Library_3.html"
				$WebPage_Title = "Selected Games for VRToolbox: Library 3"
			EndIf
			If $Combo = "Steam Library 4" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Steam_Library_4.html"
				$WebPage_Title = "Selected Games for VRToolbox: Library 4"
			EndIf
			If $Combo = "Steam Library 5" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Steam_Library_5.html"
				$WebPage_Title = "Selected Games for VRToolbox: Library 5"
			EndIf
		EndIf

		If $ButtonTAB_State = "2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Non-Steam_Appl.html"
		If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_1.html"
		If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_2.html"
		If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_3.html"
		If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_4.html"
	Else
		If $ButtonTAB_State = "1" Then
			If $Combo = "ALL" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_ALL.html"
			If $Combo = "Steam Library 1" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_1.html"
				$WebPage_Title = "Selected Games: Library 1"
			EndIf
			If $Combo = "Steam Library 2" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_2.html"
				$WebPage_Title = "Selected Games: Library 2"
			EndIf
			If $Combo = "Steam Library 3" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_3.html"
				$WebPage_Title = "Selected Games: Library 3"
			EndIf
			If $Combo = "Steam Library 4" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_4.html"
				$WebPage_Title = "Selected Games: Library 4"
			EndIf
			If $Combo = "Steam Library 5" Then
				$GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_5.html"
				$WebPage_Title = "Selected Games: Library 5"
			EndIf
		EndIf

		If $ButtonTAB_State = "2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
		If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
		If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
		If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
		If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"
	EndIf





	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	GUICtrlSetData($Display_Progressbar, 20)

	Local $TEMP_NR_selected = "false"
	For $NR = 1 To $NR_Applications
		GUICtrlSetData($Display_Progressbar, 10)
		Local $TEMP_selected = _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1)
		If $TEMP_selected = "true" Then $TEMP_NR_selected = "true"
	Next

	If $TEMP_NR_selected = "true" Then
		If FileExists($GamePage_path) Then FileDelete($GamePage_path)

		If $WinName = "VR Toolbox" Then
			FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $WebPage_Title & '</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<script>' & @CRLF & _
									'    function VRTStartCommand(cmd, what) {' & @CRLF & _
									"      var s = '{"& ' "LightVRCallback": { "'& "' + cmd + '"& '": "'& "' + what + '"& '"}'& " }'"& ';' & @CRLF & _
									'      console.log(s);' & @CRLF & _
									'    }' & @CRLF & _
									'</script>' & @CRLF & _
									'<h1>'& $WebPage_Title & '</h1>' & @CRLF & _
									'<div class="icons">' & @CRLF)
		Else
			FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $WebPage_Title & '</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<h1>'& $WebPage_Title & '</h1>' & @CRLF & _
									'<div class="icons">' & @CRLF)
		EndIf

		For $NR = 1 To $NR_Applications
			GUICtrlSetData($Display_Progressbar, $NR * 100 / $NR_Applications)
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR, "SizeOnDisk", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($gfx & "Icon_Preview.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $WinName = "VR Toolbox" Then
					FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '"& 'steam://'& "rungameid/" & $Application_appid & "');" & '"><img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				Else
					FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' "><img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf


			EndIf

		Next
		Sleep(100)
		FileWriteLine($GamePage_path, ' </div>')
		FileWriteLine($GamePage_path, '</body>')
		FileWriteLine($GamePage_path, '</html>')
		Sleep(100)
	Else
		MsgBox($MB_ICONWARNING, "No Application selected", "You need to select at least one Application to be able to create the HTML page.")
	EndIf
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
	Sleep(100)
	GUICtrlSetData($Display_Progressbar, 100)
	Sleep(600)
	GUICtrlSetData($Display_Progressbar, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
MsgBox(0, "Operation Completed", "Game Page created", 2)
EndFunc



Func _Create_MasterPage()


	Local $Master_File = $Install_Web_DIR & "MasterPage.html"

	If FileExists($Master_File) Then FileDelete($Master_File)

	FileWrite($Master_File, '<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'  <title>SSLoader MasterPage</title>' & @CRLF & _
								'  <link href="css/lightvr.css" rel="stylesheet" type="text/css">' & @CRLF & _
								'</head>' & @CRLF & _
								'<body>' & @CRLF & _
								'<script>' & @CRLF & _
								'function LightVROpen() {' & @CRLF & _
								'	var addr = document.getElementById("URL").value;' & @CRLF & _
								'	if (addr.includes("://") || addr.includes("www")) {' & @CRLF & _
								'		window.location.href = addr;' & @CRLF & _
								'	} else {' & @CRLF & _
								'		window.location.href = "https://www.google.com/search?hl=en&q=" + addr;' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								' ' & @CRLF & _
								'function LightVRKeyDown() {' & @CRLF & _
								'	if (event.keyCode == 13) {' & @CRLF & _
								'		LightVROpen();' & @CRLF & _
								'	}' & @CRLF & _
								'}' & @CRLF & _
								'</script>' & @CRLF & _
								'  <div class="navigation-bar w-container">' & @CRLF & _
								'  <div class="content w-container">' & @CRLF & _
								'	<div class="content-wrapperWMR" style="background-attachment: fixed;">' & @CRLF & _
								'	  <div class="url-field w-row">' & @CRLF & _
								'		<div class="w-col w-col-11">' & @CRLF & _
								'		  <input class="url-field w-input" id="URL" maxlength="256" placeholder="Enter Address or Search String..." type="text" onkeydown="LightVRKeyDown()"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'		<div class="w-col w-col-1">' & @CRLF & _
								'		  <input class="w-button yellow-button" style="margin-top: 0px" type="submit" value="GO" onclick="LightVROpen();"/>' & @CRLF & _
								'		</div>' & @CRLF & _
								'	  </div>' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	  <br />' & @CRLF & _
								'	</div>' & @CRLF & _
								'  </div>' & @CRLF & _
								'<div class="icons">' & @CRLF)

								FileWriteLine($Master_File, '     <div class="tooltip"><a href="https://www.youtube.com/channel/UCzuqhhs6NWbgTzMuM09WKDQ"> <img class="icon" src="images/yt360.png" width="65" /> <span class="tooltiptext">YouTube VR</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://www.youtube.com/channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ"><img class="icon" src="images/UtubeMusic.png" width="65" /><span class="tooltiptext">YouTube Music</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.twitch.tv"><img class="icon" src="images/twitch.png" width="65" /><span class="tooltiptext">Twitch</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.twitch.tv/directory/game/Virtual%20Reality"><img class="icon" src="images/twitchvr.png" width="65" /><span class="tooltiptext">Twitch VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.facebook.com/"><img class="icon" src="images/facebook.png" width="65" /><span class="tooltiptext">FaceBook</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://www.twitter.com"><img class="icon" src="images/twitter.png" width="65" /><span class="tooltiptext">Twitter</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://web.skype.com/"><img class="icon" src="images/skype.png" width="65" /><span class="tooltiptext">Skype</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/"><img class="icon" src="images/reddit.png" width="65" /><span class="tooltiptext">Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/Vive/"><img class="icon" src="images/Vivereddit.png" width="65" /><span class="tooltiptext">Vive Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://vrlfg.net/players"><img class="icon" src="images/vrlfg.png" width="65" /><span class="tooltiptext">Steam Players</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://docs.google.com/document/"><img class="icon" src="images/google_docs.png" width="65" /><span class="tooltiptext">Google Docs</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://awwapp.com/"><img class="icon" src="images/whiteboard.png" width="65" /><span class="tooltiptext">Whiteboard</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.roadtovr.com/"><img class="icon" src="images/roadtovr.png" width="65" /><span class="tooltiptext">Road to VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.virtualreality-news.net/"><img class="icon" src="images/vr360.png" width="65" /><span class="tooltiptext">VR News</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Master_File, '  <div class="icons">' & @CRLF & _
															  '	 	<div class="tooltip"><a href="GamePage_ALL.html"><img class="icon" src="images\Games_All.png" width="65" /><span class="tooltiptext">All Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Non-Steam_Appl.html"><img class="icon" src="images\Non_Steam_Apps.png" width="65" /><span class="tooltiptext">Non-Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_1.html"><img class="icon" src="images\Games_One.png" width="65" /><span class="tooltiptext">Favorites</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_2.html"><img class="icon" src="images\Games_Two.png" width="65" /><span class="tooltiptext">Custom Tab 2</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_3.html"><img class="icon" src="images\Games_Three.png" width="65" /><span class="tooltiptext">Custom Tab 3</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_4.html"><img class="icon" src="images\Games_Four.png" width="65" /><span class="tooltiptext">Custom Tab 4</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Steam_Library_1.html"><img class="icon" src="images\Library1.png" width="100" /><span class="tooltiptext">Steam Library 1</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Steam_Library_2.html"><img class="icon" src="images\Library2.png" width="100" /><span class="tooltiptext">Steam Library 2</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Steam_Library_3.html"><img class="icon" src="images\Library3.png" width="100" /><span class="tooltiptext">Steam Library 3</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Steam_Library_4.html"><img class="icon" src="images\Library4.png" width="100" /><span class="tooltiptext">Steam Library 4</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Steam_Library_5.html"><img class="icon" src="images\Library5.png" width="100" /><span class="tooltiptext">Steam Library 5</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="TVCuts.html"><img class="icon" src="images\TVCuts.png" width="85" /><span class="tooltiptext">TVCuts</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Master_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="Clock.html"><img class="icon" src="images\Clock.png" width="65" /><span class="tooltiptext">Clock</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Clock1.html"><img class="icon" src="images\Clock1.png" width="65" /><span class="tooltiptext">Clock1</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Date.html"><img class="icon" src="images\Date.png" width="65" /><span class="tooltiptext">Date</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Day.html"><img class="icon" src="images\Day.png" width="65" /><span class="tooltiptext">Day</span></a></div>' & @CRLF & _
															  '  </div>')


	FileWriteLine($Master_File, '</body>')
	FileWriteLine($Master_File, '</html>')
MsgBox(0, "Operation Completed", "MasterPage created", 2)
EndFunc




Func _Open_Page()
	Local $Open_Page_path1 = ""
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	If $WinName = "" Then $WinName = "SteamVR Home"
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $Combo = "All"



If $WinName = "VR Toolbox" Then
		If $ButtonTAB_State = "1" Then
			If $Combo = "ALL" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_All.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 1" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Steam_Library_1.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 2" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Steam_Library_2.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 3" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Steam_Library_3.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 4" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Steam_Library_4.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 5" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Steam_Library_5.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
		EndIf



		If $ButtonTAB_State = "2" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Non-Steam_Appl.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "3" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_1.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "4" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_2.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "5" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_3.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "6" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_4.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

Else
		If $ButtonTAB_State = "1" Then
			If $Combo = "ALL" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_All.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 1" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_Steam_Library_1.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 2" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_Steam_Library_2.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 3" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_Steam_Library_3.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 4" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_Steam_Library_4.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
			If $Combo = "Steam Library 5" Then
				$Open_Page_path1 = $Install_Web_DIR & "GamePage_Steam_Library_5.html"
				If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
			EndIf
		EndIf



		If $ButtonTAB_State = "2" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Non-Steam_Appl.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "3" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_1.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "4" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_2.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "5" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_3.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "6" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_4.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf
EndIf



EndFunc






Func _TV_Cuts()
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	If $WinName = "" Then $WinName = "SteamVR Home"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $Combo = "All"
	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	If $WinName = "VR Toolbox" Then
		$GamePage_path = $Install_DIR & "WebPage\TVCuts_VRTbx.html"
		$Cuts_Path = $Install_DIR & "Webpage\CutsVRTbx\"
	Else
		$GamePage_path = $Install_DIR & "WebPage\TVCuts.html"
		$Cuts_Path = $Install_DIR & "Webpage\Cuts\"
	EndIf

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If FileExists($GamePage_path) Then FileDelete($GamePage_path)

	If $WinName = "VR Toolbox" Then
			FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>TVCuts for VRToolbox</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<script>' & @CRLF & _
									'    function VRTStartCommand(cmd, what) {' & @CRLF & _
									"      var s = '{"& ' "LightVRCallback": { "'& "' + cmd + '"& '": "'& "' + what + '"& '"}'& " }'"& ';' & @CRLF & _
									'      console.log(s);' & @CRLF & _
									'    }' & @CRLF & _
									'</script>' & @CRLF & _
									'<h1>Shortcuts to be tied to Objects for VRTbx</h1>' & @CRLF & _
									'<div class="icons">' & @CRLF)
	Else
			FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>TVCuts</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<h1>Shortcuts to be tied to Objects</h1>' & @CRLF & _
									'<div class="icons">' & @CRLF)
	EndIf


	For $NR = 1 To $NR_Applications
			GUICtrlSetData($Display_Progressbar, $NR * 100 / $NR_Applications)

				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR, "SizeOnDisk", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($gfx & "Icon_Preview.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $WinName = "VR Toolbox" Then
					FileWriteLine($GamePage_path, '<div class="tooltip"><a href="'& $Cuts_Path & $Application_appid & ".html"& '"><img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					_Single_Cut_VRTbx()
				Else
					FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' "><img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					_Single_Cut()
				EndIf


	Next



Sleep(100)
	FileWriteLine($GamePage_path, ' </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')
Sleep(100)

	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
	Sleep(100)
	GUICtrlSetData($Display_Progressbar, 100)
	Sleep(600)
	GUICtrlSetData($Display_Progressbar, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Rescan Steam Library' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc


Func _Single_Cut_VRTbx()
	$Cuts_Path = $Install_DIR & "Webpage\CutsVRTbx\"
	$Full_Cuts_Path = $Cuts_Path & $Application_appid & ".html"
	If FileExists($Full_Cuts_path) Then FileDelete($Full_Cuts_path)

	FileWrite($Full_Cuts_Path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $Application_name & "</title>" & @CRLF & _
									'    <link href="../css/favs.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<script>' & @CRLF & _
									'    function VRTStartCommand(cmd, what) {' & @CRLF & _
									"      var s = '{"& ' "LightVRCallback": { "'& "' + cmd + '"& '": "'& "' + what + '"& '"}'& " }'"& ';' & @CRLF & _
									'      console.log(s);' & @CRLF & _
									'    }' & @CRLF & _
									'</script>' & @CRLF)

				FileWriteLine($Full_Cuts_Path, '<div class="favtooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '"& 'steam://'& "rungameid/" & $Application_appid & "');" & '"><img class="tvicon" src="../images/steam.app.' & $Application_appid & '.jpg" /><span class="tvtooltiptext">' & $Application_name & '</span></a></div>')


	;FileWriteLine($Full_Cuts_Path, ' </div>')
	FileWriteLine($Full_Cuts_Path, '</body>')
	FileWriteLine($Full_Cuts_Path, '</html>')

EndFunc

Func _Single_Cut()
	$Cuts_Path = $Install_DIR & "Webpage\Cuts\"
	$Full_Cuts_Path = $Cuts_Path & $Application_appid & ".html"
	If FileExists($Full_Cuts_path) Then FileDelete($Full_Cuts_path)

	FileWrite($Full_Cuts_Path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $Application_name & "</title>" & @CRLF & _
									'    <link href="../css/favs.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF)

				FileWriteLine($Full_Cuts_Path, '<div class="favtooltip"><a href="steam://rungameid/' & $Application_appid & '"><img class="tvicon" src="../images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tvtooltiptext">' & $Application_name & '</span></a></div>')


	;FileWriteLine($Full_Cuts_Path, ' </div>')
	FileWriteLine($Full_Cuts_Path, '</body>')
	FileWriteLine($Full_Cuts_Path, '</html>')

EndFunc


Func _Oculus()


; temporary place holder


EndFunc







Func _Button_Add_to_Custom()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$Status_Combo_Add_to_Custom = GUICtrlRead($Combo_Add_to_Custom)
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"


	If $Status_Combo_Add_to_Custom <> "Choose TAB" Then
		$ButtonTAB_State_1 = GUICtrlRead($ButtonTAB_Custom_1)
		$ButtonTAB_State_2 = GUICtrlRead($ButtonTAB_Custom_2)
		$ButtonTAB_State_3 = GUICtrlRead($ButtonTAB_Custom_3)
		$ButtonTAB_State_4 = GUICtrlRead($ButtonTAB_Custom_4)

		$ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"


		Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		$LastAppNR = IniRead($ApplicationList_target, "ApplicationList", "NR_Applications", "")
		$NewAppNR = $LastAppNR + 1

		For $NR = 1 To $NR_Applications
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
					Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
					Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
					Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
					Global $Application_Drive = IniRead($ApplicationList_TEMP, "Application_" & $NR, "InstallDrive", "")
					Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR, "SizeOnDisk", "")
					Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")

					IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "InstallDrive", $Application_Drive)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "SizeOnDisk", $Application_SizeOnDisk)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "IconPath", $Application_IconPath)
					$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
	EndIf
EndFunc







Func _Combo_SteamLibrary()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
;MsgBox(1,"combo steamlibrary", $Combo)
	IniWrite($config_ini, "Settings", "Steam_Library", $Combo)
	FileDelete($ApplicationList_INI)

	If $Combo = "Steam Library 1" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini") Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		If $Install_Folder_Steam_1 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 1 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 1")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 2" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
		$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		If $Install_Folder_Steam_2 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 2 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 2")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 3" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
		$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		If $Install_Folder_Steam_3 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 3 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 3.")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 4" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
		$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		If $Install_Folder_Steam_4 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 4 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 4")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 5" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
		$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		If $Install_Folder_Steam_5 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 5 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 5.ini")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_Settings_GUI()
		EndIf
	EndIf
	_Read_from_INI_ADD_2_ListView()
	GUICtrlSetData($Checkbox_CreatePage, "")
EndFunc






Func _ButtonTAB_Steam_Library()
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
	GUICtrlSetState($Text2, $GUI_SHOW)
	GUICtrlSetState($Text3, $GUI_SHOW)
	GUICtrlSetState($TextSelect, $GUI_SHOW)
	GUICtrlSetState($TextAnd, $GUI_SHOW)
	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Text4, $GUI_SHOW)
	GUICtrlSetState($TextThen, $GUI_HIDE)
	GUICtrlSetState($Text2a, $GUI_HIDE)
	GUICtrlSetState($Button_Settings, $GUI_SHOW)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
	GUICtrlSetState($Cover1, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "1")
	FileDelete($ApplicationList_INI)
	_GUICtrlListView_DeleteAllItems($ListView)
	GUICtrlSetState($listview, $GUI_SHOW)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Non_Steam_Appl()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Text2, $GUI_SHOW)
	GUICtrlSetState($Text3, $GUI_SHOW)
	GUICtrlSetState($TextSelect, $GUI_SHOW)
	GUICtrlSetState($TextAnd, $GUI_SHOW)
	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Text4, $GUI_SHOW)
	GUICtrlSetState($TextThen, $GUI_HIDE)
	GUICtrlSetState($Text2a, $GUI_HIDE)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "2")
	_GUICtrlListView_DeleteAllItems($listview_2)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_SHOW)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_1()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_1)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Text2, $GUI_HIDE)
	GUICtrlSetState($Text3, $GUI_HIDE)
	GUICtrlSetState($TextSelect, $GUI_HIDE)
	GUICtrlSetState($TextAnd, $GUI_HIDE)
	GUICtrlSetState($TextClick, $GUI_HIDE)
	GUICtrlSetState($Text4, $GUI_HIDE)
	GUICtrlSetState($TextThen, $GUI_SHOW)
	GUICtrlSetState($Text2a, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "3")
	_GUICtrlListView_DeleteAllItems($ListView_3)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_SHOW)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_2()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_2)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Text2, $GUI_HIDE)
	GUICtrlSetState($Text3, $GUI_HIDE)
	GUICtrlSetState($TextSelect, $GUI_HIDE)
	GUICtrlSetState($TextAnd, $GUI_HIDE)
	GUICtrlSetState($TextClick, $GUI_HIDE)
	GUICtrlSetState($Text4, $GUI_HIDE)
	GUICtrlSetState($TextThen, $GUI_SHOW)
	GUICtrlSetState($Text2a, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "4")
	_GUICtrlListView_DeleteAllItems($ListView_4)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_SHOW)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_3()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_3)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Text2, $GUI_HIDE)
	GUICtrlSetState($Text3, $GUI_HIDE)
	GUICtrlSetState($TextSelect, $GUI_HIDE)
	GUICtrlSetState($TextAnd, $GUI_HIDE)
	GUICtrlSetState($TextClick, $GUI_HIDE)
	GUICtrlSetState($Text4, $GUI_HIDE)
	GUICtrlSetState($TextThen, $GUI_SHOW)
	GUICtrlSetState($Text2a, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "5")
	_GUICtrlListView_DeleteAllItems($ListView_5)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_SHOW)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _ButtonTAB_Custom_4()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_4)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Text2, $GUI_HIDE)
	GUICtrlSetState($Text3, $GUI_HIDE)
	GUICtrlSetState($TextSelect, $GUI_HIDE)
	GUICtrlSetState($TextAnd, $GUI_HIDE)
	GUICtrlSetState($TextClick, $GUI_HIDE)
	GUICtrlSetState($Text4, $GUI_HIDE)
	GUICtrlSetState($TextThen, $GUI_SHOW)
	GUICtrlSetState($Text2a, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "6")
	_GUICtrlListView_DeleteAllItems($ListView_6)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_SHOW)
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _Button_AddGame2Library()
	_AddGame2Library_GUI()
EndFunc

Func _Button_ReScan_Steam_Library()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
Local $temp_Combo = $Combo


GUICtrlSetData($Combo_SteamLibrary, "ALL")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

		If $Install_Folder_Steam_1 <> "" Then $NR_temp3 = 1
		If $Install_Folder_Steam_2 <> "" Then $NR_temp3 = 2
		If $Install_Folder_Steam_3 <> "" Then $NR_temp3 = 3
		If $Install_Folder_Steam_4 <> "" Then $NR_temp3 = 4
		If $Install_Folder_Steam_5 <> "" Then $NR_temp3 = 5
		If $NR_temp3 = "" Then $NR_temp3 = 1

		For $NR_Library = 1 To $NR_temp3
			$NR_Library_temp = $NR_Library
			_Search_Files()
			Sleep(500)
			GUICtrlSetData($Display_Progressbar, 0)
			GUICtrlSetData($Display_Progressbar_2, $NR_Library * 100 / $NR_temp3)
		Next
		$NR_Library_temp = ""
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar_2, 0)
;	EndIf
;Local $testing2 ="Steam Library 1"

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")      ;If $Combo <> "ALL" Then
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
;	EndIf

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 3")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 4")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 5")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)



GUICtrlSetData($Display_Progressbar_2, 1)

GUICtrlSetData($Combo_SteamLibrary, $temp_Combo)
$Combo = GUICtrlRead($Combo_SteamLibrary)
	_Read_from_INI_ADD_2_ListView()

	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library finished." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
EndFunc


#endregion   ;  line3114  Main GUI functions @ 1457



#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	$DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		$Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
	EndIf
EndFunc

Func _BUTTON_GamePath_Folder()
	$FileSelect = FileOpenDialog("Choose File.", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		$Value_GamePath_Folder = $FileSelect
		GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
		IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", $FileSelect)
		$HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $HL_ID)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
		GUICtrlSetState($Input_Name, $GUI_SHOW)
		GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
		GUICtrlSetImage($Icon_Preview, $gfx & "Icon_Preview.jpg")
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		$Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
		$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
		$Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
		$StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
		$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_NamefromFile)
		GUICtrlSetData($Input_Name, $Value_NamefromFile)
	EndIf
EndFunc

Func _BUTTON_Use_SteamID()
	$InputBox = InputBox("Enter Steam Game ID", " ", "", "", - 1, 1)
	If $InputBox <> "" Then
		$Value_Use_SteamID = $InputBox
		GUICtrlSetData($Input_GamePath_Folder, "steam://rungameid/" & $Value_Use_SteamID)
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $Value_Use_SteamID)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
		GUICtrlSetState($Input_Name, $GUI_SHOW)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
		GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
		GUICtrlSetImage($Icon_Preview, $gfx & "Icon_Preview.jpg")
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $gfx & "Icon_Preview.jpg")
		$Value_FileName = "SteamGameID " & $Value_Use_SteamID
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_FileName)
		GUICtrlSetData($Input_Name, $Value_FileName)
	EndIf
EndFunc

Func _Input_Name()
	$Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		$Value_Input_Name = $Input_Input_Name
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc

Func _BUTTON_IconPath_Folder()
	$FileSelect = FileOpenDialog("Choose Icon File.", $Icons, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		$Value_IconPath_Folder = $FileSelect
		GUICtrlSetImage($Icon_Preview, $Value_IconPath_Folder)
		IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $Value_IconPath_Folder)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
	EndIf
EndFunc

Func _Button_SAVE_APP()
	$Value_DROPDOWN_Library = IniRead($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	$Value_Drive = IniRead($config_ini, "TEMP", "Value_Drive", "")
	$Value_SizeOnDisk = IniRead($config_ini, "TEMP", "Value_SizeOnDisk", "")
	$Value_Use_SteamID = IniRead($config_ini, "TEMP", "Value_Use_SteamID", "")
	$Value_Input_Name = IniRead($config_ini, "TEMP", "Value_Input_Name", "")
	$Value_IconPath_Folder = IniRead($config_ini, "TEMP", "Value_IconPath_Folder", "")

	$LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	$NewAppNR = $LastAppNR + 1

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "InstallDrive", $Value_Drive)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "SizeOnDisk", $Value_SizeOnDisk)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "IconPath", $Value_IconPath_Folder)

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "InstallDrive", $Value_Drive)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "SizeOnDisk", $Value_SizeOnDisk)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "IconPath", $Value_IconPath_Folder)

	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_Drive", "")
	IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", $NewAppNR)
	_Read_from_INI_ADD_2_ListView()

	GUICtrlSetData($Input_GamePath_Folder, "")
	GUICtrlSetData($Input_Name, "")

	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)

	MsgBox($MB_ICONINFORMATION, "Finished", "New Application added", 3)
EndFunc

Func _Button_Exit_AddGame2Library_GUI()
	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_Drive", "")
	IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")
	GUIDelete($AddGame2Library_GUI)
EndFunc


Func _Button_Exit_Settings_GUI()

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	GUIDelete($Settings_GUI)

EndFunc

#EndRegion


#Region Func Settings GUI


Func _Button_Install_Folder_Steam_1()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_1, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_2, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_2", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_3, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_3", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_4, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_4", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_5, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_5", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	EndIf
EndFunc


Func _Button_Install_Folder_Steam_1_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_1)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_2)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_3)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_4)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5_open()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_5)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_1_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_1)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_1, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_1", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_2_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_2)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_2", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_3)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_3, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_3", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_4)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_4, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_4", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		EndIf
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_5_save()
	Local $Value_Input = GUICtrlRead($Input_Install_Folder_Steam_5)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If FileExists($Value_Input & "Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_5, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_5", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		EndIf
	EndIf
EndFunc


Func _Button_Icon_Folder_1()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_1, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_1", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_2()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_2, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_2", $FileSelectFolder & "\")
	Else
		IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
	EndIf
EndFunc

Func _Button_Icon_Folder_3()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If $FileSelectFolder <> "" Then
		GUICtrlSetData($Input_Icon_Folder_3, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Icon_Folder_3", $FileSelectFolder & "\")
	Else
		MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
		IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
	EndIf
EndFunc


Func _Button_Icon_Folder_1_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_1)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_2_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_2)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_3_open()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_3)
	If $Value_Input <> "" Then
		ShellExecute($Value_Input)
	EndIf
EndFunc

Func _Button_Icon_Folder_1_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_1)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_1, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_1", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_2_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_2)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_2, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_2", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
		EndIf
	EndIf
EndFunc

Func _Button_Icon_Folder_3_save()
	Local $Value_Input = GUICtrlRead($Input_Icon_Folder_3)
	Local $Check_Value_Input = StringRight($Value_Input, 1)
	If $Check_Value_Input <> "" And $Check_Value_Input <> "\" Then $Value_Input = $Value_Input & "\"
	If $Value_Input <> "" Then
		GUICtrlSetData($Input_Icon_Folder_3, $Value_Input)
		IniWrite($config_ini, "Folders", "Icon_Folder_3", $Value_Input)
	Else
		If $Check_Value_Input <> "" Then
			IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
		EndIf
	EndIf
EndFunc


#endregion












#Region Func Home Loader


Func _Restart()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	If FileExists($Install_DIR & "Restart.exe") Then
		ShellExecute($Install_DIR & "Restart.exe")
	Else
		ShellExecute($Install_DIR & "SSLoader_for_VRToolbox.au3")
	EndIf
	Sleep(500)
	Exit
EndFunc

Func _Beenden()
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	Exit
EndFunc
#endregion







#EndRegion  Functions


