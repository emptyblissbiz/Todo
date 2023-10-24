//
//  Context.swift
//  Todo
//
//  Created by Joshua Sharp on 10/16/23.
//

import Foundation
import SwiftData

@Model
final class Context {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
