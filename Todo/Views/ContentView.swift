//
//  ContentView.swift
//  Todo
//
//  Created by Joshua Sharp on 10/15/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel: ContentViewModel
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationSplitView {
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
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar
            {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    EditButton()
                }
#endif
                ToolbarItem
                {
                    Button(action: viewModel.addItem)
                    {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail:
        {
            Text("Select an item")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
