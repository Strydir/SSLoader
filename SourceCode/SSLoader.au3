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
#include <WinAPIIcons.au3>
#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <String.au3>
#include <GuiSlider.au3>
#include <GuiComboBox.au3>
#include <GuiRichEdit.au3>

Opt("GUIOnEventMode", 1)

#Region Set Global
Global $GUI_Loading, $GUI_Loading_2, $GUI_Scanning, $AddGame2Library_GUI, $Settings_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $IconLoading_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp, $Value_Use_SteamID
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP, $AppList
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group, $Playlist_GUI, $POS_X_PlaylistButton, $WebPage_Title, $Application_BATpath
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP, $ListView_Favorite_Image, $ListView_Favorite_Image_1, $ListView_Favorite_Image_2
Global $ListView_Favorite_Image_3, $ListView_Favorite_Image_4, $ListView_Favorite_Image_5, $ListView_Favorite_Image_6, $ListView_Favorite_Image_7, $ListView_Favorite_Image_8, $ListView_Favorite_Image_9
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item3a, $RM_Item4, $RM_Item5, $RM_Item6, $RM_Item7,$RM_Item8,$RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12, $RM_Item13, $Launch_String
Global $Checkbox_Add_break, $Combo_Add_break, $Combo_SteamLibrary
Global $Array_tools_vrmanifest_File, $Array_tools_vrmanifest_File, $Line_NR_binary_path_windows
Global $WMR_Keyname, $hImage, $hGraphic
Global $Oculus_Game_Name, $Oculus_Game_EXE, $BAT_File, $Oculus_Game_bmp, $Oculus_Game_bmp_Scaled, $Oculus_Game_JPG, $NP, $CurrentPlayers, $RM_ItemA, $Context_Icon
Global $Form_MainSettings, $mExit, $mSet_Libraries, $mSet_PageVRTbx, $mSet_Page, $mOpen_PageVRTbx, $mOpen_Page, $mLabel_Restore, $mRestore_StartPage
Global $Sep_Name, $Install_Drive, $search_LocalFolder, $fileCK1, $aAppId, $aName, $aFileType, $aInstallDrive, $aSoD, $aIconPath, $aLineString
Global $Input_Install_Folder_Steam_1, $Input_Install_Folder_Steam_2, $Input_Install_Folder_Steam_3, $Input_Install_Folder_Steam_4, $Input_Install_Folder_Steam_5
#endregion

Global $font = "arial"
Global $font_arial = "arial"

Global $Tab1_Color = "0xFAF0E6"
Global $Tab1_ColorText = "0x000000"
Global $Tab2_Color ="0xFAF0E6"
Global $Tab2_ColorText ="0x000000"
Global $Tab3_Color ="0xFAF0E6"
Global $Tab3_ColorText ="0x000000"
Global $TabGroup_Color = "0xF5F5DC"
Global $TabGroup_ColorText = "0x000000"
Global $TabGroup = $TabGroup_Color
Global $TabButton_Color = "0xDEB887"
Global $TabButton_ColorText = "0x000000"

Global $Settings_Color = "0x00BFFF"
Global $Settings_ColorText = "0x000000"

Global $Tab_HighLight = "0x006400"

Global $Set_HomeColor = "0xFFD700"
Global $Set_HomeColorText = "0x000000"
Global $Background_Main = "0x018080"

Global $Font_Title = "Comic Sans MS"
Global $Font_Title_Size = 18
Global $Font_Header = "Comic Sans MS"
Global $Font_Header_Size = 16
Global $Font_Name = "Lucida Console"
Global $Font_Name_Size = 12

Global $Name_Total = 44

#Region Declare Variables/Const 1
Global $Version = "6.0"

Global $config_ini = @ScriptDir & "\config.ini"

Global $Install_DIR = @ScriptDir & "\"
Global $Install_Web_DIR = @ScriptDir & "\Webpage\"
Global $Install_Web_DIR_Slash = StringReplace($Install_Web_DIR, "\", "/")
Global $Install_Web_DIR_Icons = "file:///" & $Install_Web_DIR_Slash
Global $Revive_Tlbx_BAT_DIR = @ScriptDir & "\Webpage\BatsVRTbx\"
Global $Revive_BAT_DIR = @ScriptDir & "\Webpage\Bats\"
Global $Local_StartPage = $Install_Web_DIR & "StartPage.html"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $ApplicationList_Folder & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPageTemp.html"
Global $Steam_Library = IniWrite($Config_INI, "Settings", "Steam_Library", "ALL")
$Steam_Library = "ALL"
Global $Steam_Arg = "/vr"
Global $nonSteam_Arg = ""
Global $ButtonTAB_State = IniWrite($Config_INI, "Settings", "ButtonTAB_State", "1")
$ButtonTAB_State = 1
Global $StartPage_DIR = "steamapps\common\VRToolbox\utils\"
Global $Toolbox_Check = "steamapps\common\VRToolbox\bin\VRToolbox.exe"
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "")
Global $Run_Steam = "steam://rungameid/250820"
Global $BAT_Path = $Install_DIR & "VRTbxBATS/"
$BAT_Path = StringReplace($BAT_Path, "\", "/")

Global $gfx = @ScriptDir & "\" & "gfx\"
Global $Icons = $Install_DIR & "Icons\"
Global $32bit_Icons = $Icons & "32x32\" & "steam.app." & $appid & ".jpg"
Global $32bit_Bmps = $Icons & "32x32\" & "steam.app." & $appid & ".bmp"
Global $32bit_BMPtemp = $Icons & "32x32\" & "steam.app." & $Value_Use_SteamID & ".bmp"
Global $Steam_Icons = $Icons & "steam.app."
Global $Steam32_Icons = $Icons & "32x32\" & "steam.app."
Global $Icon_Temp_Preview = $Icons & "TempPic.bmp"
Global $ContextSelected_Image = $gfx & "steamvr_logo.bmp"
Global $First_Read = $Install_DIR & "Readme.html"
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
Global $otherName = "Other: "
;Global $Sep_AppId = "-"
Global $Sep_AppId = "--------"
Global $Sep_Name_Pre = "--->             "
Global $Sep_Name_Suf = "<---"
Global $Sep_Drive = "    "
Global $Sep_SoD = "          "
;Global $Sep_Name_Pre = "-----------"
;Global $Sep_Drive = "----"
;Global $Sep_SoD = "----------------"
Global $Sep_Pic = $Icons & "32x32\" & "steam.app." & "--------.bmp"
Global $left = '"'
Global $right = '"'
Global $Sort = 1
Global $Sort_Drive = False
Global $Sort_AppId = False

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
Global $ApplicationList_Revive_Apps_INI = $ApplicationList_Folder & "ApplicationList_Revive_Apps.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"
Global $ApplicationList_Custom_5_INI = $ApplicationList_Folder & "ApplicationList_Custom_5.ini"
Global $ApplicationList_Custom_6_INI = $ApplicationList_Folder & "ApplicationList_Custom_6.ini"

Global $default_vrsettings_File = IniRead($Config_INI, "Folders", "Steam_default_vrsettings", "")
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_tools_vrmanifest_File = IniRead($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
Global $Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
Global $Steam_tools_local_backup = $Install_DIR & "Backups\tools.vrmanifest.bak"

Global $OS_Version = @OSVersion
Global $OS_Build = @OSBuild

Global $tempcount = 0
Global $temptest = 20

;Global $ApplicationList_Revive_Apps_INI = $ApplicationList_Folder & "ApplicationList_Oculus_Apps.ini"

If @OSArch = "x64" Then
	Global $Revive_Manifest_Path = RegRead("HKCU64\Software\Revive", "")
	Global $Revive_Injector = $Revive_Manifest_Path & "\Revive\ReviveInjector_x64.exe"
	Global $Steam_Path_REG = RegRead('HKCU64\Software\Valve\Steam\', "SteamPath") & "\"
	Global $Oculus_DIR = RegRead('HKCU64\Software\Oculus VR, LLC\Oculus\Libraries', "DefaultLibrary")
	$Oculus_DIR = RegRead('HKCU64\Software\Oculus VR, LLC\Oculus\Libraries\' & $Oculus_DIR, "Path")
;MsgBox(0, "$Oculus_DIR", $Oculus_DIR)
Else
	Global $Revive_Manifest_Path = RegRead("HKCU\Software\Revive", "")
	Global $Revive_Injector = $Revive_Manifest_Path & "\Revive\ReviveInjector_x86.exe"
	Global $Steam_Path_REG = RegRead('HKCU\Software\Valve\Steam\', "SteamPath") & "\"
EndIf
Global $Revive_Manifest = $Revive_Manifest_Path & "\revive.vrmanifest"
Global $Config_VDF = $Steam_Path_REG & "config\config.vdf"
;Global $Revive_DIR = $Revive_Manifest_Path & "\"


IniWrite($config_ini, "Settings", "Version", $Version)

_First_Start_Empty_Check_1()

#EndRegion


If $First_Start = "true" Then
	MsgBox($MB_ICONWARNING, "Welcome to the Steam Shortcuts Loader.", "This is based on work by CogentRifter and wouldn't exist without it." & @CRLF & _
								"It's a very simplified version of his HomeLoader." & @CRLF & @CRLF & _
								'  Check it out:    https://github.com/CogentHub/HomeLoader' & @CRLF & @CRLF & _
								'The following ReadMe file is available in-program by pressing the"ReadMe" button.')


IniWrite($Config_INI, "Settings", "First_Start", "False")
	If Not FileExists($Steam_tools_local_backup) Then
		FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_local_backup)
	EndIf

$First_Start = False

ShellExecute($First_Read)
EndIf



#region Declare Names
$TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
$TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
$TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
$TAB7_Label = IniRead($Config_INI, "Settings", "TAB7_Name", "")
$TAB8_Label = IniRead($Config_INI, "Settings", "TAB8_Name", "")
$TAB9_Label = IniRead($Config_INI, "Settings", "TAB9_Name", "")
;$TAB10_Label = IniRead($Config_INI, "Settings", "TAB10_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Steam Library"
If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam Files"
If $TAB3_Label = "" Then $TAB3_Label = "Revive Apps"
If $TAB4_Label = "" Then $TAB4_Label = "Favorites"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 2"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 3"
If $TAB7_Label = "" Then $TAB7_Label = "Custom 4"
If $TAB8_Label = "" Then $TAB8_Label = "Custom 5"
If $TAB9_Label = "" Then $TAB9_Label = "Custom 6"
;If $TAB10_Label = "" Then $TAB10_Label = "Custom 7"
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

	_Loading_GUI()

	; Creating the GUI
	$GUI = GUICreate("Steam Games Library", 1015, $DesktopHeight, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_SYSMENU, $WS_EX_CLIENTEDGE))
GUISetBkColor($Background_Main)
	; PROGRESS
	Global $Display_Progressbar_2 = GUICtrlCreateProgress(0, 864, $DesktopWidth + 170, 5)
	Global $Display_Progressbar = GUICtrlCreateProgress(0, 857, $DesktopWidth + 5, 5)

	;Status Bar $Display Statusbar
	Global $Statusbar = _GUICtrlStatusBar_Create($GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'Version " & $Version & "'")

	GUISetState()



	; Top Toolbar

Global $Group_Sort = GUICtrlCreateGroup("Sort by: ", 3, 48, 256, 40, $BS_CENTER)
;GUICtrlSetFont(-1, 6, 400, 7, "Comic Sans MS")
	Global $Button_SortAppId = GUICtrlCreateButton("AppId", 8, 65, 80, 20)
;	_GUICtrlButton_SetImage($Button_Open_Page, $gfx & "OpenPage.bmp")
	GuiCtrlSetTip(-1, "Sort List by AppId:  Toggles Up or Down" & @CRLF & _
					'Note that all Separators will be moved to the top/bottom of the page')
	Global $Button_SortName = GUICtrlCreateButton("Name", 91, 65, 80, 20)
;	_GUICtrlButton_SetImage($Button_Print_GamePage, $gfx & "PrintPage.bmp")
	GuiCtrlSetTip(-1, "Sort List by Name: Toggles Up or Down" & @CRLF & _
					'Note that all Separators will be moved to the top/bottom of the page')
	Global $Button_Drive = GUICtrlCreateButton("Drive", 174, 65, 80, 20)
;	_GUICtrlButton_SetImage($Button_Print_GamePage, $gfx & "PrintPage.bmp")
	GuiCtrlSetTip(-1, "Sort List by Install Drive: Toggles Up or Down" & @CRLF & _
					'Note that all Separators will be moved to the top/bottom of the page')



	Global $SteamHome_Label = GUICtrlCreateLabel("SteamVR Home", 384, 0, 240, 41)
	GUICtrlSetFont(-1, 24, 400, 7, "Comic Sans MS")
	GuiCtrlSetTip(-1, "The program that starts with SteamVR and every time you exit a game or experience in VR" & @CRLF & _
						"Be sure that you change it back to SteamVR before moving or uninstalling this program!")
	Global $Display_WinHome = GUICtrlCreateButton($WinName, 408, 46, 188, 38, $SS_CENTER)
	GUICtrlSetFont(-1, 17, 400, 0, "Comic Sans MS")
	GUICtrlSetBkColor(-1, $Set_HomeColor)
	GuiCtrlSetTip(-1, "-Click to change-")

;	Global $Title = GUICtrlCreateLabel("Games Library", 350, 6, 240, 39)
;	GUICtrlSetFont(-1, 26, 600, 7, "arial")



	Global $Instructions = GUICtrlCreateButton("ReadMe", 771, 58, 125, 29)
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GUICtrlSetColor(-1, $COLOR_RED)
	GuiCtrlSetTip(-1, "Instructions -click me-")

	Global $ButtonCoverLibrary = GUICtrlCreatePic("gfx\ButtonCoverLibrary.bmp", 906, 5, 100, 80) ;unmodified bmp file from http://takegame.com/logical/htm/escaperosecliffisland.htm
	Global $ButtonCoverSteam = GUICtrlCreatePic("gfx\ButtonCoverSteam.bmp", 906, 5, 100, 80) ;10, 5, 100, 80
	Global $ButtonCoverNonSteam = GUICtrlCreatePic("gfx\ButtonCoverNonSteam.bmp", 906, 5, 100, 80)
	Global $ButtonCoverRevive = GUICtrlCreatePic("gfx\ButtonCoverRevive.bmp", 906, 5, 100, 80)

	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 82, 90, 85)
	Global $ButtonTAB_Non_Steam_Appl = GUICtrlCreateButton($TAB2_Label, 167, 90, 85)
	Global $ButtonTAB_Revive_Apps = GUICtrlCreateButton($TAB3_Label, 252, 90, 85)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB4_Label, 337, 90, 85)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB5_Label, 422, 90, 85)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB6_Label, 507, 90, 85)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB7_Label, 592, 90, 85)
	Global $ButtonTAB_Custom_5 = GUICtrlCreateButton($TAB8_Label, 677, 90, 85)
	Global $ButtonTAB_Custom_6 = GUICtrlCreateButton($TAB9_Label, 761, 90, 85)
;	Global $ButtonTAB_Custom_7 = GUICtrlCreateButton($TAB10_Label, 842, 90, 85)

;	Global $Tab_Group = GUICtrlCreateLabel("", 343, 113, 515, 3)
	Global $Tab_Group = GUICtrlCreateLabel("", 340, 113, 592, 3)
	Global $ButtonTAB_ChangeName = GUICtrlCreateButton("Rename Tabs", 848, 90, 85, 23, BitOR($WS_EX_CLIENTEDGE, $BS_CENTER))
	GuiCtrlSetTip(-1, "Rename the six Custom Tabs" & @CRLF & _
					"Note: after you change Tab Labels, go to Settings and recreate your " & @CRLF & _
					"MainPage/StartPage to see your labels on the web page.")

;	Global $Button_Settings = GUICtrlCreateButton("Settings", 938, 20, 64, 66, $BS_BITMAP)
;	_GUICtrlButton_SetImage($Button_Settings, $gfx & "Settings.bmp")
	Global $Button_Settings = GUICtrlCreateButton("Settings", 942, 90, 65, 26, BitOR($WS_EX_CLIENTEDGE, $BS_CENTER))
	GUICtrlSetFont(-1, 11, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Add Steam Library Folders, Change SteamVR Home," & @CRLF & _
					'Change Tab names, Create and open pages to access your Tabs,' & @CRLF & _
					'Create "Singles Page", Restore backups')


	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)
;	GUICtrlSetBkColor($ButtonTAB_Custom_7, $TabGroup_Color)
	GUICtrlSetBkColor($Tab_Group, $TabButton_Color)
	GUICtrlSetBkColor($ButtonTAB_ChangeName, $TabButton_Color)
	GUICtrlSetBkColor($Button_Settings, $Settings_Color)


;  SideBar

Global $Combo_TitleGroup = GUICtrlCreateGroup("", 861, 123, 131, 54)
	Global $Combo_Title = GUICtrlCreateButton("Steam Libraries", 865, 129, 123, 22)
	GUICtrlSetFont(-1, 12, 400, 4, "Comic Sans MS")
	GuiCtrlSetTip(-1, "Click to Add or Delete Steam Libraries")

	Local $ifCount = 1
	Global $Combo_SteamLibrary = GUICtrlCreateCombo("", 878, 152, 100, 24, $CBS_DROPDOWNLIST)
		If FileExists($Install_Folder_Steam_2) Then $ifCount = $ifCount + 1
		If FileExists($Install_Folder_Steam_3) Then $ifCount = $ifCount + 1
		If FileExists($Install_Folder_Steam_4) Then $ifCount = $ifCount + 1
		If FileExists($Install_Folder_Steam_5) Then $ifCount = $ifCount + 1
		If $ifCount = 1 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1", "ALL")
		If $ifCount = 2 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2", "ALL")
		If $ifCount = 3 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3", "ALL")
		If $ifCount = 4 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4", "ALL")
		If $ifCount = 5 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", "ALL")
;	GUICtrlSetData(-1, "ALL|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", $Steam_Library)
	GUICtrlSetFont(-1, 8, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Set Library to be Displayed")



;Global $Library_Setup_Label1 = GUICtrlCreateGroup("Library Setup" , 848, 5, 159, 262)
;GUICtrlSetFont(-1, 11, 600, 0,"Times New Roman")

Global $Library_Setup_Label2 = GUICtrlCreateGroup("Scan for Games" , 850, 184, 159, 131, $BS_CENTER)
GUICtrlSetFont(-1, 11, 600, 0,"Times New Roman")


	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Steam Library", 857, 203, 144, 105, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Scan Steam Libraries." & @CRLF & _
					'Click this when you run the program for the first time or' & @CRLF & _
					'whenever you add new Games to any of your Steam Libraries' & @CRLF)

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 857, 203, 144, 105, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "Add_Games.bmp")
	GuiCtrlSetTip(-1, "Add  individual games, experiences, web pages or files like mp4's to the Games Library" & @CRLF & _
						'If a browser can render it, you can show it')

;	Global $Button_AddFile2Library = GUICtrlCreateButton("Add File to Library", 855, 138, 144, 105, $BS_BITMAP)
;	_GUICtrlButton_SetImage($Button_AddFile2Library, $gfx & "Add_Files.bmp")
;	GuiCtrlSetTip(-1, "Add  videos, pdf's, doc's, web pages or more to the Games Library" & @CRLF & _
;					'If a browser can render it, you can show it')


	Global $Button_Rescan_Revive_Library = GUICtrlCreateButton("Rescan Oculus Library", 857, 203, 144, 105, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Rescan_Revive_Library, $gfx & "ReScan_SteamLibrary1.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Scan Revive Libraries." & @CRLF & _
					'Click this when you run the program for the first time or' & @CRLF & _
					'whenever you add new Games to your Oculus Revive Libraries')

	Global $Placeholder_Group = GUICtrlCreateGroup("" , 850, 180, 159, 150, $BS_CENTER)
	GUICtrlSetFont(-1, 11, 600, 0,"Times New Roman")
	Global $Placeholder_VRGuy = GUICtrlCreateButton("Games Library", 855, 190, 149, 127, $BS_BITMAP)
	_GUICtrlButton_SetImage($Placeholder_VRGuy, $gfx & "VRGuy.bmp")

GUICtrlCreateGroup("Customize Tabs", 850, 322, 159, 144, $BS_CENTER)
GUICtrlSetFont(-1, 11, 600, 0, "Times New Roman")

Global $Customize_Label_1 = GUICtrlCreateLabel("Select your games", 855, 338, 150, 20)
GUICtrlSetFont(-1, 14)
;Global $Customize_Label_2 = GUICtrlCreateLabel("Choose the Tab:", 858, 318, 145, 20)
Global $Customize_Label_2 = GUICtrlCreateLabel("Then", 900, 358, 60, 20)
GUICtrlSetFont(-1, 14)
;Global $Customize_Label_3 = GUICtrlCreateLabel("Tab:", 850, 343, 50, 20)
;GUICtrlSetFont(-1, 14)

Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 871, 379, 115, 15, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label & "|" & $TAB7_Label & "|" & $TAB8_Label & "|" & $TAB9_Label, "")
GUICtrlSetFont(-1, 11, 400, 2, "arial")
GuiCtrlSetTip(-1, "Choose the Tab to add your selected games to")
If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
Else
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
EndIf
Global $Customize_Label_4 = GUICtrlCreateLabel("Then click", 887, 403, 100, 20)
GUICtrlSetFont(-1, 14)
Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 869, 425, 119, 35, $BS_BITMAP)
_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
Else
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
EndIf
GuiCtrlSetTip(-1, "Add your selected games to your Custom TAB")

;	GUICtrlCreateGroup("Create Game Page", 851, 473, 158, 84, $BS_CENTER)
;	GUICtrlSetFont(-1, 11, 600, 0, "Times New Roman")
	Global $Customize_Label_1a = GUICtrlCreateLabel("Select your games", 865, 476, 130, 20)
	GUICtrlSetFont(-1, 12)
	Global $Customize_Label_4a = GUICtrlCreateLabel("Then click", 895, 495, 100, 20)
	GUICtrlSetFont(-1, 12)
	Global $Button_Create_GamePage = GUICtrlCreateButton("Create Game Page", 856, 513, 148, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_GamePage, $gfx & "Create_GamePage.bmp")
	GuiCtrlSetTip(-1, "Create your Game Page!" & @CRLF & _
						"This will create a page of your selected games")

	Global $Button_Open_Page = GUICtrlCreateButton("Open Page", 856, 565, 148, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Open_Page, $gfx & "OpenPage.bmp")
	GuiCtrlSetTip(-1, "Open Page." & @CRLF & _
					'Note that pages created while SteamVR Home is set' & @CRLF & _
					'to VRToolbox will not work outside of VRToolbox')


	Global $Button_Print_GamePage = GUICtrlCreateButton("Print Game Page", 856, 610, 148, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Print_GamePage, $gfx & "PrintPage.bmp")
	GuiCtrlSetTip(-1, "Print your Game Page!" & @CRLF & _
						"This will print a page of your games from the selected Tab using your default printer.")



;Global $Button_Open_Page = GUICtrlCreateButton("OpenPage", 858, 570, 140, 44, $BS_BITMAP)
;	_GUICtrlButton_SetImage($Button_Open_Page, $gfx & "GamePage.bmp")
;	GuiCtrlSetTip(-1, "Open Game Page." & @CRLF & _
;					'Note that pages created while SteamVR Home is set' & @CRLF & _
;					'to VRToolbox will not work outside of VRToolbox')

Global $Button_Master_Page = GUICtrlCreateButton("Open MasterPage", 860, 660, 140, 44, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Master_Page, $gfx & "MasterPage.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Open your MasterPage.")
Global $Button_Start_Page = GUICtrlCreateButton("Open StartPage", 857, 660, 140, 44, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Start_Page, $gfx & "StartPage.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Open your StartPage -Go to Settings to create it")


	Global $Button_Start_SteamVR = GUICtrlCreateButton("Start SteamVR", 861, 720, 138, 55, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Start_SteamVR, $gfx & "steamvr_logo.bmp")
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Starts SteamVR")



;	Global $Button_Restart = GUICtrlCreateButton("Restart", 858, 790, 65, 65, $BS_BITMAP) ;
;	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
;	GuiCtrlSetTip(-1, "Restart")



	Global $Button_Exit = GUICtrlCreateButton("Exit", 932, 792, 67, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GuiCtrlSetTip(-1, "Close")

	$Checkbox_CreatePage = GUICtrlCreateLabel("", 3, 90, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 25, 90, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")




	If $ButtonTAB_State = "1" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
		GUICtrlSetState($Combo_Title, $GUI_SHOW)
		GUICtrlSetState($Tab_Group, $GUI_SHOW)

		GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverSteam, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

;		GUICtrlSetState($TextAnd, $GUI_SHOW)
;		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Placeholder_Group, $GUI_HIDE)
		GUICtrlSetState($Placeholder_VRGuy, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	EndIf
#cs
	If $ButtonTAB_State = "2" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "3" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
GUICtrlSetState($Combo_Title, $GUI_hide)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "4" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
GUICtrlSetState($Combo_Title, $GUI_hide)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
	If $ButtonTAB_State = "5" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Combo_Title, $GUI_hide)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "6" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
GUICtrlSetState($Combo_Title, $GUI_hide)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf

If $ButtonTAB_State = "7" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
		GUICtrlSetState($Combo_Title, $GUI_hide)
		GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
		GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
		GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
		GUICtrlSetState($TextAnd, $GUI_SHOW)
		GUICtrlSetState($TextClick, $GUI_SHOW)
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Cover1, $GUI_SHOW)
EndIf
#ce

	If $WinName = "VR Toolbox" Then
		GUICtrlSetState($Button_Start_Page, $GUI_SHOW)
		GUICtrlSetState($Button_Master_Page, $GUI_HIDE)

	Else
		GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
		GUICtrlSetState($Button_Master_Page, $GUI_SHOW)
	EndIf

	_Create_ListView_1()
	_Create_ListView_2()
	_Create_ListView_3()
	_Create_ListView_4()
	_Create_ListView_5()
	_Create_ListView_6()
	_Create_ListView_7()
	_Create_ListView_8()
	_Create_ListView_9()


	If $ButtonTAB_State = "1" Then GUICtrlSetState($listview, $GUI_SHOW)
	If $ButtonTAB_State = "2" Then GUICtrlSetState($listview_2, $GUI_SHOW)
	If $ButtonTAB_State = "3" Then GUICtrlSetState($listview_3, $GUI_SHOW)
	If $ButtonTAB_State = "4" Then GUICtrlSetState($listview_4, $GUI_SHOW)
	If $ButtonTAB_State = "5" Then GUICtrlSetState($listview_5, $GUI_SHOW)
	If $ButtonTAB_State = "6" Then GUICtrlSetState($listview_6, $GUI_SHOW)
	If $ButtonTAB_State = "7" Then GUICtrlSetState($listview_7, $GUI_SHOW)
	If $ButtonTAB_State = "8" Then GUICtrlSetState($listview_8, $GUI_SHOW)
	If $ButtonTAB_State = "9" Then GUICtrlSetState($listview_9, $GUI_SHOW)



