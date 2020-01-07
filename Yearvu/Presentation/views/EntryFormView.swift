//
//  EntryFormView.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 02/01/20.
//  Copyright © 2020 Thiago Ricieri. All rights reserved.
//

import SwiftUI

struct EntryFormView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: EntryFormViewModel
    //var entry: ExpenseEntry
    
    init(entry: ExpenseEntry) {
        self.viewModel = EntryFormViewModel(entry: entry, currencies: currencies)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How much did it cost?")) {
                    HStack {
                        Text("Amount")
                            .frame(width: 100, height: 30, alignment: .center)
                            .multilineTextAlignment(.trailing)
                        TextField("5.00", text: $viewModel.value)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Currency")
                            .frame(width: 100, height: 30, alignment: .center)
                            .multilineTextAlignment(.trailing)
                        Picker(selection: $viewModel.currency, label: Text("")) {
                            ForEach(0 ..< currencies.count) {
                                Text(currencies[$0]).tag($0)
                            }
                        }
                    }
                }
                Section(header: Text("When did you spend?")) {
                    DatePicker(selection: $viewModel.createdAt,
                               in: Date()...,
                               displayedComponents: .date) {
                        Text("Select a date")
                    }
                }
                Section {
                    Button(action: {
                        // activate theme!
                    }) {
                        Text("Save changes")
                    }
                }
            }
            .navigationBarTitle("Expense Entry")
            .navigationBarItems(trailing:
                Button("Cancel") {
                    self.presentation.wrappedValue.dismiss()
                }
            )
        }
    }
}

#if DEBUG
struct EntryFormView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFormView(entry: expenses[0].entries[0])
    }
}
#endif
