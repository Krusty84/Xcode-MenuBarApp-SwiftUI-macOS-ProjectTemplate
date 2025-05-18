//
//  EntryPointApp.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import SwiftUI
import AppKit

@main
struct EntryPointApp: App {
    @Environment(\.openWindow) var openWindow
    @StateObject private var appState = AppState.shared
    init() {
        Helpers.checkInternetConnection {
                print("Connected to WAN")
        }
    }
    
    var body: some Scene {
        MenuBarExtra {
            MenuBarContentView()
        } label: {
            MenuBarIcon(appState: appState)
        }
        .menuBarExtraStyle(.window)
    }
}

struct MenuBarContentView: View {
    @State private var optionKeyPressed = false

    var body: some View {
        Group {
            if optionKeyPressed {
                //optional for showing by hold option key and clicking on app icon
                //InfoWindow()
            } else {
                MainWindow()
            }
        }
        .onAppear {
            optionKeyPressed = NSEvent.modifierFlags.contains(.option)
        }
    }
}


 
 

