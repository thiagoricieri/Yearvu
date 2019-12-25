//
//  DailySavingsReportTests.swift
//  YearvuTests
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import Fakery
import SwiftDate
import XCTest
@testable import Yearvu

class DailySavingsReportTests: XCTestCase {
    var expense: Expense!
    var now: Date!
    
    override func setUp() {
        expense = Expense.mock()
        expense.value = 2.0
        now = Date()
    }
    
    func testSavingDaily() {
        expense.recurrence = .daily
        
        // Variables
        var future: Date
        var daysInBetween: Double
        var savingsResult: SavingsResult
        let calculator = SavingsCalculator()
        
        // Future date  
        future = now + 3.months
        daysInBetween = Double(now.days(until: future)!)
        savingsResult = calculator.simulate(spending: expense, until: future)
        
        XCTAssertEqual(savingsResult.formerSpending.value, daysInBetween * expense.value)
        XCTAssertEqual(savingsResult.valueSaved.value, daysInBetween * expense.value)
        
        // Past date
        future = now - 3.months
        daysInBetween = Double(now.days(until: future)!)
        savingsResult = calculator.simulate(spending: expense, until: future)
        
        XCTAssertEqual(savingsResult.valueSaved.value, 0)
        XCTAssertNotNil(savingsResult.error)
    }
    
    func testReplaceExpenses() {
        let dateFormat = "yyyy-MM-dd"
        let startDate = "2019-01-01".toDate(dateFormat)!.date
        let endDate = "2019-03-01".toDate(dateFormat)!.date
        let calculator = SavingsCalculator()
        
        var newExpense = Expense.mock()
        newExpense.value = 1.0
        newExpense.reportingStartedAt = startDate
        newExpense.recurrence = .daily
        expense.reportingStartedAt = startDate
        expense.recurrence = .daily

        let savingsResult = calculator.simulate(replacing: expense, by: newExpense, until: endDate)
        
        XCTAssertEqual(savingsResult.newSpending.value, 59.0)
        XCTAssertEqual(savingsResult.valueSaved.value, 59.0)
        XCTAssertEqual(savingsResult.percentageSaved, 0.5)
    }
}
