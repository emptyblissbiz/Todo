//
//  ItemController.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//
import Foundation
import Combine
import SwiftData

@MainActor
 class ItemController: ObservableObject
{
    var modelContainer: ModelContainer
     var modelContext: ModelContext
     var userController: UserController

    @Published  var items: [Item] = [Item]()

     init(inMemory: Bool = false, userController: UserController)  throws {
        do
        {
            let schema = Schema([
                Item.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)
            modelContainer =  try ModelContainer(for: schema, configurations: [modelConfiguration])
            modelContext = modelContainer.mainContext
            self.userController = userController
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

     func add(timestamp: Date, user: User = UserController.currentUser, group: Group)
    {
        let newItem = Item(timestamp: timestamp, user: user, group: group)
        modelContext.insert(newItem)
    }

    func delete(item: Item)
    {
        modelContext.delete(item)
    }
}
