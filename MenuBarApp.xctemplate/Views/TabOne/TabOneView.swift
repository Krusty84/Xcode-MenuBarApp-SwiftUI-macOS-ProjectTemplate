//
//  ExampleView.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import SwiftUI

struct TabOneContent: View {
    @StateObject private var viewModel = TabOneViewModel()

    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.title)
                .font(.title)
            Button("Change Title") {
                viewModel.changeTitle()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#if DEBUG
struct TabOneContent_Previews: PreviewProvider {
    static var previews: some View {
        TabOneContent()
    }
}
#endif
