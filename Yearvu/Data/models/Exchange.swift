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
    var taxesTotal: Monetary {
        return taxes.reduce(Money(0.0, currency: exchanged.currency), +)
    }
    var ratio: Double {
        guard exchanging.value > 0 else {
            return 0.0
        }
        return exchanged.value / exchanging.value
    }
}
