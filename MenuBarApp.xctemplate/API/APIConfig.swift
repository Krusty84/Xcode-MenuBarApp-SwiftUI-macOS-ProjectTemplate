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

// MARK: - Dummy service for authentication example

/*
 
 import Foundation

 /// The response you get back after a successful login
 struct AuthResponse {
     let statusCode: Int
     let token: String
 }

 /// Possible errors during auth
 enum AuthError: Error {
     case invalidURL
     case invalidResponse
     case httpError(Int)
     case decodingError
 }

 /// A basic service to authenticate with an API
 class AuthService {
     /// Call your auth endpoint with an API key (or username/password)
     func authenticate(apiKey: String) async throws -> AuthResponse {
         // 1. Build URL — replace with your real endpoint
         guard let url = URL(string: "https://api.example.com/auth") else {
             throw AuthError.invalidURL
         }

         // 2. Prepare the request
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")

         // 3. Encode your payload — change body shape as needed
         let payload = ["apiKey": apiKey]
         request.httpBody = try JSONEncoder().encode(payload)

         // 4. Send request
         let (data, response) = try await URLSession.shared.data(for: request)

         // 5. Validate HTTP response
         guard let httpResp = response as? HTTPURLResponse else {
             throw AuthError.invalidResponse
         }
         guard (200...299).contains(httpResp.statusCode) else {
             throw AuthError.httpError(httpResp.statusCode)
         }

         // 6. Decode JSON — adjust to match your API’s response
         struct ResponseDTO: Decodable {
             let token: String
         }
         do {
             let dto = try JSONDecoder().decode(ResponseDTO.self, from: data)
             return AuthResponse(statusCode: httpResp.statusCode, token: dto.token)
         } catch {
             throw AuthError.decodingError
         }
     }
 }
 */

// MARK: - Dummy service for fetching a list of folders/items

/*
 import Foundation

 /// A simple folder/item model
 struct Folder {
     let id: String
     let name: String
 }

 /// Possible errors when fetching folders
 enum FolderError: Error {
     case invalidURL
     case invalidResponse
     case httpError(Int)
     case decodingError
 }

 /// A basic service to fetch folders (or items) from an API
 class FolderService {
     /// Fetch folders by passing in an auth token and a folder ID
     func fetchFolders(authToken: String, folderId: String) async throws -> [Folder] {
         // 1. Build URL with a query parameter — change endpoint as needed
         guard var components = URLComponents(string: "https://api.example.com/folders") else {
             throw FolderError.invalidURL
         }
         components.queryItems = [URLQueryItem(name: "folderId", value: folderId)]
         guard let url = components.url else {
             throw FolderError.invalidURL
         }

         // 2. Prepare the request
         var request = URLRequest(url: url)
         request.httpMethod = "GET"
         request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")

         // 3. Send request
         let (data, response) = try await URLSession.shared.data(for: request)

         // 4. Validate HTTP response
         guard let httpResp = response as? HTTPURLResponse else {
             throw FolderError.invalidResponse
         }
         guard (200...299).contains(httpResp.statusCode) else {
             throw FolderError.httpError(httpResp.statusCode)
         }

         // 5. Decode JSON — adapt DTO to your API’s structure
         struct FolderDTO: Decodable {
             let id: String
             let name: String
         }
         do {
             let dtos = try JSONDecoder().decode([FolderDTO].self, from: data)
             return dtos.map { Folder(id: $0.id, name: $0.name) }
         } catch {
             throw FolderError.decodingError
         }
     }
 }
 */

// MARK: - Calling services

/*
 func exampleUsage() {
     Task {
         do {
             // 1. Authenticate and get a token
             let auth = try await AuthService().authenticate(apiKey: "MY_API_KEY")
             print("Got token:", auth.token)
             
             // 2. Fetch folders using that token
             let folders = try await FolderService().fetchFolders(
                 authToken: auth.token,
                 folderId: "root"
             )
             print("Folders:", folders.map { $0.name })
             
         } catch {
             // 3. Handle any errors
             print("Error during API calls:", error)
         }
     }
 }

 */

/*
 import SwiftUI

 // ViewModel that drives your view
 class ContentViewModel: ObservableObject {
     @Published var folders: [Folder] = []
     @Published var errorMessage: String?

     func loadData() async {
         do {
             let auth = try await AuthService().authenticate(apiKey: "MY_API_KEY")
             self.folders = try await FolderService()
                 .fetchFolders(authToken: auth.token, folderId: "root")
         } catch {
             errorMessage = error.localizedDescription
         }
     }
 }

 // Simple SwiftUI view that shows folder names
 struct ContentView: View {
     @StateObject private var vm = ContentViewModel()

     var body: some View {
         NavigationView {
             List(vm.folders, id: \.id) { folder in
                 Text(folder.name)
             }
             .navigationTitle("My Folders")
             .onAppear {
                 Task {
                     await vm.loadData()
                 }
             }
             .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
                 Button("OK") { vm.errorMessage = nil }
             } message: {
                 Text(vm.errorMessage ?? "")
             }
         }
     }
 }

 */