#endregion

;_Loading_GUI()



#Region Function Links

	GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")
;	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Beenden")
;	GUICtrlSetOnEvent($Button_Settings, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Settings, "_Main_Settings")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")
	GUICtrlSetOnEvent($Display_WinHome, "_Main_Settings")
	GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Combo_Title, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Print_GamePage, "_PrintList")
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")
;	GUICtrlSetOnEvent($Change_Tab_Label, "_Label_Form_GUI")
;	GUICtrlSetOnEvent($TVCuts_Page, "_TV_Cuts")
	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")
	GUICtrlSetOnEvent($Button_ReScan_Revive_Library, "_Button_ReScan_Revive_Library")
;	GUICtrlSetOnEvent($Button_WindowsMR, "_WMR_Reg_Op")
	GUICtrlSetOnEvent($Instructions, "_Instructions")
	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Revive_Apps, "_ButtonTAB_Revive_Apps")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2 , "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3 , "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4 , "_ButtonTAB_Custom_4")
	GUICtrlSetOnEvent($ButtonTAB_Custom_5 , "_ButtonTAB_Custom_5")
	GUICtrlSetOnEvent($ButtonTAB_Custom_6 , "_ButtonTAB_Custom_6")
	GUICtrlSetOnEvent($ButtonTAB_ChangeName, "_Label_Form_GUI")
	GUICtrlSetOnEvent($Button_SortAppId, "_SortAppId")
	GUICtrlSetOnEvent($Button_SortName, "_SortName")
	GUICtrlSetOnEvent($Button_Drive, "_SortDrive")
;	GUICtrlSetOnEvent($Button_LightPage, "_Button_Create_GamePage_all")
	GUICtrlSetOnEvent($Button_Start_SteamVR, "_Button_Start_SteamVR")

	GUICtrlSetOnEvent($Button_Master_Page, "_Button_MasterPage")
 	GUICtrlSetOnEvent($Button_Start_Page, "_Button_StartPage")
;	GUICtrlSetOnEvent($Button_Change_StartPage, "_Change_StartPage")
;	GUICtrlSetOnEvent($Button_Create_MasterPage, "_Create_MasterPage")

	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")
	GUICtrlSetOnEvent($Button_Create_GamePage, "_Button_Create_GamePage_selected")
	GUICtrlSetOnEvent($Button_Open_Page, "_Open_Page")
	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")
;	GUICtrlSetOnEvent($Button_Start_VRToolbox, "_Button_Start_VRToolbox")

	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5") ; launch file or program
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")  ; AddSeparator
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")

	GUISetOnEvent($mExit, "_Exit_Main_Settings")
	GUISetOnEvent($mSet_Libraries, "_Settings_GUI")



#endregion

	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	_Read_from_INI_ADD_2_ListView()
	GUICtrlSetData($Display_Progressbar, 0)
	GUIRegisterMsg($WM_notify, "_ClickOnListView")
	GUIDelete($GUI_Loading)

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndIf
;_GUICtrlListView_RegisterSortCallBack($ListView)
;GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

#Region While 1
While 1
	Sleep(100)
;    Global $nMsg = GUIGetMsg()
;    Switch $nMsg
 ;       Case $GUI_EVENT_CLOSE
 ;           Exit
;	EndSwitch
WEnd
#endregion


#Region First Start And Empty Check

Func _First_Start_Empty_Check_1()
;	Global $Install_Folder_Steam_Search_Folder

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	If $Install_Folder_Steam_1 = "" Then
	Global $Steam_CK = False

;Global $Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
	_Steam_Libraries()
		If $Steam_CK Then

