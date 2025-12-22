; ====================
; === INSTRUCTIONS ===
; ====================
; 1. Any lines starting with ; are ignored
; 2. After changing this config file run script file "desktop_switcher.ahk"
; 3. Every line is in the format HOTKEY::ACTION

; === SYMBOLS ===
; !   <- Alt
; +   <- Shift
; ^   <- Ctrl
; #   <- Win
; For more, visit https://autohotkey.com/docs/Hotkeys.htm

; === EXAMPLES ===
; !n::switchDesktopToRight()             <- <Alt> + <N> will switch to the next desktop (to the right of the current one)
; #!space::switchDesktopToRight()        <- <Win> + <Alt> + <Space> will switch to next desktop
; CapsLock & n::switchDesktopToRight()   <- <CapsLock> + <N> will switch to the next desktop (& is necessary when using non-modifier key such as CapsLock)

; ===========================
; === END OF INSTRUCTIONS ===
; ===========================

LAlt & 1::SwitchDesktopOrMoveWindow(1)
LAlt & 2::SwitchDesktopOrMoveWindow(2)
LAlt & 3::SwitchDesktopOrMoveWindow(3)
LAlt & 4::SwitchDesktopOrMoveWindow(4)
LAlt & 5::SwitchDesktopOrMoveWindow(5)
LAlt & 6::SwitchDesktopOrMoveWindow(6)
LAlt & 7::SwitchDesktopOrMoveWindow(7)
LAlt & 8::SwitchDesktopOrMoveWindow(8)
LAlt & 9::SwitchDesktopOrMoveWindow(9)

LAlt & Numpad1::SwitchDesktopOrMoveWindow(1)
LAlt & Numpad2::SwitchDesktopOrMoveWindow(2)
LAlt & Numpad3::SwitchDesktopOrMoveWindow(3)
LAlt & Numpad4::SwitchDesktopOrMoveWindow(4)
LAlt & Numpad5::SwitchDesktopOrMoveWindow(5)
LAlt & Numpad6::SwitchDesktopOrMoveWindow(6)
LAlt & Numpad7::SwitchDesktopOrMoveWindow(7)
LAlt & Numpad8::SwitchDesktopOrMoveWindow(8)
LAlt & Numpad9::SwitchDesktopOrMoveWindow(9)

; Secondary shortcuts disabled to leave only Alt+number desktop switching active.
; LAlt & n::switchDesktopToRight()
; LAlt & p::switchDesktopToLeft()
; LAlt & s::switchDesktopToRight()
; LAlt & a::switchDesktopToLeft()
; LAlt & tab::switchDesktopToLastOpened()

; LAlt & c::createVirtualDesktop()
; LAlt & d::deleteVirtualDesktop()

; LAlt & q::MoveCurrentWindowToDesktop(1)
; LAlt & w::MoveCurrentWindowToDesktop(2)
; LAlt & e::MoveCurrentWindowToDesktop(3)
; LAlt & r::MoveCurrentWindowToDesktop(4)
; LAlt & t::MoveCurrentWindowToDesktop(5)
; LAlt & y::MoveCurrentWindowToDesktop(6)
; LAlt & u::MoveCurrentWindowToDesktop(7)
; LAlt & i::MoveCurrentWindowToDesktop(8)
; LAlt & o::MoveCurrentWindowToDesktop(9)

; LAlt & Right::MoveCurrentWindowToRightDesktop()
; LAlt & Left::MoveCurrentWindowToLeftDesktop()

; === INSTRUCTIONS ===
; Below is the alternate key configuration. Delete symbol ; in the beginning of the line to enable.
; Note, that  ^!1  means "Ctrl + Alt + 1" and  ^#1  means "Ctrl + Win + 1"
; === END OF INSTRUCTIONS ===

; ^!1::switchDesktopByNumber(1)
; ^!2::switchDesktopByNumber(2)
; ^!3::switchDesktopByNumber(3)
; ^!4::switchDesktopByNumber(4)
; ^!5::switchDesktopByNumber(5)
; ^!6::switchDesktopByNumber(6)
; ^!7::switchDesktopByNumber(7)
; ^!8::switchDesktopByNumber(8)
; ^!9::switchDesktopByNumber(9)

; ^!Numpad1::switchDesktopByNumber(1)
; ^!Numpad2::switchDesktopByNumber(2)
; ^!Numpad3::switchDesktopByNumber(3)
; ^!Numpad4::switchDesktopByNumber(4)
; ^!Numpad5::switchDesktopByNumber(5)
; ^!Numpad6::switchDesktopByNumber(6)
; ^!Numpad7::switchDesktopByNumber(7)
; ^!Numpad8::switchDesktopByNumber(8)
; ^!Numpad9::switchDesktopByNumber(9)

; ^!n::switchDesktopToRight()
; ^!p::switchDesktopToLeft()
; ^!s::switchDesktopToRight()
; ^!a::switchDesktopToLeft()
; ^!tab::switchDesktopToLastOpened()

; ^!c::createVirtualDesktop()
; ^!d::deleteVirtualDesktop()

; ^#1::MoveCurrentWindowToDesktop(1)
; ^#2::MoveCurrentWindowToDesktop(2)
; ^#3::MoveCurrentWindowToDesktop(3)
; ^#4::MoveCurrentWindowToDesktop(4)
; ^#5::MoveCurrentWindowToDesktop(5)
; ^#6::MoveCurrentWindowToDesktop(6)
; ^#7::MoveCurrentWindowToDesktop(7)
; ^#8::MoveCurrentWindowToDesktop(8)
; ^#9::MoveCurrentWindowToDesktop(9)

; ^#Numpad1::MoveCurrentWindowToDesktop(1)
; ^#Numpad2::MoveCurrentWindowToDesktop(2)
; ^#Numpad3::MoveCurrentWindowToDesktop(3)
; ^#Numpad4::MoveCurrentWindowToDesktop(4)
; ^#Numpad5::MoveCurrentWindowToDesktop(5)
; ^#Numpad6::MoveCurrentWindowToDesktop(6)
; ^#Numpad7::MoveCurrentWindowToDesktop(7)
; ^#Numpad8::MoveCurrentWindowToDesktop(8)
; ^#Numpad9::MoveCurrentWindowToDesktop(9)

; ^#Right::MoveCurrentWindowToRightDesktop()
; ^#Left::MoveCurrentWindowToLeftDesktop()



; === INSTRUCTIONS ===
; Additional alternative shortcut for moving current window to left or right desktop (ctrl+shift+Win+left/right)
; === END OF INSTRUCTIONS ===

; ^#+Right::MoveCurrentWindowToRightDesktop()
; ^#+Left::MoveCurrentWindowToLeftDesktop()

SwitchDesktopOrMoveWindow(targetDesktop) {
    if (GetKeyState("Shift", "P")) {
        MoveCurrentWindowToDesktop(targetDesktop)
    } else {
        switchDesktopByNumber(targetDesktop)
    }
}

; Ctrl + Left Click = Right Click
^LButton::Click Right

; Alt + Left Click + Drag = Scroll
LAlt & LButton::
    CoordMode, Mouse, Screen
    MouseGetPos, mX_Start, mY_Start
    Loop
    {
        if !GetKeyState("LButton", "P")
            break
            
        MouseGetPos, mX_Now, mY_Now
        mY_Delta := mY_Now - mY_Start
        
        if (mY_Delta > 10)
        {
            Click, WheelUp
            mY_Start := mY_Now
        }
        else if (mY_Delta < -10)
        {
            Click, WheelDown
            mY_Start := mY_Now
        }
        
        Sleep, 10
    }
return
