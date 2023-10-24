//
//  UserController.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//
import Combine
import SwiftData

@MainActor
class UserController: ObservableObject
{
    var modelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
            Group.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @Published var currentGroups: [Group]? = nil
    @Published var loggedin: Bool = false
    @Published var currentUser: User?
    {
        didSet
        {
            self.loggedin = true
            if let user = currentUser
            {
                currentGroups = user.groups
            }
        }
    }


    init()  throws
    {
        // temporary stub for dev
        let group = Group(name: "Dev")
        let user = User(name: "Dev", groups: [group])
        group.users = [user]
        currentUser = user
    }



    func login(name: String, password: String) async throws -> Bool
    {
        return false
        #warning("Flesh out with network login")
    }
}