;			$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')
;			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Search_Folder & "\")

			$Install_Folder_Steam_Search_Folder = $Steam_Path_REG
			If $Steam_tools_vrmanifest_File = "" Then
				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_Search_Folder & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
				If FileExists($Steam_tools_vrmanifest_File) Then
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
					$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
					If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
				ElseIf FileExists($Install_Folder_Steam_2 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
					$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
					$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
					If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
				ElseIf FileExists($Install_Folder_Steam_3 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
					$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
					$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
					If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
				ElseIf FileExists($Install_Folder_Steam_4 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
					$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
					$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
					If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
				ElseIf FileExists($Install_Folder_Steam_5 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
					$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
					$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
					If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
				Else
					MsgBox($MB_ICONINFORMATION, "SteamVR folder 1", "SteamVR does not appear to be installed." & @CRLF & _
								"Choose the SteamVR folder before continuing." & @CRLF)
					Local $FileSelectFolder = FileSelectFolder("Choose SteamVR folder", "C:\")
					If Not @error Then
						Local $TargetFolder = $FileSelectFolder & "\tools\" & "tools.vrmanifest"
						If FileExists($TargetFolder) Then
							$Steam_tools_vrmanifest_File = $TargetFolder & "\tools\" & "tools.vrmanifest"
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						Else
							MsgBox($MB_ICONINFORMATION, "SteamVR folder", "The file tools.vrmanifest is missing so you will not" & @CRLF & _
								"be able to change VR Home.  Unknown errors may occur.")
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
						EndIf
					Else
						MsgBox($MB_ICONINFORMATION, "SteamVR folder", "The file tools.vrmanifest is missing so you will not" & @CRLF & _
							"be able to change VR Home.  Unknown errors may occur.")
						IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
					EndIf
				EndIf
			EndIf

		Else

#cs			MsgBox($MB_ICONINFORMATION, "Steam folder 2", "Steam does not appear to be installed." & @CRLF & _
							"Choose the Steam folder before continuing." & @CRLF)
			Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", "C:\")
			If Not @error Then
				Local $TargetFolder = $FileSelectFolder & "\steamapps"
				If FileExists($TargetFolder) Then
					IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
					If $Steam_tools_vrmanifest_File = "" Then
						$Steam_tools_vrmanifest_File = $FileSelectFolder & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
						If FileExists($Steam_tools_vrmanifest_File) Then
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						ElseIf FileExists($Install_Folder_Steam_2 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
							$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						ElseIf FileExists($Install_Folder_Steam_3 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
							$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						ElseIf FileExists($Install_Folder_Steam_4 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
							$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						ElseIf FileExists($Install_Folder_Steam_5 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest") Then
							$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "\SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
							IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
							$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
							If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
						Else
							MsgBox($MB_ICONINFORMATION, "SteamVR folder 3", "SteamVR does not appear to be installed." & @CRLF & _
										"Choose the SteamVR folder before continuing." & @CRLF)
							Local $FileSelectFolder = FileSelectFolder("Choose SteamVR folder", "C:\")
							If Not @error Then
								Local $TargetFolder = $FileSelectFolder & "\tools\" & "tools.vrmanifest"
								If FileExists($TargetFolder) Then
									$Steam_tools_vrmanifest_File = $TargetFolder & "\tools\" & "tools.vrmanifest"
									IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
									$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
									If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
								Else
									MsgBox($MB_ICONINFORMATION, "SteamVR folder", "The file tools.vrmanifest is missing so you will not" & @CRLF & _
										"be able to change VR Home.  Unknown errors may occur.")
									IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
								EndIf
							Else
								MsgBox($MB_ICONINFORMATION, "SteamVR folder", "The file tools.vrmanifest is missing so you will not" & @CRLF & _
									"be able to change VR Home.  Unknown errors may occur.")
								IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
							EndIf
						EndIf
					EndIf
				Else
					MsgBox($MB_ICONWARNING, "Attention!", "No Steam Library folder selected." & @CRLF & @CRLF & "Use 'Settings' to enter a Steam path when you have it." & @CRLF & _
					"The correct one will contain the 'SteamApps' folder." & @CRLF & _
					"WARNING: Scanning Steam folders when you don't have Steam installed will cause unknown errors!")
					IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
				EndIf
			Else
#ce


			MsgBox($MB_ICONWARNING, "Attention!", "Steam does not appear to be installed" & @CRLF & @CRLF & "Use 'Settings' to enter a Steam path when you have it." & @CRLF & _
					"The correct one will contain the 'SteamApps' folder." & @CRLF & _
					"WARNING: Scanning Steam folders when you don't have Steam installed will cause unknown errors!")

			IniWrite($config_INI, "Folders", "Install_Folder_Steam_1", "")
			$Install_Folder_Steam_1 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_1, "")
			GUICtrlSetData($Combo_SteamLibrary, "", "")

;			EndIf
		EndIf
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")



	EndIf


;	If $default_vrsettings_File = "" Then
;		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
;		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
;		$default_vrsettings_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
;		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;
;		If Not FileExists($default_vrsettings_File) Then
;			If Not FileExists($default_vrsettings_File) Then
;				$default_vrsettings_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
;				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File & "\")
;				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
;			EndIf
;
;			If Not FileExists($default_vrsettings_File) Then
;				$default_vrsettings_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
;				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
;				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
;			EndIf
;
;			If Not FileExists($default_vrsettings_File) Then
;				$default_vrsettings_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
;				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
;				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
;			EndIf
;
;			If Not FileExists($default_vrsettings_File) Then
;				$default_vrsettings_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
;				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
;				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
;			EndIf
;
;			If Not FileExists($default_vrsettings_File) Then
;				$default_vrsettings_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\resources\settings\default.vrsettings"
;				$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
;				$default_vrsettings_File_new = $default_vrsettings_File & ".new"
;				If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
;				If Not FileExists($default_vrsettings_File_BAK) Then FileCopy($default_vrsettings_File, $default_vrsettings_File_BAK)
;			EndIf
;
;			If Not FileExists($default_vrsettings_File) Then
;				MsgBox($MB_ICONINFORMATION, "Default.vrsettings File", "Default.vrsettings File not found." & @CRLF & _
;					"Choose the File before continuing." & @CRLF)
;
;				Local $FileSelect = FileOpenDialog("Default.vrsettings File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
;				If $FileSelect <> "" Then
;					IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $FileSelect)
;				Else
;					MsgBox($MB_ICONWARNING, "Attention!", "Default.vrsettings File" & @CRLF & @CRLF & "Search for the File and manually write the path in the config.ini file or try again.")
;					IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
;;					_Restart()
;				EndIf
;			EndIf
;		EndIf
;	EndIf


;	If $Steam_tools_vrmanifest_File = "" Then
;		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
;		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\') & "\"
;
;		$Steam_tools_vrmanifest_File = $Install_Folder_Steam_Search_Folder & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;
;		If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;		$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;
;		If Not FileExists($Steam_tools_vrmanifest_File) Then
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
;			EndIf
;
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
;			EndIf
;
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
;			EndIf
;
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
;			EndIf
;
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				$Steam_tools_vrmanifest_File = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\tools\" & "tools.vrmanifest"
;				$Steam_tools_vrmanifest_File_BAK = $Steam_tools_vrmanifest_File & ".bak"
;				If FileExists($Steam_tools_vrmanifest_File) Then IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $Steam_tools_vrmanifest_File)
;				If Not FileExists($Steam_tools_vrmanifest_File_BAK) Then FileCopy($Steam_tools_vrmanifest_File, $Steam_tools_vrmanifest_File_BAK)
;			EndIf
;
;			If Not FileExists($Steam_tools_vrmanifest_File) Then
;				MsgBox($MB_ICONINFORMATION, "Tools.vrmanifest File", "Tools.vrmanifest File not found." & @CRLF & _
;					"Choose the File before continuing." & @CRLF)
;
;				Local $FileSelect = FileOpenDialog("Tools.vrmanifest File", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
;				If $FileSelect <> "" Then
;					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", $FileSelect)
;				Else
;					MsgBox($MB_ICONWARNING, "Attention!", "Tools.vrmanifest File" & @CRLF & @CRLF & "Search for the File and manually write the path in the config.ini file or try again.")
;					IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")
;					_Restart()
;				EndIf
;			EndIf
;		EndIf
;	EndIf




EndFunc
#endregion



#Region  Functions



#Region Func Main

Func _Loading_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000
$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, -1, 400, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
;	$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, ($DesktopWidth / 2) - 152, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
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

Func _Scanning_GUI()
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000
$GUI_Scanning = GUICreate("Scanning...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
;	$GUI_Scanning = GUICreate("Scanning...please wait...", 250, 65, ($DesktopWidth / 2) - 152, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_scanning)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Scanning...", 66, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Scanning)
	WinSetOnTop("Scanning...please wait...", "", $WINDOWS_ONTOP)
EndFunc



Func _Main_Settings()
;	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
If Not WinExists("MainSettings") Then
	If @OSBuild >= 17000 Then
		If IsAdmin() Then
			$Test_Message = "Your Windows Build is new enough, and you have admin rights"
			$Test_Message2 = "You can write the Key."
			$TM = "Yes"
		Else
			$Test_Message = "Your Windows Build is new enough, but you don't have the needed" & @CRLF & "rights to write the Key.  Please restart Program in Admin mode."
			$TM ="No"
		EndIf
	Else
		$Test_Message = "Sorry, your Windows Build is not new enough to support the Key." & @CRLF & "Please update Windows10 to the Spring 2018 Build or newer."
		$TM = "Nope"
	EndIf
	$Form_MainSettings = GUICreate("MainSettings", 630, 550, -1, -1)
	GUISetFont(10, 400, 0, "Comic Sans MS")
	$mSettings = GUICtrlCreateLabel("Settings", 240, 16, 143, 53, $SS_CENTER)
	GUICtrlSetFont(-1, 26, 400, 4, "Comic Sans MS")


	$mSteam1 = GUICtrlCreateLabel("SteamVR", 48, 90, 78, 30)
	GUICtrlSetFont(-1, 13, 400, 0, "Comic Sans MS")
	GuiCtrlSetTip(-1, "Change your SteamVR Home.  Note that" & @CRLF & _
						  'you must be using SteamVR beta.')
	$mSteam1a = GUICtrlCreateLabel("Home", 65, 110, 60, 30)
	GUICtrlSetFont(-1, 13, 400, 0, "Comic Sans MS")
	$mSteam1b = GUICtrlCreateLabel(":", 130, 93, 20, 30)
	GUICtrlSetFont(-1, 20, 400, 0, "Comic Sans MS")

	Global $Combo_SteamVR_Home = GUICtrlCreateCombo($WinName, 158, 98, 160, 40, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "SteamVR|VR Toolbox|Virtual Desktop|BigScreen|Other")
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	GuiCtrlSetTip(-1, "Make sure that you switch back to SteamVR BEFORE" & @CRLF & _
						  'you move or delete the program!')
	GUICtrlSetOnEvent($Combo_SteamVR_Home, "_DropDown_Home")

;	$mSteam = GUICtrlCreateLabel("Steam:", 325, 100, 66, 30, $SS_CENTER)
;	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	$mSet_Libraries = GUICtrlCreateButton("Set Steam Libraries", 390, 93, 137, 41)
	GUICtrlSetOnEvent($mSet_Libraries, "_Settings_GUI")
	GuiCtrlSetTip(-1, "Set Steam Library Folders" & @CRLF & _
					'Click this when you run the program for the first time or' & @CRLF & _
					'whenever you add a new Drive or Directory to your Steam Library')


	$mLabel_WMR = GUICtrlCreateLabel("WMR:", 56, 173, 58, 30)
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	GuiCtrlSetTip(-1, "To enable MS Edge to launch Steam Games from within VR" & @CRLF & _
					'you must write a MS supplied Registry Key to your Windows Registry.' & @CRLF & _
					'To do this, you must be running this program in Admin mode.')
	If $TM = "Yes" Then
		$mWrite_Key = GUICtrlCreateButton("Write Registy Key", 128, 175, 137, 41)
		GUICtrlSetOnEvent($mWrite_Key, "_WMR_Reg_Op")
		$mLabel_WMR1 = GUICtrlCreateLabel($Test_Message, 128, 147, 450, 20, $SS_CENTER)
		GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
		$mLabel2_WMR1 = GUICtrlCreateLabel($Test_Message2, 320, 175, 400, 30)
		GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
	ElseIf $TM = "Nope" Then
		$mLabel_WMR1 = GUICtrlCreateLabel($Test_Message, 110, 160, 500, 60, $SS_CENTER)
		GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
	Else
		$mLabel_WMR1 = GUICtrlCreateLabel($Test_Message, 110, 160, 500, 60, $SS_CENTER)
		GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
	EndIf

	$mLabel_Access = GUICtrlCreateLabel("To Access a webpage containing shortcuts to all of your tabs", 65, 230, 500, 30)
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	$mLabel_Access_Create = GUICtrlCreateLabel("Create/Reset it", 140, 255, 120, 30)
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	$mLabel_Access_Open = GUICtrlCreateLabel("Then Open it*", 340, 255, 120, 30)
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")

		$mSet_PageVRTbx = GUICtrlCreateButton("Change Start Page", 128, 281, 137, 41)
		GUICtrlSetOnEvent(-1, "_Change_StartPage")
		GuiCtrlSetTip(-1, "This replaces the StartPage in VRToolbox," & @CRLF & _
						'providing access to your new Game Pages' & @CRLF & _
						'in VR. See "ReadMe" for more detail.')
		$mOpen_PageVRTbx = GUICtrlCreateButton("Open Start Page", 328, 281, 145, 41)
		GUICtrlSetOnEvent(-1, "_Button_StartPage")
		GuiCtrlSetTip(-1, "Opens your Start Page")

		$mLabel_Restore = GUICtrlCreateLabel("Restore VR Toolbox StartPage", 170, 445, 500, 30)
		GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
		$mRestore_StartPage = GUICtrlCreateButton("Restore", 255, 470, 80, 36)
		GUICtrlSetOnEvent(-1, "_Restore_StartPage")
		GuiCtrlSetTip(-1, "Restores the VR Toolbox StartPage")

		$mSet_Page = GUICtrlCreateButton("Create Main Page", 128, 281, 137, 41)
		GUICtrlSetOnEvent(-1, "_Create_MasterPage")
		GuiCtrlSetTip(-1, "This Creates a 'Main Page' that has links" & @CRLF & _
						'to your new Game Pages and more.' & @CRLF & _
						'Note that this will overwrite any existing' & @CRLF & _
						'copies, effectively reseting the page.' & @CRLF & _
						'See "ReadMe" for more detail.')
		$mOpen_Page = GUICtrlCreateButton("Open Main Page", 328, 281, 137, 41)
		GUICtrlSetOnEvent(-1, "_Button_MasterPage")
		GuiCtrlSetTip(-1, "Opens your Main Page")

	If $WinName = "VR Toolbox" Then
		GUICtrlSetState($mSet_PageVRTbx, $GUI_SHOW)
		GUICtrlSetState($mSet_Page, $GUI_HIDE)
		GUICtrlSetState($mOpen_PageVRTbx, $GUI_SHOW)
		GUICtrlSetState($mOpen_Page, $GUI_HIDE)
		GUICtrlSetState($mLabel_Restore, $GUI_SHOW)
		GUICtrlSetState($mRestore_StartPage, $GUI_SHOW)
	Else
		GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
		GUICtrlSetState($mSet_Page, $GUI_SHOW)
		GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
		GUICtrlSetState($mOpen_Page, $GUI_SHOW)
		GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
		GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	EndIf


	$mLabel_Change_Labels = GUICtrlCreateButton("Change Tab Labels", 128, 382, 137, 41)
	GUICtrlSetFont(-1, 10, 400, 0, "Comic Sans MS")
	GuiCtrlSetTip(-1, "Click to change the names of the last 6 Tabs")
	GUICtrlSetOnEvent($mLabel_Change_Labels, "_Label_Form_GUI")

	$mLabel_TVCuts_Tooltip = GUICtrlCreateButton("Create Singles Page", 328, 382, 137, 41)
;	$mLabel_TVCuts = GUICtrlCreateLabel("Creates a Page of Individual Shortcuts to be used" & ' with objects to create "Object Shortcuts."', 240, 345, 320, 80)
	GUICtrlSetFont(-1, 10, 400, 0, "Comic Sans MS")
	GuiCtrlSetTip(-1, "Creates a Page of Individual Shortcuts to be" & @CRLF & 'used with objects to create "Object Shortcuts"' & @CRLF & '	See "ReadMe" for more detail.')
;	$mLabel_TVCut1s = GUICtrlCreateLabel('See "ReadMe" for more detail.', 270, 380, 280, 80)
	GUICtrlSetFont(-1, 10, 400, 0, "Comic Sans MS")
	GUICtrlSetOnEvent($mLabel_TVCuts_Tooltip, "_TV_Cuts")
	$mLabel_Access_Note = GUICtrlCreateLabel("*Note that you can open your Page from the main window as well", 20, 525, 600, 30)
	GUICtrlSetFont(-1, 14, 400, 0, "Comic Sans MS")
	Global $mExit = GUICtrlCreateButton("Exit", 562, 484, 67, 65, $BS_BITMAP)
	GuiCtrlSetTip(-1, "Close")
	_GUICtrlButton_SetImage($mExit, $gfx & "Exit.bmp")
	GUICtrlSetOnEvent(-1, "_Exit_Main_Settings")
	GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit_Main_Settings")
	GUISetState()
Else
	WinActivate("MainSettings")
EndIf

EndFunc

Func _Exit_Main_Settings()
	GUIDelete($Form_MainSettings)
EndFunc

Func _DropDown_Home()
	$VRhome =  GUICtrlRead($Combo_SteamVR_Home)
	GUICtrlSetData($Display_WinHome, $VRhome)
	If $VRhome = "SteamVR" Then	_Radio_1()
	If $VRhome = "VR Toolbox" Then _Radio_2()
	If $VRhome = "Virtual Desktop" Then	_Radio_3()
	If $VRhome = "BigScreen" Then _Radio_4()
	If $VRhome = "Other" Then _Radio_5()
;	$VRhome = IniRead($config_ini, "Settings_HomeAPP", "WindowName", "")

EndFunc

Func _Restore_StartPage()
	$StartPage_DIR_Full = IniRead($Config_INI, "Folders", "VRToolbox_utils_Folder", "")
	$StartPage_BAK = $StartPage_DIR_Full & "StartPage.BAK"
	$StartPage_DIR_File = $StartPage_DIR_Full & "StartPage.html"
	If FileExists($StartPage_BAK) Then
		If FileExists($StartPage_DIR_File) Then
			FileCopy($StartPage_BAK, $StartPage_DIR_File, $FC_OVERWRITE)
			MsgBox(1, "Success", "File copied successfully.")
		Else
			MsgBox(48, "Whoops!", "Something went wrong!  Did you create the StartPage?" & @CRLF & _
								"There was no StartPage file so no files were created or changed!")
		EndIf
	Else
		MsgBox(48, "Whoops!", "Something went wrong! There was no backup file so no files were created or changed!")
	EndIf
EndFunc

Func _PrintList()


	Local $Config = $config_ini
	Local $SoD_Total = 8
	Local $TabName_Total = 17

	Local $TabState = IniRead($Config, "Settings", "ButtonTAB_State", "")
	If $TabState = 1 Then
		Local $Steam_Library = GUICtrlRead($Combo_SteamLibrary)
		If $Steam_Library = "All" Then
			$TabName = "Steam Library All"
			$AppList = $ApplicationList_SteamLibrary_ALL_INI
		ElseIf $Steam_Library = "Steam Library 1" Then
			$TabName = "Steam Library 1"
			$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		ElseIf $Steam_Library = "Steam Library 2" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
				$TabName = "Steam Library 2"
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Printing.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 3" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
				$TabName = "Steam Library 3"
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Printing.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 4" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
				$TabName = "Steam Library 4"
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Printing.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 5" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
				$TabName = "Steam Library 5"
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Printing.")
				Return
			EndIf
		Else
			$TabName = "Steam Library All"
			$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf
	ElseIf $TabState = 2 Then
		If FileExists($ApplicationList_Non_Steam_Appl_INI) Then
			$TabName = "Non-Steam Library"
			$AppList = $ApplicationList_Non_Steam_Appl_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 3 Then
		If FileExists($ApplicationList_Revive_Apps_INI) Then
			$TabName = "Revive Library"
			$AppList = $ApplicationList_Revive_Apps_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 4 Then
		If FileExists($ApplicationList_Custom_1_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB4_Name", "")
			$AppList = $ApplicationList_Custom_1_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 5 Then
		If FileExists($ApplicationList_Custom_2_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB5_Name", "")
			$AppList = $ApplicationList_Custom_2_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 6 Then
		If FileExists($ApplicationList_Custom_3_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB6_Name", "")
			$AppList = $ApplicationList_Custom_3_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 7 Then
		If FileExists($ApplicationList_Custom_4_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB7_Name", "")
			$AppList = $ApplicationList_Custom_4_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 8 Then
		If FileExists($ApplicationList_Custom_5_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB8_Name", "")
			$AppList = $ApplicationList_Custom_5_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	ElseIf $TabState = 9 Then
		If FileExists($ApplicationList_Custom_6_INI) Then
			$TabName = IniRead($Config, "Settings", "TAB9_Name", "")
			$AppList = $ApplicationList_Custom_6_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Printing.")
			Return
		EndIf
	Else
		MsgBox(16, "Error", "Error getting Tab, maybe missing config.ini file!")
		Return
	EndIf

	Local $NbrApps = IniRead($AppList, "ApplicationList", "NR_Applications", "")
	Local $TabName_len = StringLen($TabName)
	If $TabName_len < 18 Then
		$TabName_len = $TabName_Total - $TabName_len
		$TabName = $TabName & " "
		For $d = 1 to $TabName_len
			$TabName = $TabName & "-"
		Next
	Else
		$TabName = StringTrimRight($TabName, $TabName_len - $TabName_Total)
	EndIf

    $hGui = GUICreate("IniList", 720, 550, -1, -1)
    $hRichEdit = _GUICtrlRichEdit_Create($hGui, ""& @LF, 10, 10, 650, 490)

	_GUICtrlRichEdit_SetFont($hRichEdit, $Font_Title_Size, $Font_Title)
	$cTabName = _GUICtrlRichEdit_InsertText($hRichEdit, " " & "---------------- " & $TabName & "--------------")
	_GUICtrlRichEdit_InsertText($hRichEdit, @LF)
	_GUICtrlRichEdit_SetCharAttributes($hRichEdit, "+un")
	_GUICtrlRichEdit_SetFont($hRichEdit, $Font_Header_Size, $Font_Header)
	_GUICtrlRichEdit_InsertText($hRichEdit, "Name  " & @TAB & @TAB & @TAB & @TAB& @TAB & @TAB & @TAB & "     Drive" & "    Size")
	_GUICtrlRichEdit_InsertText($hRichEdit, @LF)
	_GUICtrlRichEdit_SetCharAttributes($hRichEdit, "-un")
	_GUICtrlRichEdit_SetFont($hRichEdit, $Font_Name_Size, $Font_Name)

	For $a = 1 to $NbrApps
		Local $FileType_Sep = IniRead($AppList, "Application_" & $a, "FileType", "")
		Local $Name = IniRead($AppList, "Application_" & $a, "name", "")
		Local $Install_Drive = IniRead($AppList, "Application_" & $a, "InstallDrive", "")
		Local $SoD = IniRead($AppList, "Application_" & $a, "SizeOnDisk", "")
		If $FileType_Sep = "Separator" Then
			$SoD = StringTrimLeft($SoD, 10)
			$Install_Drive = StringTrimRight($Install_Drive, 1)
			$Name = @LF & StringTrimLeft($Name, 5)
		EndIf
		$SoD = StringReplace($SoD, " ", "")
		Local $Name_len = StringLen($Name)
		Local $SoD_len = StringLen($SoD)
		If $Name_len < 43 Then
			$Name_len = $Name_Total - $Name_len
			If $FileType_Sep = "Separator" Then
				For $b = 1 to $Name_len
					$Name = $Name & " "
				Next
			Else
				For $b = 1 to $Name_len
					$Name = $Name & "."
				Next
			EndIf
		Else
			$Name = StringTrimRight($Name, $Name_len - ($Name_Total - 1)) & "-"
		EndIf
		$SoD_len = $SoD_Total - $SoD_len
		For $c = 1 to $SoD_len
			$SoD = " " & $SoD
		Next

		$cName = _GUICtrlRichEdit_AppendText($hRichEdit, $Name & " ")
		$cInstallDrive = _GUICtrlRichEdit_AppendText($hRichEdit, $Install_Drive & " ")
		$cSoD = _GUICtrlRichEdit_InsertText($hRichEdit, $SoD)
		_GUICtrlRichEdit_InsertText($hRichEdit, @LF)

	Next
	Local $tempFile = _TempFile(@ScriptDir & "\", Default, ".rtf")
	_GUICtrlRichEdit_Deselect($hRichEdit)
	_GUICtrlRichEdit_StreamToFile($hRichEdit, $tempFile)

_FilePrint($tempFile)
_GUICtrlRichEdit_Destroy($hRichEdit)
GUIDelete($hGui)
Sleep(800)
FileDelete($tempFile)

EndFunc

Func _SortName()
Local $TabState = IniRead($config_ini, "Settings", "ButtonTAB_State", "")
	If $TabState = 1 Then
		$listview_Temp = $listview
		$ListView_ImageList_Temp = $ListView_Favorite_Image
		Local $Steam_Library = GUICtrlRead($Combo_SteamLibrary)
		If $Steam_Library = "All" Then
			$AppList = $ApplicationList_SteamLibrary_ALL_INI
		ElseIf $Steam_Library = "Steam Library 1" Then
			$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		ElseIf $Steam_Library = "Steam Library 2" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Sorting.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 3" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Sorting.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 4" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Sorting.")
				Return
			EndIf
		ElseIf $Steam_Library = "Steam Library 5" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
				$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
			Else
				MsgBox(16, "Missing Library", "Add the Library before Sorting.")
				Return
			EndIf
		Else
			$TabName = "Steam Library All"
			$AppList = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf
	ElseIf $TabState = 2 Then
		$listview_Temp = $listview_2
		$ListView_ImageList_Temp = $ListView_Favorite_Image_2
		If FileExists($ApplicationList_Non_Steam_Appl_INI) Then
			$AppList = $ApplicationList_Non_Steam_Appl_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 3 Then
		$listview_Temp = $listview_3
		$ListView_ImageList_Temp = $ListView_Favorite_Image_3
		If FileExists($ApplicationList_Revive_Apps_INI) Then
			$AppList = $ApplicationList_Revive_Apps_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 4 Then
		$listview_Temp = $listview_4
		$ListView_ImageList_Temp = $ListView_Favorite_Image_4
		If FileExists($ApplicationList_Custom_1_INI) Then
			$AppList = $ApplicationList_Custom_1_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 5 Then
		$listview_Temp = $listview_5
		$ListView_ImageList_Temp = $ListView_Favorite_Image_5
		If FileExists($ApplicationList_Custom_2_INI) Then
			$AppList = $ApplicationList_Custom_2_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 6 Then
		$listview_Temp = $listview_6
		$ListView_ImageList_Temp = $ListView_Favorite_Image_6
		If FileExists($ApplicationList_Custom_3_INI) Then
			$AppList = $ApplicationList_Custom_3_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 7 Then
		$listview_Temp = $listview_7
		$ListView_ImageList_Temp = $ListView_Favorite_Image_7
		If FileExists($ApplicationList_Custom_4_INI) Then
			$AppList = $ApplicationList_Custom_4_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 8 Then
		$listview_Temp = $listview_8
		$ListView_ImageList_Temp = $ListView_Favorite_Image_8
		If FileExists($ApplicationList_Custom_5_INI) Then
			$AppList = $ApplicationList_Custom_5_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	ElseIf $TabState = 9 Then
		$listview_Temp = $listview_9
		$ListView_ImageList_Temp = $ListView_Favorite_Image_9
		If FileExists($ApplicationList_Custom_6_INI) Then
			$AppList = $ApplicationList_Custom_6_INI
		Else
			MsgBox(16, "Missing Library", "Add the Library before Sorting.")
			Return
		EndIf
	Else
		MsgBox(16, "Error", "Error!")
		Return
	EndIf

	Local $ini_Total = IniRead($Applist, "ApplicationList", "NR_Applications", "")
	Local $Array_List[0][6]; = [['appid', 'name', 'FileType', 'InstallDrive', 'SizeOnDisk', 'IconPath']]

	For $a = 1 To $ini_Total
		$aAppId = IniRead($Applist, "Application_" & $a, "appid", "")
		$aName = IniRead($Applist, "Application_" & $a, "name", "")
		$aFileType = IniRead($Applist, "Application_" & $a, "FileType", "")
		$aInstallDrive = IniRead($Applist, "Application_" & $a, "InstallDrive", "")
		$aSoD = IniRead($Applist, "Application_" & $a, "SizeOnDisk", "")
		$aIconPath = IniRead($Applist, "Application_" & $a, "IconPath", "")
		$aLineString = $aAppId & "|" & $aName & "|" & $aFileType & "|" & $aInstallDrive & "|" & $aSoD & "|" & $aIconPath
		_ArrayAdd($Array_List, $aLineString, 0, "|")
	Next

	If $Sort = 1 Then
		If $Sort_Drive Then
			_ArraySort($Array_List, 0, 0, 0, 3)
			$Sort_Drive = False
			$Sort = 0
		ElseIf $Sort_AppId Then
			_ArraySort($Array_List, 0, 0, 0, 0)
			$Sort_AppId = False
			$Sort = 0
		Else
			_ArraySort($Array_List, 0, 0, 0, 1)
			$Sort = 0
		EndIf
	Else
		If $Sort_Drive Then
			_ArraySort($Array_List, 1, 0, 0, 3)
			$Sort_Drive = False
			$Sort = 1
		ElseIf $Sort_AppId Then
			_ArraySort($Array_List, 1, 0, 0, 0)
			$Sort_AppId = False
			$Sort = 1
		Else
			_ArraySort($Array_List, 1, 0, 0, 1)
			$Sort = 1
		EndIf
	EndIf
	;_ArrayDisplay($Array_List)
	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	_GUIImageList_Destroy($ListView_ImageList_Temp)


	$ListView_ImageList_Temp = _GUIImageList_Create(30, 30)
	Local $count = 1
	For $b = 0 To $ini_Total - 1
		If $count < $ini_Total + 1 Then

;
				$AppId = $Array_List[$b][0]
				$Name = $Array_List[$b][1]
				$FileType = $Array_List[$b][2]
				$Install_Drive = $Array_List[$b][3]
				$SoD = $Array_List[$b][4]
			_GUICtrlListView_AddItem($listview_Temp, "", $b)
			If $FileType = "Separator" Then
				_GUICtrlListView_AddSubItem($listview_Temp, $b, "", 1)
			Else
				_GUICtrlListView_AddSubItem($listview_Temp, $b, $AppId, 1)
			EndIf
			_GUICtrlListView_AddSubItem($listview_Temp, $b, $Name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $b, $Install_Drive, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $b, $SoD, 4)
			Global $tempPic = $Steam32_Icons & $AppId & ".bmp"
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $tempPic)
			IniWrite($AppList, "Application_" & $b+1, "appid", $AppId)
			IniWrite($AppList, "Application_" & $b+1, "name", $Name)
			IniWrite($AppList, "Application_" & $b+1, "FileType", $FileType)
			IniWrite($AppList, "Application_" & $b+1, "InstallDrive", $Install_Drive)
			IniWrite($AppList, "Application_" & $b+1, "SizeOnDisk", $SoD)
			IniWrite($AppList, "Application_" & $b+1, "installdir", "")
			IniWrite($AppList, "Application_" & $b+1, "IconPath", $tempPic)
			$count = $count + 1
		EndIf
	Next
_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
_GUICtrlListView_EndUpdate($listview_Temp)

;$AppList = ""
;$TabState = ""
EndFunc

Func _SortAppId()
	$Sort_AppId = True
	_SortName()
EndFunc

Func _SortDrive()
	$Sort_Drive = True
	_SortName()
EndFunc



Func _Radio_1() ; SteamVR Home
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/250820")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "SteamVR")
;	$otherName = "Other: "
;	GUICtrlSetData($_Radio_5, $otherName)
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mSet_Page, $GUI_SHOW)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mOpen_Page, $GUI_SHOW)
	GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
	GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
;	GUICtrlSetState($TextGamePages, $GUI_HIDE)
;	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
;	GUICtrlSetState($TVCuts_Page, $GUI_SHOW)
;	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
;	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
;	GUICtrlSetState($TextAndMore, $GUI_SHOW)
;	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_2() ; VR Toolbox
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/488040")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "VR Toolbox")

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	GUICtrlSetState($mSet_PageVRTbx, $GUI_SHOW)
	GUICtrlSetState($mSet_Page, $GUI_HIDE)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_SHOW)
	GUICtrlSetState($mOpen_Page, $GUI_HIDE)
	GUICtrlSetState($mLabel_Restore, $GUI_SHOW)
	GUICtrlSetState($mRestore_StartPage, $GUI_SHOW)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
;	GUICtrlSetState($TextGamePages, $GUI_SHOW)
;	GUICtrlSetState($TextVRToolbox, $GUI_SHOW)
;	GUICtrlSetState($TVCuts_Page, $GUI_SHOW)
;	GUICtrlSetState($Button_Change_StartPage, $GUI_SHOW)
	GUICtrlSetState($Button_Start_Page, $GUI_SHOW)
;	GUICtrlSetState($TextGamePages1, $GUI_HIDE)
;	GUICtrlSetState($TextAndMore, $GUI_HIDE)
;	GUICtrlSetState($Button_Create_MasterPage, $GUI_HIDE)
	GUICtrlSetState($Button_Master_Page, $GUI_HIDE)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_3() ; Virtual Desktop
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/382110")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "Virtual Desktop")

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mSet_Page, $GUI_SHOW)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mOpen_Page, $GUI_SHOW)
	GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
	GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
;	GUICtrlSetState($TextGamePages, $GUI_HIDE)
;	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
;	GUICtrlSetState($TVCuts_Page, $GUI_HIDE)
;	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
;	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
;	GUICtrlSetState($TextAndMore, $GUI_SHOW)
;	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_4() ; BigScreen
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/457550")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "BigScreen")

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mSet_Page, $GUI_SHOW)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mOpen_Page, $GUI_SHOW)
	GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
	GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
;	GUICtrlSetState($TextGamePages, $GUI_HIDE)
;	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
;	GUICtrlSetState($TVCuts_Page, $GUI_HIDE)
;	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
;	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
;	GUICtrlSetState($TextAndMore, $GUI_SHOW)
;	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc

Func _Radio_5() ; Other


	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

	_Other_HomeGUI()
	GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mSet_Page, $GUI_SHOW)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mOpen_Page, $GUI_SHOW)
	GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
	GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
;	GUICtrlSetState($TextGamePages, $GUI_HIDE)
;	GUICtrlSetState($TextVRToolbox, $GUI_HIDE)
;	GUICtrlSetState($TVCuts_Page, $GUI_HIDE)
;	GUICtrlSetState($Button_Change_StartPage, $GUI_HIDE)
	GUICtrlSetState($Button_Start_Page, $GUI_HIDE)
;	GUICtrlSetState($TextGamePages1, $GUI_SHOW)
;	GUICtrlSetState($TextAndMore, $GUI_SHOW)
;	GUICtrlSetState($Button_Create_MasterPage, $GUI_SHOW)
	GUICtrlSetState($Button_Master_Page, $GUI_SHOW)

	_Change_SteamVR_Home_default()
EndFunc


Func _Radio_6() ; Janus
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", "steam://rungameid/602090")
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "JanusVR")
	IniWrite($config_ini, "Settings", "ChangeDefaultSteamVRHome", "true")
	IniWrite($config_ini, "Settings", "Reload_HOMEonExit", "false")

	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	GUICtrlSetState($mSet_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mSet_Page, $GUI_SHOW)
	GUICtrlSetState($mOpen_PageVRTbx, $GUI_HIDE)
	GUICtrlSetState($mOpen_Page, $GUI_SHOW)
	GUICtrlSetState($mLabel_Restore, $GUI_HIDE)
	GUICtrlSetState($mRestore_StartPage, $GUI_HIDE)
	If $ButtonTAB_State = 1 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 2 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	ElseIf $ButtonTAB_State = 3 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
;		GUICtrlSetState($Cover1, $GUI_HIDE)
	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
	EndIf
;	ElseIf $ButtonTAB_State = 5 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	ElseIf $ButtonTAB_State = 6 Then
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	Else
;		GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
;		GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)
;		GUICtrlSetState($Button_Settings, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;		GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
;		GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
;		GUICtrlSetState($Cover1, $GUI_SHOW)
;	EndIf
	_Change_SteamVR_Home_default()
EndFunc



#cs
Func _WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iCode, $tNMHDR, $hWndListView, $hWndListView2
MsgBox(0, "", "jjooij")
	$hWndListView = $ListView
;	$hWndListView2 = $g_idListView2
	If Not IsHWnd($ListView) Then $hWndListView = GUICtrlGetHandle($ListView)
;	If Not IsHWnd($g_idListView2) Then $hWndListView2 = GUICtrlGetHandle($g_idListView2)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")

	Switch $hWndFrom
		Case $hWndListView, $hWndListView2
			Switch $iCode
				Case $LVN_COLUMNCLICK ; A column was clicked
					Local $tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)

					; Kick off the sort callback
					_GUICtrlListView_SortItems($hWndFrom, DllStructGetData($tInfo, "SubItem"))
					; No return value
			EndSwitch
	EndSwitch
	Return $__LISTVIEWCONSTANT_GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
#ce


Func _WMR_Reg_Op()

Local $TextKey1, $TextKey2, $ButtonOver, $ButtonDel, $WriteDelGUI, $TimerMsg, $RegWrite, $RegWrite2, $Holo_Proto_REG, $Holo_Proto_DEL, $tempholder


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

Func _Other_HomeGUI()
	$font_arial = "arial"
	Global $Add_Other_GUI = GUICreate("Add Home App", 315, 165 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	GUICtrlCreateGroup("Choose new Home app", 5, 5, 305, 115)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 14, 400, 6, $font_arial)

	GUICtrlCreateLabel("Steam App:", 10, 40, 170, 25)
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	Global $DROPDOWN_Other_GUI = GUICtrlCreateCombo("Choose Application", 100, 39, 203, 35)
	GUICtrlSetOnEvent(- 1, "_DROPDOWN_Other_GUI")
	_DropDown_Data_Other_HomeGUI()
	GUICtrlSetFont(-1, 10, 400, 2, "arial")

	GUICtrlCreateLabel("Game Path:", 10, 82, 115, 25)
	GUICtrlSetFont(-1, 12, 400, 1, $font_arial)
	Global $BUTTON_GamePath_Folder_Other_GUI = GUICtrlCreateButton("Select File", 100, 76, 205, 30, 0)
	GUICtrlSetOnEvent(- 1, "_GamePath_Other_HomeGUI")
	GUICtrlSetFont(-1, 9, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File.")

	Global $Button_Exit_Add_Other_GUI = GUICtrlCreateButton("Exit", 275, 125, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Other_HomeGUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
EndFunc

Func _DropDown_Data_Other_HomeGUI()
	Global $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Global $DROPDOWN_DATA =  ""
	For $NR = 1 To $NR_Applications
		Global $Application_NR = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR + 1, "name", "")

		If $Application_appid <> "" Then
			If $NR = 1 Then
				$DROPDOWN_DATA = $Application_name & " [" & $Application_appid & "]"
			Else
				$DROPDOWN_DATA = $DROPDOWN_DATA & "|" & $Application_name & " [" & $Application_appid & "]"
			EndIf
		EndIf
	Next
	GUICtrlSetData($DROPDOWN_Other_GUI, $DROPDOWN_DATA, "Choose Application")
EndFunc

Func _DROPDOWN_Other_GUI() ; Other GUI DropDown
	$DROPDOWN = GUICtrlRead($DROPDOWN_Other_GUI)
	Local $StringSplit = StringSplit($DROPDOWN, '[')
	Local $SteamStartURL = "steam://rungameid/" & StringReplace($StringSplit[2], ']', '')
	Local $Other_AppName = $StringSplit[1]
	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $SteamStartURL)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", $Other_AppName)
	$otherName = "Other: " & $Other_AppName
;	GUICtrlSetData($_Radio_5, $otherName)

	GUIDelete($Add_Other_GUI)
EndFunc


Func _GamePath_Other_HomeGUI() ; Other GUI BUTTON
	$FileSelect = FileOpenDialog("Select the app you want to start.", @ScriptDir & "\", "Executable (*.exe;*.au3; ...)", $FD_FILEMUSTEXIST)

	IniWrite($config_ini, "Settings_HomeAPP", "Home_Path", $FileSelect)
	IniWrite($config_ini, "Settings_HomeAPP", "WindowName", "")
;	_StartUp_Button_HomeLoader()
	GUIDelete($Add_Other_GUI)
EndFunc




Func _Button_Exit_Other_HomeGUI()
	GUIDelete($Add_Other_GUI)
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
			If $WinName = "SteamVR" Then $NewLine = '			"binary_path_windows" : "' & 'steamvr_environments/game/bin/win64/steamtours.exe' & '",'
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


;	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
;	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
;	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")


If Not WinExists("Settings") Then
	$Settings_GUI = GUICreate("Settings", 506, $HEIGHT_GUI, - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
#Region Folders
	GUICtrlCreateGroup("Steam Library Folders", 5, 5, 495, 320)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	GUICtrlCreateLabel("Library Folder 1:", 10, 42, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_1 = GUICtrlCreateInput($Install_Folder_Steam_1, 10, 65, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Main Steam Folder path.")
	Global $Button_Install_Folder_Steam_1 = GUICtrlCreateButton("...", 430, 66, 30, 30, 0)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1")
;	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_1_open = GUICtrlCreateButton("Open", 465, 66, 30, 30, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_open")
;	GuiCtrlSetTip(-1, "Opens Folder in Explorer.")
;	$Button_Install_Folder_Steam_1_save = GUICtrlCreateButton("Save", 500, 66, 30, 30, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_1_save")
;	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_open, $gfx & "Folder_small.bmp")
;	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_1_save, $gfx & "Save_small.bmp")

	GUICtrlSetState($Button_Install_Folder_Steam_1, $GUI_HIDE)
	GUICtrlSetState($Button_Install_Folder_Steam_1_open, $GUI_HIDE)
;	GUICtrlSetState($Button_Install_Folder_Steam_1_save, $GUI_HIDE)
	GUICtrlSetState($Input_Install_Folder_Steam_1, $GUI_DISABLE)
	GUICtrlSetState($Button_Install_Folder_Steam_1, $GUI_DISABLE)
	GUICtrlSetState($Button_Install_Folder_Steam_1_open, $GUI_DISABLE)
;	GUICtrlSetState($Button_Install_Folder_Steam_1_save, $GUI_DISABLE)


	GUICtrlCreateLabel("Library Folder 2:", 10, 97, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_2 = GUICtrlCreateInput($Install_Folder_Steam_2, 10, 120, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_2 = GUICtrlCreateButton("...", 430, 119, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_2_open = GUICtrlCreateButton("Clear", 465, 119, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_Clear")
	GuiCtrlSetTip(-1, "Clears entry")
;	$Button_Install_Folder_Steam_2_save = GUICtrlCreateButton("Save", 500, 119, 30, 30, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_2_save")
;	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_open, $gfx & "Reset.bmp")
;	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_2_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 3:", 10, 152, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_3 = GUICtrlCreateInput($Install_Folder_Steam_3, 10, 175, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_3 = GUICtrlCreateButton("...", 430, 174, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_3_open = GUICtrlCreateButton("Clear", 465, 174, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_Clear")
	GuiCtrlSetTip(-1, "Clears entry")
;	$Button_Install_Folder_Steam_3_save = GUICtrlCreateButton("Save", 500, 174, 30, 30, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_3_save")
;	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_open, $gfx & "Reset.bmp")
;	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_3_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 4:", 10, 207, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_4 = GUICtrlCreateInput($Install_Folder_Steam_4, 10, 230, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_4 = GUICtrlCreateButton("...", 430, 229, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_4_open = GUICtrlCreateButton("Clear", 465, 229, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_Clear")
	GuiCtrlSetTip(-1, "Clears entry.")
;	$Button_Install_Folder_Steam_4_save = GUICtrlCreateButton("Save", 500, 229, 30, 30, $BS_BITMAP)
;;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_4_save")
;	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_open, $gfx & "Reset.bmp")
;	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_4_save, $gfx & "Save_small.bmp")

	GUICtrlCreateLabel("Library Folder 5:", 10, 262, 270, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Install_Folder_Steam_5 = GUICtrlCreateInput($Install_Folder_Steam_5, 10, 285, 410, 30)
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path.")
	Global $Button_Install_Folder_Steam_5 = GUICtrlCreateButton("...", 430, 284, 30, 30, 0)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5")
	GuiCtrlSetTip(-1, "Choose Folder.")
	$Button_Install_Folder_Steam_5_open = GUICtrlCreateButton("Clear", 465, 284, 30, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_Clear")
	GuiCtrlSetTip(-1, "Clears entry.")
;	$Button_Install_Folder_Steam_5_save = GUICtrlCreateButton("Save", 500, 284, 30, 30, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Install_Folder_Steam_5_save")
;	GuiCtrlSetTip(-1, "Saves Folder Path.")
	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_open, $gfx & "Reset.bmp")
;	_GUICtrlButton_SetImage($Button_Install_Folder_Steam_5_save, $gfx & "Save_small.bmp")
#endregion

#cs
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
	_GUICtrlButton_SetImage($Button_Icon_Folder_1_save, $gfx & "Reset.bmp")

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
	_GUICtrlButton_SetImage($Button_Icon_Folder_2_save, $gfx & "Reset.bmp")

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
	_GUICtrlButton_SetImage($Button_Icon_Folder_3_save, $gfx & "Reset.bmp")
#endregion
#ce


	Global $Button_Reset_SteamLibraries = GUICtrlCreateButton("Reset Libraries", 12, $POS_Y_Button_Exit_Settings_GUI + 5, 95, 30)
	GUICtrlSetOnEvent(- 1, "_Reset_CK")
;	_GUICtrlButton_SetImage(- 1, $gfx & "Reset.bmp")
	GuiCtrlSetTip(-1, "Auto Re-Set and Re-Scan of your Steam Library Folders." & @CRLF & _
						'Supports up to 5 Libraries in total.')


	Global $Label_Rescan = GUICtrlCreateLabel("If you've changed any of your Libraries, click->" & @CRLF & _
												"   to update the main combined Library page.", 125, $POS_Y_Button_Exit_Settings_GUI + 5)

	Global $Button_Rescan_ALL = GUICtrlCreateButton("Rescan ALL", 345, $POS_Y_Button_Exit_Settings_GUI + 5, 75, 30, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Rescan_ALL")
;	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Rescan 'ALL' Library: use if you're added or removed any Libraries.")

	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", 460, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	GUISetState()
	$Game_ID = ""

Else
	WinActivate("Settings")
EndIf

EndFunc

Func _Reset_CK()
	Local $qck1 = MsgBox(52, "Reset Check", "Reseting will trigger a re-scan: are you sure?")
	If $qck1 = 6 Then
		_Steam_Libraries()
		_Button_ReScan_Steam_Library()
	EndIf

EndFunc


Func _Rescan_ALL()


;$Combo = GUICtrlRead($Combo_SteamLibrary)
;Local $temp_Combo = $Combo

_Scanning_GUI()

GUICtrlSetData($Combo_SteamLibrary, "ALL")
$Combo = "ALL"
;	$Combo = GUICtrlRead($Combo_SteamLibrary)
	_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Files")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

		If $Install_Folder_Steam_1 <> "" Then $NR_temp3 = 1
		If $Install_Folder_Steam_2 <> "" Then $NR_temp3 = 2
		If $Install_Folder_Steam_3 <> "" Then $NR_temp3 = 3
		If $Install_Folder_Steam_4 <> "" Then $NR_temp3 = 4
		If $Install_Folder_Steam_5 <> "" Then $NR_temp3 = 5
		If $NR_temp3 = "" Then $NR_temp3 = 1

;MsgBox(0, "", $NR_temp3)
;#cs
		For $NR_Library = 1 To $NR_temp3
			$NR_Library_temp = $NR_Library
			_Search_Files()
;			Sleep(500)
			GUICtrlSetData($Display_Progressbar, 0)
			GUICtrlSetData($Display_Progressbar_2, $NR_Library * 80 / $NR_temp3)
		Next
		$NR_Library_temp = ""
;		_GUICtrlListView_DeleteAllItems($listview)
;		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", $FC_OVERWRITE)
		FileDelete($ApplicationList_INI)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar_2, 75)

#cs

$s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
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
;			Sleep(500)
EndIf

#ce


_Read_from_INI_ADD_2_ListView()

GUIDelete($GUI_Scanning)
GUICtrlSetData($Display_Progressbar_2, 100)
_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc


Func _Steam_Libraries()
	Local $vReturn, $iStart = 0, $aEnd, $sLibrary, $sLibrary1, $iDex = 0, $limit = 2, $Drop_Context

	If @OSArch = "x64" Then
		Global $Steam_Path_REG = RegRead('HKCU64\Software\Valve\Steam\', "SteamPath") & "\"
	Else
		Global $Steam_Path_REG = RegRead('HKCU\Software\Valve\Steam\', "SteamPath") & "\"
	EndIf
	If Not @error Then
		$Steam_Path_REG = StringReplace($Steam_Path_REG, "/", "\")
		_FileReadToArray($Config_VDF, $vReturn)
		If Not @error Then
			$Steam_CK = True
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_1", $Steam_Path_REG)
			$Install_Folder_Steam_1 = $Steam_Path_REG
			GUICtrlSetData($Input_Install_Folder_Steam_1, $Steam_Path_REG)
			GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1", "All")
			Do
				$iDex = _ArraySearch($vReturn, '"BaseInstallFolder_', $iDex, 0, 0, 1, 1)
				If $iDex <> -1 Then
					$sLibrary = $vReturn[$iDex]
					$sLibrary1 = StringSplit($sLibrary, '"', $STR_ENTIRESPLIT)
					$sLibrary = $sLibrary1[4]
					$sLibrary = StringReplace($sLibrary, "\\", "\")
					$sLibrary = $sLibrary & "\"
					If $limit < 6 Then
						IniWrite($config_INI, "Folders", "Install_Folder_Steam_" & $limit, $sLibrary)
						If $limit = 2 Then
							$Drop_Context = "|All|Steam Library 1|Steam Library 2"
							GUICtrlSetData($Combo_SteamLibrary, $Drop_Context, "All")
							GUICtrlSetData($Input_Install_Folder_Steam_2, $sLibrary)
							$Install_Folder_Steam_2 = $sLibrary
		;					MsgBox(0, "", "Steam Library " & $limit & " is at " & $sLibrary)
						ElseIf $limit = 3 Then
							$Drop_Context = "|All|Steam Library 1|Steam Library 2|Steam Library 3"
							GUICtrlSetData($Combo_SteamLibrary, $Drop_Context, "All")
							GUICtrlSetData($Input_Install_Folder_Steam_3, $sLibrary)
							$Install_Folder_Steam_3 = $sLibrary
		;					MsgBox(0, "", "Steam Library " & $limit & " is at " & $sLibrary)
						ElseIf $limit = 4 Then
							$Drop_Context = "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4"
							GUICtrlSetData($Combo_SteamLibrary, $Drop_Context, "All")
							GUICtrlSetData($Input_Install_Folder_Steam_4, $sLibrary)
							$Install_Folder_Steam_4 = $sLibrary
		;					MsgBox(0, "", "Steam Library " & $limit & " is at " & $sLibrary)
						ElseIf $limit = 5 Then
							$Drop_Context = "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5"
							GUICtrlSetData($Combo_SteamLibrary, $Drop_Context, "All")
							GUICtrlSetData($Input_Install_Folder_Steam_5, $sLibrary)
							$Install_Folder_Steam_5 = $sLibrary
		;					MsgBox(0, "", "Steam Library " & $limit & " is at " & $sLibrary)
						EndIf
						$limit = $limit + 1
					Else
						MsgBox(0, "", "Only 5 Steam Libraries are supported at this time")
						$limit = $limit + 1
					EndIf
					$iDex = $iDex + 1
				EndIf
			Until $iDex = -1
		Else
			MsgBox(48, "Configuration Error", "There seems to be a problem with your Steam Installation!" & @crlf & _
						"Steam configuration file 'Config.vdf' is missing.")
		EndIf
	EndIf

EndFunc



Func _Label_Form_GUI()

If Not WinExists("Tab Label") Then
	Global $Custom_Tab_Label1, $Custom_Tab_Label2, $Custom_Tab_Label3, $Custom_Tab_Label4, $Exit_Label

	$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	$TAB7_Label = IniRead($Config_INI, "Settings", "TAB7_Name", "")
	$TAB8_Label = IniRead($Config_INI, "Settings", "TAB8_Name", "")
	$TAB9_Label = IniRead($Config_INI, "Settings", "TAB9_Name", "")
	If $TAB4_Label = "" Then $TAB4_Label = "Favorites"
	If $TAB5_Label = "" Then $TAB5_Label = "Custom 2"
	If $TAB6_Label = "" Then $TAB6_Label = "Custom 3"
	If $TAB7_Label = "" Then $TAB7_Label = "Custom 4"
	If $TAB8_Label = "" Then $TAB8_Label = "Custom 5"
	If $TAB9_Label = "" Then $TAB9_Label = "Custom 6"

	Global $Label_Form_GUI = GUICreate("Tab Label", 656, 400, 2538, 390)
	Global $Custom_Tab1 = GUICtrlCreateInput($TAB4_Label, 60, 50, 209, 21)
	Global $Custom_Tab2 = GUICtrlCreateInput($TAB5_Label, 60, 110, 209, 21)
	Global $Custom_Tab3 = GUICtrlCreateInput($TAB6_Label, 60, 170, 209, 21)
	Global $Custom_Tab4 = GUICtrlCreateInput($TAB7_Label, 60, 230, 209, 21)
	Global $Custom_Tab5 = GUICtrlCreateInput($TAB8_Label, 60, 290, 209, 21)
	Global $Custom_Tab6 = GUICtrlCreateInput($TAB9_Label, 60, 350, 209, 21)
	$Custom_Tab_Label1 = GUICtrlCreateLabel("Custom Tab1", 112, 30, 67, 17, $SS_CENTER)
	$Custom_Tab_Label2 = GUICtrlCreateLabel("Custom Tab2", 112, 90, 67, 17, $SS_CENTER)
	$Custom_Tab_Label3 = GUICtrlCreateLabel("Custom Tab3", 112, 150, 67, 17, $SS_CENTER)
	$Custom_Tab_Label4 = GUICtrlCreateLabel("Custom Tab4", 112, 210, 67, 17, $SS_CENTER)
	$Custom_Tab_Label5 = GUICtrlCreateLabel("Custom Tab5", 112, 270, 67, 17, $SS_CENTER)
	$Custom_Tab_Label6 = GUICtrlCreateLabel("Custom Tab6", 112, 330, 67, 17, $SS_CENTER)
	$Label_Tool_Text = GUICtrlCreateLabel("Enter the text for your Labels. ", 400, 64, 187, 25)
	$Save_Label = GUICtrlCreateButton("Save", 384, 275, 100, 49)
	GUICtrlSetOnEvent(-1, "_Save_Tab_Label")
	$Exit_Label = GUICtrlCreateButton("Exit", 520, 275, 100, 49)
	GUICtrlSetOnEvent(-1, "_Button_Exit_Label_Form_GUI")

	GUISetState(@SW_SHOW)
Else
	WinActivate("Tab Label")
EndIf
EndFunc

Func _Save_Tab_Label()
	Local $Custom_Tab1a, $Custom_Tab2a, $Custom_Tab3a, $Custom_Tab4a, $Custom_Tab5a, $Custom_Tab6a
	$Custom_Tab1a = ""
	$Custom_Tab2a = ""
	$Custom_Tab3a = ""
	$Custom_Tab4a = ""
	$Custom_Tab5a = ""
	$Custom_Tab6a = ""
	$Custom_Tab1a = GUICtrlRead($Custom_Tab1)
	$Custom_Tab2a = GUICtrlRead($Custom_Tab2)
	$Custom_Tab3a = GUICtrlRead($Custom_Tab3)
	$Custom_Tab4a = GUICtrlRead($Custom_Tab4)
	$Custom_Tab5a = GUICtrlRead($Custom_Tab5)
	$Custom_Tab6a = GUICtrlRead($Custom_Tab6)
	$TAB4_Label = $Custom_Tab1a
	$TAB5_Label = $Custom_Tab2a
	$TAB6_Label = $Custom_Tab3a
	$TAB7_Label = $Custom_Tab4a
	$TAB8_Label = $Custom_Tab5a
	$TAB9_Label = $Custom_Tab6a
	IniWrite($Config_INI, "Settings", "TAB4_Name", $Custom_Tab1a)
	IniWrite($Config_INI, "Settings", "TAB5_Name", $Custom_Tab2a)
	IniWrite($Config_INI, "Settings", "TAB6_Name", $Custom_Tab3a)
	IniWrite($Config_INI, "Settings", "TAB7_Name", $Custom_Tab4a)
	IniWrite($Config_INI, "Settings", "TAB8_Name", $Custom_Tab5a)
	IniWrite($Config_INI, "Settings", "TAB9_Name", $Custom_Tab6a)
	GUICtrlSetData($ButtonTAB_Custom_1, $Custom_Tab1a)
	GUICtrlSetData($ButtonTAB_Custom_2, $Custom_Tab2a)
	GUICtrlSetData($ButtonTAB_Custom_3, $Custom_Tab3a)
	GUICtrlSetData($ButtonTAB_Custom_4, $Custom_Tab4a)
	GUICtrlSetData($ButtonTAB_Custom_5, $Custom_Tab5a)
	GUICtrlSetData($ButtonTAB_Custom_6, $Custom_Tab6a)
	GUICtrlSetData($Combo_Add_to_Custom, "")
	GUICtrlSetData($Combo_Add_to_Custom, $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label & "|" & $TAB7_Label & "|" & $TAB8_Label & "|" & $TAB9_Label,"Choose Tab")
EndFunc

Func _Button_Exit_Label_Form_GUI()
	GUIDelete($Label_Form_GUI)
EndFunc

Func _AddGame2Library_GUI()
If Not WinExists("Add Game to Library") Then
	$AddGame2Library_GUI = GUICreate("Add Game to Library", 349, 305 , - 1, - 1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; Darstellung Icon Preview Rahmen
	Global $Frame_up = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_down = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 243, 110, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_right = GUICtrlCreatePic($gfx & "Frame.jpg", 330, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Frame_left = GUICtrlCreatePic($gfx & "Frame.jpg", 220, 190, 3, 56, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Icon_Preview = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 223, 193, 107, 50)
	Global $Value_DROPDOWN_Library = ""
	Global $DROPDOWN = ""
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	;Global $Label_FileType_Path = "Game Path:"

	GUICtrlCreateGroup("Properties", 5, 5, 340, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)


		GUICtrlCreateLabel("File Type:", 10, 40, 170, 25)
		GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
		Global $DROPDOWN_Library = GUICtrlCreateCombo("", 130, 39, 203, 35)
		GUICtrlSetOnEvent($DROPDOWN_Library, "_DROPDOWN_Library")
		GUICtrlSetData(-1, "Steam Game|Non-Steam Exe|Non-Steam File|Web Link", "")
		GUICtrlSetFont(-1, 12, 400, 2, "arial")


	Global $FileType_Label = GUICtrlCreateLabel($Value_DROPDOWN_Library, 133, 40, 170, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $Label_GamePath = GUICtrlCreateLabel("Game Path:", 10, 112, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
;	Global $Label_WebURL = GUICtrlCreateLabel("Web URL:", 10, 80, 115, 25)
;	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)

	Global $BUTTON_GamePath_Folder = GUICtrlCreateButton("Select File", 130, 76, 99, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_GamePath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select File")

	Global $BUTTON_WebURL = GUICtrlCreateButton("Input URL", 130, 76, 99, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_WebURL")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Enter Web URL")

	Global $BUTTON_Use_SteamID= GUICtrlCreateButton("Use Steam ID", 130, 76, 100, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_Use_SteamID")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Enter Steam ID:" & @CRLF & "Using Steam, create a Desktop shortcut to your new game." & @CRLF & _
						"Right click on the shortcut and click properties." & @CRLF & _
						"The 'URL:' will show a 6 digit number: this is the SteamID for your game.")

	Global $Input_GamePath_Folder = GUICtrlCreateInput("", 130, 108, 203, 30)
	GUICtrlSetFont(-1, 11, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Folder path")

	Global $Label_App_Name = GUICtrlCreateLabel("App Name:", 10, 153, 150, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $Input_Name = GUICtrlCreateInput("", 130, 149, 203, 30)
	GUICtrlSetOnEvent(- 1, "_Input_Name")
	GUICtrlSetFont(-1, 14, 400, 1, $font_arial)
	GuiCtrlSetTip(-1, "Enter Application Name")

	Global $Label_IconPath = GUICtrlCreateLabel("Icon Path:", 10, 207, 115, 25)
	GUICtrlSetFont(-1, 16, 400, 1, $font_arial)
	Global $BUTTON_IconPath_Folder = GUICtrlCreateButton("Select Icon", 130, 203, 85, 30, 0)
	GUICtrlSetOnEvent(- 1, "_BUTTON_IconPath_Folder")
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GuiCtrlSetTip(-1, "Select Icon File.")

	GUICtrlCreateGroup("Drop Field", 350, 5, 130, 255)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	Global $Button_SAVE_APP = GUICtrlCreateButton("Save", 5, 265, 200, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_SAVE_APP")
	_GUICtrlButton_SetImage(- 1, $gfx & "Create_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")

	Global $Button_RESET = GUICtrlCreateButton("Reset", 204, 265, 108, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_RESET")
	_GUICtrlButton_SetImage(- 1, $gfx & "Reset2.bmp")
	GuiCtrlSetTip(-1, "Resets Properties")


	Global $Button_Exit_AddGame2Library_GUI = GUICtrlCreateButton("Exit", 310, 265, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(- 1, "_Button_Exit_AddGame2Library_GUI")
	_GUICtrlButton_SetImage(- 1, $gfx & "Exit_small.bmp")
	GuiCtrlSetTip(-1, "Closes GUI Window.")
	GUISetState()

	GUICtrlSetState($FileType_Label, $GUI_HIDE)
	GUICtrlSetState($Label_GamePath, $GUI_HIDE)
	GUICtrlSetState($BUTTON_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($BUTTON_WebURL, $GUI_HIDE)
	GUICtrlSetState($BUTTON_Use_SteamID, $GUI_HIDE)
	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Label_App_Name, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($Label_IconPath, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
	GUICtrlSetState($Button_RESET, $GUI_HIDE)


Else
	WinActivate("Add Game to Library")
EndIf

EndFunc


Func _Update_StatusBar()
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

;	Local $rTM_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "renderTargetMultiplier", "1.0")
;	Local $ssS_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "supersampleScale", "1.0")
;	Local $aSF_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "allowSupersampleFiltering", "true")

;	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "RTM: " & $rTM_value & " / " & "SSS: " & $ssS_value &  " / " & "ASF: " & $aSF_value & @TAB & "'Version " & $Version & "'")


	Local $rTM_value = "1.0"
	Local $ssS_value = "1.0"
	Local $aSF_value = "true"

	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "'Version " & $Version & "'")
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
;			Sleep(500)
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
;				Sleep(500)
			EndIf
			$FileList = ""
	EndIf
	_Read_from_INI_ADD_2_ListView()
EndFunc



Func _ApplicationList_Update()

Global $File = $File_Path
Global $Line_Value = ""
Local $Install_Drive = ""
Local $Local_SizeOnDisk = ""
Local $Local_SizeOnTest = ""

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

					$Local_SizeOnTest = $SizeOnDisk / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SizeOnDisk = $Local_SizeOnTest & " Kb"
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SizeOnDisk = $Local_SizeOnTest & " Mb"
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SizeOnDisk = $Local_SizeOnTest & " Gb"
				EndIf

			Next

		$Install_Drive = StringMid($File, 1, 3)
		$Install_Drive = StringUpper($Install_Drive)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "FileType", "Steam Game")
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "InstallDrive", $Install_Drive)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "SizeOnDisk", $SizeOnDisk)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "FileType", "Steam Game")
			IniWrite($ApplicationList_INI, "Application_" & $appid, "InstallDrive", $Install_Drive)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "SizeOnDisk", $SizeOnDisk)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "installdir", $installdir)

			If $appid <> "" Then
				IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
			Else
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

Func _Button_ReScan_Revive_Library()
	If $Revive_Manifest <> "" Then
		_Revive_Data_Storage()
		MsgBox(0, "Revive Data Written", "Revive Library scanned.")
	Else
		MsgBox(0, "Revive Not Found", "Revive was not found on your computer.  Please install Revive and Oculus software and try again.")
	EndIf
EndFunc

Func _Revive_Data_Storage()
Local $iCount_EXE, $iCount_JPG, $iCount_Name, $iCount_AppNR, $Oculus_Game_JPG, $Oculus_Game_EXE_Split, $Oculus_Game_SOD, $Oculus_SOD_Test, $Oculus_Game_Drive, $Oculus_Game_SizeOnDisk, $x
Local $hImage_JPG, $hBitmap, $hBitmap_Scaled

	If FileExists($ApplicationList_Revive_Apps_INI) Then FileDelete($ApplicationList_Revive_Apps_INI)
	$iCount_AppNR = 1
	$iCount_EXE = 5
	$iCount_JPG = 7
	$iCount_Name = 11
	$x = 1
	$FileType = "Revive Game"
	$appid = ""
	$Oculus_Game_Name = ""
	$Oculus_Game_Drive = ""
	$Oculus_Game_SizeOnDisk = ""
	$Oculus_Game_JPG = ""
	$Oculus_Game_EXE = ""

	Do		;Do while Lines in Revive.Manifest exist

		$Oculus_Game_EXE = FileReadLine($Revive_Manifest, $iCount_EXE)
		$Oculus_Game_JPG = FileReadLine($Revive_Manifest, $iCount_JPG)
		$Oculus_Game_Name = FileReadLine($Revive_Manifest, $iCount_Name)

		If $Oculus_Game_EXE <> "" Then
			$Oculus_Game_JPG = StringReplace($Oculus_Game_JPG, '"', "@", -2)
			$Oculus_Game_JPG = StringSplit($Oculus_Game_JPG, '@', $STR_ENTIRESPLIT)[2]
			$Oculus_Game_JPG = StringReplace($Oculus_Game_JPG, '/', "\")

;			$Oculus_Game_JPG = $Revive_DIR & $Oculus_Game_JPG

			$Oculus_Game_Name = StringReplace($Oculus_Game_Name, '"', "@", -2)
			$Oculus_Game_Name = StringSplit($Oculus_Game_Name, '@', $STR_ENTIRESPLIT)[2]
			$Oculus_Game_Drive = StringTrimRight($Oculus_Game_JPG, (StringLen($Oculus_Game_JPG) - 3))
			$appid = "OC" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')

			$Oculus_Game_EXE = StringSplit($Oculus_Game_EXE, '\"', $STR_ENTIRESPLIT)[2]
			$Oculus_Game_EXE = StringReplace($Oculus_Game_EXE, '\\', "\")
			$Oculus_Game_EXE_Split = StringSplit($Oculus_Game_JPG, "Software\", $STR_ENTIRESPLIT)[2]
			$Oculus_Game_EXE_Split = StringTrimRight($Oculus_Game_JPG, StringLen($Oculus_Game_EXE_Split))
			$Oculus_Game_EXE = $Oculus_Game_EXE_Split & $Oculus_Game_EXE
			$Oculus_Game_EXE = StringReplace($Oculus_Game_EXE, "CoreData\", "")
			$Oculus_Game_SizeOnDisk = StringSplit($Oculus_Game_EXE, "\Software\Software\", $STR_ENTIRESPLIT)[2]
			$Oculus_Game_SizeOnDisk = StringLeft($Oculus_Game_SizeOnDisk, StringInStr($Oculus_Game_SizeOnDisk, "\", 1) -1)
			$Oculus_Game_SOD = StringLeft($Oculus_Game_JPG, StringInStr($Oculus_Game_JPG, "CoreData", 1) -1)
			$Oculus_Game_SOD = $Oculus_Game_SOD & "Software\Software\" & $Oculus_Game_SizeOnDisk
			$Oculus_Game_SOD = DirGetSize($Oculus_Game_SOD)
			If $Oculus_Game_SOD <> 0 Then
					$Oculus_SOD_Test = $Oculus_Game_SOD / 1024
					$Oculus_SOD_Test = Round($Oculus_SOD_Test, 1)
					If $Oculus_SOD_Test < 999 And $Oculus_SOD_Test >= 1 Then $Oculus_Game_SizeOnDisk = $Oculus_SOD_Test & " Kb"
					$Oculus_SOD_Test = $Oculus_SOD_Test / 1024
					$Oculus_SOD_Test = Round($Oculus_SOD_Test, 1)
					If $Oculus_SOD_Test < 999 And $Oculus_SOD_Test >= 1 Then $Oculus_Game_SizeOnDisk = $Oculus_SOD_Test & " Mb"
					$Oculus_SOD_Test = $Oculus_SOD_Test / 1024
					$Oculus_SOD_Test = Round($Oculus_SOD_Test, 1)
					If $Oculus_SOD_Test < 999 And $Oculus_SOD_Test >= 1 Then $Oculus_Game_SizeOnDisk = $Oculus_SOD_Test & " Gb"
			Else
				MsgBox(0, "SOD Error", "There's been a problem with the SizeOnDisk Info, please inform dev. Thank you.")
			EndIf


			IniWrite($ApplicationList_Revive_Apps_INI, "ApplicationList", "NR_Applications", $iCount_AppNR)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "NR", $iCount_AppNR)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "appid", $appid)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "name", $Oculus_Game_Name)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "FileType", $FileType)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "InstallDrive", $Oculus_Game_Drive)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "SizeOnDisk", $Oculus_Game_SizeOnDisk)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "IconPath", $Oculus_Game_JPG)
			IniWrite($ApplicationList_Revive_Apps_INI, "Application_" & $iCount_AppNR, "GamePath", $Oculus_Game_EXE)

			_Revive_BAT()


			If FileExists($Oculus_Game_JPG) Then
				FileCopy($Oculus_Game_JPG, $Steam_Icons & $appid & ".jpg")
				_GDIPlus_Startup()
					$hImage_JPG = _GDIPlus_ImageLoadFromFile($Oculus_Game_JPG)
					_GDIPlus_ImageSaveToFile($hImage_JPG, $Steam_Icons & $appid & ".bmp")

					$hBitmap = _GDIPlus_ImageLoadFromFile($Steam_Icons & $appid & ".bmp")

					$hBitmap_Scaled = _GDIPlus_ImageResize($hBitmap, 32, 32) ;resize image
					_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $Steam32_Icons & $appid & ".bmp")

				_GDIPlus_ImageDispose($hImage_JPG)
				_GDIPlus_BitmapDispose($hBitmap_Scaled)
				_GDIPlus_BitmapDispose($hBitmap)
				_GDIPlus_Shutdown()
				FileDelete($Steam_Icons & $appid & ".bmp")
			EndIf



			$iCount_AppNR = $iCount_AppNR + 1
			$iCount_EXE = $iCount_EXE + 12
			$iCount_JPG = $iCount_JPG + 12
			$iCount_Name = $iCount_Name + 12
		Else
;  				zero out all data and return.
			$x = 2
			$iCount_AppNR = ""
			$appid = ""
			$Oculus_Game_Name = ""
			$FileType = ""
			$Oculus_Game_Drive = ""
			$Oculus_Game_SizeOnDisk = ""
			$Oculus_Game_JPG = ""
			$Oculus_Game_EXE = ""
		EndIf

	Until $x = 2

_Read_from_INI_ADD_2_ListView()
$NR_Applications = IniRead($ApplicationList_Folder & "ApplicationList_Revive_Apps.ini", "ApplicationList", "NR_Applications", "")
_GUICtrlStatusBar_SetText($Statusbar, "'Scan Revive Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc   ;==>_Revive_Data_Storage




Func _Revive_BAT()
	$BAT_File = $Revive_Tlbx_BAT_DIR & $Oculus_Game_Name & ".bat"
	If FileExists($BAT_File) Then FileDelete($BAT_File)
	$Revive_Injector = StringReplace($Revive_Injector, "\", "/")
	$Oculus_Game_EXE = StringReplace($Oculus_Game_EXE, "\", "/")
	FileWrite($BAT_File, "START """ & '"' & ' "' & $Revive_Injector & '" "' & $Oculus_Game_EXE & '"')
	$BAT_File = ""
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
	Global $Check_AppId = $appid
If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		_INetGetSource($URL)
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")

		If Not @error Then
			$WinHttpReq.Open("GET", $URL, false)
			$WinHttpReq.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 4.0.20506)")
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText

			Local $iPosition_1 = StringInStr($Data, 'avatar" src="', $STR_CASESENSE, 1, 1000)
			Local $iPosition_2 = StringInStr($Data, '" alt="" width="32', $STR_CASESENSE, 1, 1000)
			Local $iPosition_3 = $iPosition_2 - $iPosition_1
			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)
			$sString = StringTrimLeft($sString, 13)


			If $sString <> "" Then
				$32bit_Icons = $Icons & "32x32\" & "steam.app." & $appid & ".jpg"
				$32bit_Bmps = $Icons & "32x32\" & "steam.app." & $appid & ".bmp"
				Local $Download = InetGet($sString, $32bit_Icons, 16, 0)
				If $Download = 0 Then
					FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $appid & ".bmp", $FC_OVERWRITE)
				EndIf
				If $Download <> 0 Then
					_GDIPlus_Startup()
					$hImage_JPG = _GDIPlus_ImageLoadFromFile($32bit_Icons)
					_GDIPlus_ImageSaveToFile($hImage_JPG, $32bit_Bmps)
					_GDIPlus_ImageDispose($hImage_JPG)
					_GDIPlus_Shutdown()
					FileDelete($32bit_Icons)
				EndIf
			Else
;				MsgBox(0, "32bit Icon Error", "Getting the Icon bleeping failed")
				FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $appid & ".bmp", $FC_OVERWRITE)
			EndIf
		EndIf
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
				_Create_MasterPage()
				ShellExecute($MasterPage_path)
	;			MsgBox(0,"Oops!", "Oops! You need to create it first!  See '" & "Settings' Page.")
			EndIf
EndFunc


Func _Button_StartPage()
		$StartPage_path1 = IniRead($Config_INI, "Folders", "VRToolbox_utils_Folder", "")
		$StartPage_path = $StartPage_path1 & "Startpage.html"
			If FileExists($StartPage_path) Then
				ShellExecute($StartPage_path)
			Else
				_Change_StartPage()
				ShellExecute($StartPage_path)
;				MsgBox(0,"Oops!", "Oops! You need to create it first!  See '" & "Settings' Page.")
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
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview, 14, 500, 1, "Comic Sans MS")
;_GUICtrlListView_SetBkColor(-1, 0xADFF2F)
	; Load images
	Global $ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
;	_GUICtrlListView_AddColumn($listview, "NR", 60)
	_GUICtrlListView_AddColumn($listview, "Select", 75)
	_GUICtrlListView_AddColumn($listview, "App ID", 90)
	_GUICtrlListView_AddColumn($listview, "Name", 467)
	_GUICtrlListView_AddColumn($listview, "Drive", 48)
	_GUICtrlListView_AddColumn($listview, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview)
;	$RM_Item2 = GUICtrlCreateMenuItem("Image", $contextmenu)
;	MsgBox(0, "", $ContextSelected_Image)
;	GUICtrlSetImage($RM_Item2, "shell32.dll", 4)
;	$RM_ItemA = GUICtrlCreateMenuItem($Context_Icon, $contextmenu)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
;	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
    $RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
    $RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Speparator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc

Func _Create_ListView_2()    ;   line1496=
	$listview_2 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_2, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_2, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_2, "Select", 75)
	_GUICtrlListView_AddColumn($listview_2, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_2, "Name", 467)
	_GUICtrlListView_AddColumn($listview_2, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_2, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_2, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_2)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_2, $GUI_HIDE)
EndFunc

Func _Create_ListView_3()
	$listview_3 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_3, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_3, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_3, "Select", 75)
	_GUICtrlListView_AddColumn($listview_3, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_3, "Name", 467)
	_GUICtrlListView_AddColumn($listview_3, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_3, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_3, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_3)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_3, $GUI_HIDE)
EndFunc

Func _Create_ListView_4()
	$listview_4 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_4, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_4, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_4, "Select", 75)
	_GUICtrlListView_AddColumn($listview_4, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_4, "Name", 467)
	_GUICtrlListView_AddColumn($listview_4, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_4, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_4, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_4)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_4, $GUI_HIDE)
EndFunc

Func _Create_ListView_5()
	$listview_5 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_5, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_5, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_5, "Select", 75)
	_GUICtrlListView_AddColumn($listview_5, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_5, "Name", 467)
	_GUICtrlListView_AddColumn($listview_5, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_5, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_5, "Online", 95, 2)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	$contextmenu = GUICtrlCreateContextMenu($listview_5)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
EndFunc

Func _Create_ListView_6()
	$listview_6 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_6, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_6, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_6, "Select", 75)
	_GUICtrlListView_AddColumn($listview_6, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_6, "Name", 467)
	_GUICtrlListView_AddColumn($listview_6, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_6, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_6, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_6)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_6, $GUI_HIDE)
EndFunc

Func _Create_ListView_7()
	$listview_7 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_7, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_7, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_7 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_7, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_7, "Select", 75)
	_GUICtrlListView_AddColumn($listview_7, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_7, "Name", 467)
	_GUICtrlListView_AddColumn($listview_7, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_7, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_7, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_7)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_7, $GUI_HIDE)
