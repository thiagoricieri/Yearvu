//
//  domainSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

// MARK: - Convenience Types

typealias Percentage = Float

// MARK: - Models

protocol Model {
    var id: String { get set }
}

protocol HasName {
    var name: String { get set }
}

protocol Monetary {
    var value: Double { get set }
    var currency: Currency { get set }
}

extension Monetary where Self: CustomStringConvertible {
    var description: String {
        "\(self.currency) \(self.value)"
    }
}

protocol StaticCurrency {
    static var currency: Currency { get }
}

protocol IsDated {
    var createdAt: Date { get set }
}

protocol IsRecurrent {
    var recurrence: Recurrence { get set }
    var reportingStartedAt: Date { get set }
}

typealias MonetaryRecurrent = Monetary & IsRecurrent

protocol Tax: HasName {
    var charge: Double { get }
    var rule: TaxRule { get }
}

protocol TaxCalculated: Monetary {
    var tax: Tax { get }
}

protocol SavingsResult {
    var formerSpending: Monetary { get }
    var newSpending: Monetary { get }
    var valueSaved: Monetary { get }
    var percentageSaved: Percentage { get }
    var error: MonetaryError? { get }
}

protocol ExchangeIndex {
    var from: Currency { get }
    var to: Currency { get }
    var ratio: Float { get }
    var inverseRatio: Float { get }
}

protocol ExchangeResult {
    var index: ExchangeIndex { get }
    var taxes: [TaxCalculated] { get }
    var taxesTotal: Monetary { get }
    var exchanging: Monetary { get }
    var exchanged: Monetary { get }
    var netExchanged: Monetary { get }
}

// MARK: - Calculators

protocol Calculator {}

protocol SimulationCalculator: Calculator {
    func simulate(spending: MonetaryRecurrent, until: Date) -> SavingsResult
    func simulate(replacing expense: MonetaryRecurrent, by newExpense: MonetaryRecurrent, until: Date) -> SavingsResult
}

protocol ExchangeCalculator: Calculator {
    func exchange(from value: Monetary, to currency: Currency, ratio: Float, taxes: [Tax]) -> ExchangeResult
}
