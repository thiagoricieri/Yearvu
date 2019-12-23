//
//  mockCreator.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import Fakery

private let faker = Faker()

extension ExpenseEntry {
    static func mock() -> ExpenseEntry {
        return ExpenseEntry(
            value: faker.number.randomDouble(min: 0, max: 1_000),
            currency: FiduciaryCurrency.usDollars,
            createdAt: faker.date.forward(2)
        )
    }
    static func mock(_ count: UInt) -> [ExpenseEntry] {
        return Array(0...count).map { _ in ExpenseEntry.mock() }
    }
}

extension Expense {
    static func mock() -> Expense {
        return Expense(
            name: faker.name.name(),
            value: faker.number.randomDouble(min: 0, max: 1_000),
            currency: FiduciaryCurrency.usDollars,
            entries: ExpenseEntry.mock(3)
        )
    }
    
    static func mock(numberOfExpenses count: UInt, recurrence: Recurrence) -> Expense {
        return Expense(
            name: faker.name.name(),
            entries: ExpenseEntry.mock(count),
            recurrence: recurrence
        )
    }
    
    static func mock(expenses: [ExpenseEntry] = [], recurrence: Recurrence) -> Expense {
        return Expense(
            name: faker.name.name(),
            entries: expenses,
            recurrence: recurrence
        )
    }
}