EndFunc

Func _Create_ListView_8()
	$listview_8 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_8, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_8, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_8 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_8, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_8, "Select", 75)
	_GUICtrlListView_AddColumn($listview_8, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_8, "Name", 467)
	_GUICtrlListView_AddColumn($listview_8, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_8, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_8, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_8)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_8, $GUI_HIDE)
EndFunc

Func _Create_ListView_9()
	$listview_9 = GUICtrlCreateListView("", 0, 115, 845, 740, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_9, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_9, 14, 500, 1, "Comic Sans MS")

	; Load images
	Global $ListView_Favorite_Image_9 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_9, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_9, "Select", 75)
	_GUICtrlListView_AddColumn($listview_9, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_9, "Name", 467)
	_GUICtrlListView_AddColumn($listview_9, "Drive", 48)
	_GUICtrlListView_AddColumn($listview_9, "Size@Install", 143, 1)
;	_GUICtrlListView_AddColumn($listview_9, "Online", 95, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview_9)
	$RM_Item0 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item1 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	$RM_Item2 = GUICtrlCreateMenuItem("", $contextmenu)
;	$RM_Item3 = GUICtrlCreateMenuItem("Steam VR Settings Menu", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Number of Current Players", $contextmenu)
	$RM_Item4 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item5 = GUICtrlCreateMenuItem("Launch File or Program", $contextmenu)
	$RM_Item6 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item7 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item10 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Add Separator", $contextmenu)
	$RM_Item12 = GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item13 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Create_HTMLView_GUI")
;	GUICtrlSetOnEvent($RM_Item3, "_SS_GUI")
	GUICtrlSetOnEvent($RM_Item3, "_Current_Players")
	GUICtrlSetOnEvent($RM_Item5, "_RM_Menu_Item_5")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item_11")
	GUICtrlSetOnEvent($RM_Item13, "_RM_Menu_Item_13")
	GUICtrlSetState($listview_9, $GUI_HIDE)
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
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Custom_5_INI
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Custom_6_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6
	If $ButtonTAB_State = "7" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_7
	If $ButtonTAB_State = "8" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_8
	If $ButtonTAB_State = "9" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_9


	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_Temp)
	_GUIImageList_Destroy($ListView_ImageList_Temp)
	_GUICtrlListView_DeleteAllItems($listview_Temp)
	$ListView_ImageList_Temp = _GUIImageList_Create(30, 30)
	For $NR = 0 To $NR_Applications + 1 ;original
