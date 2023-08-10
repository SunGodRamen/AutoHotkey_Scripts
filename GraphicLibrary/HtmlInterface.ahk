;Include hash library
#Include C:\Users\avons\Code\AutoHotkey_Scripts\Util\Hash.ahk

class HtmlInterface {
    EventSinks := {DISPID_BEFORENAVIGATE2: "BeforeNavigate2"}
    Title := 
    GUIID :=
    Dim_X := 1600
    Dim_Y := 800
    Geo_X := 0
    Geo_Y := 0
    Trans := 160
    Shown := false

    __New(title, pageDir, dim_x, dim_y, geo_x, geo_y, trans, ByRef globalText, navigateFunction) {
        ; Check if the pageDir path is valid
        if (!FileExist(pageDir . "\body.html")||!FileExist(pageDir . "\style.css")||!FileExist(pageDir . "\script.js")) {
            MsgBox, 16, Error, %pageDir% directory does not contain the required files. Please make sure the directory is correct.
            return, false
        }

        this.Title := title
        this.GUIID := HashString(title)
        this.Dim_X := dim_x
        this.Dim_Y := dim_y
        this.Geo_X := geo_x
        this.Geo_Y := geo_y
        this.Trans := trans
        
        ; Read HTML, CSS, and JS files
        FileRead, html, % pageDir . "\body.html"
        FileRead, css, % pageDir . "\style.css"
        FileRead, js, % pageDir . "\script.js"
        
        ; Combine HTML and CSS into a single HTML string
        html = 
        (
        <style>
        %css%
        </style>
        <script>
        %js%
        </script>
        <body>
        %html%
        </body>
        )
        
        guiid := this.GUIID
        Gui, %guiid%, New, % this.title
        Gui, -Caption
        Gui, Add, ActiveX, x%geo_x%, y%geo_y%, w%dim_x%, h%dim_y%, vglobalText, Shell.Explorer
        globalText.Navigate("about:blank")
        ComObjConnect(globalText, EventSinks)
        globalText.document.write(html)
        globalText.document.close()
        WinSet, Transparent, trans, % this.title
    }

    Show() {
        dim_x := this.Dim_X
        dim_y := this.Dim_Y
        title := this.Title
        guiid := this.GUIID
        Gui, %guiid%, Show, w%dim_x% h%dim_y%, %title%
        this.Shown := true
    }

    Hide() {
        guiid := this.GUIID
        Gui, %guiid%, Hide, % this.title
        this.Shown := false
    }

    Destroy() {
        guiid := this.GUIID
        Gui, %guiid%, Destroy, % this.title
    }
    
    BeforeNavigate2(pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel) {
        if this.NavigateFunction
          this.NavigateFunction.Call(pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel)
    }
}