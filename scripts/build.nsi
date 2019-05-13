; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Open Exam Suite"
!define PRODUCT_VERSION "3.2.0"
!define PRODUCT_PUBLISHER "bolorundurowb"
!define PRODUCT_WEB_SITE "https://bolorundurowb.github.io/Open-Exam-Suite/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\Simulator.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_RADIOBUTTONS
!insertmacro MUI_PAGE_LICENSE "License.rtf"
; Components page
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\Simulator.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "OES v${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\Open Exam Suite"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "Simulator" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\src\apps\Simulator\bin\Release\Storage.dll"
  File "..\src\apps\Simulator\bin\Release\Simulator.exe"
  CreateDirectory "$SMPROGRAMS\Open Exam Suite"
  CreateShortCut "$SMPROGRAMS\Open Exam Suite\Simulator.lnk" "$INSTDIR\Simulator.exe"
  CreateShortCut "$DESKTOP\Simulator.lnk" "$INSTDIR\Simulator.exe"
  File "..\src\apps\Simulator\bin\Release\Shared.dll"
  File "..\src\apps\Simulator\bin\Release\Newtonsoft.Json.dll"
  File "..\src\apps\Simulator\bin\Release\Logging.dll"
  File "..\src\apps\Simulator\bin\Release\LiteDB.dll"
  File "..\src\apps\Simulator\bin\Release\itextsharp.dll"
SectionEnd

Section "Creator" SEC02
  File "..\src\apps\Creator\bin\Release\Storage.dll"
  File "..\src\apps\Creator\bin\Release\Shared.dll"
  File "..\src\apps\Creator\bin\Release\Newtonsoft.Json.dll"
  File "..\src\apps\Creator\bin\Release\Logging.dll"
  File "..\src\apps\Creator\bin\Release\LiteDB.dll"
  File "..\src\apps\Creator\bin\Release\itextsharp.dll"
  File "..\src\apps\Creator\bin\Release\Creator.exe"
  CreateShortCut "$SMPROGRAMS\Open Exam Suite\Creator.lnk" "$INSTDIR\Creator.exe"
  CreateShortCut "$DESKTOP\Creator.lnk" "$INSTDIR\Creator.exe"
SectionEnd

Section "Samples" SEC03
  SetOutPath "$INSTDIR\Samples"
  File "..\samples\GMAT Sample.oef"
  File "..\samples\Basic Science.oef"
SectionEnd

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\Open Exam Suite\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\Open Exam Suite\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Simulator.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\Simulator.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Tool to help administer exams"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Tool to help create exam files"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Samples to test with"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$DOCUMENTS\OpenExamSuite\GMAT Sample.oef"
  Delete "$INSTDIR\Creator.exe"
  Delete "$INSTDIR\itextsharp.dll"
  Delete "$INSTDIR\LiteDB.dll"
  Delete "$INSTDIR\Logging.dll"
  Delete "$INSTDIR\Newtonsoft.Json.dll"
  Delete "$INSTDIR\Shared.dll"
  Delete "$INSTDIR\Storage.dll"
  Delete "$INSTDIR\itextsharp.dll"
  Delete "$INSTDIR\LiteDB.dll"
  Delete "$INSTDIR\Logging.dll"
  Delete "$INSTDIR\Newtonsoft.Json.dll"
  Delete "$INSTDIR\Shared.dll"
  Delete "$INSTDIR\Simulator.exe"
  Delete "$INSTDIR\Storage.dll"

  Delete "$SMPROGRAMS\Open Exam Suite\Uninstall.lnk"
  Delete "$SMPROGRAMS\Open Exam Suite\Website.lnk"
  Delete "$DESKTOP\Creator.lnk"
  Delete "$SMPROGRAMS\Open Exam Suite\Creator.lnk"
  Delete "$DESKTOP\Simulator.lnk"
  Delete "$SMPROGRAMS\Open Exam Suite\Simulator.lnk"

  RMDir "$SMPROGRAMS\Open Exam Suite"
  RMDir "$INSTDIR"
  RMDir "$DOCUMENTS\OpenExamSuite"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd