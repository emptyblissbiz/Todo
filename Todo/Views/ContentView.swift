    //
    //  ContentView.swift
    //  Todo
    //
    //  Created by Joshua Sharp on 10/15/23.
    //

import SwiftUI
import SwiftData

struct ContentView: View 
{
    @ObservedObject private var viewModel: ContentViewModel
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View
    {
        NavigationSplitView
        {
            List
            {
                ForEach(viewModel.items) { item in
                    NavigationLink {
                        Text("Item at \(item.created, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.created, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform:  viewModel.deleteItems)
            }
            
        } detail:
        {
            Text("Select an item")
        }
#if os(macOS)
        .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
    }

}

    //#Preview {
    //    ContentView()
    //        .modelContainer(for: Item.self, inMemory: true)
    //}
