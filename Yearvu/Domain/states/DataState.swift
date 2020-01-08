//
//  DataState.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.StateType

struct DataState: StateType {
    var expenses: [Expense] = []
    var currencies: [String] = []

    static var current: DataState {
        return yearvuStore.state.dataState
    }
}

extension DataState: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(expenses)
        hasher.combine(currencies)
    }

    static func == (lhs: DataState, rhs: DataState) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
