//
//  Group.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Foundation
import SwiftData

@Model
final class Group
{
    var name: String
    var users: [User]?


    init(name: String, users: [User]? = nil) {
        self.name = name
        self.users = users
    }
}