;	For $NR = 0 To $NR_Applications
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_Drive = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "InstallDrive", "")
		Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "SizeOnDisk", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
;		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
;		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
;		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")
		$FileType = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "FileType", "")

		If $Application_appid <> "" Then
;			Local $ListView_RowNR = $NR - 1
			Local $ListView_RowNR = $NR ; original
			If $FileType = "Separator" Then
				$ImageList_Icon = $Icons & "32x32\" & "steam.app." & "--------.bmp"
			Else
				$ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"
			EndIf
			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf
			$ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
;			_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)
;			_GUICtrlListView_AddItem($listview_Temp, "", $Application_NR) ;original line

			_GUICtrlListView_AddItem($listview_Temp, "", $ListView_RowNR)
			If $FileType = "Separator" Then
				_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, "", 1)
			Else
				_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			EndIf
;			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_Drive, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_SizeOnDisk, 4)

		EndIf
	Next
;	_GUICtrlListView_EndUpdate($listview_Temp)
_GUICtrlListView_SetImageList($listview_Temp, $ListView_ImageList_Temp, 1)

;	For $NR2 = 0 To $NR_Applications - 1
;		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")

;		If $Application_appid_last <> "" Then
;			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"

;			If Not FileExists($ListView_Icon) Then
;				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)

;			EndIf
;		EndIf
;		_GUICtrlListView_SetItemImage($listview_Temp, $NR2, $NR2)
;	Next
;	_GUICtrlListView_JustifyColumn($listview_Temp, 4, 1)

	_GUICtrlListView_EndUpdate($listview_Temp)

;	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & @TAB & "'Version " & $Version & "'")
;	_GUICtrlStatusBar_SetText($Statusbar, "Applications added" & @TAB & @TAB & "'Version " & $Version & "'")
EndFunc

#cs
Func _ListView_Icon_Refresh()

Local $NR_of_Apps = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If $ButtonTAB_State = "1" Then
		$ListView_Favorite_Image = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image, 1)
	EndIf
	If $ButtonTAB_State = "2" Then
		$ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_2, 1)
	EndIf
	If $ButtonTAB_State = "3" Then
		$ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_3, 1)
	EndIf
	If $ButtonTAB_State = "4" Then
		$ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_4, 1)
	EndIf
	If $ButtonTAB_State = "5" Then
		$ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_5, 1)
	EndIf
	If $ButtonTAB_State = "6" Then
		$ListView_Favorite_Image_6 =_GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_6, 1)
	EndIf
	If $ButtonTAB_State = "7" Then
		$ListView_Favorite_Image_7 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_7, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_7, 1)
	EndIf
	If $ButtonTAB_State = "8" Then
		$ListView_Favorite_Image_8 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_8, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_8, 1)
	EndIf
	If $ButtonTAB_State = "9" Then
		$ListView_Favorite_Image_9 = _GUIImageList_Create(30, 30)
		For $NR = 1 To $NR_of_Apps
			$appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
			_GUIImageList_AddBitmap($ListView_Favorite_Image_9, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		Next
		_GUICtrlListView_SetImageList($listview_Temp, $ListView_Favorite_Image_9, 1)
	EndIf

EndFunc
#ce

Func _Current_Players()

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
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Custom_5_INI
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Custom_6_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameNR = $ListView_Selected_Row_Nr

	Local $Get_FileType = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "FileType", "")
	Local $Get_appid = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	If $Get_FileType = "Steam Game" Then
		If $Get_appid <> "" Then
			Local $URL = "https://steamdb.info/app/" & $Get_appid & "/info/"

;			Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
;			If Not @error Then
;				$WinHttpReq.Open("GET", $URL, false)
;				$WinHttpReq.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 4.0.20506)")
;				$WinHttpReq.Send()
;				Local $Data = $WinHttpReq.ResponseText

				HttpSetUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134")
				Local $Data = BinaryToString(InetRead($URL, 1))

				Local $String_Players_Online = _StringBetween($Data, '<li><strong>', '</strong> right now</li>')
				If Not @error Then
					Local $CurrentPlayers = $String_Players_Online[0] & " People Currently Playing"
					MsgBox(0, "", $CurrentPlayers)
				Else
					MsgBox(0, "No Players", "0 Current Players")
				EndIf

;			Else
;				MsgBox(0, "Error", "Error creating Object, please notify dev.")
;			EndIf
		EndIf
	Else
		MsgBox(0, "Wrong FileType", "Unable to get information about non-Steam Games")
	EndIf
EndFunc



#Region  Right Mouse Menus

Func _RM_Menu_Item_3()
	$temptest = 54
	GUICtrlSetData($RM_Item3, $temptest)
MsgBox(0, "", "hello")

EndFunc


Func _RM_Menu_Item_5()
	_Run_Program()
EndFunc


Func _RM_Menu_Item_8()   ; RM up ?
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9
	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
If $ListView_Selected_Row_Index > 0 Then
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

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
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Custom_5_INI
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Custom_6_INI

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	$GetItem_Drive_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "InstallDrive", "")
	$GetItem_SizeOnDisk_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "SizeOnDisk", "")
	$GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")
	$GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
	$GetItem_GamePath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "GamePath", "")
	$GetItem_FileType_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "FileType", "")
	$GetItem_WebURL_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "WebURL", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	$GetItem_Drive_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "InstallDrive", "")
	$GetItem_SizeOnDisk_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "SizeOnDisk", "")
	$GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "installdir", "")
	$GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "IconPath", "")
	$GetItem_GamePath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "GamePath", "")
	$GetItem_FileType_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "FileType", "")
	$GetItem_WebURL_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "WebURL", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "InstallDrive", $GetItem_Drive_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "SizeOnDisk", $GetItem_SizeOnDisk_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "GamePath", $GetItem_GamePath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "FileType", $GetItem_FileType_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "WebURL", $GetItem_WebURL_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "InstallDrive", $GetItem_Drive_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "SizeOnDisk", $GetItem_SizeOnDisk_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "GamePath", $GetItem_GamePath_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "FileType", $GetItem_FileType_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "WebURL", $GetItem_WebURL_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
EndIf

EndFunc




Func _RM_Menu_Item_9() ; RM_DOWN    line2062
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9

	Local $temp_List_Count = _GUICtrlListView_GetItemCount($listview_Temp)

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)

	If $ListView_Selected_Row_Index + 1 < $temp_List_Count Then

		Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

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
		If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
		If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
		If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
		If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
		If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI
		If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Custom_5_INI
		If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Custom_6_INI

		Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_Temp, $ListView_Selected_Row_Index)
		Local $GameName = $ListView_Item_Array[3]
		Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
		Local $Game_ID = $ListView_Item_Array[2]

		$GameNR = $ListView_Selected_Row_Nr

		$GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
		$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
		$GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
		$GetItem_Drive_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "InstallDrive", "")
		$GetItem_SizeOnDisk_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "SizeOnDisk", "")
		$GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")
		$GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
		$GetItem_GamePath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "GamePath", "")
		$GetItem_FileType_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "FileType", "")
		$GetItem_WebURL_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "WebURL", "")
		$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
		$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
		$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

		$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
		$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
		$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
		$GetItem_Drive_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "InstallDrive", "")
		$GetItem_SizeOnDisk_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "SizeOnDisk", "")
		$GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "installdir", "")
		$GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "IconPath", "")
		$GetItem_GamePath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "GamePath", "")
		$GetItem_FileType_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "FileType", "")
		$GetItem_WebURL_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "WebURL", "")
		$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
		$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
		$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "InstallDrive", $GetItem_Drive_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "SizeOnDisk", $GetItem_SizeOnDisk_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "GamePath", $GetItem_GamePath_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "FileType", $GetItem_FileType_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "WebURL", $GetItem_WebURL_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "InstallDrive", $GetItem_Drive_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "SizeOnDisk", $GetItem_SizeOnDisk_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "GamePath", $GetItem_GamePath_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "FileType", $GetItem_FileType_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "WebURL", $GetItem_WebURL_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "supersampleScale", $GetItem_supersampleScale_2)
		IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_2)

;		_ListView_Icon_Refresh()
		_Read_from_INI_ADD_2_ListView()
	EndIf
EndFunc

Func _RM_Menu_Item_11()  ; Add Separator
	Global $Add_Sep_Form = GUICreate("Separator Name", 800, 80, -1, -1)
	Global $Add_Sep_Form_Label = GUICtrlCreateLabel("Separator Name:", 40, 16, 129, 27)
	GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
	Global $Add_Sep_Name_Input = GUICtrlCreateInput("None", 192, 16, 420, 31)
	GUICtrlSetOnEvent($Add_Sep_Name_Input, "_Write_Separator")
	GUICtrlSetFont(-1, 12, 400, 0, "Comic Sans MS")
	GUISetState(@SW_SHOW)

EndFunc



Func _Write_Separator()
Local $Checker = "Yes"
$Sep_Name = GUICtrlRead($Add_Sep_Name_Input)
If $Sep_Name <> "" Then
	$ButtonTAB_State = ""
	$ApplicationList_TEMP = ""
;	$listview_TEMP = ""

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = 1 Then
		Local $Steam_Library = GUICtrlRead($Combo_SteamLibrary)
;		$listview_TEMP = $ListView_Favorite_Image
		If $Steam_Library = "All" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			Local $tempTAB = "'Scan Steam Library Folders' if a game was added or removed."
		ElseIf $Steam_Library = "Steam Library 1" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
			$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
			$Install_Folder_Steam_1 = StringTrimRight($Install_Folder_Steam_1, 1)
			$Install_Folder_Steam_1 = "                             " & $Install_Folder_Steam_1
			Local $tempTAB = "Steam Library 1:  " & $Install_Folder_Steam_1
		ElseIf $Steam_Library = "Steam Library 2" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
				$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
				$Install_Folder_Steam_2 = StringTrimRight($Install_Folder_Steam_2, 1)
				$Install_Folder_Steam_2 = "                             " & $Install_Folder_Steam_2
				Local $tempTAB = "Steam Library 2:  " & $Install_Folder_Steam_2
			Else
				MsgBox(48, "Missing Library", "Add the Library before adding Separators.")
				$Checker = "No"
			EndIf
		ElseIf $Steam_Library = "Steam Library 3" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
				$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
				$Install_Folder_Steam_3 = StringTrimRight($Install_Folder_Steam_3, 1)
				$Install_Folder_Steam_3 = "                             " & $Install_Folder_Steam_3
				Local $tempTAB = "Steam Library 3:  " & $Install_Folder_Steam_3
			Else
				MsgBox(48, "Missing Library", "Add the Library before adding Separators.")
				$Checker = "No"
			EndIf
		ElseIf $Steam_Library = "Steam Library 4" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
				$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
				$Install_Folder_Steam_4 = StringTrimRight($Install_Folder_Steam_4, 1)
				$Install_Folder_Steam_4 = "                             " & $Install_Folder_Steam_4
				Local $tempTAB = "Steam Library 4:  " & $Install_Folder_Steam_4
			Else
				MsgBox(48, "Missing Library", "Add the Library before adding Separators.")
				$Checker = "No"
			EndIf
		ElseIf $Steam_Library = "Steam Library 5" Then
			If FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
				$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
				$Install_Folder_Steam_5 = StringTrimRight($Install_Folder_Steam_5, 1)
				$Install_Folder_Steam_5 = "                             " & $Install_Folder_Steam_5
				Local $tempTAB = "Steam Library 5:  " & $Install_Folder_Steam_5
			Else
				MsgBox(48, "Missing Library", "Add the Library before adding Separators.")
				$Checker = "No"
			EndIf
		Else
			MsgBox(48, "Error", "Error reading Control")
			$Checker = "No"
		EndIf
	ElseIf $ButtonTAB_State = 2 Then
		$ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
		Local $tempTAB = "'Add: Games etc' to add Webpages, mp4's, doc's etc..."
;		$listview_TEMP = $ListView_Favorite_Image_2
	ElseIf $ButtonTAB_State = 3 Then
		$ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
		Local $tempTAB = "'Scan Revive Library Folders' if a game was added or removed."
;		$listview_TEMP = $ListView_Favorite_Image_3
	ElseIf $ButtonTAB_State = 4 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_1_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab4_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_4
	ElseIf $ButtonTAB_State = 5 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_2_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab5_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_5
	ElseIf $ButtonTAB_State = 6 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_3_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab6_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_6
	ElseIf $ButtonTAB_State = 7 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_4_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab7_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_7
	ElseIf $ButtonTAB_State = 8 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_5_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab8_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_8
	ElseIf $ButtonTAB_State = 9 Then
		$ApplicationList_TEMP = $ApplicationList_Custom_6_INI
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab9_Name", "")
;		$listview_TEMP = $ListView_Favorite_Image_9
	Else
		MsgBox(48, "Error", "Error getting Tab, maybe missing config.ini file!")
		$Checker = "No"
	EndIf

	If $Checker = "Yes" Then
		Local $NbrApps = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		Local $Sep_Name_len = StringLen($Sep_Name)
		If $Sep_Name_len < 39 Then
			$Sep_Name_len = $Name_Total - $Sep_Name_len
			For $a = 1 to $Sep_Name_len
				$Sep_Name = $Sep_Name & " "
			Next
		Else
			$Sep_Name = StringTrimRight($Sep_Name, $Sep_Name_len - ($Name_Total - 1))
		EndIf
		$Sep_Name = $Sep_Name_Pre & $Sep_Name

		$LastAppNR = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		$NewAppNR = $LastAppNR + 1

		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "NR", $NewAppNR)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "appid", $Sep_AppId)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "name", $Sep_Name)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "FileType", "Separator")
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "InstallDrive", $Sep_Drive)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "SizeOnDisk", $Sep_SoD)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "installdir", $Sep_Drive)
		IniWrite($ApplicationList_TEMP, "Application_" & $NewAppNR, "IconPath", $Sep_Pic)

#cs
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "NR", $NewAppNR)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "appid", $Sep_AppId)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "name", $Sep_Name)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "FileType", "Separator")
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "InstallDrive", $Sep_Drive)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "SizeOnDisk", $Sep_SoD)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "installdir", $Sep_Drive)
		IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "IconPath", $Sep_Pic)
	;	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "GamePath", $Value_GamePath_Folder)
	;	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "WebURL", $Value_Link_WebURL)
#ce

		IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $NewAppNR)
		_Read_from_INI_ADD_2_ListView()
	Else
		GUIDelete($Add_Sep_Form)
	EndIf
Else
	GUIDelete($Add_Sep_Form)
EndIf
GUIDelete($Add_Sep_Form)
_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NbrApps + 1 & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc



Func _RM_Menu_Item_13() ; Delete ListView item    line2139
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	$Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI
	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then
		$listview_Temp = $listview
		If $Combo = "ALL" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			Local $tempTAB = "'Scan Steam Library Folders' if a game was added or removed."
		EndIf
		If $Combo = "Steam Library 1" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
			$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
			$Install_Folder_Steam_1 = StringTrimRight($Install_Folder_Steam_1, 1)
			$Install_Folder_Steam_1 = "                             " & $Install_Folder_Steam_1
			Local $tempTAB = "Steam Library 1:  " & $Install_Folder_Steam_1
		EndIf
		If $Combo = "Steam Library 2" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
			$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
			$Install_Folder_Steam_2 = StringTrimRight($Install_Folder_Steam_2, 1)
			$Install_Folder_Steam_2 = "                             " & $Install_Folder_Steam_2
			Local $tempTAB = "Steam Library 2:  " & $Install_Folder_Steam_2
		EndIf
		If $Combo = "Steam Library 3" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
			$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
			$Install_Folder_Steam_3 = StringTrimRight($Install_Folder_Steam_3, 1)
			$Install_Folder_Steam_3 = "                             " & $Install_Folder_Steam_3
			Local $tempTAB = "Steam Library 3:  " & $Install_Folder_Steam_3
		EndIf
		If $Combo = "Steam Library 4" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
			$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
			$Install_Folder_Steam_4 = StringTrimRight($Install_Folder_Steam_4, 1)
			$Install_Folder_Steam_4 = "                             " & $Install_Folder_Steam_4
			Local $tempTAB = "Steam Library 4:  " & $Install_Folder_Steam_4
		EndIf
		If $Combo = "Steam Library 5" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
			$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
			$Install_Folder_Steam_5 = StringTrimRight($Install_Folder_Steam_5, 1)
			$Install_Folder_Steam_5 = "                             " & $Install_Folder_Steam_5
			Local $tempTAB = "Steam Library 5:  " & $Install_Folder_Steam_5
		EndIf
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then
		$ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
		$listview_Temp = $listview_2
		Local $tempTAB = "'Add: Games etc' to add Webpages, mp4's, doc's etc..."
	EndIf
	If $ButtonTAB_State = "3" Then
		$ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
		$listview_Temp = $listview_3
		Local $tempTAB = "'Scan Revive Library Folders' if a game was added or removed."
	EndIf
	If $ButtonTAB_State = "4" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_1_INI
		$listview_Temp = $listview_4
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab4_Name", "")
	EndIf
	If $ButtonTAB_State = "5" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_2_INI
		$listview_Temp = $listview_5
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab5_Name", "")
	EndIf
	If $ButtonTAB_State = "6" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_3_INI
		$listview_Temp = $listview_6
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab6_Name", "")
	EndIf
	If $ButtonTAB_State = "7" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_4_INI
		$listview_Temp = $listview_7
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab7_Name", "")
	EndIf
	If $ButtonTAB_State = "8" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_5_INI
		$listview_Temp = $listview_8
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab8_Name", "")
	EndIf
	If $ButtonTAB_State = "9" Then
		$ApplicationList_TEMP = $ApplicationList_Custom_6_INI
		$listview_Temp = $listview_9
		Local $tempTAB = IniRead($Config_INI, "Settings", "Tab9_Name", "")
	EndIf

#cs
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9
#ce

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
	$GetItem_installdir_1 = ""
	$GetItem_IconPath_1 = ""
	$GetItem_GamePath_1 = ""
	$GetItem_FileType_1 = ""
	$GetItem_WebURL_1 = ""
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
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", $GetItem_IconPath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "GamePath", $GetItem_GamePath_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "FileType", $GetItem_FileType_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "WebURL", $GetItem_WebURL_1)
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
			$GetItem_installdir_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "installdir", "")
			$GetItem_IconPath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "IconPath", "")
			$GetItem_GamePath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "GamePath", "")
			$GetItem_FileType_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "FileType", "")
			$GetItem_WebURL_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "WebURL", "")
			$GetItem_right_now_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "right_now", "")
;			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_24h_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "24h_peak", "")
			$GetItem_all_time_peak_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "all_time_peak", "")
			$GetItem_renderTargetMultiplier_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "renderTargetMultiplier", "")
			$GetItem_supersampleScale_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "supersampleScale", "")
			$GetItem_allowSupersampleFiltering_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "allowSupersampleFiltering", "")

			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "InstallDrive", $GetItem_Drive_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "SizeOnDisk", $GetItem_SizeOnDisk_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "installdir", $GetItem_installdir_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "IconPath", $GetItem_IconPath_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "GamePath", $GetItem_GamePath_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "FileType", $GetItem_FileType_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "WebURL", $GetItem_WebURL_next)
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

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $ApplicationList_NR_Applications - 1)
_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $ApplicationList_NR_Applications - 1 & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

