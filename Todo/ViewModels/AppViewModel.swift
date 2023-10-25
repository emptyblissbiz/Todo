//
//  AppViewModel.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Combine
import SwiftData

    @MainActor
    final class AppViewModel: ObservableObject
    {
        @Published var itemController: ItemController
        @Published var userController: UserController
        var contentViewModel: ContentViewModel

        init() throws
        {
            do
            {
                var uc = try UserController()
                self.userController = uc
                var ic = try ItemController(userController: uc)
                self.itemController = ic
                var cvm = ContentViewModel(itemController: ic, userController: uc)
                contentViewModel = cvm
            }
            catch
            {
                throw error
            }
        }
    }
