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
    let entry: ExpenseEntry
    
    var body: some View {
        VStack {
            Text(entry.prettyValue)
            Button("Dismiss") {
                self.presentation.wrappedValue.dismiss()
            }
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
