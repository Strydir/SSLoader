#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Compile_Icons\InfoWindow.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

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
#endregion

Global $font = "arial"
Global $font_arial = "arial"

#Region Declare Variables/Const 1
Global $Version = "0.48"
Global $config_ini = @ScriptDir & "\config.ini"
Global $Install_DIR = @ScriptDir & "\"
Global $Install_Web_DIR = @ScriptDir & "\Webpage\"
Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $Install_DIR & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPageTemp.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

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


IniWrite($config_ini, "Settings", "Version", $Version)

_First_Start_Empty_Check_1()

#EndRegion


If $First_Start = "true" Then
	MsgBox($MB_ICONWARNING, "Welcome to the Steam Shortcuts/Game Loader.", '                                     Steam Game Loader               ' & @CRLF & @CRLF & _
								'   This is a simplified version of Home Loader, by CogentRifter,                                             modified by Strydr.' & @CRLF & _
								'Original project here: https://github.com/CogentHub/HomeLoader' & @CRLF & @CRLF & _
								"This Utility can create web pages of shortcuts to your Steam Games; simplying and organizing the launching of your games in VR. " & @CRLF & _
								'*Note that it will pick up your 2d games as well.  Remove them by right clicking and delete.' & @CRLF & @CRLF & _
								'With WindowsMR, you place an "Edge" page in VR allowing you to launch your SteamVR Games directly from the Cliffhouse without the need to mess with the desktop app.' & @CRLF & @CRLF & _
								'To start, click "Scan Steam Libraries" to scan your games into the Library.  Click it anytime you get new games to add them to the list.' & @CRLF & @CRLF & _
								'Click "Set Steam Folders" to add additional Steam Library folders.' & @CRLF & @CRLF & _
								'If you changed the default installation path for Steam, you can change it here as well.')





;	_Settings_GUI()

;MsgBox(1, "PlaceHolder", $First_Start)



IniWrite($Config_INI, "Settings", "First_Start", "False")
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

;MsgBox(1, "PlaceHolder", $First_Start)
#region Create GUI
If $First_Start <> "True" Then

