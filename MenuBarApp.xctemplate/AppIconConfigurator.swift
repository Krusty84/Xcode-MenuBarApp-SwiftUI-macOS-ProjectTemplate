//
//  AppIconConfigurator.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import SwiftUI
import AppKit

// MARK: - Icon Tinting
func tintedIcon(named iconName: String, color: NSColor) -> NSImage {
    guard let icon = NSImage(named: iconName) else { return NSImage() } // Use your icon name here
    
    // Resize the icon to 18x18 points
    let newSize = NSSize(width: 18, height: 18)
    let resizedIcon = NSImage(size: newSize)
    
    resizedIcon.lockFocus()
    icon.draw(in: NSRect(origin: .zero, size: newSize))
    resizedIcon.unlockFocus()
    
    // Apply the tint color
    let tintedIcon = resizedIcon.copy() as! NSImage
    tintedIcon.lockFocus()
    
    color.set()
    let imageRect = NSRect(origin: .zero, size: newSize)
    imageRect.fill(using: .sourceAtop)
    
    tintedIcon.unlockFocus()
    return tintedIcon
}

// MARK: - MenuBar (near clock:)) Implementation
struct MenuBarIcon: View {
    @ObservedObject var appState: AppState

    var body: some View {
        let iconColor = appState.latestConditionForAppIconColorMask
        return Image(nsImage: tintedIcon(named: "AppIcon", color: iconColor))
    }
}
