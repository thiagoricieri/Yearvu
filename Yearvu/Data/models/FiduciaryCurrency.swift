//
//  Currency.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct FiduciaryCurrency: Currency, Codable {
    var name: String
    var symbol: String
}

extension FiduciaryCurrency {
    static var usDollars: Currency {
        FiduciaryCurrency(name: "Dollar", symbol: "USD")
    }
}
