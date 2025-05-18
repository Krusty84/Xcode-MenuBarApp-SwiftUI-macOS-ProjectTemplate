//
//  AppState.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import AppKit
import Foundation
import Combine
import SwiftUI

class AppState: ObservableObject {
    static let shared = AppState() // Singleton for reusability
    @Published private(set) var latestConditionForAppIconColorMask: NSColor = .systemGray // Track the latest condition color

    // Helper function to update the latestConditionColor based on the latest changed variable
    private func updateLatestConditionColor() {
        let newColor: NSColor
//        if .... {
//            newColor = .systemGreen
//        } else {
//            newColor = .clear
//        }
        newColor = .clear
        latestConditionForAppIconColorMask = newColor
    }
}
