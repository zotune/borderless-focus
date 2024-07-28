# Borderless Focus

Enhance your gaming experience with custom borders, taskbar hiding, and smart audio management for borderless windowed games. Perfect for playing 21:9 games on 32:9 super ultrawide monitors!

## Key Features

- Ideal for 21:9 gaming on 32:9 super ultrawide monitors
- Add black borders to borderless windowed games
- Hide the taskbar for a truly fullscreen experience
- Mute/unmute game audio automatically
- Easy toggle with Windows + B hotkey

## Ultrawide Monitor Support

Borderless Focus is especially useful for users with 32:9 super ultrawide monitors who want to play games in 21:9 aspect ratio. It creates a perfect centered 21:9 viewing area with black borders on the sides, giving you the ideal gaming experience without the need for manual resizing or dealing with stretched visuals.

## Requirements

- AutoHotkey v2.0
- NVIDIA graphics card with G-SYNC support (for optimal performance)
- Works great with 32:9 super ultrawide monitors!

## Installation

1. Install AutoHotkey v2.0 from the [official website](https://www.autohotkey.com/).
2. Download the `borderless-focus.ahk` script from this repository.
3. Double-click the script to run it.

## Setting Up Custom 21:9 Resolution on 32:9 Monitors

To enable a custom 21:9 resolution (3440x1440) on your 32:9 monitor:

1. Press Windows key + R, type "regedit", and press Enter
2. Use "Edit - Find..." and search for "NV_Modes" key
4. Add the following to the end of the existing value: "; 3440x1440x8,16,32,64=1F"
5. Save and exit the Registry Editor
6. Restart your computer or reload the graphics driver

Note: You have to do this every time you upgrade your driver

Now you can set your game to 3440x1440 windowed mode and enjoy 240Hz refresh rate.

## Important: Enable G-SYNC for Windowed and Full Screen Mode

For the best experience with borderless windowed games, especially on ultrawide monitors, it's crucial to enable G-SYNC for both windowed and full screen modes:

1. Open NVIDIA Control Panel
2. Navigate to "Set up G-SYNC" in the left menu
3. Check the box for "Enable G-SYNC, G-SYNC Compatible"
4. Select "Enable for windowed and full screen mode"
5. Apply the changes

This setting ensures that G-SYNC works properly with borderless windowed games, providing smooth, tear-free gameplay across your entire display.

## How to Use

1. Launch your game in borderless windowed mode (use 3440x1440 for 21:9 on 32:9 monitors).
2. Press `Windows + B` to toggle Borderless Focus on/off.
3. When activated:
   - Black borders will appear around your game window (perfect for 21:9 on 32:9)
   - The taskbar will be hidden
   - Game audio will be unmuted
4. When deactivated:
   - Borders will be removed
   - The taskbar will reappear
   - Game audio will be muted
   - The game window will be minimized

## Notes

- Ensure your game is the active window when toggling Borderless Focus.
- If you encounter any issues with audio control, check that the script has the necessary permissions to interact with your audio devices.
- For 32:9 monitor users: Use the custom 3440x1440 resolution for the best 21:9 experience.

## Troubleshooting

If you encounter any issues:
1. Ensure you're running the latest version of AutoHotkey v2.0.
2. Check that your game is in true borderless windowed mode, not fullscreen or regular windowed mode.
3. Run the script as administrator if you're having trouble with taskbar or audio controls.
4. Verify that G-SYNC is enabled for both windowed and full screen mode in NVIDIA Control Panel.
5. For ultrawide monitors: Make sure you've set up the custom 21:9 resolution as described above.
6. If the custom resolution doesn't appear, try updating your GPU drivers or using a custom resolution utility.