;MsgBox(1, "PlaceHolder", "not")
	Local $hGUI, $hGraphic, $hPen
	Local $GUI, $aSize, $aStrings[5]
	Local $btn, $chk, $rdo, $Msg
	Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	Local $DesktopWidth = "855"
	Local $DesktopHeight = @DesktopHeight - 100

	; Creating the GUI
	$GUI = GUICreate("Steam Games Library", 800, $DesktopHeight, 4, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))

	; PROGRESS
	Global $Display_Progressbar_2 = GUICtrlCreateProgress(0, $DesktopHeight - 25, $DesktopWidth, 5)
	Global $Display_Progressbar = GUICtrlCreateProgress(0, $DesktopHeight - 121, $DesktopWidth, 5)

	;Status Bar $Display Statusbar
	Global $Statusbar = _GUICtrlStatusBar_Create($GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'Version " & $Version & "'")

	GUISetState()


	; Toolbar above
	GUICtrlCreateLabel("Steam Games Library", 230, 5, 350, 38)
	GUICtrlSetFont(-1, 24, 600, 7, "arial")

	Global $Combo_SteamLibrary = GUICtrlCreateCombo("", 310, 50, 155, 25, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, "ALL|Steam Library 1|Steam Library 2|Steam Library 3|Steam Library 4|Steam Library 5", $Steam_Library)
	GUICtrlSetFont(-1, 14, 400, 2, "arial")
	GuiCtrlSetTip(-1, "Not working properly, atm")

	Global $Button_AddGame2Library = GUICtrlCreateButton("Add Game to Library", 15, 5, 100, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_AddGame2Library, $gfx & "AddGame2Library.bmp")
	GuiCtrlSetTip(-1, "Add Game to the Steam Games Library." & @CRLF)

	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Steam Library", 630, 5, 155, 80, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	If $ButtonTAB_State <>  1 Then GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
	GuiCtrlSetTip(-1, "Scan Steam Libraries" & @CRLF)




	; Toolbar below

	Global $Button_Start_SteamVR = GUICtrlCreateButton("Start SteamVR", 391, $DesktopHeight - 103, 145, 29)
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	GuiCtrlSetTip(-1, "Starts SteamVR.")

	Global $Button_Open_Folder = GUICtrlCreateButton("Open Folder", 386, $DesktopHeight - 67, 155, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Open_Folder, $gfx & "Open_Folder.bmp")
	GuiCtrlSetTip(-1, "Opens Game Page Folder" & @CRLF & _
						"If your default browser is NOT Edge, right click the file and choose" & @CRLF & _
						"'Open with Microsoft Edge' so you can set it as an Edge Favorite." & @CRLF & @CRLF)

	;Global $Button_Settings = GUICtrlCreateButton("SteamFolders", 590, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	Global $Button_Settings = GUICtrlCreateButton("Set Steam Folders", 557, $DesktopHeight - 90, 165, 45)
	GUICtrlSetFont(-1, 14, 600, 2, "Segoe UI Black")
	;_GUICtrlButton_SetImage($Button_Settings, $gfx & "SteamFolders.bmp")
	GuiCtrlSetTip(-1, "Set Steam Library Folders")


	Global $Button_Exit = GUICtrlCreateButton("Exit", 730, $DesktopHeight - 100, 65, 65, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GuiCtrlSetTip(-1, "Close")


	$Checkbox_CreatePage = GUICtrlCreateLabel("", 4, $DesktopHeight - 77, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 30, $DesktopHeight - 78, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")

	Global $Button_Create_GamePage1 = GUICtrlCreateButton("Create Game Page", 205, $DesktopHeight - 107, 166, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Create_GamePage1, $gfx & "Create_GamePage1.bmp")
	GuiCtrlSetTip(-1, "Create Game Page" & @CRLF & _
						"This can take some time, depending on how many games are installed and selected." & @CRLF & @CRLF)

	Global $Button_Open_GamePage = GUICtrlCreateButton("Open Game Page", 205, $DesktopHeight - 67, 166, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Open_GamePage, $gfx & "Open_GamePage.bmp")
	GuiCtrlSetTip(-1, "Opens Selected Game Page" & @CRLF & _
						"If your default browser is Edge, make the page a favorite for access in VR." & @CRLF & @CRLF)

	Global $Button_Add_to_Custom = GUICtrlCreateButton("Add to Custom", 70, $DesktopHeight - 100, 117, 35, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Add_to_Custom, $gfx & "Add_to_Custom.bmp")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	EndIf
	GuiCtrlSetTip(-1, "Add Entry to Custom TAB.")

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose TAB", 70, $DesktopHeight - 64, 115, 15, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	If $ButtonTAB_State = 1 Or $ButtonTAB_State = 2 Then
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	Else
		GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	EndIf



	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 0, 90, 100)
	Global $ButtonTAB_Non_Steam_Appl = GUICtrlCreateButton($TAB2_Label, 100, 90, 100)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB3_Label, 205, 90, 100)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB4_Label, 305, 90, 100)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB5_Label, 405, 90, 100)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB6_Label, 505, 90, 100)

	If $ButtonTAB_State = "1" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_SHOW)
	EndIf

	If $ButtonTAB_State = "2" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "3" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "4" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "5" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_DISABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_ENABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
	EndIf

	If $ButtonTAB_State = "6" Then
		GUICtrlSetState($ButtonTAB_Steam_Library, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Non_Steam_Appl, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_1, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_2, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_3, $GUI_ENABLE)
		GUICtrlSetState($ButtonTAB_Custom_4, $GUI_DISABLE)
		GUICtrlSetState($Combo_SteamLibrary, $GUI_HIDE)
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

_Loading_GUI()   ;  line376

