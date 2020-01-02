//
//  ExpenseEntriesListView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 01/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct ExpenseEntriesListView: View {
    @State private var showModal = false
    @State private var selectedEntry: ExpenseEntry = .empty
    
    let entries: [ExpenseEntry]
    
    var body: some View {
        List(entries.reversed()) { entry in
            ExpenseEntryRowView(entry: entry)
                .onTapGesture {
                    self.showModal = true
                    self.selectedEntry = entry
                }
        }
        .navigationBarTitle(Text("Entries"))
        .sheet(isPresented: self.$showModal, onDismiss: {
            self.selectedEntry = .empty
        }) {
            EntryFormView(entry: self.selectedEntry)
        }
    }
}

#if DEBUG
struct ExpenseEntriesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseEntriesListView(entries: expenses[0].entries)
    }
}
#endif
