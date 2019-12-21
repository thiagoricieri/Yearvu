//
//  dataSpecs.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import struct Foundation.Date

protocol Model {}

protocol Currency: HasName {
    var symbol: String { get set }
}

protocol HasName {
    var name: String { get set }
}
