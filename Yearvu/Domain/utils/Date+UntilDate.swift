//
//  Date+UntilDate.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Calendar
import struct Foundation.Date

extension Date {
    func days(until date: Date) -> Int? {
        let calendar = Calendar.current
        let selfDate = calendar.startOfDay(for: self)
        let untilDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.day], from: selfDate, to: untilDate)
        return components.day
    }

    func weeks(until date: Date) -> Int? {
        let calendar = Calendar.current
        let selfDate = calendar.startOfDay(for: self)
        let untilDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.weekOfYear], from: selfDate, to: untilDate)
        return components.weekOfYear
    }

    func months(until date: Date) -> Int? {
        let calendar = Calendar.current
        let selfDate = calendar.startOfDay(for: self)
        let untilDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.month], from: selfDate, to: untilDate)
        return components.month
    }

    func years(until date: Date) -> Int? {
        let calendar = Calendar.current
        let selfDate = calendar.startOfDay(for: self)
        let untilDate = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.year], from: selfDate, to: untilDate)
        return components.year
    }
}
