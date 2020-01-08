//
//  EntryFormViewModel.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 06/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import protocol Combine.ObservableObject
import struct Combine.Published
import struct Foundation.Date
import struct Foundation.UUID
import struct SwiftUI.Binding

class EntryFormViewModel: ObservableObject, ViewModel {
    var id: UUID = UUID()
    var entry: ExpenseEntry
    let currencies: [String]

    @Published var value: String {
        didSet {
            entry.value = value.money
        }
    }

    @Published var currency: Int {
        didSet {
            entry.currency = Currency(rawValue: currencies[currency]) ?? .none
        }
    }

    @Published var createdAt: Date {
        didSet {
            entry.createdAt = createdAt
        }
    }

    init(entry: ExpenseEntry, currencies: [String]) {
        self.entry = entry
        self.value = entry.value.moneyFormatted
        self.currency = currencies.firstIndex(of: entry.currency.rawValue) ?? 0
        self.createdAt = entry.createdAt
        self.currencies = currencies
    }
}
