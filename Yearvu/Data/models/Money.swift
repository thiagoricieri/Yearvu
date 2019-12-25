//
//  Money.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

class Money: Monetary {
    var value: Double = 0.0
    var currency: Currency = NoCurrency()

    init() {}

    init(_ value: Double, currency: Currency) {
        self.value = value
        self.currency = currency
    }

    init(_ value: Monetary) {
        self.value = value.value
        self.currency = value.currency
    }
}

extension Money: Equatable {
    static func ==(lhs: Money, rhs: Money) -> Bool {
        return lhs.value == rhs.value
            && lhs.currency.symbol == rhs.currency.symbol
    }

    static func +(lhs: Money, rhs: Monetary) -> Money {
        guard lhs.currency.symbol == rhs.currency.symbol else {
            return Money()
        }
        return Money(lhs.value + rhs.value, currency: lhs.currency)
    }

    static func -(lhs: Money, rhs: Monetary) -> Money {
        guard lhs.currency.symbol == rhs.currency.symbol else {
            return Money()
        }
        return Money(lhs.value - rhs.value, currency: lhs.currency)
    }
}

class USD: Money {
    init(_ value: Double) {
        super.init()
        self.value = value
        self.currency = FiduciaryCurrency.usDollars
    }

    override init(_ value: Monetary) {
        super.init()
        self.value = value.value
        self.currency = FiduciaryCurrency.usDollars
    }
}
