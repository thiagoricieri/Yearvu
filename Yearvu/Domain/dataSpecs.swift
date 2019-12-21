//
//  dataSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

protocol Model {}

protocol HasName {
    var name: String { get set }
}

protocol Monetary {
    var value: Double { get set }
    var currency: Currency { get set }
}

protocol Currency: HasName {
    var symbol: String { get set }
}

protocol IsRecurrent {
    var startDate: Date { get set }
    var recurrence: Recurrence { get set }
}

protocol HasMemo {
    var memo: String { get set }
}
