//
//  PeriodicCalculator.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

struct SavingsCalculator: SimulationCalculator {
    func simulate(spending expense: MonetaryRecurrent, until: Date) -> SavingsResult {
        var savings = Savings(
            formerSpending: USD(expense),
            newSpending: USD(expense),
            valueSaved: USD(0.0)
        )
        
        var differenceInUnits: Int?
        switch expense.recurrence {
        case .daily: differenceInUnits = expense.reportingStartedAt.days(until: until)
        case .weekly: differenceInUnits = expense.reportingStartedAt.weeks(until: until)
        case .monthly: differenceInUnits = expense.reportingStartedAt.months(until: until)
        case .yearly: differenceInUnits = expense.reportingStartedAt.years(until: until)
        default: break
        }
        
        switch differenceInUnits {
        case let diff where diff == nil: savings.error = MonetaryError.dateDifferenceFailed
        case let diff where diff! < 0: savings.error = MonetaryError.negativeDifference
        default:
            savings.formerSpending = USD(expense.value * Double(differenceInUnits!))
            savings.valueSaved = savings.formerSpending
        }
        
        return savings
    }
    
    func simulate(replacing expense: MonetaryRecurrent, by newExpense: MonetaryRecurrent, until: Date) -> SavingsResult {
        var savings = Savings(
            formerSpending: USD(expense),
            newSpending: USD(newExpense),
            valueSaved: USD(0.0)
        )
        
        var expenseUnits: Int?
        switch expense.recurrence {
        case .daily: expenseUnits = expense.reportingStartedAt.days(until: until)
        case .weekly: expenseUnits = expense.reportingStartedAt.weeks(until: until)
        case .monthly: expenseUnits = expense.reportingStartedAt.months(until: until)
        case .yearly: expenseUnits = expense.reportingStartedAt.years(until: until)
        default: break
        }
        
        var newExpenseUnits: Int?
        switch newExpense.recurrence {
        case .daily: newExpenseUnits = newExpense.reportingStartedAt.days(until: until)
        case .weekly: newExpenseUnits = newExpense.reportingStartedAt.weeks(until: until)
        case .monthly: newExpenseUnits = newExpense.reportingStartedAt.months(until: until)
        case .yearly: newExpenseUnits = newExpense.reportingStartedAt.years(until: until)
        default: break
        }
        
        var amountSpent: Double = 0.0
        switch expenseUnits {
        case let diff where diff == nil: savings.error = MonetaryError.dateDifferenceFailed
        case let diff where diff! < 0: savings.error = MonetaryError.negativeDifference
        default: amountSpent = expense.value * Double(expenseUnits!)
        }
        
        var newAmountSpent: Double = 0.0
        switch newExpenseUnits {
        case let diff where diff == nil: savings.error = MonetaryError.dateDifferenceFailed
        case let diff where diff! < 0: savings.error = MonetaryError.negativeDifference
        default: newAmountSpent = newExpense.value * Double(newExpenseUnits!)
        }
        
        if amountSpent > 0.0, newAmountSpent > 0.0 {
            savings.formerSpending = USD(amountSpent)
            savings.newSpending = USD(newAmountSpent)
            savings.valueSaved = USD(amountSpent - newAmountSpent)
        }
        
        return savings
    }
}
