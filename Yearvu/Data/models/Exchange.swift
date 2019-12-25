//
//  Exchange.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct Exchange: ExchangeResult {
    var exchanging: Monetary
    var exchanged: Monetary
    var taxes: [TaxCalculated]
    var index: ExchangeIndex
    
    var netExchanged: Monetary {
        return exchanged as! Money - taxesTotal
    }
    var taxesTotal: Monetary {
        return taxes.reduce(Money(0.0, currency: exchanged.currency), +)
    }
    
    init(from: Monetary, to: Currency, ratio: Float, calculated taxes: [TaxCalculated] = []) {
        self.exchanging = from
        self.exchanged = ratio > 0 ? Money(from.value * Double(ratio), currency: to) : Money()
        self.taxes = taxes
        self.index = AnyExchangeIndex(from: from.currency, to: to, ratio: ratio)
    }
}

struct AnyExchangeIndex: ExchangeIndex {
    var from: Currency
    var to: Currency
    var ratio: Float
    var inverseRatio: Float {
        guard ratio > 0 else {
            return 0.0
        }
        return 1 / ratio
    }
}
