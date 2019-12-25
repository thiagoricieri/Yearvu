//
//  USDExchangeCalculator.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct USDExchangeCalculator: ExchangeCalculator {
    func exchange(_ value: Monetary, taxes: [Tax]) -> ExchangeResult {
        var exchanged = Exchange(
            exchanging: value,
            exchanged: USD(0.0),
            taxes: []
        )
        
        return exchanged
    }
}
