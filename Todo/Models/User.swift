//
//  User.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Foundation
import SwiftData

@Model
final class User
{
    var name: String
    var group: Group?
    {
        groups.first
    }
    var groups: [Group]

    init(name: String, groups: [Group]) {
        self.name = name
        self.groups = groups
    }
}