#Region Function Links ;line 378

	GUISetOnEvent($GUI_EVENT_CLOSE, "_Beenden")

	GUICtrlSetOnEvent($Button_Exit, "_Beenden")
	GUICtrlSetOnEvent($Button_Settings, "_Settings_GUI")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")

	GUICtrlSetOnEvent($Combo_SteamLibrary, "_Combo_SteamLibrary")
	GUICtrlSetOnEvent($Button_AddGame2Library, "_Button_AddGame2Library")

	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")

	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Non_Steam_Appl, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2 , "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3 , "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4 , "_ButtonTAB_Custom_4")


	GUICtrlSetOnEvent($Button_Start_SteamVR, "_Button_Start_SteamVR")
	GUICtrlSetOnEvent($Button_Open_Folder, "_Open_Folder")
	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")
	GUICtrlSetOnEvent($Button_Add_to_Custom, "_Button_Add_to_Custom")

	GUICtrlSetOnEvent($Button_Create_GamePage1, "_Button_Create_GamePage_selected")
	GUICtrlSetOnEvent($Button_Open_GamePage, "_Open_GamePage")




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
	Global $Install_Folder_Steam_Search_Folder, $Install_Folder_Steam_Search_Folder

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
	Global $Line_Value = ""

	If $File <> "" Then
			For $iCount_1 = 1 To 7
				Local $Complete_Value_Line = FileReadLine($File, $iCount_1)

				Local $iPosition = StringInStr($Complete_Value_Line, "appid")
				If $iPosition <> 0 Then
					Global $appid = StringReplace($Complete_Value_Line, '	"appid"		"', '')
					$appid = StringReplace($appid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "Universe")
				If $iPosition <> 0 Then
					Global $Universe = StringReplace($Complete_Value_Line, '	"Universe"		"', '')
					$Universe = StringReplace($Universe, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "name")
				If $iPosition <> 0 Then
					$name = StringReplace($Complete_Value_Line, '	"name"		"', '')
					$name = StringReplace($name, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "StateFlags")
				If $iPosition <> 0 Then
					Global $StateFlags = StringReplace($Complete_Value_Line, '	"StateFlags"		"', '')
					$StateFlags = StringReplace($StateFlags, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "installdir")
				If $iPosition <> 0 Then
					Global $installdir = StringReplace($Complete_Value_Line, '	"installdir"		"', '')
					$installdir = StringReplace($installdir, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "LastUpdated")
				If $iPosition <> 0 Then
					Global $LastUpdated = StringReplace($Complete_Value_Line, '	"LastUpdated"		"', '')
					$LastUpdated = StringReplace($LastUpdated, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "UpdateResult")
				If $iPosition <> 0 Then
					Global $UpdateResult = StringReplace($Complete_Value_Line, '	"UpdateResult"		"', '')
					$UpdateResult = StringReplace($UpdateResult, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "SizeOnDisk")
				If $iPosition <> 0 Then
					Global $SizeOnDisk = StringReplace($Complete_Value_Line, '	"SizeOnDisk"		"', '')
					$SizeOnDisk = StringReplace($SizeOnDisk, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "buildid")
				If $iPosition <> 0 Then
					Global $buildid = StringReplace($Complete_Value_Line, '	"buildid"		"', '')
					$buildid = StringReplace($buildid, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "LastOwner")
				If $iPosition <> 0 Then
					Global $LastOwner = StringReplace($Complete_Value_Line, '	"LastOwner"		"', '')
					$LastOwner = StringReplace($LastOwner, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "BytesToDownload")
				If $iPosition <> 0 Then
					Global $BytesToDownload = StringReplace($Complete_Value_Line, '	"BytesToDownload"		"', '')
					$BytesToDownload = StringReplace($BytesToDownload, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "BytesDownloaded")
				If $iPosition <> 0 Then
					Global $BytesDownloaded = StringReplace($Complete_Value_Line, '	"BytesDownloaded"		"', '')
					$BytesDownloaded = StringReplace($BytesDownloaded, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "AutoUpdateBehavior")
				If $iPosition <> 0 Then
					Global $AutoUpdateBehavior = StringReplace($Complete_Value_Line, '	"AutoUpdateBehavior"		"', '')
					$AutoUpdateBehavior = StringReplace($AutoUpdateBehavior, '"', '')
				EndIf

				Local $iPosition = StringInStr($Complete_Value_Line, "AllowOtherDownloadsWhileRunning")
				If $iPosition <> 0 Then
					Global $AllowOtherDownloadsWhileRunning = StringReplace($Complete_Value_Line, '	"AllowOtherDownloadsWhileRunning"		"', '')
					$AllowOtherDownloadsWhileRunning = StringReplace($AllowOtherDownloadsWhileRunning, '"', '')
				EndIf
			Next

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
			IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

			IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
			IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
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


	EndIf
