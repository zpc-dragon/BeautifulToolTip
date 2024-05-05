#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1

OnClipboardChange("ClipChanged") ; ע�������仯�¼�.
ClipChanged(clip_type) {
    ; MsgBox, �����������Ѿ��ı�. ����: %clip_type%

    if (clip_type == 1) { ; ������ı�
        file_type := "�ı�"
    } else if (clip_type == 2) {
        file_type := "ͼ��"
    } else {
        file_type := "δ֪"
    }
    ; �Զ���һ��������ʾ

    Text = ������:%file_type%
    ; �̶���������Ļ���½���ʾ��������������
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
    ; ���XY����
    ; MsgBox, %X% %Y%
    ; ExitApp
}
