//
//  ExchangeTests.swift
//  YearvuTests
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import Fakery
import SwiftDate
import XCTest
@testable import Yearvu

class ExchangeTests: XCTestCase {
    let calculator = TwoWaysExchangeCalculator()
    
    func testExchangeUSDtoBRL() {
        let exchange = calculator.exchange(
            from: USD(10.0),
            to: BRL.currency,
            ratio: USDExchangeTable.toBRL,
            taxes: [
                BrazilianExchangeTax(),
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 40.8, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 38.04, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 2.75, accuracy: 0.01)
    }
    
    func testExchangeUSDtoEUR() {
        let exchange = calculator.exchange(
            from: USD(10.0),
            to: EUR.currency,
            ratio: USDExchangeTable.toEUR,
            taxes: [
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 9, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 8.85, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 0.15, accuracy: 0.01)
    }
    
    func testExchangeUSDtoGBP() {
        let exchange = calculator.exchange(
            from: USD(10.0),
            to: GBP.currency,
            ratio: USDExchangeTable.toGBP,
            taxes: [
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 7.7, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 7.55, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 0.15, accuracy: 0.01)
    }
    
    func testExchangeBRLtoUSD() {
        let exchange = calculator.exchange(
            from: BRL(50.0),
            to: USD.currency,
            ratio: 1 / USDExchangeTable.toBRL,
            taxes: [
                BrazilianExchangeTax(),
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 12.25, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 11.32, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 0.93, accuracy: 0.01)
    }
    
    func testExchangeBRLtoEUR() {
        let exchange = calculator.exchange(
            from: BRL(50.0),
            to: USD.currency,
            ratio: 1 / USDExchangeTable.toBRL * USDExchangeTable.toEUR,
            taxes: [
                BrazilianExchangeTax(),
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 11.03, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 10.17, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 0.85, accuracy: 0.01)
    }
    
    func testExchangeBRLtoGBP() {
        let exchange = calculator.exchange(
            from: BRL(50.0),
            to: USD.currency,
            ratio: 1 / USDExchangeTable.toBRL * USDExchangeTable.toGBP,
            taxes: [
                BrazilianExchangeTax(),
                BankTax()
            ]
        )
        
        XCTAssertEqual(exchange.exchanged.value, 9.43, accuracy: 0.01)
        XCTAssertEqual(exchange.netExchanged.value, 8.68, accuracy: 0.01)
        XCTAssertEqual(exchange.taxesTotal.value, 0.75, accuracy: 0.01)
    }
}
