//
//  Money.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct Money: Monetary, Equatable {
    var value: Double
    var currency: Currency
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.value == rhs.value
            && lhs.currency.symbol == rhs.currency.symbol
    }
}

struct USD: Monetary, Equatable {
    var value: Double
    var currency: Currency

    init(_ value: Double) {
        self.value = value
        self.currency = FiduciaryCurrency.usDollars
    }
    
    init(_ value: Monetary) {
        self.value = value.value
        self.currency = FiduciaryCurrency.usDollars
    }

    static func == (lhs: USD, rhs: USD) -> Bool {
        return lhs.value == rhs.value
            && lhs.currency.symbol == rhs.currency.symbol
    }
}
