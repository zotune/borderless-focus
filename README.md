# Borderless Focus

Enhance your gaming experience with custom borders, taskbar hiding, and smart audio management for borderless windowed games.

## Features

- Add black borders to borderless windowed games
- Hide the taskbar for a truly fullscreen experience
- Mute/unmute the game audio automatically
- Easy toggle with Windows + B hotkey

## Requirements

- AutoHotkey v2.0
- NVIDIA graphics card with G-SYNC support (for optimal performance)

## Installation

1. Install AutoHotkey v2.0 from the [official website](https://www.autohotkey.com/).
2. Download the `borderless-focus.ahk` script from this repository.
3. Double-click the script to run it.

## How to Use

1. Launch your game in borderless windowed mode.
2. Press `Windows + B` to toggle Borderless Focus on/off.
3. When activated:
   - Black borders will appear around your game window
   - The taskbar will be hidden
   - Game audio will be unmuted
4. When deactivated:
   - Borders will be removed
   - The taskbar will reappear
   - Game audio will be muted
   - The game window will be minimized
  
## Important: Enable G-SYNC for Windowed and Full Screen Mode

For the best experience with borderless windowed games, it's crucial to enable G-SYNC for both windowed and full screen modes:

1. Open NVIDIA Control Panel
2. Navigate to "Set up G-SYNC" in the left menu
3. Check the box for "Enable G-SYNC, G-SYNC Compatible"
4. Select "Enable for windowed and full screen mode"
5. Apply the changes

This setting ensures that G-SYNC works properly with borderless windowed games, providing smooth, tear-free gameplay.

## Notes

- Ensure your game is the active window when toggling Borderless Focus.
- If you encounter any issues with audio control, check that the script has the necessary permissions to interact with your audio devices.

## Troubleshooting

If you encounter any issues:
1. Ensure you're running the latest version of AutoHotkey v2.0.
2. Check that your game is in true borderless windowed mode, not fullscreen or regular windowed mode.
3. Run the script as administrator if you're having trouble with taskbar or audio controls.
4. Verify that G-SYNC is enabled for both windowed and full screen mode in NVIDIA Control Panel.