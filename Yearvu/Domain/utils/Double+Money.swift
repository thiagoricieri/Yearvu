//
//  Double+Money.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import func Foundation.pow
import class Foundation.NumberFormatter
import class Foundation.NSNumber

private let currencyFormatter = NumberFormatter()

extension Double {
    /// Monetary value rounded to 2 decimals
    var money: Double {
        self.rounded(toPlaces: 2)
    }
    
    /// Currency formatted to be used as a string.
    var moneyFormatted: String {
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        return currencyFormatter.string(from: NSNumber(value: self.money))!
    }
    
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
