# Xcode-MenuBarApp-SwiftUI-macOS-ProjectTemplate

A small template for a project to create macOS applications for placement in the MenuBar (a la System Tray for those coming from the Windows world).

Template includes: Project structure, and small snippets: checking internet access, converting time formats, a mechanism for saving settings, autorun, etc.

<img width="819" alt="image" src="https://github.com/user-attachments/assets/0f0444b1-dcd5-4228-bb90-885c32de16e4" />

Project OOTB content

<img width="264" alt="image" src="https://github.com/user-attachments/assets/ed1904bb-ff5a-4d78-9c44-3f80a3c40a2c" />

## Installation

1. Copy the template folder - **MenuBarApp.xctemplate** to:
   ```
   ~/Library/Developer/Xcode/Templates/YourCategoryDoYouWantAnyName/
   ```
2. Restart Xcode.
3. In Xcode, choose **File → New → File…**, then select **MenuBarApp** under **macOS** and under **YourCategoryDoYouWantAnyName** section

## Setting up the created project 

1. Add packages:
https://github.com/Krusty84/ElegantTabs
https://github.com/sindresorhus/LaunchAtLogin-Modern

**LoggerHelper** if you need it: https://github.com/Krusty84/LoggerHelper

2. Set **Yes** for "**Application is agent (UIElement) aka LSUIElement**" in *Project/Targets/Info/Custom macOS Application Target Properties*
3. Check **Sandbox Mode** (it should be enabled)

