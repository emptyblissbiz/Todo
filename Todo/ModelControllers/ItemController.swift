    //
    //  ItemController.swift
    //  Todo
    //
    //  Created by Joshua Sharp on 10/16/23.
    //
import Foundation
import Combine
import SwiftData
import SwiftUI

@MainActor
class ItemController: ObservableObject
{
    var modelContainer: ModelContainer
    var modelContext: ModelContext
    @ObservedObject var userController: UserController
    private var currentUser: User?
    private var currentGroup: Group?

    @Published  var items: [Item] = [Item]()

    init(inMemory: Bool = false, userController: UserController) throws {
        self.userController = userController
        self.currentUser = userController.currentUser
        self.currentGroup = userController.currentGroup
        do
        {
            let schema = Schema([
                Item.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)
            modelContainer =  try ModelContainer(for: schema, configurations: [modelConfiguration])
            modelContext = modelContainer.mainContext
            try  fetchData()
        }
        catch
        {
            throw error
        }
    }

    func fetchData()  throws
    {
        do {
            let descriptor = FetchDescriptor<Item>()
            items = try  modelContainer.mainContext.fetch(descriptor)
        } catch {
            print("Fetch failed: \(error)")
            throw error
        }
    }


    func deleteItems(offsets: IndexSet) {
        for index in offsets
        {
            modelContext.delete(items[index])
        }
    }

    func add(timestamp: Date = Date(), user: User? = nil, group: Group? = nil) -> UUID?
    {
        guard let user = user ?? currentUser,
              let group = group ?? currentGroup else { return nil }
        let newItem = Item(timestamp: timestamp, user: user, group: group)
        modelContext.insert(newItem)
        return newItem.id
    }

    func delete(item: Item)
    {
        modelContext.delete(item)
    }
}
