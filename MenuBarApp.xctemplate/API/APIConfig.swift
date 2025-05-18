//
//  APIConfig.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

struct APIConfig {
    static let yaFoldersEndpoint = "https://resource-manager.api.cloud.yandex.net/resource-manager/v1/folders"
    //
    static let yaFoldersWebUrl = "https://console.yandex.cloud/folders/"
    static func yaVMsWebUrl(folderID: String, instanceID: String) -> String {
          return "\(yaFoldersWebUrl)\(folderID)/compute/instance/\(instanceID)/overview"
    }
}

