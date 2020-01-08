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
    var id: UUID = UUID()
    var name: String
    var value: Double = 0.0
    var currency: Currency
    var entries: [ExpenseEntry] = []
    var recurrence: Recurrence = .notRecurrent
    var reportingStartedAt: Date = Date()
}
