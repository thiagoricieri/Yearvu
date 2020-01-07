//
//  ExpenseRowView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 31/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct ExpenseRowView: View {
    var expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.name)
                .fontWeight(.black)
            Spacer()
            Text(expense.prettyValue)
        }
        .padding()
    }
}

#if DEBUG
struct ExpenseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseRowView(expense: expenses[0])
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
#endif
