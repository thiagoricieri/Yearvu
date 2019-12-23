//
//  Savings.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct Savings: SavingsResult {
    var formerSpending: Monetary
    var newSpending: Monetary
    var valueSaved: Monetary
    var error: MonetaryError? = nil
    var percentageSaved: Percentage {
        guard formerSpending.value <= 0 else {
            return Percentage(0)
        }
        return Percentage(valueSaved.value / formerSpending.value)
    }
}
