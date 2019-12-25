//
//  ExpenseChangeTests.swift
//  YearvuTests
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import Fakery
import SwiftDate
import XCTest
@testable import Yearvu

class EexpenseChangeTests: XCTestCase {
    let dateFormat = "yyyy-MM-dd"
    let calculator = ForecastCalculator()
    
    func testChangeDailyToWeeklyAfterFiveWeeks() {
        let startDate = "2019-01-01".toDate(dateFormat)!.date
        let endDate = "2019-02-05".toDate(dateFormat)!.date
        
        var expense = Expense.mock()
        expense.value = 1
        expense.reportingStartedAt = startDate
        expense.recurrence = .daily
        
        var newExpense = Expense.mock()
        newExpense.value = 5.0
        newExpense.reportingStartedAt = startDate
        newExpense.recurrence = .weekly

        let savingsResult = calculator.forecast(replacing: expense, by: newExpense, until: endDate)
        
        XCTAssertEqual(savingsResult.formerSpending.value, 35.0)
        XCTAssertEqual(savingsResult.newSpending.value, 25.0)
        XCTAssertEqual(savingsResult.valueSaved.value, 10.0)
        XCTAssertEqual(savingsResult.percentageSaved, 0.2857, accuracy: 0.0001)
    }
    
    func testChangeDailyToMonthlyAfterThreeMonths() {
        let startDate = "2019-01-01".toDate(dateFormat)!.date
        let endDate = "2019-03-01".toDate(dateFormat)!.date
        
        var expense = Expense.mock()
        expense.value = 1
        expense.reportingStartedAt = startDate
        expense.recurrence = .daily
        
        var newExpense = Expense.mock()
        newExpense.value = 25.0
        newExpense.reportingStartedAt = startDate
        newExpense.recurrence = .monthly

        let savingsResult = calculator.forecast(replacing: expense, by: newExpense, until: endDate)
        
        XCTAssertEqual(savingsResult.formerSpending.value, 59.0)
        XCTAssertEqual(savingsResult.newSpending.value, 50.0)
        XCTAssertEqual(savingsResult.valueSaved.value, 9.0)
        XCTAssertEqual(savingsResult.percentageSaved, 0.1525, accuracy: 0.0001)
    }
    
    func testChangeDailyToYearlyAfterThreeYears() {
        let startDate = "2019-01-01".toDate(dateFormat)!.date
        let endDate = "2022-03-01".toDate(dateFormat)!.date
        
        var expense = Expense.mock()
        expense.value = 1.0
        expense.reportingStartedAt = startDate
        expense.recurrence = .daily
        
        var newExpense = Expense.mock()
        newExpense.value = 120.0
        newExpense.reportingStartedAt = startDate
        newExpense.recurrence = .yearly

        let savingsResult = calculator.forecast(replacing: expense, by: newExpense, until: endDate)
        
        XCTAssertEqual(savingsResult.formerSpending.value, 1155.0)
        XCTAssertEqual(savingsResult.newSpending.value, 360.0)
        XCTAssertEqual(savingsResult.valueSaved.value, 795.0)
        XCTAssertEqual(savingsResult.percentageSaved, 0.6883, accuracy: 0.001)
    }
}
