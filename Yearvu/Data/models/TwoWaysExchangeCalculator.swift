//
//  TwoWaysExchangeCalculator.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct TwoWaysExchangeCalculator: ExchangeCalculator {
    func exchange(from value: Monetary, to currency: Currency, ratio: Float, taxes: [Tax]) -> ExchangeResult {
        var result = Exchange(from: value, to: currency, ratio: ratio)
        result.taxes = taxes.map { tax -> TaxCalculated in
            var value = result.exchanged.value
            switch tax.rule {
            case .percentage: value = value * tax.charge
            case .increment: value = tax.charge
            }
            return Taxed(value: value, currency: result.exchanged.currency, tax: tax)
        }
        return result
    }
}