#EndRegion

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
;MsgBox(0, "", "testign")
    Local $tagNMHDR, $event, $hwndFrom, $code
    $tagNMHDR = DllStructCreate("int;int;int", $lParam)
    If @error Then Return
    $event = DllStructGetData($tagNMHDR, 3)
        If $event = $NM_CLICK Then
			_Change_Preview_Icon_ListView()
;			_Update_StatusBar()
        EndIf
If $event = $NM_RCLICK Then
;	_Current_Players($NP)
;	$temptest = "Count is: " & $NP

;	$Context_Icon = $Steam_Icons & $appid & ".jpg"

	GUICtrlSetData($RM_ItemA, $Context_Icon)
;	$tempcount = $tempcount + 1
;	MsgBox(0, "", $temptest)
EndIf
        If $event = $NM_DBLCLK Then
			_DB_Click_Listview()
        EndIf

    $tagNMHDR = 0
    $event = 0
    $lParam = 0
EndFunc



Func _DB_Click_Listview()

	Local $Msg_Test = MsgBox(1, "Launch File?", "Are you sure that you want to launch this file?")
	If $Msg_Test == 1 Then _Run_Program()

;	Sleep(200)
;	_Create_HTMLView_GUI()
;	Sleep(200)
EndFunc


Func _Run_Program()
$Launch_String = ""

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
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Revive_Apps_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Custom_5_INI
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Custom_6_INI

	$listview_Temp = $ListView
	If $ButtonTAB_State = "1" Then $listview_Temp = $listview
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $listview_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $listview_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $listview_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $listview_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $listview_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $listview_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $listview_9

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_Temp)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	$GameNR = $ListView_Selected_Row_Nr

	$GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_FileType_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "FileType", "")

	If $GetItem_FileType_1 = "Steam Game" Then
		If Not ProcessExists("vrserver.exe") Then
			Local $ProcessTemp = MsgBox(36, "VR not running", "SteamVR is not running, do you want to launch it first?")
			If $ProcessTemp = 6 Then
				ShellExecute($Run_Steam)
				ProcessWait("vrdashboard.exe")
				Sleep(5000)
				$Launch_String = "steam://launch/" & $GetItem_appid_1 & "/vr"
			Else
				$Launch_String = "steam://launch/" & $GetItem_appid_1
			EndIf
		Else
			$Launch_String = "steam://launch/" & $GetItem_appid_1 & "/vr"
		EndIf
;		$Launch_String = "steam://launch/" & $GetItem_appid_1
	ElseIf $GetItem_FileType_1 = "Web Link" Then
		$Launch_String = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "WebURL", "")
	ElseIf $GetItem_FileType_1 = "Non-Steam Exe" Then
		$Launch_String = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "GamePath", "")
	ElseIf $GetItem_FileType_1 = "Non-Steam File" Then
		$Launch_String = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "GamePath", "")
	ElseIf $GetItem_FileType_1 = "Separator" Then
		MsgBox(48, "Oops!", "Can't launch the Separators!")
		$Launch_String = ""
	Else
		MsgBox(0,"FileType", $GetItem_FileType_1)
	EndIf
	If Not $Launch_String = "" Then ShellExecute($Launch_String)

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
		$CheckImagePath = IniRead($ApplicationList_Revive_Apps_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 4 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 5 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 6 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 7 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 8 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_5_INI, "Application_" & $Check_AppID, "IconPath", "")
	EndIf

	If $ButtonTAB_State = 9 Then
		$CheckImagePath = IniRead($ApplicationList_Custom_6_INI, "Application_" & $Check_AppID, "IconPath", "")
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
		Case 7
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_7)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_7, $ListView_Selected_Row_Index)
		Case 8
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_8)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_8, $ListView_Selected_Row_Index)
		Case 9
			Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView_9)
			$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
			Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1
			Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView_9, $ListView_Selected_Row_Index)
	EndSwitch



	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]
	Local $Game_ID_Type = StringTrimRight($Game_ID, 6)
	If $Game_ID_Type = "" Then
		Local $IE_Adresse = "https://steamdb.info/app/" & $Game_ID & "/graphs/"
		ShellExecute($IE_Adresse)
	Else
		MsgBox(48, "Not Steam", "This is not a Steam Game, so no Steam Info is available.")
	EndIf
;	Local $oIE = ObjCreate("Shell.Explorer.2")
;	Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 1010, 590, (@DesktopWidth - 920) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
;	GUICtrlCreateObj($oIE, 0, 0, 1010, 550)
;	Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 973, 553, 35, 35, $BS_BITMAP)
;	GUICtrlSetOnEvent(- 1, "_Button_Exit_HTML_GUI")
;	_GUICtrlButton_SetImage(- 1, $gfx & "Close_small.bmp")
;	GuiCtrlSetTip(-1, "Closes HTML GUI.")

;	$oIE.navigate($IE_Adresse)


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
	If $ButtonTAB_State = "7" Then $listview_Temp = $ListView_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $ListView_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $ListView_9

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Revive_Apps.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_5.ini"
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_6.ini"

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
	Local $Label_Web_Title4 = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	Local $Label_Web_Title5 = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	Local $Label_Web_Title6 = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	Local $Label_Web_Title7 = IniRead($Config_INI, "Settings", "TAB7_Name", "")
	Local $Label_Web_Title8 = IniRead($Config_INI, "Settings", "TAB8_Name", "")
	Local $Label_Web_Title9 = IniRead($Config_INI, "Settings", "TAB9_Name", "")

	If FileExists($Light_File) Then FileDelete($Light_File)

	FileWrite($Light_File, '<!DOCTYPE html>' & @CRLF & _
								'<html>' & @CRLF & _
								'<head>' & @CRLF & _
								'  <title>LightVR Start Page</title>' & @CRLF & _
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

								FileWriteLine($Light_File,  '	<div class="icons">' & @CRLF & _
															  '     <div class="tooltip"><a href="https://www.youtube.com/channel/UCzuqhhs6NWbgTzMuM09WKDQ"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/yt360.png" width="65" /><span class="tooltiptext">YouTube VR</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://www.youtube.com/channel/UC-9-kyTW8ZkZNDHQJ6FgpwQ"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/UtubeMusic.png" width="65" /><span class="tooltiptext">YouTube Music</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.twitch.tv"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/twitch.png" width="65" /><span class="tooltiptext">Twitch</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.twitch.tv/directory/game/Virtual%20Reality"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/twitchvr.png" width="65" /><span class="tooltiptext">Twitch VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://vrlfg.net/players"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/vrlfg.png" width="65" /><span class="tooltiptext">Steam Players</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.facebook.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/facebook.png" width="65" /><span class="tooltiptext">FaceBook</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://www.twitter.com"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/twitter.png" width="65" /><span class="tooltiptext">Twitter</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://web.skype.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/skype.png" width="65" /><span class="tooltiptext">Skype</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://imgur.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/imgur.png" width="65" /><span class="tooltiptext">Imgur</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://docs.google.com/document/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/google_docs.png" width="65" /><span class="tooltiptext">Google Docs</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.mindmeister.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/MindMeister.png" width="65" /><span class="tooltiptext">MindMeister</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://awwapp.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/whiteboard.png" width="65" /><span class="tooltiptext">Whiteboard</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Light_File, '	<div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Gmail.png" width="65" /><span class="tooltiptext">Gmail</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://login.yahoo.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/YahooEmail.png" width="65" /><span class="tooltiptext">Yahoo Email</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://login.aol.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/AOLemail.png" width="65" /><span class="tooltiptext">AOL Email</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/Vive/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Vivereddit.png" width="65" /><span class="tooltiptext">Vive Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/WindowsMR/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/WindowsMRreddit.png" width="65" /><span class="tooltiptext">WindowsMR Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/oculus/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/OculusReddit.png" width="65" /><span class="tooltiptext">Oculus Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://store.steampowered.com/vr/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Steam.png" width="65" /><span class="tooltiptext">SteamStore VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.roadtovr.com/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/RoadtoVR.png" width="65" /><span class="tooltiptext">RoadToVR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.virtualreality-news.net/"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/VR360.png" width="65" /><span class="tooltiptext">VR360</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.netflix.com/login"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Netflix.png" width="65" /><span class="tooltiptext">Netflix</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://auth.hulu.com/web/login"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Hulu.png" width="65" /><span class="tooltiptext">Hulu</span></a></div>' & @CRLF & _
															  ' </div>')

								FileWriteLine($Light_File, '  <div class="icons">' & @CRLF & _
															  '	 	<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_ALL.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_All.png" width="65" /><span class="tooltiptext">All Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Non-Steam_Appl.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Non_Steam_Apps.png" width="65" /><span class="tooltiptext">Non-Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Revive_Apps.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Revive.png" width="65" /><span class="tooltiptext">Revive Apps</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_1.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_One.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title4 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_2.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Two.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title5 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_3.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Three.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title6 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_4.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Four.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title7 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_5.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Five.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title8 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'GamePage_VRTbx_Custom_6.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Games_Six.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title9 & '</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Light_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'Clock.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Clock.png" width="65" /><span class="tooltiptext">Clock</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'Clock1.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Clock1.png" width="65" /><span class="tooltiptext">Clock1</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'Date.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Date.png" width="65" /><span class="tooltiptext">Date</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'Day.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/Day.png" width="65" /><span class="tooltiptext">Day</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Light_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR_Icons & 'TVCuts_VRTbx.html"><img class="icon" src="'& $Install_Web_DIR_Icons & 'images/TVCuts.png" width="95" /><span class="tooltiptext">Singles Page</span></a></div>' & @CRLF & _
															  '  </div>')



	FileWriteLine($Light_File, '</body>')
	FileWriteLine($Light_File, '</html>')

EndFunc



Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page...")

	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	Local $Label_Web_Title4 = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	Local $Label_Web_Title5 = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	Local $Label_Web_Title6 = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	Local $Label_Web_Title7 = IniRead($Config_INI, "Settings", "TAB7_Name", "")
	Local $Label_Web_Title8 = IniRead($Config_INI, "Settings", "TAB8_Name", "")
	Local $Label_Web_Title9 = IniRead($Config_INI, "Settings", "TAB9_Name", "")
	If $WinName = "VR Toolbox" Then
		If $ButtonTAB_State = "1" Then $WebPage_Title = "All SteamVR Games for VRToolbox"
		If $ButtonTAB_State = "2" Then $WebPage_Title = "Non-Steam Titles for VRToolbox"
		If $ButtonTAB_State = "3" Then $WebPage_Title = "Revive/Oculus Apps for VRToolbox"
		If $ButtonTAB_State = "4" Then $WebPage_Title = $Label_Web_Title4 & " for VRToolbox"
		If $ButtonTAB_State = "5" Then $WebPage_Title = $Label_Web_Title5 & " for VRToolbox"
		If $ButtonTAB_State = "6" Then $WebPage_Title = $Label_Web_Title6 & " for VRToolbox"
		If $ButtonTAB_State = "7" Then $WebPage_Title = $Label_Web_Title7 & " for VRToolbox"
		If $ButtonTAB_State = "8" Then $WebPage_Title = $Label_Web_Title8 & " for VRToolbox"
		If $ButtonTAB_State = "9" Then $WebPage_Title = $Label_Web_Title9 & " for VRToolbox"
	Else
		If $ButtonTAB_State = "1" Then $WebPage_Title = "All SteamVR Games"
		If $ButtonTAB_State = "2" Then $WebPage_Title = "Non-Steam Titles"
		If $ButtonTAB_State = "3" Then $WebPage_Title = "Revive/Oculus Apps"
		If $ButtonTAB_State = "4" Then $WebPage_Title = $Label_Web_Title4
		If $ButtonTAB_State = "5" Then $WebPage_Title = $Label_Web_Title5
		If $ButtonTAB_State = "6" Then $WebPage_Title = $Label_Web_Title6
		If $ButtonTAB_State = "8" Then $WebPage_Title = $Label_Web_Title8
		If $ButtonTAB_State = "9" Then $WebPage_Title = $Label_Web_Title9
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
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Revive_Apps.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "7" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"
	If $ButtonTAB_State = "8" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_5.ini"
	If $ButtonTAB_State = "9" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_6.ini"

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
		If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Revive_Apps.html"
		If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_1.html"
		If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_2.html"
		If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_3.html"
		If $ButtonTAB_State = "7" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_4.html"
		If $ButtonTAB_State = "8" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_5.html"
		If $ButtonTAB_State = "9" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_VRTbx_Custom_6.html"

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
		If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Revive_Apps.html"
		If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
		If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
		If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
		If $ButtonTAB_State = "7" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"
		If $ButtonTAB_State = "8" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_5.html"
		If $ButtonTAB_State = "9" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_6.html"
	EndIf





	If $ButtonTAB_State = "1" Then $listview_Temp = $ListView
	If $ButtonTAB_State = "2" Then $listview_Temp = $listview_2
	If $ButtonTAB_State = "3" Then $listview_Temp = $ListView_3
	If $ButtonTAB_State = "4" Then $listview_Temp = $ListView_4
	If $ButtonTAB_State = "5" Then $listview_Temp = $ListView_5
	If $ButtonTAB_State = "6" Then $listview_Temp = $ListView_6
	If $ButtonTAB_State = "7" Then $listview_Temp = $ListView_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $ListView_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $ListView_9

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
			FileWrite($GamePage_path, '<!DOCTYPE html>' & @CRLF & _
									'<html>' & @CRLF & _
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
			FileWrite($GamePage_path, '<!DOCTYPE html>' & @CRLF & _
									'<html>' & @CRLF & _
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
				Global $Application_Install_Drive = IniRead($ApplicationList_TEMP, "Application_" & $NR, "InstallDrive", "")
				Global $Application_FileType = IniRead($ApplicationList_TEMP, "Application_" & $NR, "FileType", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")
				$Application_IconPath = "file://localhost/" & StringReplace($Application_IconPath, "\","/")
				Global $Application_GamePath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "GamePath", "")
				$Application_GamePath = StringReplace($Application_GamePath, "\", "/")
				Global $Application_WebURL = IniRead($ApplicationList_TEMP, "Application_" & $NR, "WebURL", "")
				Global $WebPage_IconPath = "..\Icons\steam.app." & $Application_appid & ".jpg"
				Local $File_Exists = FileExists($Icons & "steam.app." & $Application_appid & ".jpg")

				If $File_Exists = 0 Then
					FileCopy($gfx & "Icon_Preview.jpg", $Icons & "steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $WinName = "VR Toolbox" Then
						If $Application_FileType = "Non-Steam Exe" Then
						; 	$Application_BATpath = $BAT_Path & $Application_appid & ".bat"
						;	_MakeBAT()
						;	FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $Application_BATpath & "');" & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
							FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $Application_GamePath & $nonSteam_Arg & "');" & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						ElseIf $Application_FileType = "Non-Steam File" Then
							FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'OpenFile', '" & $Application_GamePath & "');" & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						ElseIf $Application_FileType = "Web Link" Then
							FileWriteLine($GamePage_path, '<div class="tooltip"><a href="' & $Application_WebURL & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '" ><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						ElseIf $Application_FileType = "Revive Game" Then
							$BAT_File = $Revive_Tlbx_BAT_DIR & $Application_name & ".bat"
							$BAT_File = StringReplace($BAT_File, "\", "/")
							FileWriteLine($GamePage_path, '	<div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $BAT_File & "');" & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						Else
			;				$Application_BATpath = $BAT_Path & $Application_appid & ".bat"
			;				_MakeBAT()
			;				FileWriteLine($GamePage_path, '    <div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $Application_BATpath & "');" & '"><img ' & "class" & '="icon" src="../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
							FileWriteLine($GamePage_path, '    <div class="tooltip"><a onclick="VRTStartCommand(' & "'ShellExec', 'steam://launch/" & $Application_appid & $Steam_Arg & "');" & '"><img ' & "class" & '="icon" src="../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						EndIf
				Else

					If $Application_FileType = "Non-Steam Exe" Then
							FileWriteLine($GamePage_path, '	<div class="tooltip"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">EXE files will not work outside of VRToolbox</span></a></div>')
						ElseIf $Application_FileType = "Non-Steam File" Then
							FileWriteLine($GamePage_path, '	<div class="tooltip"><a href="file://localhost/' & $Application_GamePath & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						ElseIf $Application_FileType = "Web Link" Then
							FileWriteLine($GamePage_path, '	<div class="tooltip"><a href="' & $Application_WebURL & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '" ><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
						ElseIf $Application_FileType = "Revive Game" Then
;							$BAT_File = $Revive_Tlbx_BAT_DIR & $Application_name & ".bat"
;							$BAT_File = StringReplace($BAT_File, "\", "/")
							FileWriteLine($GamePage_path, '	<div class="tooltip"><img ' & "class" & '="icon" src="' & $Application_IconPath & '"><br>&nbsp;<' & "span class" & '="tooltiptext">' & "Revive files will not work outside of VRToolbox" & '</span></a></div>')
						Else
							FileWriteLine($GamePage_path, '	<div class="tooltip"><a href="steam://launch/' & $Application_appid & '/vr"><img class="icon" src="../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf
			EndIf
		Next

		Sleep(100)
		FileWriteLine($GamePage_path, ' </div>')
		FileWriteLine($GamePage_path, '</body>')
		FileWriteLine($GamePage_path, '</html>')
		Sleep(100)
		GUICtrlSetData($Checkbox_CreatePage, "")
		_GUICtrlListView_SetItemChecked($listview_Temp, -1, False)
		GUICtrlSetData($Display_Progressbar, 100)
		_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
		MsgBox(0, "Operation Completed", "Game Page created", 1)
		Sleep(600)
		GUICtrlSetData($Display_Progressbar, 0)
	Else
		MsgBox($MB_ICONWARNING, "No Application selected", "You need to select at least one Application to be able to create the HTML page.")
	EndIf

	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")

EndFunc

Func _MakeBAT()
	If FileExists($Application_BATpath) Then FileDelete($Application_BATpath)
	FileWriteLine($Application_BATpath, "@echo off")
	If $Application_FileType = "Steam Game" Then
		FileWriteLine($Application_BATpath, 'START "" ' & '"steam://launch/' & $Application_appid & '"')
	Else
		FileWriteLine($Application_BATpath, 'START "" ' & '"' & $Application_GamePath & '"')
	EndIf
	FileWriteLine($Application_BATpath, 'tasklist /FI "IMAGENAME eq ' & 'VRToolbox.exe" | find' & ' /I "VRToolbox.' & 'exe" > nul')
	FileWriteLine($Application_BATpath, "IF %ERRORLEVEL" & '% equ 0 taskkill /' & 'IM "VRToolbox.exe"')
	FileWriteLine($Application_BATpath, "exit")

EndFunc

Func _Create_MasterPage()

	Local $Label_Web_Title4 = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	Local $Label_Web_Title5 = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	Local $Label_Web_Title6 = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	Local $Label_Web_Title7 = IniRead($Config_INI, "Settings", "TAB7_Name", "")
	Local $Label_Web_Title8 = IniRead($Config_INI, "Settings", "TAB8_Name", "")
	Local $Label_Web_Title9 = IniRead($Config_INI, "Settings", "TAB9_Name", "")

	Local $Master_File = $Install_Web_DIR & "MasterPage.html"

	If FileExists($Master_File) Then FileDelete($Master_File)

	FileWrite($Master_File, '<!DOCTYPE html>' & @CRLF & _
								'<html>' & @CRLF & _
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
															  '		<div class="tooltip"><a href="http://vrlfg.net/players"><img class="icon" src="images/vrlfg.png" width="65" /><span class="tooltiptext">Steam Players</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.facebook.com/"><img class="icon" src="images/facebook.png" width="65" /><span class="tooltiptext">FaceBook</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="http://www.twitter.com"><img class="icon" src="images/twitter.png" width="65" /><span class="tooltiptext">Twitter</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://web.skype.com/"><img class="icon" src="images/skype.png" width="65" /><span class="tooltiptext">Skype</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://imgur.com/"><img class="icon" src="images/imgur.png" width="65" /><span class="tooltiptext">Imgur</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://docs.google.com/document/"><img class="icon" src="images/google_docs.png" width="65" /><span class="tooltiptext">Google Docs</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.mindmeister.com/"><img class="icon" src="images/MindMeister.png" width="65" /><span class="tooltiptext">MindMeister</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://awwapp.com/"><img class="icon" src="images/whiteboard.png" width="65" /><span class="tooltiptext">Whiteboard</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Master_File, '	<div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"><img class="icon" src="images/Gmail.png" width="65" /><span class="tooltiptext">Gmail</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://login.yahoo.com/"><img class="icon" src="images/YahooEmail.png" width="65" /><span class="tooltiptext">Yahoo Email</span></a></div>' & @CRLF & _
															  '     <div class="tooltip"><a href="https://login.aol.com/"><img class="icon" src="images/AOLemail.png" width="65" /><span class="tooltiptext">AOL Email</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/Vive/"><img class="icon" src="images/Vivereddit.png" width="65" /><span class="tooltiptext">Vive Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/WindowsMR/"><img class="icon" src="images/WindowsMRreddit.png" width="65" /><span class="tooltiptext">WindowsMR Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.reddit.com/r/oculus/"><img class="icon" src="images/OculusReddit.png" width="65" /><span class="tooltiptext">Oculus Reddit</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://store.steampowered.com/vr/"><img class="icon" src="images/Steam.png" width="65" /><span class="tooltiptext">SteamStore VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.roadtovr.com/"><img class="icon" src="images/roadtovr.png" width="65" /><span class="tooltiptext">Road to VR</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="https://www.virtualreality-news.net/"><img class="icon" src="images/vr360.png" width="65" /><span class="tooltiptext">VR News</span></a></div>' & @CRLF & _
															  ' </div>')

								FileWriteLine($Master_File, '  <div class="icons">' & @CRLF & _
															  '	 	<div class="tooltip"><a href="GamePage_ALL.html"><img class="icon" src="images\Games_All.png" width="65" /><span class="tooltiptext">All Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Non-Steam_Appl.html"><img class="icon" src="images\Non_Steam_Apps.png" width="65" /><span class="tooltiptext">Non-Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Revive_Apps.html"><img class="icon" src="images\Games_Revive.png" width="65" /><span class="tooltiptext">Revive Apps</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_1.html"><img class="icon" src="images\Games_One.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title4 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_2.html"><img class="icon" src="images\Games_Two.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title5 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_3.html"><img class="icon" src="images\Games_Three.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title6 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_4.html"><img class="icon" src="images\Games_Four.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title7 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_5.html"><img class="icon" src="images\Games_Five.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title8 & '</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="GamePage_Custom_6.html"><img class="icon" src="images\Games_Six.png" width="65" /><span class="tooltiptext">' & $Label_Web_Title9 & '</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Master_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="Clock.html"><img class="icon" src="images\Clock.png" width="65" /><span class="tooltiptext">Clock</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Clock1.html"><img class="icon" src="images\Clock1.png" width="65" /><span class="tooltiptext">Clock1</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Date.html"><img class="icon" src="images\Date.png" width="65" /><span class="tooltiptext">Date</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="Day.html"><img class="icon" src="images\Day.png" width="65" /><span class="tooltiptext">Day</span></a></div>' & @CRLF & _
															  '  </div>')

								FileWriteLine($Master_File, '  <div class="icons">' & @CRLF & _
															  '		<div class="tooltip"><a href="TVCuts.html"><img class="icon" src="images\TVCuts.png" width="85" /><span class="tooltiptext">Singles Page</span></a></div>' & @CRLF & _
															  '  </div>')

	FileWriteLine($Master_File, '</body>')
	FileWriteLine($Master_File, '</html>')
;MsgBox(0, "Operation Completed", "MasterPage created", 2)
EndFunc




Func _Open_Page()
	Local $Open_Page_path1 = ""
	$WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")
	If $WinName = "" Then $WinName = "SteamVR"
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
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Revive_Apps.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "4" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_1.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "5" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_2.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "6" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_3.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "7" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_4.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf
		If $ButtonTAB_State = "8" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_5.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf
		If $ButtonTAB_State = "9" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_VRTbx_Custom_6.html"
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
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Revive_Apps.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "4" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_1.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "5" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_2.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "6" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_3.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "7" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_4.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "8" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_5.html"
			If FileExists($Open_Page_path1) Then
					ShellExecute($Open_Page_path1)
				Else
					MsgBox(0,"Oops!", "You need to create the page first!")
				EndIf
		EndIf

		If $ButtonTAB_State = "9" Then
			$Open_Page_path1 = $Install_Web_DIR & "GamePage_Custom_6.html"
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
	If $WinName = "" Then $WinName = "SteamVR"
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
			FileWrite($GamePage_path, '<!DOCTYPE html>' & @CRLF & _
									'<html>' & @CRLF & _
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

	_TV_AppList_All()
	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
	_TV_AppList_All()
;	$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Revive_Apps.ini"
;	$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
;	_TV_AppList_All()

	FileWriteLine($GamePage_path, ' </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')

	If $WinName <> "VR Toolbox" Then
		MsgBox(0, "File Status", "Singles Page created: note that Revive and EXE files will not launch from a browser outside of VRToolbox, so they have not been included.", 5)
	Else
		MsgBox(0, "File Status", "Page Created", .5)
	EndIf
	_GUICtrlStatusBar_SetText($Statusbar, "Game Page created." & @TAB & @TAB & "'Version " & $Version & "'")
	Sleep(100)
	GUICtrlSetData($Display_Progressbar, 100)
	Sleep(600)
	GUICtrlSetData($Display_Progressbar, 0)
	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc



Func _TV_AppList_All()

	For $NR = 1 To $NR_Applications
			GUICtrlSetData($Display_Progressbar, $NR * 100 / $NR_Applications)

				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_SizeOnDisk = IniRead($ApplicationList_TEMP, "Application_" & $NR, "SizeOnDisk", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $Application_FileType = IniRead($ApplicationList_TEMP, "Application_" & $NR, "FileType", "")
				Global $WebPage_IconPath = $Install_DIR & "..\Icons\steam.app." & $Application_appid & ".jpg"
				Global $Application_GamePath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "GamePath", "")
				$Application_GamePath = StringReplace($Application_GamePath, "\", "/")
				Global $Application_WebURL = IniRead($ApplicationList_TEMP, "Application_" & $NR, "WebURL", "")

				Local $File_Exists = FileExists($Icons & "steam.app." & $Application_appid & ".jpg")
				If $File_Exists = 0 Then
					FileCopy($gfx & "Icon_Preview.jpg", $Icons & "steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $WinName = "VR Toolbox" Then
					FileWriteLine($GamePage_path, '<div class="tooltip"><a href="CutsVRTbx/' & $Application_appid & ".html" & '"><img class="icon" src="../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					_Single_Cut_VRTbx()
				Else
					If $Application_FileType <> "Non-Steam Exe" Then
						FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="Cuts/' & $Application_appid & ".html" & '"><img class="icon" src="../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						_Single_Cut()
					EndIf
				EndIf

	Next

EndFunc


Func _Single_Cut_VRTbx()
	$Cuts_Path = $Install_DIR & "Webpage\CutsVRTbx\"
	$Full_Cuts_Path = $Cuts_Path & $Application_appid & ".html"
	If FileExists($Full_Cuts_path) Then FileDelete($Full_Cuts_path)

	FileWrite($Full_Cuts_Path, '<!DOCTYPE html>' & @CRLF & _
									'<html>' & @CRLF & _
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


	If $Application_FileType = "Non-Steam Exe" Then
		FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $Application_GamePath & "');" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
	ElseIf $Application_FileType = "Non-Steam File" Then
		FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a onclick="VRTStartCommand(' & "'OpenFile', '" & $Application_GamePath & "');" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
	ElseIf $Application_FileType = "Web Link" Then
		FileWriteLine($Full_Cuts_Path, '    <div class="favtooltip"><a onclick="VRTStartCommand(' & "'OpenFile', '" & $Application_WebURL & "');" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
;		FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a href="' & $Application_WebURL & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '" ><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
	ElseIf $Application_FileType = "Revive Game" Then
		$BAT_File = $Revive_Tlbx_BAT_DIR & $Application_name & ".bat"
		$BAT_File = StringReplace($BAT_File, "\", "/")
		FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '" & $BAT_File & "');" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
	Else
		FileWriteLine($Full_Cuts_Path, '    <div class="favtooltip"><a onclick="VRTStartCommand(' & "'ShellExec', 'steam://launch/" & $Application_appid & "/vr');" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tvtooltiptext">' & $Application_name & '</span></a></div>')
	EndIf


;				FileWriteLine($Full_Cuts_Path, '<div class="favtooltip"><a onclick="VRTStartCommand(' & "'ShellExec', '"& 'steam://'& "rungameid/" & $Application_appid & "');" & '"><img class="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg" /><span class="tvtooltiptext">' & $Application_name & '</span></a></div>')


	;FileWriteLine($Full_Cuts_Path, ' </div>')
	FileWriteLine($Full_Cuts_Path, '</body>')
	FileWriteLine($Full_Cuts_Path, '</html>')

EndFunc

Func _Single_Cut()
	$Cuts_Path = $Install_DIR & "Webpage\Cuts\"
	$Full_Cuts_Path = $Cuts_Path & $Application_appid & ".html"
	If FileExists($Full_Cuts_path) Then FileDelete($Full_Cuts_path)

	FileWrite($Full_Cuts_Path, '<!DOCTYPE html>' & @CRLF & _
									'<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $Application_name & "</title>" & @CRLF & _
									'    <link href="../css/favs.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF)

		If $Application_FileType = "Non-Steam Exe" Then
;			FileWriteLine($Full_Cuts_Path, '	<div class="' & 'favtooltip"><a href = "file:///' & $Application_GamePath & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
		ElseIf $Application_FileType = "Non-Steam File" Then
			FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a href = "file:///' & $Application_GamePath & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
		ElseIf $Application_FileType = "Web Link" Then
			FileWriteLine($Full_Cuts_Path, '    <div class="favtooltip"><a href= "' & $Application_WebURL & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
;			FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a href= "' & $Application_WebURL & '"><img ' & "class" & '="icon" src="' & $Application_IconPath & '" ><br>&nbsp;<' & "span class" & '="tooltiptext">' & $Application_name & '</span></a></div>')
		ElseIf $Application_FileType = "Revive Game" Then
;			$BAT_File = $Revive_Tlbx_BAT_DIR & $Application_name & ".bat"
;			$BAT_File = StringReplace($BAT_File, "\", "/")
;			FileWriteLine($Full_Cuts_Path, '	<div class="favtooltip"><a href = "file:///' & $BAT_File & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg"><br>&nbsp;<' & "span class" & '="tvtooltiptext">' & $Application_name & '</span></a></div>')
		Else
			FileWriteLine($Full_Cuts_Path, '    <div class="favtooltip"><a href= "' & 'steam://launch/' & $Application_appid & "/vr" & '"><img ' & "class" & '="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tvtooltiptext">' & $Application_name & '</span></a></div>')
		EndIf



;	FileWriteLine($Full_Cuts_Path, '<div class="favtooltip"><a href="steam://rungameid/' & $Application_appid & '"><img class="tvicon" src="../../Icons/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tvtooltiptext">' & $Application_name & '</span></a></div>')


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
	If $ButtonTAB_State = "7" Then $listview_Temp = $ListView_7
	If $ButtonTAB_State = "8" Then $listview_Temp = $ListView_8
	If $ButtonTAB_State = "9" Then $listview_Temp = $ListView_9

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Revive_Apps.ini"

	If $Status_Combo_Add_to_Custom <> "Choose TAB" Then
		$ButtonTAB_State_1 = GUICtrlRead($ButtonTAB_Custom_1)
		$ButtonTAB_State_2 = GUICtrlRead($ButtonTAB_Custom_2)
		$ButtonTAB_State_3 = GUICtrlRead($ButtonTAB_Custom_3)
		$ButtonTAB_State_4 = GUICtrlRead($ButtonTAB_Custom_4)
		$ButtonTAB_State_5 = GUICtrlRead($ButtonTAB_Custom_5)
		$ButtonTAB_State_6 = GUICtrlRead($ButtonTAB_Custom_6)

		$ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_5 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_5.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_6 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_6.ini"


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
					Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
					Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")
					Global $Application_GamePath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "GamePath", "")
					Global $Application_FileType = IniRead($ApplicationList_TEMP, "Application_" & $NR, "FileType", "")
					Global $Application_WebURL = IniRead($ApplicationList_TEMP, "Application_" & $NR, "WebURL", "")

					IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)                     ;results in one odd line in the ini file
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "InstallDrive", $Application_Drive)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "SizeOnDisk", $Application_SizeOnDisk)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "installdir", $Application_installdir)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "IconPath", $Application_IconPath)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "GamePath", $Application_GamePath)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "FileType", $Application_FileType)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "WebURL", $Application_WebURL)
					$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
		MsgBox(0, "Copied", "Copied", 1)
	EndIf
	GUICtrlSetData($Checkbox_CreatePage, "")
	_GUICtrlListView_SetItemChecked($listview_Temp, -1, False)

EndFunc




Func _Combo_SteamLibrary()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Install_FS = ""

	IniWrite($config_ini, "Settings", "Steam_Library", $Combo)
	If $Combo = "Steam Library 1" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini") Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		If $Install_Folder_Steam_1 <> "" Then
			_Read_from_INI_ADD_2_ListView()
;			$NR_Applications = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini", "ApplicationList", "NR_Applications", "")

;			_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
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
	If $Combo = "ALL" Then
		_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	ElseIf $Combo = "Steam Library 1" Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		$Install_Folder_Steam_1 = StringTrimRight($Install_Folder_Steam_1, 1)
		_GUICtrlStatusBar_SetText($Statusbar, $Combo & "                      " & $Install_Folder_Steam_1 & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	ElseIf $Combo = "Steam Library 2"  Then
		$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		$Install_Folder_Steam_2 = StringTrimRight($Install_Folder_Steam_2, 1)
		_GUICtrlStatusBar_SetText($Statusbar, $Combo & "                             " & $Install_Folder_Steam_2 & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	ElseIf $Combo = "Steam Library 3" Then
		$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		$Install_Folder_Steam_3 = StringTrimRight($Install_Folder_Steam_3, 1)
		_GUICtrlStatusBar_SetText($Statusbar, $Combo & "                             " & $Install_Folder_Steam_3 & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	ElseIf $Combo = "Steam Library 4" Then
		$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		$Install_Folder_Steam_4 = StringTrimRight($Install_Folder_Steam_4, 1)
		_GUICtrlStatusBar_SetText($Statusbar, $Combo & "                             " & $Install_Folder_Steam_4 & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	ElseIf	$Combo = "Steam Library 5" Then
		$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		$Install_Folder_Steam_5 = StringTrimRight($Install_Folder_Steam_5, 1)
		_GUICtrlStatusBar_SetText($Statusbar, $Combo & "                             " & $Install_Folder_Steam_5 & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	EndIf
	GUICtrlSetData($Checkbox_CreatePage, "")
EndFunc

Func _Color()  ;place holder  Not used atm

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)
;	GUICtrlSetBkColor($ButtonTAB_Custom_7, $TabGroup_Color)
	GUICtrlSetBkColor($Tab_Group, $TabButton_Color)
	GUICtrlSetBkColor($ButtonTAB_ChangeName, $TabButton_Color)
	GUICtrlSetBkColor($Button_Settings, $Settings_Color)

EndFunc




Func _ButtonTAB_Steam_Library()
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
	GUICtrlSetState($Combo_TitleGroup, $GUI_SHOW)
	GUICtrlSetState($Combo_Title, $GUI_SHOW)
	GUICtrlSetState($Combo_Title, $GUI_ENABLE)
	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverSteam, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

;	GUICtrlSetState($Button_Settings, $GUI_SHOW)
	GUICtrlSetState($Placeholder_Group, $GUI_HIDE)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_HIDE)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
;	GUICtrlSetState($Cover1, $GUI_HIDE)
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
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image)
	Local $NR_of_Apps = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView, $ListView_Favorite_Image, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Non_Steam_Appl()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Non_Steam_Appl)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_DISABLE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
	GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_HIDE)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_HIDE)
	GUICtrlSetState($Button_AddGame2Library, $GUI_SHOW)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_HIDE)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "2")
	_GUICtrlListView_DeleteAllItems($listview_2)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_SHOW)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_2)
	Local $NR_of_Apps = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next
	_GUICtrlListView_SetImageList($ListView_2, $ListView_Favorite_Image_2, 1)

	_Read_from_INI_ADD_2_ListView()
	_GUICtrlStatusBar_SetText($Statusbar, "'Add: Games etc' to add Webpages, mp4's, doc's etc..." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Revive_Apps()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Revive_Apps)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_SHOW)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_HIDE)
	GUICtrlSetState($Library_Setup_Label2, $GUI_SHOW)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_HIDE)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_HIDE)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "3")
	_GUICtrlListView_DeleteAllItems($listview_3)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_SHOW)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_3)
	Local $NR_of_Apps = IniRead($ApplicationList_Revive_Apps_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Revive_Apps_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next
	_GUICtrlListView_SetImageList($ListView_3, $ListView_Favorite_Image_3, 1)
	_Read_from_INI_ADD_2_ListView()
	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Revive Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Custom_1()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_1)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)

	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "4")
	_GUICtrlListView_DeleteAllItems($ListView_4)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_SHOW)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_4)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_1_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_1_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_4, $ListView_Favorite_Image_4, 1)
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab4_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")

