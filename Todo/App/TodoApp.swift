//
//  TodoApp.swift
//  Todo
//
//  Created by Joshua Sharp on 10/15/23.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App 
{
    private var error: Error? = nil
    private var viewModel: AppViewModel? = nil
    init()
    {
        do
        {
            var avm = try AppViewModel.init()
            self.viewModel = avm
        }
        catch
        {
            self.error = error
        }
    }

    var body: some Scene 
    {
        WindowGroup
        {
            if var avm = viewModel
            {
                ContentView(viewModel: avm.contentViewModel)
            } else if let error = error{
                ErrorView(error: error)
            }
        }
    }
}
