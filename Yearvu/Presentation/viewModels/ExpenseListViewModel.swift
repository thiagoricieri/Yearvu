//
//  ExpenseListViewModel.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 08/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import struct Combine.Published
import struct Foundation.UUID
import protocol ReSwift.StoreSubscriber
import protocol SwiftUI.ObservableObject

class ExpensesListViewModel: ObservableObject, ViewModel {
    var id: String = UUID().uuidString
    @Published var expenses: [Expense] = []
}

extension ExpensesListViewModel: StoreSubscriber {
    func newState(state: DataState) {
        expenses = state.expenses
    }
}
