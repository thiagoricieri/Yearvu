//
//  SavingsReportTests.swift
//  YearvuTests
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import Fakery
import SwiftDate
import XCTest
@testable import Yearvu

class SavingsReportTests: XCTestCase {
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
        
        // Future date  
        future = now + 3.months
        daysInBetween = Double(now.days(until: future)!)
        savingsResult = forecast(until: future)
        
        XCTAssertEqual(savingsResult.formerSpending.value, daysInBetween * expense.value)
        XCTAssertEqual(savingsResult.valueSaved.value, daysInBetween * expense.value)
        
        // Past date
        future = now - 3.months
        daysInBetween = Double(now.days(until: future)!)
        savingsResult = forecast(until: future)
        
        XCTAssertEqual(savingsResult.valueSaved.value, 0)
        XCTAssertNotNil(savingsResult.error)
    }
    
    private func forecast(until: Date) -> SavingsResult {
        let calculator = ForecastCalculator()
        return calculator.forecast(saving: expense, until: until)
    }
}
