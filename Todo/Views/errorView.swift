//
//  ErrorView.swift
//  Todo
//
//  Created by Joshua Sharp on 10/25/23.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let error: Error

    init(error: Error)
    {
        self.error = error
    }
    var body: some View {
        Text("Error: \(error.localizedDescription)")
    }

}
