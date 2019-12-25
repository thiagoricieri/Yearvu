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
    let calculator = AppExchangeCalculator()
    let BRL = FiduciaryCurrency(name: "Brazilian Real", symbol: "BRL")
    let EUR = FiduciaryCurrency(name: "Euro", symbol: "EUR")
    let GBP = FiduciaryCurrency(name: "Great Britain Pound", symbol: "GBP")
    
    func testExchangeUSDtoBRL() {
        let usd = USD(10.0)
        let exchange = calculator.exchange(
            from: usd,
            to: BRL,
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
        let usd = USD(10.0)
        let exchange = calculator.exchange(
            from: usd,
            to: EUR,
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
        let usd = USD(10.0)
        let exchange = calculator.exchange(
            from: usd,
            to: GBP,
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
        let brl = Money(50.0, currency: BRL)
        let exchange = calculator.exchange(
            from: brl,
            to: FiduciaryCurrency.usDollars,
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
        let brl = Money(50.0, currency: BRL)
        let exchange = calculator.exchange(
            from: brl,
            to: FiduciaryCurrency.usDollars,
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
        let brl = Money(50.0, currency: BRL)
        let exchange = calculator.exchange(
            from: brl,
            to: FiduciaryCurrency.usDollars,
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
