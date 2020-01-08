//
//  ExpenseEntry.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date
import struct Foundation.UUID

struct ExpenseEntry: Model, IsDated, Monetary, Codable, Identifiable {
    var id: UUID = UUID()
    var value: Double
    var currency: Currency
    var createdAt: Date = Date()
}

extension ExpenseEntry {
    static let empty = ExpenseEntry(value: 0.0, currency: .none)
}
