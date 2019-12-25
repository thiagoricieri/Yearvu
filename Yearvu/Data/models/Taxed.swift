//
//  Taxed.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct Taxed: TaxCalculated {
    var value: Double
    var currency: Currency
    var tax: Tax
}
