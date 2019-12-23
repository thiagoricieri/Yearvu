//
//  recurrenceSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

typealias NextRecurrence = (Date) -> Date
typealias PreviousRecurrence = (Date) -> Date

enum Recurrence: Hashable {
    case notRecurrent
    case daily
    case weekly
    case monthly
    case yearly
}
