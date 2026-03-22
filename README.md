# windows-desktop-switcher (Augmented Fork)

> [!NOTE]
> This is a personal fork of [windows-desktop-switcher](https://github.com/pmb6tz/windows-desktop-switcher). You can support the original creator [here](https://ko-fi.com/U6U82G0A5).
> 
> This fork is tailored for enhanced productivity with custom gesture controls and modified hotkeys.

## New Features
- **Move Window**: `Alt` + `Shift` + `1-9` moves the active window to the specified desktop.
- **Resize Window**: `Alt` + `P/O/I/U` changes the active window width or height in 96 px steps.

An AutoHotkey script for Windows that lets a user switch virtual desktops by pressing <kbd>CapsLock</kbd> and a number row key at the sime time (e.g. <kbd>CapsLock</kbd> + <kbd>2</kbd> to switch to Desktop 2). It also provides other features, such as customizing the key combinations, creation/deletion of desktops by hotkey, etc. (see Hotkeys section below).

## Hotkeys

| Action | Hotkey |
| :--- | :--- |
| **Switch** to Desktop 1-9 | `Alt` + `1`...`9` (or Numpad) |
| **Move Window** to Desktop 1-9 | `Alt` + `Shift` + `1`...`9` |
| **Shrink** active window horizontally | `Alt` + `U` |
| **Shrink** active window vertically | `Alt` + `I` |
| **Grow** active window vertically | `Alt` + `O` |
| **Grow** active window horizontally | `Alt` + `P` |

## Configuration

To change the key mappings, modify the `user_config.ahk` script and then run `desktop_switcher.ahk` (the script will reload automatically).

### Current Configuration
The default configuration in this fork uses `LAlt` as the primary modifier.

The resize shortcuts intentionally ignore maximized windows. Normal windows are resized in 96 px steps while keeping the top-left corner fixed.

```autohotkey
; Switch to Desktop 1
LAlt & 1::SwitchDesktopOrMoveWindow(1)

; Move Window to Desktop 1 (when Shift is held)
SwitchDesktopOrMoveWindow(targetDesktop) {
    if (GetKeyState("Shift", "P")) {
        MoveCurrentWindowToDesktop(targetDesktop)
    } else {
        switchDesktopByNumber(targetDesktop)
    }
}
```

## Running
[Install AutoHotkey v1.1](https://autohotkey.com/download/1.1/AutoHotkey_1.1.37.02_setup.exe), then run `desktop_switcher.ahk`.

## Credits
This project uses [VirtualDesktopAccessor.dll](https://github.com/Ciantic/VirtualDesktopAccessor).
