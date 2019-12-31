//
//  Money.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

class Money: Monetary, CustomStringConvertible {
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

// MARK: - Concrete Currencies

class USD: Money, StaticCurrency {
    static var currency: Currency {
        FiduciaryCurrency(name: "Dollar", symbol: "USD")
    }

    init(_ value: Double) {
        super.init()
        self.value = value
        self.currency = USD.currency
    }

    override init(_ value: Monetary) {
        super.init()
        self.value = value.value
        self.currency = USD.currency
    }
}

class BRL: Money, StaticCurrency {
    static var currency: Currency {
        FiduciaryCurrency(name: "Brazilian Real", symbol: "BRL")
    }

    init(_ value: Double) {
        super.init()
        self.value = value
        self.currency = BRL.currency
    }

    override init(_ value: Monetary) {
        super.init()
        self.value = value.value
        self.currency = BRL.currency
    }
}

class EUR: Money, StaticCurrency {
    static var currency: Currency {
        FiduciaryCurrency(name: "Euro", symbol: "EUR")
    }

    init(_ value: Double) {
        super.init()
        self.value = value
        self.currency = EUR.currency
    }

    override init(_ value: Monetary) {
        super.init()
        self.value = value.value
        self.currency = EUR.currency
    }
}

class GBP: Money, StaticCurrency {
    static var currency: Currency {
        FiduciaryCurrency(name: "Great Britain Pound", symbol: "GBP")
    }

    init(_ value: Double) {
        super.init()
        self.value = value
        self.currency = GBP.currency
    }

    override init(_ value: Monetary) {
        super.init()
        self.value = value.value
        self.currency = GBP.currency
    }
}
