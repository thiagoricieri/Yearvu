//
//  ExpensesListView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 21/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct ExpensesListView: View {
    var body: some View {
        NavigationView {
            List(expenses) { expense in
                NavigationLink(destination: ExpenseDetailView(expense: expense)) {
                    ExpenseRowView(expense: expense)
                }
            }
            .navigationBarTitle(Text("Expenses"))
        }
    }
}

#if DEBUG
struct ExpensesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesListView()
    }
}
#endif
