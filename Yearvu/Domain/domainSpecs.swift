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

protocol Tax {
    var name: String { get }
    var value: Double { get }
    var rule: TaxRule { get }
}

protocol TaxCalculated: Monetary {
    var tax: Tax { get }
}

enum TaxRule {
    case percentage
    case increment
}

protocol Calculator {}

protocol SavingsResult: Model {
    var formerSpending: Monetary { get }
    var newSpending: Monetary { get }
    var valueSaved: Monetary { get }
    var percentageSaved: Percentage { get }
    var error: MonetaryError? { get }
}

protocol SavingsCalculator: Calculator {
    func forecast(saving: MonetaryRecurrent, until: Date) -> SavingsResult
    func forecast(replacing expense: MonetaryRecurrent, by newExpense: MonetaryRecurrent, until: Date) -> SavingsResult
}

protocol ExchangeResult: Model {
    var exchanging: Monetary { get }
    var exchanged: Monetary { get }
    var ratio: Double { get }
    var taxes: [TaxCalculated] { get }
    var taxesTotal: Monetary { get }
}

protocol ExchangeCalculator: Calculator {
    func exchange(_ value: Monetary, taxes: [Tax]) -> ExchangeResult
}
