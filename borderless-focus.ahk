#Requires AutoHotkey v2.0
#SingleInstance Force

global isBorderActive := false
global borderGuis := []
global dpiScale := A_ScreenDPI / 96
global activeWindow := ""

#B::ToggleBorder

try {
    HideShowTaskbar(false)
}

ToggleBorder(*) {
    global isBorderActive, borderGuis, activeWindow

    if (isBorderActive) {
        ; Remove borders
        for borderGui in borderGuis
            borderGui.Destroy()
        borderGuis := []
        isBorderActive := false
        try {
            HideShowTaskbar(false)
        }
        if (activeWindow != "") {
            AppVol(0)
            WinMinimize(activeWindow)
            
            activeWindow := ""
        }
    } else {
        if !WinExist("A") {
            return
        }
        activeWindow := WinGetID("A")
        AppVol(100)

        rect := GetWindowRectDPI("A")
        x := rect.left
        y := rect.top
        width := rect.right - rect.left
        height := rect.bottom - rect.top

        if (x == "" || y == "" || width == "" || height == "") {
            ToolTip("Invalid window position data")
            return
        }
        monWidth := GetMonitorResolution().width
        monHeight := GetMonitorResolution().height

        borderGuis.Push(CreateBorderGui(x, 0, Round(width/dpiScale), Round(y/dpiScale)))  ; Top
        borderGuis.Push(CreateBorderGui(x, y+height, Round(width/dpiScale), Round((monHeight-(y+height))/dpiScale)))  ; Bottom
        borderGuis.Push(CreateBorderGui(0, 0, Round(x/dpiScale), monHeight))  ; Left
        borderGuis.Push(CreateBorderGui(x + width, 0, Round(((monWidth-(x+width))/dpiScale)), monHeight))  ; Right

        isBorderActive := true
        try {
            HideShowTaskbar(true)
        }
    }
}

CreateBorderGui(x, y, w, h) {
    newGui := Gui("+AlwaysOnTop -Caption +ToolWindow +E0x20")
    newGui.BackColor := "Black"
    newGui.Show(Format("x{1} y{2} w{3} h{4} NoActivate", x, y, w, h))
    WinSetTransparent(255, newGui)
    return newGui
}

GetMonitorResolution(monitorNumber := MonitorGetPrimary()) {
    MonitorGet(monitorNumber, &left, &top, &right, &bottom)
    width := right - left
    height := bottom - top
    return {width: width, height: height}
}

GetWindowRectDPI(winTitle) {
    hWnd := WinExist(winTitle)
    if (!hWnd)
        return false

    rect := Buffer(16, 0)
    DllCall("dwmapi\DwmGetWindowAttribute"
        , "Ptr", hWnd
        , "UInt", 9
        , "Ptr", rect
        , "UInt", 16
        , "Int")

    return {left: NumGet(rect, 0, "Int")
        , top: NumGet(rect, 4, "Int")
        , right: NumGet(rect, 8, "Int")
        , bottom: NumGet(rect, 12, "Int")}
}

HideShowTaskbar(shouldHide) {
    if (shouldHide)
        WinHide("ahk_class Shell_TrayWnd")
    else
        WinShow("ahk_class Shell_TrayWnd")
}

AppVol(Target := "A", Level := 0) {
    if (Target ~= "^[-+]?\d+$") {
        Level := Target
        Target := "A"
    } else if (SubStr(Target, -4) = ".exe") {
        Target := "ahk_exe " Target
    }
    try {
        hw := DetectHiddenWindows(true)
        appName := WinGetProcessName(Target)
        DetectHiddenWindows(hw)
    } catch {
        throw TargetError("Target not found.", -1, Target)
    }
    GUID := Buffer(16)
    DllCall("ole32\CLSIDFromString", "Str", "{77AA99A0-1BD6-484F-8BC7-2C654C9A9B6F}", "Ptr", GUID)
    IMMDeviceEnumerator := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")
    ComCall(4, IMMDeviceEnumerator, "UInt", 0, "UInt", 1, "Ptr*", &IMMDevice := 0)
    ObjRelease(IMMDeviceEnumerator.Ptr)
    ComCall(3, IMMDevice, "Ptr", GUID, "UInt", 23, "Ptr", 0, "Ptr*", &IAudioSessionManager2 := 0)
    ObjRelease(IMMDevice)
    ComCall(5, IAudioSessionManager2, "Ptr*", &IAudioSessionEnumerator := 0) || DllCall("SetLastError", "UInt", 0)
    ObjRelease(IAudioSessionManager2)
    ComCall(3, IAudioSessionEnumerator, "UInt*", &cSessions := 0)
    loop cSessions {
        ComCall(4, IAudioSessionEnumerator, "Int", A_Index - 1, "Ptr*", &IAudioSessionControl := 0)
        IAudioSessionControl2 := ComObjQuery(IAudioSessionControl, "{BFB7FF88-7239-4FC9-8FA2-07C950BE9C6D}")
        ObjRelease(IAudioSessionControl)
        ComCall(14, IAudioSessionControl2, "UInt*", &pid := 0)
        ; msgbox(ProcessGetName(pid)`npid`nappName)
        if (pid = 0) || (ProcessGetName(pid) != appName) {
            continue
        }
        ISimpleAudioVolume := ComObjQuery(IAudioSessionControl2, "{87CE5498-68D6-44E5-9215-6DA47EF883D8}")
        ComCall(6, ISimpleAudioVolume, "Int*", &isMuted := 0)
        if (isMuted || !Level) {
            ComCall(5, ISimpleAudioVolume, "Int", !isMuted, "Ptr", 0)
        }
        if (Level) {
            ComCall(4, ISimpleAudioVolume, "Float*", &levelOld := 0)
            if (Level ~= "^[-+]") {
                levelNew := Max(0.0, Min(1.0, levelOld + (Level / 100)))
            } else {
                levelNew := Level / 100
            }
            if (levelNew != levelOld) {
                ComCall(3, ISimpleAudioVolume, "Float", levelNew, "Ptr", 0)
            }
        }
        ObjRelease(ISimpleAudioVolume.Ptr)
    }
    return (IsSet(levelOld) ? Round(levelOld * 100) : -1)
}
