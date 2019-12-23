//
//  domainSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

typealias Percentage = Float

protocol Monetary {
    var value: Double { get set }
    var currency: Currency { get set }
}

protocol MonetaryDated: Monetary {
    var createdAt: Date { get set }
}

protocol MonetaryRecurrent: Monetary {
    var recurrence: Recurrence { get set }
    var reportingStartedAt: Date { get set }
}

protocol SavingsResult: Model {
    var formerSpending: Monetary { get }
    var newSpending: Monetary { get }
    var valueSaved: Monetary { get }
    var percentageSaved: Percentage { get }
    var error: MonetaryError? { get }
}

protocol Calculator {}

protocol SavingsCalculator: Calculator {
    func forecast(saving: MonetaryRecurrent, until: Date) -> SavingsResult
}
