# Borderless Focus

Enhance your gaming experience with custom borders, taskbar hiding, and smart audio management for borderless windowed games. Especially useful for users with 32:9 super ultrawide monitors who want to play games in 21:9 aspect ratio. It creates a perfect centered 21:9 viewing area with black borders on the sides, giving you the ideal gaming experience without the need for manual resizing or dealing with stretched visuals.

## Key Features

- Ideal for 21:9 gaming on 32:9 super ultrawide monitors
- Add black borders to borderless windowed games
- Hide the taskbar for a truly fullscreen experience
- Mute/unmute game audio automatically
- Minimize games and mute them when toggled off
- Easy toggle with Windows + B hotkey

## Installation

1. Install AutoHotkey v2.0 from the [official website](https://www.autohotkey.com/).
2. Download the `borderless-focus.ahk` script from this repository.
3. Double-click the script to run it.

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

## Setting Up Custom 21:9 Resolution on 32:9 Monitors

To enable a custom 21:9 resolution (3440x1440) on your 32:9 monitor:

1. Press Windows key + R, type `regedit`, and press Enter
2. Use "Edit - Find..." and search for "NV_Modes" key
4. Add the following to the end of the existing value: `; 3440x1440x8,16,32,64=1F`
5. Save and exit the Registry Editor
6. Restart your computer

Note: You have to redo this upgrading your NVIDIA driver (no need to restart however)

To override scaling settings you also need to go to "NVIDIA Control Panel - Adjust desktop size and position" and set the following settings:
1. Select a scaling mode: "Aspect ratio"
2. Perform scaling on: "GPU"
3. Override the scaling mode set by games and programs: "Checked"

![image](https://github.com/user-attachments/assets/1515b006-b124-4bb8-ac14-b95c5898c66e)

Now you can set your game to 3440x1440 windowed mode and enjoy 240Hz refresh rate.

## Important: Enable G-SYNC for Windowed and Full Screen Mode

For the best experience with borderless windowed games, especially on ultrawide monitors, it's crucial to enable G-SYNC for both windowed and full screen modes:

1. Open NVIDIA Control Panel
2. Navigate to "Set up G-SYNC" in the left menu
3. Check the box for "Enable G-SYNC, G-SYNC Compatible"
4. Select "Enable for windowed and full screen mode"
5. Apply the changes

This setting ensures that G-SYNC works properly with borderless windowed games, providing smooth, tear-free gameplay across your entire display.


## Notes

- Ensure your game is the active window when toggling Borderless Focus.
- If you encounter any issues with audio control, check that the script has the necessary permissions to interact with your audio devices.
- For 32:9 monitor users: Use the custom 3440x1440 resolution for the best 21:9 experience.
- When toggling off Borderless Focus, your game will be minimized and muted, allowing you to easily switch to other applications.

## Troubleshooting

If you encounter any issues:
1. Ensure you're running the latest version of AutoHotkey v2.0.
2. Check that your game is in true borderless windowed mode, not fullscreen or regular windowed mode.
3. Run the script as administrator if you're having trouble with taskbar or audio controls.
4. Verify that G-SYNC is enabled for both windowed and full screen mode in NVIDIA Control Panel.
5. For ultrawide monitors: Make sure you've set up the custom 21:9 resolution as described above.
6. If the custom resolution doesn't appear, try updating your GPU drivers or using a custom resolution utility.

## Uses the following binaries/modules
* [AppVol.ahk](https://gist.github.com/anonymous1184/b251cd8407a379d4965791585887cfce) by **anonymous1184**

<a href="https://www.buymeacoffee.com/adore" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-blue.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
