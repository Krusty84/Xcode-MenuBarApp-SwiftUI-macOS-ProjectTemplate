//
//  SettingsTabViewModel.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import Combine

class SettingsTabViewModel: ObservableObject {
    @Published var appLoggingEnabled: Bool {
        didSet {
            SettingsManager.shared.appLoggingEnabled = appLoggingEnabled
        }
    }

    @Published var username: String {
        didSet {
            SettingsManager.shared.username = username
        }
    }

    init() {
        let settingsMgr = SettingsManager.shared
        self.appLoggingEnabled = settingsMgr.appLoggingEnabled
        self.username          = settingsMgr.username
    }
}
