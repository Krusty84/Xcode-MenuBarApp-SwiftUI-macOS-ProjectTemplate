//
//  SettingsTabContent.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import SwiftUI
/**

 ## Don't forget to add the `LaunchAtLogin` dependency:

 1. Click File → Add Packages…
 2. In the search box in the upper right, enter:
    https://github.com/sindresorhus/LaunchAtLogin-Modern
 3. Click Add Package
 4. Click Add Package, again

 */
import LaunchAtLogin

struct SettingsTabContent: View {
    @StateObject private var vm = SettingsTabViewModel()

    var body: some View {
        VStack(spacing: 20) {
            // Launch-at-login toggle
            LaunchAtLogin.Toggle()
                .toggleStyle(.switch)
                .help("Launch this app automatically when you log in")

            // App-logging toggle
            Toggle("Enable Logging", isOn: $vm.appLoggingEnabled)
                .toggleStyle(.switch)
                .help("Turn application logging on or off")

            // Username text field
            TextField("Username", text: $vm.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .help("Enter and save your username")
        }
        .padding()
    }
}

#if DEBUG
struct SettingsTabContent_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabContent()
    }
}
#endif

