# Xcode-MenuBarApp-SwiftUI-macOS-ProjectTemplate

A simple Xcode file template with examples for settings UI and async services.

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