EndFunc

Func _ButtonTAB_Custom_2()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_2)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "5")
	_GUICtrlListView_DeleteAllItems($ListView_5)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_SHOW)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_5)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_2_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_2_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_5, $ListView_Favorite_Image_5, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab5_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Custom_3()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_3)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "6")
	_GUICtrlListView_DeleteAllItems($ListView_6)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_SHOW)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_6)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_3_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_3_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_6, $ListView_Favorite_Image_6, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab6_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Custom_4()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_4)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "7")
	_GUICtrlListView_DeleteAllItems($ListView_7)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_SHOW)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_7)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_4_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_7 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_4_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_7, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_7, $ListView_Favorite_Image_7, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab7_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Custom_5()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_5)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_DISABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_ENABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $Tab_HighLight)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $TabGroup_Color)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "8")
	_GUICtrlListView_DeleteAllItems($ListView_8)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_SHOW)
	GUICtrlSetState($listview_9, $GUI_HIDE)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_8)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_5_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_8 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_5_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_8, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_8, $ListView_Favorite_Image_8, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab8_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc

Func _ButtonTAB_Custom_6()
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_6)
	GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Revive_Apps, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_5, $GUI_ENABLE)
	GUICtrlSetState($ButtonTAB_Custom_6, $GUI_DISABLE)
	GUICtrlSetState($Combo_SteamLibrary, $GUI_DISABLE)
;	GUICtrlSetState($Combo_TitleGroup, $GUI_HIDE)
	GUICtrlSetState($Combo_Title, $GUI_DISABLE)

	GUICtrlSetBkColor($ButtonTAB_Steam_Library, $Tab1_Color)
	GUICtrlSetBkColor($ButtonTAB_Non_Steam_Appl, $Tab2_Color)
	GUICtrlSetBkColor($ButtonTAB_Revive_Apps, $Tab3_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_5, $TabGroup_Color)
	GUICtrlSetBkColor($ButtonTAB_Custom_6, $Tab_HighLight)

	GUICtrlSetState($ButtonCoverLibrary, $GUI_SHOW)
	GUICtrlSetState($ButtonCoverSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverNonSteam, $GUI_HIDE)
	GUICtrlSetState($ButtonCoverRevive, $GUI_HIDE)
;	GUICtrlSetState($Library_Setup_Label1, $GUI_SHOW)
	GUICtrlSetState($Library_Setup_Label2, $GUI_HIDE)

;	GUICtrlSetState($TextAnd, $GUI_SHOW)
;	GUICtrlSetState($TextClick, $GUI_SHOW)
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
;	GUICtrlSetState($Button_Settings, $GUI_HIDE)
	GUICtrlSetState($Placeholder_Group, $GUI_SHOW)
	GUICtrlSetState($Placeholder_VRGuy, $GUI_SHOW)
	GUICtrlSetState($Button_AddGame2Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Revive_Library, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
;	GUICtrlSetState($Cover1, $GUI_SHOW)
	GUICtrlSetData($Checkbox_CreatePage, "")
	IniWrite($config_ini, "Settings", "ButtonTAB_State", "9")
	_GUICtrlListView_DeleteAllItems($ListView_9)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)
	GUICtrlSetState($listview_7, $GUI_HIDE)
	GUICtrlSetState($listview_8, $GUI_HIDE)
	GUICtrlSetState($listview_9, $GUI_SHOW)

	GUICtrlSetState($Tab_Group, $GUI_SHOW)

	_GUIImageList_Destroy($ListView_Favorite_Image_9)
	Local $NR_of_Apps = IniRead($ApplicationList_Custom_6_INI, "ApplicationList", "NR_Applications", "")
	$ListView_Favorite_Image_9 = _GUIImageList_Create(30, 30)
	For $NR = 1 To $NR_of_Apps
		$appid = IniRead($ApplicationList_Custom_6_INI, "Application_" & $NR, "appid", "")
		_GUIImageList_AddBitmap($ListView_Favorite_Image_9, $Icons & "32x32\" & "steam.app." & $appid & ".bmp")
	Next

	_GUICtrlListView_SetImageList($ListView_9, $ListView_Favorite_Image_9, 1)

;	_ListView_Icon_Refresh()
	_Read_from_INI_ADD_2_ListView()
	Local $tempTAB = IniRead($Config_INI, "Settings", "Tab9_Name", "")
	_GUICtrlStatusBar_SetText($Statusbar, $tempTAB & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc


Func _Button_AddGame2Library()
	_AddGame2Library_GUI()
EndFunc

Func _Button_ReScan_Steam_Library()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
Local $temp_Combo = $Combo

_Scanning_GUI()

GUICtrlSetData($Combo_SteamLibrary, "ALL")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Files")
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
;			Sleep(500)
			GUICtrlSetData($Display_Progressbar, 0)
			GUICtrlSetData($Display_Progressbar_2, $NR_Library * 80 / $NR_temp3)
		Next
		$NR_Library_temp = ""
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar_2, 75)


GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")      ;If $Combo <> "ALL" Then
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Library 1")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
		GUICtrlSetData($Display_Progressbar_2, 80)
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library 1 finished.")

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Library 2")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
		GUICtrlSetData($Display_Progressbar_2, 85)
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library 2 finished.")

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 3")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Library 3")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
		GUICtrlSetData($Display_Progressbar_2, 90)
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library 3 finished.")

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 4")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Library 4")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
		GUICtrlSetData($Display_Progressbar_2, 95)
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library 4 finished.")

GUICtrlSetData($Combo_SteamLibrary, "Steam Library 5")
	$Combo = GUICtrlRead($Combo_SteamLibrary)
		_GUICtrlStatusBar_SetText($Statusbar, "Scanning Steam Library 5")
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
;		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
		GUICtrlSetData($Display_Progressbar_2, 100)
		_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Library 5 finished.")
		Sleep(500)
_GUICtrlListView_DeleteAllItems($listview)


GUICtrlSetData($Display_Progressbar_2, 0)

GUICtrlSetData($Combo_SteamLibrary, $temp_Combo)
$Combo = GUICtrlRead($Combo_SteamLibrary)
	_Read_from_INI_ADD_2_ListView()

	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of Steam Libraries finished." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
	GUIDelete($GUI_Scanning)
	Sleep(500)
	_GUICtrlStatusBar_SetText($Statusbar, "'Scan Steam Library Folders' if a game was added or removed." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")

EndFunc


#endregion   ;  line3114  Main GUI functions @ 1457



#Region Func Add to Library GUI
Func _DROPDOWN_Library()
	$DROPDOWN = GUICtrlRead($DROPDOWN_Library)
	If $DROPDOWN <> "" Then
		$Value_DROPDOWN_Library = $DROPDOWN
		IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $Value_DROPDOWN_Library)
		GUICtrlSetData($FileType_Label, $Value_DROPDOWN_Library)
		GUICtrlSetState($DROPDOWN_Library, $GUI_HIDE)
		GUICtrlSetState($FileType_Label, $GUI_SHOW)
		If $DROPDOWN = "Web Link" Then
			GUICtrlSetData($Label_GamePath, "Web URL:")
			GUICtrlSetState($Label_GamePath, $GUI_HIDE)
;			GUICtrlSetState($Label_WebURL, $GUI_SHOW)
			GUICtrlSetState($BUTTON_GamePath_Folder, $GUI_HIDE)
			GUICtrlSetState($BUTTON_WebURL, $GUI_SHOW)
			GUICtrlSetState($BUTTON_Use_SteamID, $GUI_HIDE)
		ElseIf $DROPDOWN = "Steam Game" Then
;			_BUTTON_Use_SteamID()
			GUICtrlSetData($Label_GamePath, "SteamID:")
			GUICtrlSetState($Label_GamePath, $GUI_HIDE)
;			GUICtrlSetState($Label_GamePath, $GUI_SHOW)
;			GUICtrlSetState($Label_WebURL, $GUI_HIDE)
			GUICtrlSetState($BUTTON_GamePath_Folder, $GUI_HIDE)
			GUICtrlSetState($BUTTON_WebURL, $GUI_HIDE)
			GUICtrlSetState($BUTTON_Use_SteamID, $GUI_SHOW)
;			GUICtrlSetState($Icon_Preview, $GUI_SHOW)
;			GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		ElseIf $DROPDOWN = "Non-Steam Exe" Then
			GUICtrlSetData($Label_GamePath, "Game Path:")
			GUICtrlSetState($Label_GamePath, $GUI_HIDE)
;			GUICtrlSetState($Label_GamePath, $GUI_SHOW)
			GUICtrlSetState($BUTTON_GamePath_Folder, $GUI_SHOW)
			GUICtrlSetState($BUTTON_WebURL, $GUI_HIDE)
			GUICtrlSetState($BUTTON_Use_SteamID, $GUI_HIDE)
		Else
			GUICtrlSetData($Label_GamePath, "File Path:")
			GUICtrlSetState($Label_GamePath, $GUI_HIDE)
;			GUICtrlSetState($Label_GamePath, $GUI_SHOW)
			GUICtrlSetState($BUTTON_GamePath_Folder, $GUI_SHOW)
			GUICtrlSetState($BUTTON_WebURL, $GUI_HIDE)
			GUICtrlSetState($BUTTON_Use_SteamID, $GUI_HIDE)
		EndIf
;		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
;GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
		GUICtrlSetState($Input_Name, $GUI_HIDE)
;		GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
		GUICtrlSetState($Frame_up, $GUI_HIDE)
		GUICtrlSetState($Frame_down, $GUI_HIDE)
		GUICtrlSetState($Frame_right, $GUI_HIDE)
		GUICtrlSetState($Frame_left, $GUI_HIDE)
;		GUICtrlSetState($Icon_Preview, $GUI_SHOW)
;		GUICtrlSetImage($Icon_Preview, $gfx & "Icon_Preview.jpg")
		GUICtrlSetState($Button_RESET, $GUI_SHOW)
	EndIf
EndFunc

Func _BUTTON_GamePath_Folder()
Local $Local_SizeOnTest = ""
Local $test_exe = ""
;$Icon_Preview = ""
GUICtrlSetState($Icon_Preview, $GUI_HIDE)
;Local $Drop_test = IniRead($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
		$FileSelect = FileOpenDialog("Choose File.", $install_dir, "All (*.*)", $FD_FILEMUSTEXIST)
		If $FileSelect <> "" Then
;			IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $DROPDOWN)
			$test_exe = StringTrimLeft($FileSelect,  StringLen($FileSelect) - 3)
			If $DROPDOWN = "Non-Steam Exe" And $test_exe = "exe" Then
				$Value_GamePath_Folder = $FileSelect
				GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
				IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", $FileSelect)
				$Value_Drive = StringTrimRight($FileSelect, Stringlen($FileSelect) - 3)
				IniWrite($config_ini, "TEMP", "Value_Drive", $Value_Drive)
				$HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
				IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $HL_ID)
				Local $Local_SizeOnDisk = StringLeft($FileSelect, StringInStr($FileSelect, "\", 1, -1) -1)
				$Local_SizeOnDisk = DirGetSize($Local_SizeOnDisk)

				If $Local_SizeOnDisk <> 0 Then
					$Local_SizeOnTest = $Local_SizeOnDisk / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Kb")
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Mb")
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Gb")
				EndIf


				GUICtrlSetState($Label_GamePath, $GUI_SHOW)
				GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
				GUICtrlSetState($Label_App_Name, $GUI_SHOW)
				GUICtrlSetState($Input_Name, $GUI_SHOW)
				GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
				GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
				GUICtrlSetState($Frame_up, $GUI_SHOW)
				GUICtrlSetState($Frame_down, $GUI_SHOW)
				GUICtrlSetState($Frame_right, $GUI_SHOW)
				GUICtrlSetState($Frame_left, $GUI_SHOW)
				$Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
				$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
				$Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
				$StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
				$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
				IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_NamefromFile)
				GUICtrlSetData($Input_Name, $Value_NamefromFile)
			ElseIf $DROPDOWN = "Non-Steam Exe" And $test_exe <> "exe" Then
				MsgBox(0, "Wrong FileType", "Wrong FileType, please find the 'exe'")
			ElseIf $DROPDOWN = "Non-Steam File" And $test_exe <> "exe" Then
				$Value_GamePath_Folder = $FileSelect
				GUICtrlSetData($Input_GamePath_Folder, $FileSelect)
				IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", $FileSelect)
				$Value_Drive = StringTrimRight($FileSelect, Stringlen($FileSelect) - 3)
				IniWrite($config_ini, "TEMP", "Value_Drive", $Value_Drive)
				$HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
				IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $HL_ID)
				$Local_SizeOnDisk = FileGetSize($FileSelect)

				If $Local_SizeOnDisk <> 0 Then
					$Local_SizeOnTest = $Local_SizeOnDisk / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 1000 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Kb")
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 1000 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Mb")
					$Local_SizeOnTest = $Local_SizeOnTest / 1024
					$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
					If $Local_SizeOnTest < 1000 And $Local_SizeOnTest >= 1 Then IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $Local_SizeOnTest & " Gb")
				EndIf

				GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
				GUICtrlSetState($Input_Name, $GUI_SHOW)
				GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
				GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
				GUICtrlSetState($Label_GamePath, $GUI_SHOW)
				GUICtrlSetState($Label_App_Name, $GUI_SHOW)
				GUICtrlSetState($Frame_up, $GUI_SHOW)
				GUICtrlSetState($Frame_down, $GUI_SHOW)
				GUICtrlSetState($Frame_right, $GUI_SHOW)
				GUICtrlSetState($Frame_left, $GUI_SHOW)
				$Value_FileName = StringInStr($Value_GamePath_Folder, "\", "", -1)
				$Value_FileName = StringTrimLeft($Value_GamePath_Folder, $Value_FileName)
				$Value_NamefromFile = StringInStr($Value_FileName, ".", "", -1)
				$StringCut_NR = StringLen($Value_FileName) - $Value_NamefromFile + 1
				$Value_NamefromFile = StringTrimRight($Value_FileName, $StringCut_NR)
				IniWrite($config_ini, "TEMP", "Value_Input_Name", $Value_NamefromFile)
				GUICtrlSetData($Input_Name, $Value_NamefromFile)
			ElseIf $DROPDOWN = "Non-Steam File" And $test_exe = "exe" Then
				MsgBox(0, "Wrong FileType", "Wrong FileType, please use 'Non-Steam Game' for exe's")
			EndIf
		EndIf
EndFunc

Func _BUTTON_WebURL()
	Global $Link_WebURL = InputBox("URL", "        Paste your URL here")
	If $Link_WebURL <> "" Then
		$Value_Link_WebURL = $Link_WebURL
		GUICtrlSetData($Input_GamePath_Folder, $Value_Link_WebURL)
		IniWrite($config_ini, "TEMP", "Value_Link_WebURL", $Value_Link_WebURL)
		$HL_ID = "HL" & StringReplace(StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2) & StringLeft(Random(0, 99, 0), 2), '.', '')
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $HL_ID)
		IniWrite($config_ini, "TEMP", "Value_Drive", "Url")
