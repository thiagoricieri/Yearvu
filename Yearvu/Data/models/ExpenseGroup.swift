//
//  ExpenseGroup.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

struct ExpenseGroup: Model {
    var name: String
    var expenses: [Expense] = []
}
