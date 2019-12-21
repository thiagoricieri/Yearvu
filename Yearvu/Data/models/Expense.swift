//
//  Expense.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

struct Expense: Model, HasName, Monetary, IsRecurrent {
    var name: String
    var value: Double
    var currency: Currency
    var startDate: Date
    var recurrence: Recurrence
    var memo: String
}