EndFunc



Func _Get_SteamGame_Icon_32x32()
	Global $Steam_AppId = $appid

	Global $sHTML = _INetGetSource('https://steamdb.info/app/' & $appid & '/info/')

	Local $iPosition_1 = StringInStr($sHTML, 'clienttga</td>', $STR_CASESENSE, 1, 1000)
	Local $iPosition_2 = StringInStr($sHTML, '.jpg" rel="nofollow">', $STR_CASESENSE, 1, 1000)
	Local $iPosition_3 = $iPosition_2 - $iPosition_1
	Local $sString = StringMid($sHTML, $iPosition_1, $iPosition_3)

;	MsgBox(1, "PlaceHolder", $sString)

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






Func _Create_ListView_1()     ; line1458
	$listview = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview, "NR", 60)
	_GUICtrlListView_AddColumn($listview, "App ID", 90)
	_GUICtrlListView_AddColumn($listview, "Name", 290)
	_GUICtrlListView_AddColumn($listview, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview, "Online", 95, 2)
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
	$listview_2 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_2, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_2, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_2, "NR", 60)
	_GUICtrlListView_AddColumn($listview_2, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_2, "Name", 290)
	_GUICtrlListView_AddColumn($listview_2, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_2, "Online", 95, 2)
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
	$listview_3 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_3, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_3, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_3, "NR", 60)
	_GUICtrlListView_AddColumn($listview_3, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_3, "Name", 290)
	_GUICtrlListView_AddColumn($listview_3, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_3, "Online", 95, 2)
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
	$listview_4 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_4, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_4, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_4, "NR", 60)
	_GUICtrlListView_AddColumn($listview_4, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_4, "Name", 290)
	_GUICtrlListView_AddColumn($listview_4, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_4, "Online", 95, 2)
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
	$listview_5 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_5, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_5, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_5, "NR", 60)
	_GUICtrlListView_AddColumn($listview_5, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_5, "Name", 290)
	_GUICtrlListView_AddColumn($listview_5, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_5, "Online", 95, 2)
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
	$listview_6 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 236, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_6, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_6, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_6, "NR", 60)
	_GUICtrlListView_AddColumn($listview_6, "App ID", 90)
	_GUICtrlListView_AddColumn($listview_6, "Name", 290)
	_GUICtrlListView_AddColumn($listview_6, "Install dir", 240)
	_GUICtrlListView_AddColumn($listview_6, "Online", 95, 2)
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
	$Combo_State = StringReplace($Combo, "Steam Library ", "")

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
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
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
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_installdir, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 4)
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
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
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
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_installdir, 3)
			_GUICtrlListView_AddSubItem($listview_Temp, $ListView_RowNR, $Application_right_now, 4)
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




Func _RM_Menu_Item_8() ; RM_UP    line1985
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
	$GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
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
	$GetItem_Playtime_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "Playtime", "")
	$GetItem_renderTargetMultiplier_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "allowSupersampleFiltering", "")

	$GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	$GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	$GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	$GetItem_Playtime_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "Playtime", "")
	$GetItem_renderTargetMultiplier_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "renderTargetMultiplier", "")
	$GetItem_supersampleScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "supersampleScale", "")
	$GetItem_allowSupersampleFiltering_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "allowSupersampleFiltering", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "Playtime", $GetItem_Playtime_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "renderTargetMultiplier", $GetItem_renderTargetMultiplier_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "supersampleScale", $GetItem_supersampleScale_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "allowSupersampleFiltering", $GetItem_allowSupersampleFiltering_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "Playtime", $GetItem_Playtime_2)
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
	$GetItem_installdir_1 = ""
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
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", $GetItem_installdir_1)
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
			$GetItem_installdir_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "installdir", "")
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
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "installdir", $GetItem_installdir_next)
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






