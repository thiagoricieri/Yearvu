//
//  ExpenseRowViewModel.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 08/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import protocol Combine.ObservableObject
import struct Combine.Published
import struct Foundation.Date
import struct Foundation.UUID
import struct SwiftUI.Binding

class ExpenseRowViewModel: ObservableObject, ViewModel {
    var id: String = UUID().uuidString
}
