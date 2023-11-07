//
//  codeTestApp.swift
//  codeTest
//
//  Created by marilise morona on 06/11/23.
//

import SwiftUI

@main
struct codeTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: CodeViewModel(initialState: CodeViewState()))
        }
    }
}
