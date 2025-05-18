//
//  ExampleViewModel.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

class ExampleViewModel: ObservableObject {
    @Published var title: String = "Hello, SwiftUI!"

    func changeTitle() {
        title = "Title changed!"
    }
}
