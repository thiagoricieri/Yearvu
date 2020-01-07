//
//  String+Money.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 07/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

extension String {
    /// Monetary value rounded to 2 decimals
    var money: Double {
        Double(self)?.rounded(toPlaces: 2) ?? 0.0
    }
}
