//
//  ExpenseDetailView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 01/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct ExpenseDetailView: View {
    var expense: Expense
    
    var body: some View {
        VStack {
            Spacer()
            // Header
            Text(expense.name)
                .fontWeight(.black)
                .font(.system(size: 40))
                .lineLimit(2)
                .padding()
            HStack {
                Text("Tracking")
                Text(expense.prettyValue)
                Text(expense.recurrence.rawValue)
            }
            HStack {
                Text("Currently")
                Text(String(expense.entries.count))
                Text("entries since")
                Text(expense.reportingStartedAt.usFormat)
            }
            Spacer()
            // Stats
            Text("Quick Stats")
                .fontWeight(.black)
                .font(.system(size: 20))
                .lineLimit(2)
                .padding()
            HStack {
                OneNumberStatView(
                    period: "Spent in 1 year",
                    value: "USD 365.00"
                )
                .padding()
                OneNumberStatView(
                    period: "Spent in 1 year",
                    value: "USD 365.00"
                )
                .padding()
            }
            HStack {
                OneNumberStatView(
                    period: "Spent in 1 year",
                    value: "USD 365.00"
                )
                .padding()
                OneNumberStatView(
                    period: "Spent in 1 year",
                    value: "USD 365.00"
                )
                .padding()
            }
            Spacer()
            // Link
            HStack {
                NavigationLink(destination: ExpenseEntriesListView(entries: expense.entries)) {
                    Text("More stats +")
                        .padding()
                }
                NavigationLink(destination: ExpenseEntriesListView(entries: expense.entries)) {
                    Text("View entries →")
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(expense.name), displayMode: .inline)
    }
}

#if DEBUG
struct ExpenseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailView(expense: expenses[0])
    }
}
#endif
