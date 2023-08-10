#Include C:\Users\avons\Code\AutoHotkey_Scripts\GraphicLibrary\HtmlInterface.ahk

global text1
global text2

Test_HandleNavigation(pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel) {
}

Test_GuiController_Display() {
    ; Define the path to the ReadmePopup directory
    pageDir := % A_ScriptDir . "\TestPage"
    navFuncObj := Func("Test_HandleNavigation")
    
    myHtmlInterface := new HtmlInterface(title1, pageDir, text1, navFuncObj)
    myHtmlInterface.Show()

    myHtmlInterface2 := new HtmlInterface(title2, pageDir, text2, navFuncObj)
    myHtmlInterface2.Show()

    myHtmlInterface.Hide()
    myHtmlInterface2.Hide()

    myHtmlInterface.Destroy()
    myHtmlInterface2.Destroy()
}

; Execute the test
Test_GuiController_Display()

ExitApp, 0
