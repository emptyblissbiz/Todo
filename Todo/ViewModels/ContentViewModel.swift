//
//  ContentViewModel.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Combine
import SwiftData
import SwiftUI


    @MainActor
    class ContentViewModel: ObservableObject
    {
        private(set) var itemController: ItemController
        @Published private(set) var currentUser: User?
        @Published private(set) var currentGroup: Group?
        @Published private(set) var items: [Item]

        init(itemController: ItemController, userController: UserController)
        {
            self.itemController = itemController
            self.items = itemController.items
            self.currentUser = userController.currentUser
            self.currentGroup = userController.currentGroup
        }

        public func sddItem()
        {
            
        }

        func deleteItems(offsets: IndexSet)
        {
            itemController.deleteItems(offsets: offsets)
        }
    }
