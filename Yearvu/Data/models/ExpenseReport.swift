//
//  ExpenseReport.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

struct ExpenseReport: Model {
    var group: ExpenseGroup
    var recurrence: Recurrence
    var reportingStartedAt: Date = Date()
}
