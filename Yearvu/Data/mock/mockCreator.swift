//
//  mockCreator.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import class Fakery.Faker
import struct Foundation.Date

private let faker = Faker()

extension ExpenseEntry {
    static func mock(
        valueMin: Double = 0,
        valueMax: Double = Double.infinity,
        daysForward days: Int = 0
    ) -> ExpenseEntry {
        return ExpenseEntry(
            value: faker.number.randomDouble(min: valueMin, max: valueMax).money,
            currency: USD.currency,
            createdAt: faker.date.forward(days)
        )
    }

    static func mock(
        _ count: UInt,
        valueMin: Double = 0,
        valueMax: Double = Double.infinity,
        daysForward days: Int = 0
    ) -> [ExpenseEntry] {
        return Array(0...count).map { num in
            ExpenseEntry.mock(
                valueMin: valueMin,
                valueMax: valueMax,
                daysForward: Int(num) + days
            )
        }
    }
}

extension Expense {
    static func mock() -> Expense {
        return Expense(
            name: faker.name.name(),
            value: faker.number.randomDouble(min: 0, max: 1_000).money,
            currency: USD.currency,
            entries: ExpenseEntry.mock(3)
        )
    }

    static func mock(
        numberOfExpenses count: UInt,
        recurrence: Recurrence,
        valueMin: Double = 0,
        valueMax: Double = Double.infinity
    ) -> Expense {
        return Expense(
            name: faker.name.name(),
            value: faker.number.randomDouble(min: valueMin, max: valueMax).money,
            currency: USD.currency,
            entries: ExpenseEntry.mock(count),
            recurrence: recurrence
        )
    }

    static func mock(
        expenses: [ExpenseEntry] = [],
        recurrence: Recurrence,
        valueMin: Double = 0,
        valueMax: Double = Double.infinity
    ) -> Expense {
        return Expense(
            name: faker.name.name(),
            value: faker.number.randomDouble(min: valueMin, max: valueMax).money,
            currency: USD.currency,
            entries: expenses,
            recurrence: recurrence
        )
    }

    static func mock(
        _ name: String,
        money: Monetary,
        recurrence: Recurrence,
        units: Int,
        range: Double = 0.0
    ) -> Expense {
        var expense = Expense.mock()
        expense.currency = money.currency
        expense.value = money.value
        expense.name = name
        expense.recurrence = recurrence
        expense.reportingStartedAt = Date()
        expense.entries = Array(0...units).map { num in
            ExpenseEntry(
                value: faker.number.randomDouble(min: money.value * (1 - range), max: money.value * (1 + range)).money,
                currency: money.currency,
                createdAt: faker.date.forward(Int(Double(num) * recurrence.daysMultiplier))
            )
        }

        return expense
    }
}

// MARK: - Concrete Mock Examples

extension Expense {
    static func mockAppInitialState() -> [Expense] {
        return [
            Expense.mock("Coffee", money: USD(5.0), recurrence: .daily, units: 10, range: 0.3),
            Expense.mock("Candy", money: GBP(2.0), recurrence: .every(days: 3), units: 30, range: 0.3),
            Expense.mock("Gym", money: EUR(39.99), recurrence: .monthly, units: 24, range: 0.2),
            Expense.mock("App Subscription", money: BRL(194.9), recurrence: .yearly, units: 3)
        ]
    }
}
