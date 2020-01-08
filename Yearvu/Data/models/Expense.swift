//
//  Expense.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date
import struct Foundation.UUID

struct Expense: Model, HasName, MonetaryRecurrent, Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var value: Double = 0.0
    var currency: Currency
    var entries: [ExpenseEntry] = []
    var recurrence: Recurrence = .notRecurrent
    var reportingStartedAt: Date = Date()
}

extension Expense: Hashable {
    static func == (lhs: Expense, rhs: Expense) -> Bool {
        return lhs.id == rhs.id
    }
}