;		IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", $DROPDOWN)
		GUICtrlSetState($Label_GamePath, $GUI_SHOW)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
		GUICtrlSetState($Label_App_Name, $GUI_SHOW)
		GUICtrlSetState($Input_Name, $GUI_SHOW)
		GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_SHOW)
		GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
		GUICtrlSetState($Frame_up, $GUI_SHOW)
		GUICtrlSetState($Frame_down, $GUI_SHOW)
		GUICtrlSetState($Frame_right, $GUI_SHOW)
		GUICtrlSetState($Frame_left, $GUI_SHOW)
	Else
		MsgBox(0, "No URL", "Please enter a web address")
	EndIf

EndFunc





Func _BUTTON_Use_SteamID()
Global $Install_Drive = ""
	$InputBox = InputBox("Enter Steam Game ID", " ", "", "", - 1, 1)
	If $InputBox <> "" Then
		$Value_Use_SteamID = $InputBox
		GUICtrlSetData($Input_GamePath_Folder, "steam://rungameid/" & $Value_Use_SteamID)
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $Value_Use_SteamID)
		$appid = $Value_Use_SteamID
_Loading_GUI()
		If Not FileExists($Icons & "steam.app." & $appid & ".jpg") Then	_Download_Icon_for_SteamGameID()
		If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".jpg") Then	_Get_SteamGame_Icon_32x32()
		GUIDelete($GUI_Loading)
		If FileExists($Icons & "steam.app." & $appid & ".jpg") Then
			$Name = ""
			$Install_Drive = ""
			$fileCK1 = True
			_Find_acf()
			If $fileCK1 Then
				Local $Download_Icon_jpg = $Icons & "steam.app." & $appid & '.jpg'
				GUICtrlSetImage($Icon_Preview, $Download_Icon_jpg)
				GUICtrlSetState($Icon_Preview, $GUI_SHOW)
				IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $Download_Icon_jpg)
				GUICtrlSetState($Label_GamePath, $GUI_SHOW)
				GUICtrlSetState($Input_GamePath_Folder, $GUI_SHOW)
				GUICtrlSetState($Label_App_Name, $GUI_SHOW)
				GUICtrlSetData($Input_Name, $Name)
				GUICtrlSetState($Input_Name, $GUI_SHOW)
				GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
				GUICtrlSetState($Button_SAVE_APP, $GUI_SHOW)
				GUICtrlSetState($Frame_up, $GUI_SHOW)
				GUICtrlSetState($Frame_down, $GUI_SHOW)
				GUICtrlSetState($Frame_right, $GUI_SHOW)
				GUICtrlSetState($Frame_left, $GUI_SHOW)
			EndIf
		Else
			MsgBox(0, "Invalid SteamID", "Invalid SteamID, please enter a valid SteamID")
		EndIf
	Else
;		MsgBox(0, "Invalid SteamID", "Input blank, please enter a valid SteamID")
	EndIf
EndFunc

Func _Input_Name()
	$Input_Input_Name = GUICtrlRead($Input_Name)
	If $Input_Input_Name <> "" Then
		$Value_Input_Name = $Input_Input_Name
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Input_Input_Name)
	EndIf
EndFunc

Func _Find_acf()

;target?
	Local $Looptest = "No"
	If FileExists($Install_Folder_Steam_1 & "SteamApps\") Then
		$search_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		Local $FileList = _FileListToArray($search_LocalFolder , "*.acf" , 1)
		If $FileList <> "" Then
			For $NR = 1 To $FileList[0]
				Global $File_Name = $FileList[$NR]
				Local $File_Name_Test = StringTrimLeft($File_Name, 12)
				$File_Name_Test = StringTrimRight($File_Name_Test, 4)
				If $File_Name_Test = $appid Then
					$Looptest = "Yes"
					Global $File_Path = $search_LocalFolder & $File_Name
					$NR = $FileList[0]
				EndIf
			Next
		EndIf
		$FileList = ""
	EndIf
	If FileExists($Install_Folder_Steam_2 & "SteamApps\") Then
		$search_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		Local $FileList = _FileListToArray($search_LocalFolder , "*.acf" , 1)
		If $FileList <> "" Then
			For $NR = 1 To $FileList[0]
				Global $File_Name = $FileList[$NR]
				Local $File_Name_Test = StringTrimLeft($File_Name, 12)
				$File_Name_Test = StringTrimRight($File_Name_Test, 4)
				If $File_Name_Test = $appid Then
					$Looptest = "Yes"
					Global $File_Path = $search_LocalFolder & $File_Name
					$NR = $FileList[0]
				EndIf
			Next
		EndIf
		$FileList = ""
	EndIf
	If FileExists($Install_Folder_Steam_3 & "SteamApps\") Then
		$search_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		Local $FileList = _FileListToArray($search_LocalFolder , "*.acf" , 1)
		If $FileList <> "" Then
			For $NR = 1 To $FileList[0]
				Global $File_Name = $FileList[$NR]
				Local $File_Name_Test = StringTrimLeft($File_Name, 12)
				$File_Name_Test = StringTrimRight($File_Name_Test, 4)
				If $File_Name_Test = $appid Then
					$Looptest = "Yes"
					Global $File_Path = $search_LocalFolder & $File_Name
					$NR = $FileList[0]
				EndIf
			Next
		EndIf
		$FileList = ""
	EndIf
	If FileExists($Install_Folder_Steam_4 & "SteamApps\") Then
		$search_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		Local $FileList = _FileListToArray($search_LocalFolder , "*.acf" , 1)
		If $FileList <> "" Then
			For $NR = 1 To $FileList[0]
				Global $File_Name = $FileList[$NR]
				Local $File_Name_Test = StringTrimLeft($File_Name, 12)
				$File_Name_Test = StringTrimRight($File_Name_Test, 4)
				If $File_Name_Test = $appid Then
					$Looptest = "Yes"
					Global $File_Path = $search_LocalFolder & $File_Name
					$NR = $FileList[0]
				EndIf
			Next
		EndIf
		$FileList = ""
	EndIf
	If FileExists($Install_Folder_Steam_5 & "SteamApps\") Then
		$search_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
		Local $FileList = _FileListToArray($search_LocalFolder , "*.acf" , 1)
		If $FileList <> "" Then
			For $NR = 1 To $FileList[0]
				Global $File_Name = $FileList[$NR]
				Local $File_Name_Test = StringTrimLeft($File_Name, 12)
				$File_Name_Test = StringTrimRight($File_Name_Test, 4)
				If $File_Name_Test = $appid Then
					$Looptest = "Yes"
					Global $File_Path = $search_LocalFolder & $File_Name
					$NR = $FileList[0]
				EndIf
			Next
		EndIf
		$FileList = ""
	EndIf



	If $Looptest = "Yes" Then
		Local	$Line3_AppId = FileReadLine($File_Path, 3)
		Local $Array_Line3_AppId = _StringBetween($Line3_AppId, $left, $right, $STR_ENDNOTSTART)
		If Not @error Then
			Global $AppId = $Array_Line3_AppId[1]
;			MsgBox(0, "", $AppId)
		EndIf

		Local $Line5_Name = FileReadLine($File_Path, 5)
		Local $Array_Line5_Name = _StringBetween($Line5_Name, $left, $right, $STR_ENDNOTSTART)
		If Not @error Then
			Global $Name = $Array_Line5_Name[1]
		EndIf

		$Install_Drive = StringLeft($File_Path, 3)
		$Install_Drive = StringUpper($Install_Drive)

		Local $Line10_SoD = FileReadLine($File_Path, 10)
		Local $Array_Line10_SoD = _StringBetween($Line10_SoD, $left, $right, $STR_ENDNOTSTART)
		If Not @error Then
			Global $SoD = $Array_Line10_SoD[1]
				$Local_SizeOnTest = $SoD / 1024
				$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
				If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SoD = $Local_SizeOnTest & " Kb"
				$Local_SizeOnTest = $Local_SizeOnTest / 1024
				$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
				If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SoD = $Local_SizeOnTest & " Mb"
				$Local_SizeOnTest = $Local_SizeOnTest / 1024
				$Local_SizeOnTest = Round($Local_SizeOnTest, 1)
				If $Local_SizeOnTest < 999 And $Local_SizeOnTest >= 1 Then $SoD = $Local_SizeOnTest & " Gb"
		EndIf
		$FileType = "Steam Game"
		IniWrite($config_ini, "TEMP", "Value_Use_SteamID", $AppId)
		IniWrite($config_ini, "TEMP", "Value_Input_Name", $Name)
		IniWrite($config_ini, "TEMP", "Value_Drive", $Install_Drive)
		IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", $SoD)
		IniWrite($config_ini, "TEMP", "Value_FileType", $FileType)

	Else
		GUICtrlSetData($Input_GamePath_Folder, "")
		GUICtrlSetData($Input_Name, "")
		$appid = ""
;		$Icon_Preview = ""
		GUICtrlSetState($Label_GamePath, $GUI_HIDE)
		GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
		GUICtrlSetState($Label_App_Name, $GUI_HIDE)
		GUICtrlSetState($Input_Name, $GUI_HIDE)
		GUICtrlSetState($Icon_Preview, $GUI_HIDE)
		$fileCK1 = False
		MsgBox(0, "TargetTest", "Unable to find game. Do you have your Libraries setup?")
	EndIf
EndFunc


Func _BUTTON_IconPath_Folder()
	$FileSelect = FileOpenDialog("Choose Icon File.", $Icons, "All (*.*)", $FD_FILEMUSTEXIST)
	If $FileSelect <> "" Then
		Local $Icon_Type =StringTrimLeft($FileSelect,  StringLen($FileSelect) - 3)

		$Value_IconPath_Folder = $FileSelect
;		Local $Icon_jpg
;		Local $32bit_BMPtemp = $Icons & "32x32\" & "steam.app" & $Value_Use_SteamID & ".bmp"

		If $Icon_Type = "jpg" Or $Icon_Type = "gif" Or $Icon_Type = "bmp" Or $Icon_Type = "ico" Or $Icon_Type = "png" Then
;			If $Icon_Type = "ico" Or $Icon_Type = "png" Then MsgBox(0, "Icon Type", "The image file that you've chosen will not show up here, but it will show up in your web page")

				_GDIPlus_Startup()
					$Icon_jpg = _GDIPlus_ImageLoadFromFile($FileSelect)
					_GDIPlus_ImageSaveToFile($Icon_jpg, $Icon_Temp_Preview)


					_GDIPlus_ImageDispose($Icon_jpg)
				_GDIPlus_Shutdown()

			IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", $Value_IconPath_Folder)
			GUICtrlSetState($Frame_up, $GUI_SHOW)
			GUICtrlSetState($Frame_down, $GUI_SHOW)
			GUICtrlSetState($Frame_right, $GUI_SHOW)
			GUICtrlSetState($Frame_left, $GUI_SHOW)
			GUICtrlSetImage($Icon_Preview, $Icon_Temp_Preview)
			GUICtrlSetState($Icon_Preview, $GUI_SHOW)
		Else
			MsgBox(0, "Icon Type", "Please choose an image file")
		EndIf
	EndIf
EndFunc


Func _Button_RESET()
	_Button_Exit_AddGame2Library_GUI()
	Sleep(100)
	_AddGame2Library_GUI()
EndFunc



Func _Button_SAVE_APP()
	$Value_DROPDOWN_Library = IniRead($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	$Value_Drive = IniRead($config_ini, "TEMP", "Value_Drive", "")
	$Value_Use_SteamID = IniRead($config_ini, "TEMP", "Value_Use_SteamID", "")
	$Value_Input_Name = IniRead($config_ini, "TEMP", "Value_Input_Name", "")
	$Value_IconPath_Folder = IniRead($config_ini, "TEMP", "Value_IconPath_Folder", "")
	$Value_GamePath_Folder = IniRead($config_ini, "TEMP", "Value_GamePath_Folder", "")
	$Value_SizeOnDisk = IniRead($config_ini, "TEMP", "Value_SizeOnDisk", "")
	$Value_Link_WebURL = IniRead($config_ini, "TEMP", "Value_Link_WebURL", "")

	$LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	$NewAppNR = $LastAppNR + 1

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "NR", $NewAppNR)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "FileType", $Value_DROPDOWN_Library)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "InstallDrive", $Value_Drive)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "SizeOnDisk", $Value_SizeOnDisk)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "IconPath", $Value_IconPath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "GamePath", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "WebURL", $Value_Link_WebURL)

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "NR", $NewAppNR)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "FileType", $Value_DROPDOWN_Library)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "InstallDrive", $Value_Drive)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "SizeOnDisk", $Value_SizeOnDisk)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "IconPath", $Value_IconPath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "GamePath", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "WebURL", $Value_Link_WebURL)



				_GDIPlus_Startup()
					$hImage_BMP = _GDIPlus_ImageLoadFromFile($Icon_Temp_Preview)
					$hBitmap_Scaled = _GDIPlus_ImageResize($hImage_BMP, 32, 32) ;resize image
					_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $Steam32_Icons & $Value_Use_SteamID & ".bmp")
					Local $hImage2 = _GDIPlus_ImageLoadFromFile($Value_IconPath_Folder)
					_GDIPlus_ImageSaveToFile($hImage2, $Steam_Icons & $Value_Use_SteamID & ".jpg")
					_GDIPlus_ImageDispose($hImage2)
					_GDIPlus_ImageDispose($hImage_BMP)
					_GDIPlus_BitmapDispose($hBitmap_Scaled)
	;				_GDIPlus_BitmapDispose($hBitmap)
				_GDIPlus_Shutdown()
				_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $Steam32_Icons & $Value_Use_SteamID & ".bmp")

;	FileCopy($Value_IconPath_Folder, $Steam_Icons & $Value_Use_SteamID & ".jpg")

	IniWrite($config_ini, "TEMP", "Value_Drive", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", "")
	IniWrite($config_ini, "TEMP", "Value_Link_WebURL", "")


	IniWrite($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", $NewAppNR)

;	_ListView_Icon_Refresh()

	_Read_from_INI_ADD_2_ListView()

	GUICtrlSetData($Input_GamePath_Folder, "")
	GUICtrlSetData($Input_Name, "")
	GUICtrlSetData($Icon_Preview, "")
	GUICtrlSetData($appid, "")
	GUICtrlSetState($DROPDOWN_Library, $GUI_SHOW)
	GUICtrlSetState($FileType_Label, $GUI_HIDE)
	GUICtrlSetState($Label_GamePath, $GUI_HIDE)
	GUICtrlSetState($Input_GamePath_Folder, $GUI_HIDE)
	GUICtrlSetState($Label_App_Name, $GUI_HIDE)
	GUICtrlSetState($Input_Name, $GUI_HIDE)
	GUICtrlSetState($Button_SAVE_APP, $GUI_HIDE)
	GUICtrlSetState($BUTTON_IconPath_Folder, $GUI_HIDE)
	GUICtrlSetState($Frame_up, $GUI_HIDE)
	GUICtrlSetState($Frame_down, $GUI_HIDE)
	GUICtrlSetState($Frame_right, $GUI_HIDE)
	GUICtrlSetState($Frame_left, $GUI_HIDE)
	GUICtrlSetState($Icon_Preview, $GUI_HIDE)

	MsgBox($MB_ICONINFORMATION, "Finished", "New Application added", 1)
EndFunc

Func _Button_Exit_AddGame2Library_GUI()
	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_Drive", "")
	IniWrite($config_ini, "TEMP", "Value_SizeOnDisk", "")
	IniWrite($config_ini, "TEMP", "Value_Use_SteamID", "")
	IniWrite($config_ini, "TEMP", "Value_Input_Name", "")
	IniWrite($config_ini, "TEMP", "Value_IconPath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
	IniWrite($config_ini, "TEMP", "Value_Link_WebURL", "")
	FileDelete($Icon_Temp_Preview)
	GUIDelete($AddGame2Library_GUI)
	$NR_Applications = IniRead($ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini", "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "'Add: Games etc' to add Webpages, mp4's, doc's etc..." & @TAB & "Apps: " & $NR_Applications & " including separators" & @TAB & "'Version " & $Version & "'")
EndFunc


Func _Button_Exit_Settings_GUI()
Local $ifCount = 1
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	If FileExists($Install_Folder_Steam_2) Then $ifCount = $ifCount + 1
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	If FileExists($Install_Folder_Steam_3) Then $ifCount = $ifCount + 1
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	If FileExists($Install_Folder_Steam_4) Then $ifCount = $ifCount + 1
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	If FileExists($Install_Folder_Steam_5) Then $ifCount = $ifCount + 1
	GUIDelete($Settings_GUI)

If $ifCount = 1 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1", "ALL")
If $ifCount = 2 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2", "ALL")
If $ifCount = 3 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3", "ALL")
If $ifCount = 4 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4", "ALL")
If $ifCount = 5 Then GUICtrlSetData($Combo_SteamLibrary, "|All|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", "ALL")
_Combo_SteamLibrary()
EndFunc

#EndRegion


#Region Func Settings GUI


Func _Button_Install_Folder_Steam_1()
	Local $FileSelectFolder = FileSelectFolder($install_dir, "")
	If FileExists($FileSelectFolder & "\Steam.dll") Then
		GUICtrlSetData($Input_Install_Folder_Steam_1, $FileSelectFolder & "\")
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
		$Install_Folder_Steam_1 = $FileSelectFolder & "\"
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
		$Install_Folder_Steam_2 = $FileSelectFolder & "\"
		_Button_Install_Folder_Steam_2_save()
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
		$Install_Folder_Steam_3 = $FileSelectFolder & "\"
		_Button_Install_Folder_Steam_3_save()
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
		$Install_Folder_Steam_4 = $FileSelectFolder & "\"
		_Button_Install_Folder_Steam_4_save()
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
		$Install_Folder_Steam_5 = $FileSelectFolder & "\"
		_Button_Install_Folder_Steam_5_save()
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

Func _Button_Install_Folder_Steam_2_Clear()
	If $Install_Folder_Steam_3 <> "" Then
		$Install_Folder_Steam_2 = $Install_Folder_Steam_3
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_2", $Install_Folder_Steam_3)
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Install_Folder_Steam_3)
		FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini", $FC_OVERWRITE )
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
		_Combo_SteamLibrary()
	;	FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini")
		If $Install_Folder_Steam_4 <> "" Then
			$Install_Folder_Steam_3 = $Install_Folder_Steam_4
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", $Install_Folder_Steam_4)
			GUICtrlSetData($Input_Install_Folder_Steam_3, $Install_Folder_Steam_4)
			FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE )

			If $Install_Folder_Steam_5 <> "" Then
				$Install_Folder_Steam_4 = $Install_Folder_Steam_5
				IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", $Install_Folder_Steam_5)
				GUICtrlSetData($Input_Install_Folder_Steam_4, $Install_Folder_Steam_5)
				FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $FC_OVERWRITE )
				$Install_Folder_Steam_5 = ""
				GUICtrlSetData($Input_Install_Folder_Steam_5, "")
				IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
				FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
			Else
				$Install_Folder_Steam_4 = ""
				GUICtrlSetData($Input_Install_Folder_Steam_4, "")
				IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", "")
				FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini")
			EndIf
		ElseIf $Install_Folder_Steam_5 <> "" Then
			$Install_Folder_Steam_3 = $Install_Folder_Steam_5
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", $Install_Folder_Steam_5)
			FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE )
			$Install_Folder_Steam_5 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_5, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
		Else
			$Install_Folder_Steam_3 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_3, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini")
		EndIf
	ElseIf $Install_Folder_Steam_4 <> "" Then
		$Install_Folder_Steam_2 = $Install_Folder_Steam_4
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Install_Folder_Steam_4)
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_2", $Install_Folder_Steam_4)
		FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini", $FC_OVERWRITE )
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
		_Combo_SteamLibrary()
		$Install_Folder_Steam_4 = ""
		GUICtrlSetData($Input_Install_Folder_Steam_4, "")
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", "")
		FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini")
		If $Install_Folder_Steam_5 <> "" Then
			$Install_Folder_Steam_3 = $Install_Folder_Steam_5
			GUICtrlSetData($Input_Install_Folder_Steam_3, $Install_Folder_Steam_5)
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", $Install_Folder_Steam_5)
			FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE )
			$Install_Folder_Steam_5 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_5, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
		EndIf
	ElseIf $Install_Folder_Steam_5 <> "" Then
		$Install_Folder_Steam_2 = $Install_Folder_Steam_5
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Install_Folder_Steam_5)
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_2", $Install_Folder_Steam_5)
		FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini", $FC_OVERWRITE )
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
		_Combo_SteamLibrary()
		GUICtrlSetData($Input_Install_Folder_Steam_5, "")
		$Install_Folder_Steam_5 = ""
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
		FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
	Else
		$Install_Folder_Steam_2 = ""
		GUICtrlSetData($Input_Install_Folder_Steam_2, "")
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_2", "")
		FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini")
		GUICtrlSetData($Combo_SteamLibrary, "ALL")
		_Combo_SteamLibrary()
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_3_Clear()
	If $Install_Folder_Steam_4 <> "" Then
		$Install_Folder_Steam_3 = $Install_Folder_Steam_4
		GUICtrlSetData($Input_Install_Folder_Steam_3, $Install_Folder_Steam_4)
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", $Install_Folder_Steam_4)
		FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE )
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 3")
		_Combo_SteamLibrary()

		If $Install_Folder_Steam_5 <> "" Then
			$Install_Folder_Steam_4 = $Install_Folder_Steam_5
			GUICtrlSetData($Input_Install_Folder_Steam_4, $Install_Folder_Steam_5)
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", $Install_Folder_Steam_5)
			FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $FC_OVERWRITE )
			$Install_Folder_Steam_5 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_5, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")

		Else
			$Install_Folder_Steam_4 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_4, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini")
		EndIf
	ElseIf $Install_Folder_Steam_5 <> "" Then
		$Install_Folder_Steam_3 = $Install_Folder_Steam_5
		GUICtrlSetData($Input_Install_Folder_Steam_3, $Install_Folder_Steam_5)
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", $Install_Folder_Steam_5)
		FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE )
		$Install_Folder_Steam_5 = ""
		GUICtrlSetData($Input_Install_Folder_Steam_5, "")
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
		FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 3")
		_Combo_SteamLibrary()
	Else
		$Install_Folder_Steam_3 = ""
		GUICtrlSetData($Input_Install_Folder_Steam_3, "")
		IniWrite($config_INI, "Folders", "Install_Folder_Steam_3", "")
		FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini")
		GUICtrlSetData($Combo_SteamLibrary, "ALL")
		_Combo_SteamLibrary()
	EndIf
EndFunc

Func _Button_Install_Folder_Steam_4_Clear()
	If $Install_Folder_Steam_5 <> "" Then
			$Install_Folder_Steam_4 = $Install_Folder_Steam_5
			GUICtrlSetData($Input_Install_Folder_Steam_4, $Install_Folder_Steam_5)
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", $Install_Folder_Steam_5)
			FileCopy($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $FC_OVERWRITE )
			$Install_Folder_Steam_5 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_5, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
			GUICtrlSetData($Combo_SteamLibrary, "Steam Library 4")
			_Combo_SteamLibrary()
		Else
			$Install_Folder_Steam_4 = ""
			GUICtrlSetData($Input_Install_Folder_Steam_4, "")
			IniWrite($config_INI, "Folders", "Install_Folder_Steam_4", "")
			FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini")
			GUICtrlSetData($Combo_SteamLibrary, "ALL")
			_Combo_SteamLibrary()
		EndIf
EndFunc

Func _Button_Install_Folder_Steam_5_Clear()
	IniWrite($config_INI, "Folders", "Install_Folder_Steam_5", "")
	FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini")
	GUICtrlSetData($Input_Install_Folder_Steam_5, "")
	$Install_Folder_Steam_5 = ""
	GUICtrlSetData($Combo_SteamLibrary, "ALL")
	_Combo_SteamLibrary()
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
		_Scanning_GUI()
		GUICtrlSetData($Input_Install_Folder_Steam_2, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_2", $Value_Input)
		$s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
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
;			Sleep(500)
		EndIf
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		_Read_from_INI_ADD_2_ListView()
		FileDelete($ApplicationList_INI)
		$Combo = "Steam Library 2"
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 2")
		_Combo_SteamLibrary()
		GUIDelete($GUI_Scanning)
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
		_Scanning_GUI()
		GUICtrlSetData($Input_Install_Folder_Steam_3, $Value_Input)
		IniWrite($config_ini, "Folders", "Install_Folder_Steam_3", $Value_Input)
		$s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
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
;			Sleep(500)
		EndIf
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		_Read_from_INI_ADD_2_ListView()
		FileDelete($ApplicationList_INI)
		$Combo = "Steam Library 3"
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 3")
		_Combo_SteamLibrary()
		GUIDelete($GUI_Scanning)
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
		_Scanning_GUI()
;		GUICtrlSetData($Input_Install_Folder_Steam_4, $Value_Input)
;		IniWrite($config_ini, "Folders", "Install_Folder_Steam_4", $Value_Input)
		$s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
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
;			Sleep(500)
		EndIf
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		_Read_from_INI_ADD_2_ListView()
		FileDelete($ApplicationList_INI)
		$Combo = "Steam Library 4"
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 4")
		_Combo_SteamLibrary()
		GUIDelete($GUI_Scanning)
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
		_Scanning_GUI()
;		GUICtrlSetData($Input_Install_Folder_Steam_5, $Value_Input)
;		IniWrite($config_ini, "Folders", "Install_Folder_Steam_5", $Value_Input)
		$s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
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
;			Sleep(500)
		EndIf

		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini", $FC_OVERWRITE + $FC_CREATEPATH)
;		_Read_from_INI_ADD_2_ListView()
		FileDelete($ApplicationList_INI)
		$Combo = "Steam Library 5"
		GUICtrlSetData($Combo_SteamLibrary, "Steam Library 5")
		_Combo_SteamLibrary()
		GUIDelete($GUI_Scanning)
	Else
		If $Check_Value_Input <> "" Then
			MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The correct folder contains the File 'Steam.dll' and the Folder 'SteamApps'.")
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		EndIf
	EndIf
EndFunc

#cs
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


#ce









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
;_GUICtrlListView_UnRegisterSortCallBack($ListView)
;GUIRegisterMsg($WM_NOTIFY, "")
	Exit
EndFunc
#endregion







#EndRegion  Functions


