//
//  SettingsManager.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import Foundation

class SettingsManager {
    static let shared = SettingsManager()
    private let defaults = UserDefaults.standard

    // Keys
    private let appLoggingEnabledKey = "___PRODUCT_BUNDLE_IDENTIFIER___.settings.appLoggingEnabled"
    private let usernameKey            = "___PRODUCT_BUNDLE_IDENTIFIER___.settings.username"

    // MARK: – App Logging
    var appLoggingEnabled: Bool {
        get { defaults.bool(forKey: appLoggingEnabledKey) }
        set { defaults.set(newValue, forKey: appLoggingEnabledKey) }
    }

    // MARK: – Username
    var username: String {
        get { defaults.string(forKey: usernameKey) ?? "" }
        set { defaults.set(newValue, forKey: usernameKey) }
    }
}
