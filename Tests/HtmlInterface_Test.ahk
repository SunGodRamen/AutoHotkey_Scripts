;HtmlInterface_Test.ahk

#Include C:\Users\avons\Code\AutoHotkey_Scripts\GraphicLibrary\HtmlInterface.ahk

global globalBrowser

class WB_events
{
    NavigateComplete2(wb, NewURL)
    {
        MsgBox, % "NavigateComplete2: " wb " " NewURL
    }

    BeforeNavigate2(wb, URL, Flags, TargetFrameName, PostData, Headers, Cancel)
    {
        MsgBox, % "BeforeNavigate2: " wb " " URL " " Flags " " TargetFrameName " " PostData " " Headers " " Cancel
        Cancel := False
    }
}

Test_HtmlInterface() {
    ; Define the path to the ReadmePopup directory
    pageDir := % A_ScriptDir . "\TestPage"
    navFuncObj := Func("Test_HandleNavigation")
    myEvents := new WB_events()

    myHtmlInterface := new HtmlInterface("title1", pageDir, 1000, 900, 250, 89, 200, globalBrowser, myEvents)
    myHtmlInterface.Show()
}

; Execute the test
Test_HtmlInterface()