Func _Create_HTMLView_GUI()      ;line2399
	Local $Button_Exit_HTML_GUI, $TreeView_Steam_app_PO_right_now, $TreeView_Steam_app_PO_24h_peak, $TreeView_Steam_app_PO_all_time_peak, $Text_SplitNR
	Local $Handle_2, $Text_2

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($ListView)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

    Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($ListView, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $oIE = ObjCreate("Shell.Explorer.2")

	Global $HTML_GUI = GUICreate($Steam_app_Name & " - " & "steam.app." & $Game_ID, 980, 600, (@DesktopWidth - 980) / 2, (@DesktopHeight - 600) / 2, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	GUICtrlCreateObj($oIE, 0, 0, 979, 550)

	Global $Button_Exit_HTML_GUI = GUICtrlCreateButton("Exit", 940, 560, 35, 35, $BS_BITMAP)
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
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "ALL" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
	If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
	If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
	If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"



	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	If FileExists($GamePage_path) Then FileDelete($GamePage_path)

	FileWrite($GamePage_path, '<html>' & @CRLF & _
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

								FileWriteLine($GamePage_path, '     <div class="tooltip"><a href="https://www.youtube.com/"> <img class="icon" src="images/youtube.png" width="65" /> <span class="tooltiptext">YouTube</span></a></div>' & @CRLF & _
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

								FileWriteLine($GamePage_path, '  <div class="icons">' & @CRLF & _
															  '	 	<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_ALL.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">All Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_Non-Steam_Appl.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">Non-Steam Games</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_Custom_1.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">Favorites</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_Custom_2.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">Custom Tab 2</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_Custom_3.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">Custom Tab 3</span></a></div>' & @CRLF & _
															  '		<div class="tooltip"><a href="'& $Install_Web_DIR & 'GamePage_Custom_4.html"><img class="icon" src="images/Games.png" width="65" /><span class="tooltiptext">Custom Tab 4</span></a></div>' & @CRLF & _
															  '  </div>')



;	For $NR = 1 To $NR_Applications
;		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
;		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
;		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
;		Global $Application_StateFlags = IniRead($ApplicationList_TEMP, "Application_" & $NR, "StateFlags", "")
;		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
;		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")
;		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR, "right_now", "")
;		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "24h_peak", "")
;		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR, "all_time_peak", "")
;
;		If Not FileExists($Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg") Then
;			FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
;		EndIf
;
;		If Not FileExists($Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg") Then
;			FileCopy($gfx & "Icon_Preview.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
;		EndIf
;
;		FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & '"> <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /> <span class="tooltiptext">' & $Application_name & '</span></a></div>')
;	Next

;	FileWriteLine($GamePage_path, '  </div>')
	FileWriteLine($GamePage_path, '</body>')
	FileWriteLine($GamePage_path, '</html>')
EndFunc




Func _Button_Create_GamePage_selected()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating Game Page..." & @TAB & @TAB & "'Version " & $Version & "'")

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "" Then $ButtonTAB_State = "1"
	$Combo = GUICtrlRead($Combo_SteamLibrary)
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then $WebPage_Title = "All SteamVR Games"
	If $ButtonTAB_State = "2" Then $WebPage_Title = "Non-Steam Titles"
	If $ButtonTAB_State = "3" Then $WebPage_Title = "Favorites"
	If $ButtonTAB_State = "4" Then $WebPage_Title = "Custom 2"
	If $ButtonTAB_State = "5" Then $WebPage_Title = "Custom 3"
	If $ButtonTAB_State = "6" Then $WebPage_Title = "Custom 4"


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

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_ALL.html"
		If $Combo = "Steam Library 1" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_1.html"
		If $Combo = "Steam Library 2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_2.html"
		If $Combo = "Steam Library 3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_3.html"
		If $Combo = "Steam Library 4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_4.html"
		If $Combo = "Steam Library 5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Steam_Library_5.html"
	EndIf

	If $ButtonTAB_State = "2" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
	If $ButtonTAB_State = "3" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
	If $ButtonTAB_State = "4" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
	If $ButtonTAB_State = "5" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
	If $ButtonTAB_State = "6" Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"

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

		FileWrite($GamePage_path, '<html>' & @CRLF & _
									'<head>' & @CRLF & _
									'    <title>'& $WebPage_Title & '</title>' & @CRLF & _
									'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
									'</head>' & @CRLF & _
									'<body>' & @CRLF & _
									'<h1>'& $WebPage_Title & '</h1>' & @CRLF & _
									'<div class="icons">' & @CRLF)


		For $NR = 1 To $NR_Applications
			GUICtrlSetData($Display_Progressbar, $NR * 100 / $NR_Applications)
			If _GUICtrlListView_GetItemChecked($listview_Temp, $NR - 1) Then
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
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



				FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' "><img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')



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
					Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
					Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR, "IconPath", "")

					IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "installdir", $Application_installdir)
					IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "IconPath", $Application_IconPath)
					$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
	EndIf
