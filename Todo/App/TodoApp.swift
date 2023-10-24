//
//  TodoApp.swift
//  Todo
//
//  Created by Joshua Sharp on 10/15/23.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    private var viewmodel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewmodel.contentViewModel)
        }
    }
}
