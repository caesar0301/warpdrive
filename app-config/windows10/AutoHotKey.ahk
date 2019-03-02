#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; -------------------------------------------------------------------------
; 网页快捷键
:*:*wd::
Run, https://github.com/caesar0301/warp-drive
return
:*:*pt::
Run, https://pt.sjtu.edu.cn/index.php
return
:*:*jr::
Run, http://172.16.0.244:8080
return
:*:*wk::
Run, http://172.16.1.168:8090
return
:*:*gl::
Run, http://172.16.1.41:10080/
return
; -------------------------------------------------------------------------
; 快捷输入当前日期时间
:*:]n::  ; 按下快捷键组合： `]` 和 `n`
getNow()
return
getNow()
{
    FormatTime, NowDateTime,, yyyy-MM-dd HH:mm:ss
    send, %NowDateTime%
}
; -------------------------------------------------------------------------
; Window 10同一应用多窗口切换
!`:: ; Next window
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinGet, List, List, % "ahk_class " ActiveClass
Loop, % List
{
    index := List - A_Index + 1
    WinGet, State, MinMax, % "ahk_id " List%index%
    if (State <> -1)
    {
        WinID := List%index%
        break
    }
}
WinActivate, % "ahk_id " WinID
return

!^`:: ; Last window
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinGet, List, List, % "ahk_class " ActiveClass
Loop, % List
{
    index := List - A_Index + 1
    WinGet, State, MinMax, % "ahk_id " List%index%
    if (State <> -1)
    {
        WinID := List%index%
        break
    }
}
WinActivate, % "ahk_id " WinID
return
; -------------------------------------------------------------------------
