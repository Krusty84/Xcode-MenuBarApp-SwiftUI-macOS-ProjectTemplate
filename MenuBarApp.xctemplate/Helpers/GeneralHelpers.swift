//
//  GeneralHelpers.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import SwiftUI
import AppKit
import Foundation
import Network
import Combine

class Helpers:ObservableObject {
    static let shared = Helpers() // Singleton for reusability
    let appState = AppState.shared
    
    init (){
    }
    
    deinit {
    }
    
    /**

     ## Don't forget to add the `LoggerHelper` dependency if you need it:

     1. Click File → Add Packages…
     2. In the search box in the upper right, enter:
        https://github.com/Krusty84/LoggerHelper
     3. Click Add Package
     4. Click Add Package, again

     */
    
    static func convertGMTToLocalTime(utcDateString: String) -> String {
        // Define possible date formats
        let dateFormats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ", // With milliseconds
            "yyyy-MM-dd'T'HH:mm:ssZ",     // Without milliseconds
            "yyyy-MM-dd'T'HH:mmZ",        // Without seconds
            "yyyy-MM-dd HH:mm:ss Z",      // Alternative format
            "yyyy-MM-dd HH:mm Z"          // Another alternative format
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") // Set input time zone to UTC
        
        // Try each format until one succeeds
        for format in dateFormats {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: utcDateString) {
                // Convert the Date to local time
                dateFormatter.timeZone = TimeZone.current // Switch to local time zone
                dateFormatter.dateFormat = "dd.MM.yy (HH:mm)" // Your desired output format
                let localTimeString = dateFormatter.string(from: date)
                return localTimeString
            }
        }
        
        // If none of the formats worked
        //LoggerHelper.error("Failed to parse the date string")
        return ""
    }
        
    static func checkInternetConnection(completion: @escaping () -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                // Internet connection is available
                //LoggerHelper.info("Internet access is available")
                DispatchQueue.main.async {
                    completion() // Call the completion handler
                }
                monitor.cancel() // Stop monitoring once the connection is available
            } else{
                //LoggerHelper.error("The Internet access does not work")
            }
        }

        // Start monitoring
        monitor.start(queue: queue)
    }
}
