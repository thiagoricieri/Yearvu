//
//  ExpenseEntry.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

struct ExpenseEntry: Model, MonetaryDated, CustomStringConvertible {
    var value: Double = 0.0
    var currency: Currency
    var createdAt: Date = Date()
}
