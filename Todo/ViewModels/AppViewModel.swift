//
//  AppViewModel.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Combine
import SwiftData

//    @MainActor
    final class AppViewModel: ObservableObject
    {
        @Published var itemController: ItemController
        @Published var userController: UserController
        var contentViewModel: ContentViewModel

        init() async throws
        {
            do
            {
                userController = try await UserController()
                itemController = try await ItemController(userController: userController)
                contentViewModel = await ContentViewModel(itemController: itemController, userController: userController)
            }
            catch
            {
                throw error
            }
        }
    }
