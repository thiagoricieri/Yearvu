//
//  dataReducer.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import protocol ReSwift.Action

func dataReducer(_ action: Action, _ state: DataState) -> DataState {
    var state = state

    switch action {
    case _ as LoadExpenses: state.expenses = load("expenses.json")
    case _ as LoadCurrencies: state.currencies = ["USD", "BRL", "EUR", "GBP"]
    default: break
    }

    return state
}
