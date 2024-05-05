#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1

OnClipboardChange("ClipChanged") ; 注册剪贴板变化事件.
ClipChanged(clip_type) {
    ; MsgBox, 剪贴板内容已经改变. 类型: %clip_type%

    if (clip_type == 1) { ; 如果是文本
        file_type := "文本"
    } else if (clip_type == 2) {
        file_type := "图像"
    } else {
        file_type := "未知"
    }
    ; 自定义一个工具提示

    Text = 剪贴板:%file_type%
    ; 固定在整个屏幕右下角显示剪贴板数据类型
    showPrompt(Text)

}
showPrompt(Text) {
    ; fadein
    ; X := A_ScreenWidth
    ; Y := A_ScreenHeight
    X := 2200, Y := 1250
    for k, v in [15,35,55,75,95,115,135,155,175,195,215,235,255]
    {
        btt(Text,X ,Y, ,"Style4",{Transparent:v,CoordMode:"Screen"})
        Sleep, 30
    }

    Sleep, 1000

    ; fadeout
    for k, v in [240,220,200,180,160,140,120,100,80,60,40,20,0]
    {
        btt(Text,X, Y, ,"Style4",{Transparent:v,CoordMode:"Screen"})
        Sleep, 30
    }
    ; 输出XY坐标
    ; MsgBox, %X% %Y%
    ; ExitApp
}
