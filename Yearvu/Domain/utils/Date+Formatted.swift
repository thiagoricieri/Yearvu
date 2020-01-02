//
//  Date+Formatted.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 01/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date
import class Foundation.DateFormatter

private let dateFormatter = DateFormatter()

extension Date {
    var usFormat: String {
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter.string(from: self)
    }
}
