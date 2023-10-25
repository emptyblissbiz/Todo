//
//  Item.swift
//  Todo
//
//  Created by Joshua Sharp on 10/15/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    let id: UUID = UUID()
    var created: Date
    var updated: Date
    var userOwner: User
    var groupOwner: Group

    init(timestamp: Date = Date(), user: User, group: Group) {
        let date = timestamp
        self.created = date
        self.updated = date
        self.userOwner = user
        self.groupOwner = group
    }
}
