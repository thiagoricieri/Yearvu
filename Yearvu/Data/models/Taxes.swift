//
//  Taxes.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct BrazilianExchangeTax: Tax {
    var name: String = "Exchange Tax"
    var charge: Double = 0.0638
    var rule: TaxRule = .percentage
}

struct BankTax: Tax {
    var name: String = "Bank Tax"
    var charge: Double = 0.15
    var rule: TaxRule = .increment
}
