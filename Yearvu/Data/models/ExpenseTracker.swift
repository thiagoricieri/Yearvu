//
//  ExpenseTracker.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

struct ExpenseTracker: Model {
    var name: String
    var expenses: [Expense] = []
    var startTrackingDate: Date = Date()
    var recurrence: Recurrence
}
