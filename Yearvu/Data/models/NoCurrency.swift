//
//  NoCurrency.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 25/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct NoCurrency: Currency, Codable {
    var symbol: String = "(NO)"
    var name: String = "No Currency"
}
