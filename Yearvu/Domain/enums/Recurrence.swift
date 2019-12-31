//
//  recurrenceSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

enum Recurrence: String, Hashable, Codable {
    case notRecurrent
    case hourly
    case daily
    case everyOtherDay
    case everyThreeDays
    case everyFourDays
    case weekdays
    case weekends
    case weekly
    case monthly
    case everyOtherMonth
    case quarterly
    case semiannually
    case yearly
    
    var daysMultiplier: Double {
        switch self {
        case .notRecurrent: return 0.0
        case .hourly: return 1.0 / 24
        case .daily: return 1.0
        case .everyOtherDay: return 3.5
        case .everyThreeDays: return 3
        case .everyFourDays: return 4
        case .weekdays: return 5.0
        case .weekends: return 2.0
        case .weekly: return 7.0
        case .monthly: return 365.0 / 12
        case .everyOtherMonth: return 365.0 / 6
        case .quarterly: return 365.0 / 4
        case .semiannually: return 365.0 / 2
        case .yearly: return 365.0
        }
    }
}
