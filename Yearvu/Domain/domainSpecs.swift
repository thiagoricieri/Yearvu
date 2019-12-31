//
//  domainSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

typealias Percentage = Float
typealias Period = (start: Date, end: Date)

protocol Model {}

protocol HasName {
    var name: String { get set }
}

protocol Currency: HasName {
    var symbol: String { get set }
}

protocol Monetary {
    var value: Double { get set }
    var currency: Currency { get set }
}

extension Monetary where Self: CustomStringConvertible {
    var description: String {
        "\(self.currency.symbol) \(self.value)"
    }
}

protocol StaticCurrency {
    static var currency: Currency { get }
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

protocol SimulationCalculator: Calculator {
    func simulate(spending: MonetaryRecurrent, until: Date) -> SavingsResult
    func simulate(replacing expense: MonetaryRecurrent, by newExpense: MonetaryRecurrent, until: Date) -> SavingsResult
}

protocol ExchangeResult: Model {
    var index: ExchangeIndex { get }
    var taxes: [TaxCalculated] { get }
    var taxesTotal: Monetary { get }
    var exchanging: Monetary { get }
    var exchanged: Monetary { get }
    var netExchanged: Monetary { get }
}

protocol ExchangeCalculator: Calculator {
    func exchange(from value: Monetary, to currency: Currency, ratio: Float, taxes: [Tax]) -> ExchangeResult
}

protocol ExchangeIndex: Model {
    var from: Currency { get }
    var to: Currency { get }
    var ratio: Float { get }
    var inverseRatio: Float { get }
}