EndFunc




Func _Button_Start_SteamVR()
		ShellExecute("steam://rungameid/250820")
EndFunc

Func _Open_Folder()
		Run("C:\WINDOWS\EXPLORER.EXE /n,/e," & $Install_Web_DIR)
EndFunc






Func _Open_GamePage()
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

		If $ButtonTAB_State = 1 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_All.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_ALL.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf


		If $ButtonTAB_State = 2 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_Non-Steam_Appl.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf

		If $ButtonTAB_State = 3 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_Custom_1.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_Custom_1.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf


		If $ButtonTAB_State = 4 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_Custom_2.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_Custom_2.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf

		If $ButtonTAB_State = 5 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_Custom_3.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_Custom_3.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf


		If $ButtonTAB_State = 6 Then

			$GamePage_path1 = $Install_DIR & "WebPage\GamePage_Custom_4.html"
			If FileExists($GamePage_path1) Then
				ShellExecute("C:/Users/Phantom/Desktop/HomeLoader48 Project/WebPage/GamePage_Custom_4.html")
			Else
				MsgBox(1,"Oops!", "No such page exists!")
			EndIf
		EndIf



EndFunc







Func _Combo_SteamLibrary()
	$Combo = GUICtrlRead($Combo_SteamLibrary)
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
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_SHOW)
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
	GUICtrlSetState($Button_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_SHOW)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
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
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
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
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
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
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
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
	GUICtrlSetState($Button_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Combo_Add_to_Custom, $GUI_HIDE)
	GUICtrlSetState($Button_ReScan_Steam_Library, $GUI_HIDE)
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

	If $Combo = "ALL" Then
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
	EndIf

	If $Combo <> "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(500)
		GUICtrlSetData($Display_Progressbar, 0)
	EndIf
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
	$Value_GamePath_Folder = IniRead($config_ini, "TEMP", "Value_GamePath_Folder", "")
	$Value_Use_SteamID = IniRead($config_ini, "TEMP", "Value_Use_SteamID", "")
	$Value_Input_Name = IniRead($config_ini, "TEMP", "Value_Input_Name", "")
	$Value_IconPath_Folder = IniRead($config_ini, "TEMP", "Value_IconPath_Folder", "")

	$LastAppNR = IniRead($ApplicationList_Non_Steam_Appl_INI, "ApplicationList", "NR_Applications", "")
	$NewAppNR = $LastAppNR + 1

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $NewAppNR, "IconPath", $Value_IconPath_Folder)

	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "appid", $Value_Use_SteamID)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "name", $Value_Input_Name)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "installdir", $Value_GamePath_Folder)
	IniWrite($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Value_Use_SteamID, "IconPath", $Value_IconPath_Folder)

	IniWrite($config_ini, "TEMP", "Value_DROPDOWN_Library", "")
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
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
	IniWrite($config_ini, "TEMP", "Value_GamePath_Folder", "")
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
	If FileExists($Install_DIR & "SteamGameLoader.exe") Then
		ShellExecute($Install_DIR & "SteamGameLoader.exe")
	Else
		ShellExecute($Install_DIR & "SteamGameLoader.au3")
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


